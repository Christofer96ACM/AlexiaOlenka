using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using DevExpress.Web.ASPxEditors;
using System.Web.UI.HtmlControls;
using BusinessServices;
using System.Web.Security;
using BusinessEntities;
using BusinessRules;
using System.Web.Services;
using System.Web.Script.Services;
using DevExpress.Web.ASPxGridView;
using System.Drawing;
using DevExpress.Web.ASPxNavBar;

namespace OneCommerce 
{
    public partial class _Default : Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(User.Identity.Name))
            {
                //if (string.Compare(((BEParameters)Session["InitPar"]).Socied, "BT", false) == 0)
                //    DevExpress.Web.ASPxClasses.ASPxWebControl.GlobalTheme = "RedWine";
                //else
                DevExpress.Web.ASPxClasses.ASPxWebControl.GlobalTheme = "PlasticBlue";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();  
            //if (string.IsNullOrWhiteSpace(User.Identity.Name))
            //{
            //    FormsAuthentication.SignOut();
            //    FormsAuthentication.RedirectToLoginPage();  
            //}
            //else
            //{
                //if (!IsPostBack && !IsCallback)
                //{
                //    var obec = ((BEParameters)Session["InitPar"]);
                    //if (obec.Permition == "001")
                    //    Response.Redirect("~/Sales/SalesOrder.aspx");
                    //else
                    //    Response.Redirect("~/Sales/ARInvoice.aspx");

                    //Set_Permissions();
                    //Search();
                    //var _sd = ((string.Compare(((BEParameters)Session["InitPar"]).Socied, "BT", false) == 0) ? "Botica Francesa" : "Belmay");
                    //((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Socied")).InnerText = _sd;
                    //((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Local")).InnerText = ((BEParameters)Session["InitPar"]).DscpLocal;
                    //((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "Tipo de Cambio: " + ((BEParameters)Session["InitPar"]).Rate.ToString("c3");
            //    }
            //}
        }
        public T FindControl<T>(string id) where T : Control
        {
            return FindChildControl<T>(Page, id);
        }
        public T FindControl<T>(Control startingControl, string id) where T : Control
        {
            return BSControlFinder.FindControl<T>(startingControl, id);
        }

        public T FindChildControl<T>(Control startingControl, string id) where T : Control
        {
            return BSControlFinder.FindChildControl<T>(startingControl, id);
        }
        private void Set_Permissions()
        {
            var obec = ((BEParameters)Session["InitPar"]);

            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Masters").Visible = true;
            /*if (obec.Permition == "001")
            {
                if (obec.Socied == "DX")
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = true;*/
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARInvoice").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("CreditNote").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Reports").Visible = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Tools").Visible = true;
            /*}
            else if (obec.Permition == "003")
            {
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("SalesOrder").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = true;*/
            /*}
            if (obec.U_BF_ADMIN==0)*/
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Administrator").Visible = true;
        }

        //!+ RUTINAS AJAX

        /// <summary>
        ///  LISTA LAS CONDICONES DE PAGO
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BECreditTarject> Get_CreditTarject( string socied)
        {
            var obep = new BEParameters() { Socied = socied };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OCRC(obep);
            return (olst);
        }
        private void Search()
        {
            try
            {
                var obep = ((BEParameters)Session["InitPar"]);
                obep.Socied = obep.Socied;
                obep.Project = obep.Project;

                var obr = new BRDocument();
                var olst = obr.Get_OSCSP_DVPP(obep);

                Session["dvpp"] = olst;
                gdvData.DataSource = olst;
                gdvData.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public static string Right(string param, int length)
        {
            int value = param.Length - length;
            string result = param.Substring(value, length);
            return result;
        }
        private string Payment(int DocEntry)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var item = ((List<BEDocument>)Session["dvpp"]).Where(i => i.DocEntry == DocEntry).ElementAt(0);
            var obj = new BEDocument();
            obj.Socied = obec.Socied;
            obj.DocEntry = DocEntry;
            obj.DocDate = DateTime.Today;
            obj.CardCode = item.CardCode;
            obj.CardName = item.CardName;
            if (pgcPayment.ActiveTabIndex == 0)
            {
                obj.MedPayment = "EF";
                obj.CashAccount = (obec.Socied == "BT") ? "_SYS00000003803" : "_SYS00000003232";
                obj.CashSum = Convert.ToDecimal(txtSalEfe.Value);
            }
            else
            {
                obj.MedPayment = "TC";
                var _stc = cbbCreditCard.Value.ToString().Split('_');
                obj.CreditCard = Convert.ToInt16(_stc[0]);
                obj.CashAccount = "_" + _stc[1];
                obj.CashSum = Convert.ToDecimal(txtSalTacre.Value);
                var _ccn = ("0000000000000" + txtCardNum.Text);
                obj.CreditCardNumber = Right(_ccn, 13);
                obj.VoucherNum = txtCardNum.Text;
            }
            obj.Project = ((BEParameters)Session["InitPar"]).Project;
            obj.PaidToDate = item.PaidToDate + obj.CashSum;
            obj.PendingBal = item.DocTotal - obj.PaidToDate;

            using (var obrd = new BRDocument())
            {
                obrd.SavePayment(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKP#{0}#{1}#{2}", DocEntry, obj.PaidToDate, obj.PendingBal);
            return (_err);
        }
        protected void gdvData_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            try
            {
                gdvData.JSProperties["cpError"] = string.Empty;
                var _arr = e.Parameters.Split(':');
                if (_arr[0] == "pg")
                {
                    var result = Payment(Convert.ToInt32(_arr[1]));
                    gdvData.JSProperties["cpError"] = result;
                    if (result.Contains("OKP"))
                    {
                        _arr = result.Split('#');
                        ((List<BEDocument>)Session["dvpp"])
                            .Where(i => i.DocEntry == Convert.ToInt32(_arr[1]))
                            .ToList()
                            .ForEach(item => 
                            {
                                item.PaidToDate = Convert.ToDecimal(_arr[2]);
                                item.PendingBal = Convert.ToDecimal(_arr[3]);
                                if (item.PendingBal == 0)
                                    item.DocStatus = "Cerrado";
                            });

                        ((List<BEDocument>)Session["dvpp"]).RemoveAll(item => item.DocStatus == "Cerrado");
                        gdvData.DataSource = Session["dvpp"];
                        gdvData.DataBind();
                    }
                    else
                    {
                        throw new ArgumentException(result);
                    }
                }
            }
            catch (Exception ex)
            {
                gdvData.JSProperties["cpError"] = ex.Message;
            }
        }
        protected void gdvData_DataBinding(object sender, EventArgs e)
        {
            gdvData.DataSource = Session["dvpp"];
        }
        protected void gdvData_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            {
                var dte1 = Convert.ToDateTime(e.GetValue("DocDate"));
                int daysDiff = ((TimeSpan)(DateTime.Today - dte1)).Days;
                if (daysDiff == 1)
                {
                    e.Row.BackColor = Color.LavenderBlush;
                }
                else if (daysDiff >= 2)
                {
                    e.Row.BackColor = Color.Pink;
                }
            }
        }
    }
}