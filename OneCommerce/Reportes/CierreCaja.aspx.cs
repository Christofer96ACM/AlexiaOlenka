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
    public partial class CierreCaja : Page
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
            obep.Number = Convert.ToInt32(obep.U_BF_EMID);

            var obr = new BRDocument();
            var olst = obr.Get_OSCSP_RPCJ(obep);

            Session["rpcc"] = olst;
            gdvData.DataSource = olst;
            gdvData.DataBind();
        }
        protected void btnExport_Click(object sender, EventArgs e)
        {
            gexData.WriteXlsxToResponse();
        }

        protected void gdvData_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            Search();
        }

        protected void gdvData_DataBinding(object sender, EventArgs e)
        {
            gdvData.DataSource = Session["rpcc"];
        }
    }
}