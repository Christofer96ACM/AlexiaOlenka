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
    public partial class AbonadosInfiltrados : Page
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
            Session["DXP_ISP_INFILTRADOS"] = new List<BEAbonado>();


            hdfTemp.Add("Band", false);
            hdfTemp.Add("Msg", "");
            hdfTemp.Add("IP", obec.DIRECCIONIP);
            hdfTemp.Add("Sociedad", obec.Socied);
            hdfTemp.Add("UNMK", obec.USUARIOMKT);
            hdfTemp.Add("PSWMK", obec.PASSWORDMKT);
            hdfTemp.Add("SEDE", obec.U_DXP_SEDE);
            //hdfTemp.Add("_soci", obec.Socied);
            //hdfTemp.Add("_proj", obec.Project);
            //hdfTemp.Add("_whsc", obec.WhsCode);
            //hdfTemp.Add("_cpnadd", obec.CompanyAddress.ToUpper());
            //hdfTemp.Add("_phone", obec.Phone);
            //hdfTemp.Add("_SerieM", obec.SerieMaqr);
        }
        //!+ RUTINAS AJAX
        /// <summary>
        /// LISTA LOS DATOS BASICOS
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEInitialData> Get_InitialData(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_VALORES_MK(obep);
            return (olst);
        }





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

    

     
       
        protected void grdvInfiltrados_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {

            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("INIT"))
            {
                //var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    U_DXP_COD_ABONADO = txtCliente.Text,
                    U_DXP_SEDE = obec.U_DXP_SEDE

                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_ISP_INFILTRADOS(obep);

                Session["DXP_ISP_INFILTRADOS"] = olst;
                grdvInfiltrados.DataSource = olst;
                grdvInfiltrados.DataBind();
            }
            if (e.Parameters.Contains("CHANGE"))
            {
                var sede = cbbssede.Value.ToString().Split('$');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    U_DXP_COD_ABONADO = txtCliente.Text,
                    DIRECCIONIP = sede[0],
                    PASSWORDMKT = sede[1],
                    USUARIOMKT = sede[2],
                    U_DXP_SEDE = cbbssede.Text
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_ISP_INFILTRADOS(obep);

                Session["DXP_ISP_INFILTRADOS"] = olst;
                grdvInfiltrados.DataSource = olst;
                grdvInfiltrados.DataBind();
            }
        }

        protected void grdvInfiltrados_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {

        }

        protected void grdvInfiltrados_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {

        }

        protected void grdvInfiltrados_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "U_DXP_COD_ABONADO", false) == 0 ||
               string.Compare(e.Column.FieldName, "U_DXP_ABONADO", false) == 0 ||
                string.Compare(e.Column.FieldName, "U_DXP_PLAN_INT", false) == 0 ||
                 string.Compare(e.Column.FieldName, " U_DXP_ESTADO_INT", false) == 0 )


            {
                e.Editor.ReadOnly = true;
            }
            else
            {
                e.Editor.ReadOnly = false;
            }
           

        

    }

    protected void grdvInfiltrados_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            var obrd = new BRDocument();
            var obec = ((BEParameters)Session["InitPar"]);
            var sede = cbbssede.Value.ToString().Split('$');


            if (e.ButtonID != "Eliminar") return;
            Hashtable copiedValues = null;
            string[] copiedFields = new string[] { "U_DXP_COD_ABONADO", "U_DXP_ABONADO", "U_DXP_PLAN_INT",
                 "U_DXP_ESTADO_INT" };
            copiedValues = new Hashtable();
            foreach (string fieldName in copiedFields)
                copiedValues[fieldName] = grdvInfiltrados.GetRowValues(e.VisibleIndex, fieldName);


            var obj = new BEAbonado()
            {
                U_DXP_COD_ABONADO = Convert.ToString(copiedValues["U_DXP_COD_ABONADO"]),
                U_DXP_ABONADO = Convert.ToString(copiedValues["U_DXP_ABONADO"]),
                U_DXP_PLAN_INT = Convert.ToString(copiedValues["U_DXP_PLAN_INT"]),
                U_DXP_ESTADO_INT = Convert.ToString(copiedValues["U_DXP_ESTADO_INT"]),
                U_DXP_VISIBLE = "FALSE",
                U_U_DXP_FECHA = DateTime.Today,
                U_DXP_USUARIO_MOD = obec.UserName,



                DIRECCIONIP = sede[0],
                USUARIOMKT = sede[1],
                PASSWORDMKT = sede[2],
                Socied = obec.Socied,
                U_DXP_SEDE = cbbssede.Text


            };
            obrd.DXP_UPDATE_CRUDINFILTRADOS(obj);
            grdvInfiltrados.DeleteRow(e.VisibleIndex);



        }

        protected void grdvInfiltrados_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = grdvInfiltrados.FindVisibleIndexByKeyValue(e.Keys[grdvInfiltrados.KeyFieldName]);
            Hashtable copiedValues = null;
            string[] copiedFields = new string[] { "U_DXP_COD_ABONADO", "U_DXP_ABONADO", "U_DXP_PLAN_INT",
                 "U_DXP_ESTADO_INT" };
            copiedValues = new Hashtable();
            foreach (string fieldName in copiedFields)
                copiedValues[fieldName] = grdvInfiltrados.GetRowValues(i, fieldName);
            ((List<BEAbonado>)Session["DXP_ISP_INFILTRADOS"]).RemoveAll(item => item.U_DXP_COD_ABONADO == Convert.ToString(copiedValues["U_DXP_COD_ABONADO"]));

            grdvInfiltrados.DataSource = ((List<BEAbonado>)Session["DXP_ISP_INFILTRADOS"]);
            grdvInfiltrados.DataBind();

        }

        protected void grdvInfiltrados_DataBinding(object sender, EventArgs e)
        {
            grdvInfiltrados.DataSource = Session["DXP_ISP_INFILTRADOS"];
        }
    }
}