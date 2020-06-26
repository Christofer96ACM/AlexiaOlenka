using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.Services;
using BusinessEntities;
using BusinessRules;
using System.Web.Script.Services;
using DevExpress.Web.ASPxGridView;
using BusinessServices;
using DevExpress.Web.ASPxEditors;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.Web;
using DevExpress.Web.ASPxCallback;
using DevExpress.Web.Data;
using DevExpress.Web.ASPxClasses;
using System.Drawing;
using DevExpress.Web.ASPxNavBar;

namespace OneCommerce.Reportes
{
    public partial class ReporteCliente : Page
    {
        public static List<BEClientAddress> ListaDirecciones = new List<BEClientAddress>();
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
                ASPxWebControl.GlobalTheme = "Aqua";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(User.Identity.Name))
            {
                FormsAuthentication.SignOut();
                FormsAuthentication.RedirectToLoginPage();  
            }
            else
            {
                if (!IsPostBack && !IsCallback)
                {
                    var obec = ((BEParameters)Session["InitPar"]);
                    /*if (obec.Permition == "001")
                    {
                        FormsAuthentication.SignOut();
                        FormsAuthentication.RedirectToLoginPage();  
                    }
                    else
                    {*/
                        Init_VarSessions();
                        Set_Permissions();
                        dteDateIn.Date = DateTime.Today;
                        dteDateFi.Date = DateTime.Today;
                        var mmp = ((ASPxNavBar)Master.FindControl("nvbMain"));
                        var _sd = obec.RAZON_SOCIAL;
                        ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Socied")).InnerText = _sd;
                        ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Local")).InnerText = obec.DscpLocal;
                        ((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "Tipo de Cambio: " + obec.Rate.ToString("c3");
                    //}                 
                }
            }
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
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARReserva").Enabled = true;
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
        private void Init_VarSessions()
        {
            var obec = ((BEParameters)Session["InitPar"]);

            Session["ortt"] = new List<BETipoCambio>();
            Session["oitm"] = new List<BEProduct>();
            Session["owhs"] = new List<BEWhsCode>();
            Session["opln"] = new List<BEPrice>();
            Session["cliente"] = new List<BEContratos>();

        }
        private string SaveItem()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BETipoCambio();
            using (var obrd = new BRDocument())
            {
                //obrd.SaveCurrencyDates(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
            return (_err);
        }

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveItem"))
                {
                    e.Result = SaveItem();
                }
                if (e.Parameter.Contains("Modify"))
                {
                    e.Result = "";
                }
                else
                {
                    e.Result = string.Empty;
                }
            }
            catch (Exception ex)
            {
                e.Result = ex.Message;
            }
        }
        private void Search()
        {
            var obep = ((BEParameters)Session["InitPar"]);
            obep.DateIn = Convert.ToDateTime(dteDateIn.Text);
            obep.DateFi = Convert.ToDateTime(dteDateFi.Text);
            obep.Socied = obep.Socied;
            obep.Project = obep.Project;
            obep.CardCode = txtid.Text;
            

            var obr = new BRDocument();
            var olst = obr.DXP_ESTADO_CUENTA_FINAL_2(obep);



            Session["rpcc"] = olst;
            gdvEstadoCuenta.DataSource = olst;
            gdvEstadoCuenta.DataBind();
        }

        private void Search2()
        {
            var obep = ((BEParameters)Session["InitPar"]);
            //obep.DateIn = null;
            //obep.DateFi = null;
            obep.Socied = obep.Socied;
            obep.Project = obep.Project;
            obep.CardCode = txtid.Text;


            var obr = new BRDocument();
            var olst = obr.DXP_ESTADO_CUENTA_FINAL(obep);



            Session["rpcc"] = olst;
            gdvEstadoCuenta.DataSource = olst;
            gdvEstadoCuenta.DataBind();
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            gexData.WriteXlsxToResponse();
        }

       
       
        protected void gdvEstadoCuenta_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters.Contains("BUSCAR1"))
            {
                Search();
            }
            else if (e.Parameters.Contains("BUSCAR2"))
            {
                Search2();
            }
            
        }

        protected void gdvEstadoCuenta_DataBinding(object sender, EventArgs e)
        {
            gdvEstadoCuenta.DataSource = Session["rpcc"];
        }

        protected void gdvClientSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var Detalle = "";
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters();


            obj.Socied = obec.Socied;
            obj.CardCode = txtcode.Text;
            obj.CardName = txtrason.Text;
            obj.Project = obec.Project;
            obj.Id_Dire = txtidir.Text;
            obj.Contrato = txtcontratobus.Text; 

            
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_CLIENTE_ESTADO_CUENTA(obj);

            olst.ForEach(item =>
            {
                Detalle = "";
                var obep2 = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocNum = Convert.ToInt32(item.DocNum),
                    CardCode = item.CardCode,
                    ObjType = 17
                };
                var olst2 = obrd.DXP_GETDETALLE_BORRADOR_OV(obep2);
                olst2.Where(i => i.ActivoC == "Y").ToList().ForEach(item2 =>
                {
                    Detalle += item2.ItemName + ",";
                });

                item.Detalle = Detalle.Substring(0, Detalle.Length - 1);
            });



            Session["cliente"] = olst;
            gdvClientSearch.DataSource = olst;
            gdvClientSearch.DataBind();
        }
    

        protected void gdvClientSearch_DataBinding(object sender, EventArgs e)
        {
            gdvClientSearch.DataSource = Session["cliente"];
        }
    }
}