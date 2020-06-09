using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.UI.HtmlControls;
using BusinessEntities;
using Newtonsoft.Json;
using DevExpress.Web.ASPxClasses;
using System.Web.Security;

namespace OneCommerce.Print
{
    public partial class TicketBill : System.Web.UI.Page
    {
        protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
        {
            var page = HttpContext.Current.CurrentHandler as Page;
            if (page != null)
            {
                page.PreInit += Page_PreInit;
            }
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(User.Identity.Name))
            {
                if (string.Compare(((BEParameters)Session["InitPar"]).Socied, "BT", false) == 0)
                    ASPxWebControl.GlobalTheme = "RedWine";
                else
                    ASPxWebControl.GlobalTheme = "Office2003Olive";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(User.Identity.Name))
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                if (!IsPostBack && !IsCallback)
                {
                    PrintTicket();
                }
            }
        }
        private string Replicate(string source, string input, int count, bool tp)
        {
            if (string.IsNullOrEmpty(input) == true) return source;
            if (count < 1) return source;
            var Result = new StringBuilder(source.Length + (input.Length * count));
            Result.Append(source);
            for (int i = 0; i < count; i++)
            {
                if (tp)
                    Result.Insert(0, input);
                else
                    Result.Append(input);
            }
            return Result.ToString();
        }
        public static string Right(string param, int length)
        {
            int value = param.Length - length;
            string result = param.Substring(value, length);
            return result;
        }
        private void PrintTicket()
        {
            var layout = (List<BEPrintTicket>)Session["tckt"];
            var olst = new List<BEPrintTicket>();
            layout.GroupBy(dobj => new
            {
                dobj.CompanyName,
                dobj.Ruc,
                dobj.CompanyAddress,
                dobj.Phone,
                dobj.SerieMaqr,
                dobj.NumAtCard,
                dobj.DocDate,
                dobj.CardName,
                dobj.LicTradNum
            })
            .ToList()
            .ForEach(obj =>
            {
                var _obj = new BEPrintTicket()
                {
                    CompanyName = obj.Key.CompanyName.ToUpper(),
                    Ruc = obj.Key.Ruc.ToUpper(),
                    CompanyAddress = obj.Key.CompanyAddress.ToUpper(),
                    Phone = obj.Key.Phone.ToUpper(),
                    SerieMaqr = obj.Key.SerieMaqr.ToUpper(),
                    NumAtCard = "NRO. DOC: " + obj.Key.NumAtCard.ToUpper(),
                    DocDate = "FECHA: " + obj.Key.DocDate,
                    CardName = "CLIENTE: " + obj.Key.CardName.ToUpper(),
                    LicTradNum = "RUC: " + obj.Key.LicTradNum
                };
                olst.Add(_obj);
            });

            string ans = JsonConvert.SerializeObject(olst, Formatting.Indented);
            string script = string.Format("var tkh = {{\"Head\": {0}}};", ans);
            script += "for(i = 0; i < tkh.Head.length; i++)";
            script += "{";
            script += "document.getElementById('CompanyName').innerHTML = tkh.Head[i].CompanyName;";
            script += "document.getElementById('Ruc').innerHTML = tkh.Head[i].Ruc;";
            script += "document.getElementById('CompanyAddress').innerHTML = tkh.Head[i].CompanyAddress;";
            script += "document.getElementById('Phone').innerHTML = tkh.Head[i].Phone;";
            script += "document.getElementById('SerieMaqr').innerHTML = tkh.Head[i].SerieMaqr;";
            script += "document.getElementById('NumAtCard').innerHTML = tkh.Head[i].NumAtCard;";
            script += "document.getElementById('DocDate').innerHTML = tkh.Head[i].DocDate;";
            script += "document.getElementById('CardName').innerHTML = tkh.Head[i].CardName;";
            script += "document.getElementById('LicTradNum').innerHTML = tkh.Head[i].LicTradNum;";
            script += "}";
            var cs = Page.ClientScript;
            cs.RegisterStartupScript(Page.GetType(), "JSON", script, true);

            var det = new HtmlTable() { ID = "det", Border = 0, CellPadding = 0, CellSpacing = 0, Width = "300px" };
            var rwd = new HtmlTableRow();
            var cld = new HtmlTableCell() { InnerHtml = string.Empty };
            rwd.Cells.Add(cld);
            det.Rows.Add(rwd);
            layout.ForEach(obj =>
            {
                var plg = ("S/." + obj.PriceDiscount).Length;
                rwd = new HtmlTableRow();
                cld = new HtmlTableCell();
                var val = string.Format("- {0} {1} {2}", obj.ItemCode, obj.Quantity, obj.ItemName);
                var ilg = 0;
                var ncad = "";
                if (val.Length >= 36)
                {
                    ilg = (34 - plg);
                    ncad = val.Insert(ilg, (string.Format(" S/.{0}\n", obj.PriceDiscount)));
                }
                else
                {
                    ilg = (36 - val.Length) - obj.PriceDiscount.ToString().Length;
                    ncad = Replicate(val, " ", ilg, false) + string.Format(" S/.{0}", obj.PriceDiscount);
                }
                cld.InnerHtml = ncad;
                rwd.Cells.Add(cld);
                det.Rows.Add(rwd);
            });
            Controls.Add(det);

            var foo = new HtmlTable() { ID = "foo", Border = 0, CellPadding = 0, CellSpacing = 0, Width = "300px" };
            var rwfsp = new HtmlTableRow();
            var clfsp = new HtmlTableCell() { InnerHtml = string.Empty, Height = "10px" };
            rwfsp.Cells.Add(clfsp);
            det.Rows.Add(rwfsp);
            layout.GroupBy(dobj => new
            {
                dobj.SubTotal,
                dobj.VatSum,
                dobj.Discount,
                dobj.DocTotal
            })
                .ToList()
                .ForEach(obj =>
                {
                    var val = Replicate(obj.Key.SubTotal.ToString(), " ", 24, true);
                    val = Right(val, 24);
                    var rwfs = new HtmlTableRow();
                    var clfs = new HtmlTableCell() { InnerHtml = "VALOR VENTA:" + val };
                    rwfs.Cells.Add(clfs);
                    foo.Rows.Add(rwfs);

                    if (!string.IsNullOrWhiteSpace(obj.Key.Discount.ToString()) && obj.Key.Discount.ToString() != "0")
                    {
                        val = Replicate("S/ " + obj.Key.Discount, " ", 26, true);
                        val = Right(val, 26);
                        var rwds = new HtmlTableRow();
                        var clds = new HtmlTableCell() { InnerHtml = "VALOR DSC:" + val };
                        rwds.Cells.Add(clds);
                        foo.Rows.Add(rwds);
                    }

                    val = Replicate(obj.Key.VatSum.ToString(), " ", 26, true);
                    val = Right(val, 26);
                    var rwfv = new HtmlTableRow();
                    var clfv = new HtmlTableCell() { InnerHtml = "VALOR IGV:" + val };
                    rwfv.Cells.Add(clfv);
                    foo.Rows.Add(rwfv);

                    val = Replicate(obj.Key.DocTotal.ToString(), " ", 24, true);
                    val = Right(val, 24);
                    var rwfd = new HtmlTableRow();
                    var clfd = new HtmlTableCell() { InnerHtml = "TOTAL VENTA:" + val };
                    rwfd.Cells.Add(clfd);
                    foo.Rows.Add(rwfd);
                });

            rwfsp = new HtmlTableRow();
            clfsp = new HtmlTableCell() { InnerHtml = string.Empty, Height = "10px" };
            rwfsp.Cells.Add(clfsp);
            foo.Rows.Add(rwfsp);

            rwfsp = new HtmlTableRow();
            clfsp = new HtmlTableCell() { InnerHtml = "     GRACIAS POR SU COMPRA...!!", Align = "Center" };
            rwfsp.Cells.Add(clfsp);
            foo.Rows.Add(rwfsp);
            Controls.Add(foo);
        }
    }
}