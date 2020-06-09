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
using System.Collections;

namespace OneCommerce.Mikrotik
{
    public partial class Recursos : Page
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
                ASPxWebControl.GlobalTheme = "Aqua";





            }
        }
        protected void Page_Load(object sender, EventArgs e, ASPxGridViewCustomCallbackEventArgs e1)
        {
            //grdvPlanes_CustomCallback(sender, e1);
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

            obec.Permisos.ForEach(item => {
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName(item.GRUPO_MENU).Items.FindByName(item.PARTICULAR_MENU).Enabled = Convert.ToBoolean(item.PERMISO);
            });
        }
        private void Init_VarSessions()
        {
            var obec = ((BEParameters)Session["InitPar"]);

            Session["orcp"] = new List<BEContratos>();
            Session["DXP_ISP_REGISTRO"] = new List<BEAbonado>();
            Session["odrf"] = new List<BEDocument>();
            Session["orcl"] = new List<BEWhsCode>();
            Session["DXP_IP_POOL"] = new List<BETipoPlan>();
            Session["GET_RECURSOS"] = new List<BERecursos>();


            //hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
            ////hdfTemp.Add("_emid", obec.U_BF_EMID);
            //hdfTemp.Add("_soci", obec.Socied);
            //hdfTemp.Add("_proj", obec.Project);
            //hdfTemp.Add("_whsc", obec.WhsCode);
            //hdfTemp.Add("_cpnadd", obec.CompanyAddress.ToUpper());
            //hdfTemp.Add("_phone", obec.Phone);
            //hdfTemp.Add("_SerieM", obec.SerieMaqr);
        }
        //!+ RUTINAS AJAX
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEParameters> GET_VALORES_ARTICULOS(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_VALORES_ARTICULOS(obep);
            return (olst);
        }






       

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {

        }

        protected void grdvRecurso_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("INIT"))
            {
                //var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    

                };
                var obrd = new BRDocument();
                var olst = obrd.GET_RECURSOS(obep);

                Session["GET_RECURSOS"] = olst;
                grdvRecurso.DataSource = olst;
                grdvRecurso.DataBind();
            }

        }

        protected void grdvRecurso_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {

        }

        protected void grdvRecurso_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {

        }

        protected void grdvRecurso_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

        }

        protected void grdvRecurso_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {

        }

        protected void grdvRecurso_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            var obrd = new BRDocument();
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.ButtonID != "Enviar") return;
            Hashtable copiedValues = null;
            string[] copiedFields = new string[] { "PrjName", "DIRECCIONIP", "USUARIOMKT", "PASSWORDMKT" };
            copiedValues = new Hashtable();
            foreach (string fieldName in copiedFields)
                copiedValues[fieldName] = grdvRecurso.GetRowValues(e.VisibleIndex, fieldName);
            var obj = new BEParameters()
            {
                U_DXP_SEDE = Convert.ToString(copiedValues["PrjName"]),
                //PrjName = Convert.ToString(copiedValues["PrjName"]),
                DIRECCIONIP = Convert.ToString(copiedValues["DIRECCIONIP"]),
                USUARIOMKT= Convert.ToString(copiedValues["USUARIOMKT"]),
                PASSWORDMKT = Convert.ToString(copiedValues["PASSWORDMKT"]),
                Socied = obec.Socied,
                
            };
            obrd.Leer_Mikrotik_Abonados(obj, obec.objSapSbo);


        }

        protected void grdvRecurso_DataBinding(object sender, EventArgs e)
        {

        }


        //protected void grdvConsumos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        //{
        //    var obec = ((BEParameters)Session["InitPar"]);
        //    if (e.Parameters.Contains("INIT"))
        //    {
        //        //var spl = e.Parameters.Split(':');
        //        var obep = new BEParameters()
        //        {
        //            Socied = obec.Socied,
        //            U_DXP_COD_ABONADO = txtCliente.Text,
        //            DIRECCIONIP=obec.DIRECCIONIP,
        //            USUARIOMKT=obec.USUARIOMKT,
        //            PASSWORDMKT=obec.PASSWORDMKT,

        //        };
        //        var obrd = new BRDocument();
        //        var olst = obrd.Leer_Mikrotik_Consumos(obep);


        //        Session["DXP_ISP_REGISTRO"] = olst;
        //        grdvConsumos.DataSource = olst;
        //        grdvConsumos.DataBind();
        //    }
        //}


    }
}