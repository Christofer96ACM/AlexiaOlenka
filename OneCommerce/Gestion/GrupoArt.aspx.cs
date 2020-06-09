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

namespace OneCommerce.Gestion
{
    public partial class GrupoArt : Page
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

            Session["oitw"] = new List<BEAlmacen>();
            Session["oitm"] = new List<BEProduct>();
            Session["owhs"] = new List<BEWhsCode>();
            Session["opln"] = new List<BEPrice>();
            Session["asiento"] = new List<BEAsiento>();
            Session["grupo"] = new List<BEGrupoArt>();


            hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
            //hdfTemp.Add("_emid", obec.U_BF_EMID);
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("_proj", obec.Project);
            hdfTemp.Add("_whsc", obec.WhsCode);
            hdfTemp.Add("_cpnadd", obec.CompanyAddress.ToUpper());
            //hdfTemp.Add("_phone", obec.Phone);
            //hdfTemp.Add("_SerieM", obec.SerieMaqr);
        }
        //!+ RUTINAS AJAX
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEParameters> GET_VALORES_GRUPO_ART(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_GRUPO_ARTICULOS(obep);
            return (olst);
        }
        //private string SaveItem()
        //{
        //    var obec = ((BEParameters)Session["InitPar"]);
        //    var obj = new BEGrupoArt();

        //    obj.ItmsGrpNam = txtItmsGrpNam.Text;
        //    obj.PlaningSys = Convert.ToString(cbbPlaningSys.Value);
        //    obj.PrcrmntMtd = Convert.ToString(cbbPrcrmntMtd.Value);
        //    obj.OrdrIntrvl = Convert.ToString(cbbOrdrIntrvl.Value);
        //    obj.OrdrMulti  = txtOrdrMulti.Text;
        //    obj.MinOrdrQty = txtMinOrdrQty.Text;
        //    obj.LeadTime =txtLeadTime.Text;
        //    obj.ToleranDay =txtToleranDay.Text;
        //    obj.ExpensesAc= betxtExpensesAc.Text;
        //    obj.BalInvntAc = bteBalInvntAc.Text;
        //    obj.SaleCostAc = bteSaleCostAc.Text;
        //    obj.TransferAc = bteTransferAc.Text;
        //    obj.VarianceAc = bteVarianceAc.Text;
        //    obj.PriceDifAc = btePriceDifAc.Text;
        //    obj.NegStckAct = bteNegStckAct.Text;
        //    obj.DecreasAc = bteDecreasAc.Text;
        //    obj.IncreasAc = bteIncreasAc.Text;
        //    obj.ReturnAc = bteReturnAc.Text;
        //    obj.FrRevenuAc = betFrRevenuAc.Text;
        //    obj.FrExpensAc = bteFrExpensAc.Text;
        //    obj.ExchangeAc = bteExchangeAc.Text;
        //    obj.BalanceAcc = bteBalanceAcc.Text;
        //    obj.DecresGlAc = bteDecresGlAc.Text;
        //    obj.IncresGlAc = bteIncresGlAc.Text;
        //    obj.WipAcct = bteWipAcct.Text;
        //    obj.WipVarAcct = bteWipVarAcct.Text;
        //    obj.StokRvlAct = bteStokRvlAct.Text;
        //    obj.StkOffsAct = bteStkOffsAct.Text;
        //    obj.ExpClrAct = bteExpClrAct.Text;
        //    obj.StkInTnAct = bteStkInTnAct.Text;
        //    obj.ARCMAct = bteARCMAct.Text;


        //    //obj.Almacenes = ((List<BEAlmacen>)Session["oitw"]);
        //    //obj.Precios = ((List<BEPrice>)Session["opln"]);

        //    //using (var obrd = new BRDocument())
        //    //{
        //    //    obrd.SaveItems(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
        //    //}
        //    //var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
        //    //Init_VarSessions();
        //    return (_err);
        //}
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveItem"))
                {
                    //e.Result = Save();
                }
                else if (e.Parameter.Contains("Modify"))
                {
                    //e.Result = Update();
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
        protected void gdvAccountsrch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                cuenta = txtcuenta.Text,

            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_CUENTAS_ASIENTO(obj);
            Session["asiento"] = olst;
            gdvAccountsrch.DataSource = olst;
            gdvAccountsrch.DataBind();
        }

        protected void gdvAccountsrch_DataBinding(object sender, EventArgs e)
        {
            gdvAccountsrch.DataSource = Session["asiento"];
        }

        protected void gdvGrupoArt_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                Descripcion = txtnombregrupo.Text,

            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_GRUPO_ART(obj);
            Session["grupo"] = olst;
            gdvGrupoArt.DataSource = olst;
            gdvGrupoArt.DataBind();
        }

        protected void gdvGrupoArt_DataBinding(object sender, EventArgs e)
        {
            gdvGrupoArt.DataSource = Session["grupo"];
        }
    }
}