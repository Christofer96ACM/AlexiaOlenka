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

namespace OneCommerce.RegistroOnus
{
    public partial class Registro : Page
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
            Session["DXP_REGISTRO_ONU"] = new List<BEOnu>();
            Session["DXP_REGISTRO_ONU2"] = new List<BEOnu>();
            Session["DXP_PLAN_ONU"] = new List<BETipoPlan>();

            hdfTemp.Add("IPONU", obec.IPONU);
            hdfTemp.Add("Sociedad", obec.Socied);
            hdfTemp.Add("UNON", obec.USUARIONU);
            hdfTemp.Add("PSWON", obec.PASSWORDONU);
            hdfTemp.Add("SEDE", obec.U_DXP_SEDE);
            

            //hdfTemp.Add("_proj", obec.Project);
            //hdfTemp.Add("_whsc", obec.WhsCode);
            //hdfTemp.Add("_cpnadd", obec.CompanyAddress.ToUpper());
            //hdfTemp.Add("_phone", obec.Phone);
            //hdfTemp.Add("_SerieM", obec.SerieMaqr);
        }

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
            var olst = obrd.GET_VALORES_ON(obep);
            return (olst);
        }

       
        

        protected void grdvOnusRegistro_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var mensaje = "";

            if (e.Parameters.Contains("INIT"))
            {
                //var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    U_DXP_ONU_SEDE = obec.U_DXP_SEDE,
                    IPONU = obec.IPONU,
                    USUARIONU=obec.USUARIONU,
                    PASSWORDONU=obec.PASSWORDONU



                };
                var obrd = new BRDocument();
                //if(obep.IPONU=="" || obep.USUARIONU=="" || obep.PASSWORDONU == "" || obep.IPONU == "null" || obep.USUARIONU == "null" || obep.PASSWORDONU == "null"
                //    || obep.IPONU == null || obep.USUARIONU ==null || obep.PASSWORDONU == null)
                //{
                //   mensaje = "No existe OLT registrada";
                //    ((List<BEOnu>)Session["DXP_REGISTRO_ONU2"]).Clear();
                //    grdvOnusRegistro.DataSource = Session["DXP_REGISTRO_ONU2"];
                    

                //}
                //else {

                    var olst = obrd.LEER_ONUS_REGISTRAR(obep);

                    Session["DXP_REGISTRO_ONU"] = olst;
                    grdvOnusRegistro.DataSource = olst;
                    grdvOnusRegistro.DataBind();
                //}
                
            }
            if (e.Parameters.Contains("CHANGE"))
            {
                var sede = cbbssede.Value.ToString().Split('$');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    IPONU = sede[0],
                    PASSWORDONU = sede[2],
                    USUARIONU = sede[1],
                    U_DXP_ONU_SEDE = cbbssede.Text
                };
                var obrd = new BRDocument();

                //if (obep.IPONU == "" || obep.USUARIONU == "" || obep.PASSWORDONU == "" || obep.IPONU == "null" || obep.USUARIONU == "null" || obep.PASSWORDONU == "null"
                //    || obep.IPONU == null || obep.USUARIONU == null || obep.PASSWORDONU == null)
                //{
                //    mensaje = "No existe OLT registrada";
                //    ((List<BEOnu>)Session["DXP_REGISTRO_ONU2"]).Clear();
                //    grdvOnusRegistro.DataSource = Session["DXP_REGISTRO_ONU2"];


                //}

                //else
                //{
                    var olst = obrd.LEER_ONUS_REGISTRAR(obep);

                    Session["DXP_REGISTRO_ONU"] = olst;
                    grdvOnusRegistro.DataSource = olst;
                    grdvOnusRegistro.DataBind();

            //    }
                
            }

        }

        protected void grdvOnusRegistro_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = grdvOnusRegistro.EditingRowVisibleIndex;
            string[] x = new string[15];

            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"])[index].U_DXP_ABO_MIKROT= Convert.ToString(e.NewValues["U_DXP_ABO_MIKROT"]);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"])[index].U_DXP_ONU_CODABO = Convert.ToString(e.NewValues["U_DXP_ONU_CODABO"]);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"])[index].U_DXP_ONU_TARJETA = Convert.ToString(e.NewValues["U_DXP_ONU_TARJETA"]);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"])[index].U_DXP_ONU_PUERTO = Convert.ToString(e.NewValues["U_DXP_ONU_PUERTO"]);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"])[index].U_DXP_ONU_ABONADO = Convert.ToString(e.NewValues["U_DXP_ONU_ABONADO"]);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"])[index].U_DXP_COD_ONU = Convert.ToString(e.NewValues["U_DXP_COD_ONU"]);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"])[index].U_DXP_ONU_TYPE= Convert.ToString(e.NewValues["U_DXP_ONU_TYPE"]);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"])[index].U_DXP_ONU_ESTADO = Convert.ToString(e.NewValues["U_DXP_ONU_ESTADO"]);


            //var obrd = new BRDocument();
            //obrd.CRUD_PENDIENTES(obep);
            //var olst = obrd.DXP_GET_ISP_REGISTROTMP(obep);

            grdvOnusRegistro.CancelEdit();
            e.Cancel = true;
            grdvOnusRegistro.DataSource = Session["DXP_REGISTRO_ONU"];
            grdvOnusRegistro.DataBind();

        }

        protected void grdvOnusRegistro_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {

        }

        protected void grdvOnusRegistro_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (
              string.Compare(e.Column.FieldName, "U_DXP_ONU_CODABO", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_TARJETA", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_PUERTO", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_ABONADO", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_COD_ONU", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_ESTADO", false) == 0 )
            {
                e.Editor.ReadOnly = true;
            }
            else
            {
                e.Editor.ReadOnly = false;
            }
            if (string.Compare(e.Column.FieldName, "U_DXP_ABO_MIKROT", false) == 0 ||
                string.Compare(e.Column.FieldName, "U_DXP_ONU_TYPE", false) == 0 )
            {
                e.Editor.Focus();
            }
        }

        protected void grdvOnusRegistro_DataBinding(object sender, EventArgs e)
        {
            grdvOnusRegistro.DataSource = Session["DXP_REGISTRO_ONU"];
        }

        protected void grdvOnusRegistro_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            var obrd = new BRDocument();
            var obec = ((BEParameters)Session["InitPar"]);
            var sede = cbbssede.Value.ToString().Split('$');
            var mensajesalida = "";


            if (e.ButtonID != "Registrar") return;
            Hashtable copiedValues = null;
            string[] copiedFields = new string[] { "U_DXP_ABO_MIKROT", "U_DXP_ONU_CODABO", "U_DXP_ONU_TARJETA", "U_DXP_ONU_PUERTO",
                "U_DXP_ONU_ABONADO", "U_DXP_COD_ONU" , "U_DXP_ONU_TYPE","U_U_DXP_ONU_SERIAL", "U_DXP_ONU_ESTADO" };
            copiedValues = new Hashtable();
            foreach (string fieldName in copiedFields)
                copiedValues[fieldName] = grdvOnusRegistro.GetRowValues(e.VisibleIndex, fieldName);
            var obj = new BEOnu()
            {
                U_DXP_ABO_MIKROT = Convert.ToString(copiedValues["U_DXP_ABO_MIKROT"]),
                U_DXP_ONU_CODABO = Convert.ToString(copiedValues["U_DXP_ONU_CODABO"]),
                U_DXP_ONU_TARJETA = Convert.ToString(copiedValues["U_DXP_ONU_TARJETA"]),
                U_DXP_ONU_PUERTO = Convert.ToString(copiedValues["U_DXP_ONU_PUERTO"]),
                U_DXP_ONU_ABONADO = Convert.ToString(copiedValues["U_DXP_ONU_ABONADO"]),
                U_DXP_COD_ONU = Convert.ToString(copiedValues["U_DXP_COD_ONU"]),
                U_DXP_ONU_TYPE = Convert.ToString(copiedValues["U_DXP_ONU_TYPE"]),
                U_U_DXP_ONU_SERIAL = Convert.ToString(copiedValues["U_U_DXP_ONU_SERIAL"]),
                U_DXP_ONU_ESTADO = Convert.ToString(copiedValues["U_DXP_ONU_ESTADO"]),
                U_DXP_ONU_SEDE = cbbssede.Text,

            };
            var objs = new BEParameters()
            {
                IPONU = sede[0],
                USUARIONU = sede[1],
                PASSWORDONU = sede[2],
                Socied = obec.Socied,
                U_DXP_ONU_SEDE = cbbssede.Text,
                U_DXP_ABO_MIKROT = Convert.ToString(copiedValues["U_DXP_ABO_MIKROT"]),
                U_DXP_ONU_CODABO = Convert.ToString(copiedValues["U_DXP_ONU_CODABO"]),
                U_DXP_ONU_TARJETA = Convert.ToString(copiedValues["U_DXP_ONU_TARJETA"]),
                U_DXP_ONU_PUERTO = Convert.ToString(copiedValues["U_DXP_ONU_PUERTO"]),
                U_DXP_ONU_ABONADO = Convert.ToString(copiedValues["U_DXP_ONU_ABONADO"]),
                U_DXP_COD_ONU = Convert.ToString(copiedValues["U_DXP_COD_ONU"]),
                U_DXP_ONU_TYPE = Convert.ToString(copiedValues["U_DXP_ONU_TYPE"]),
                U_U_DXP_ONU_SERIAL = Convert.ToString(copiedValues["U_U_DXP_ONU_SERIAL"]),
                U_DXP_ONU_ESTADO = Convert.ToString(copiedValues["U_DXP_ONU_ESTADO"]),
            };

            
           
            var mensaje=obrd.REGISTRAR_ONUS(objs,obj);
            if(mensaje.Contains("Backuping old configuration into flash") && mensaje.Contains("OK"))
            {
                var abo = mensaje.Split(':');
                objs.U_DXP_ONU_ABONADO = abo[0];
                obrd.GUARDAR_ONU_SAP(objs, obec.objSapSbo);
                mensajesalida = "Abonado Configurado Correctamente";
                grdvOnusRegistro.DeleteRow(e.VisibleIndex);
            }
           
            
            grdvOnusRegistro.DataSource = Session["DXP_REGISTRO_ONU"];

            //var mensaje = obrd.MikrotikPendientes(obj, obec.objSapSbo);
            //// hdfTemp.Set("Msg", mensaje);
            //if (mensaje.Contains("Abonado Creado Correctamente"))
            //{
            //    grdvRegistroOnus.DeleteRow(e.VisibleIndex);
            //    obrd.DeletePendientes(obj, obec.objSapSbo);
            //}
            //else
            //{

            //}
        }

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {

        }

        protected void gdvTipoPlan_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var spl = e.Parameters.Split(':');
            if (e.Parameters.Contains("SRCH"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    Code = spl[1],
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_IP_PLAN_ONU(obj);
                Session["DXP_PLAN_ONU"] = olst;
                gdvTipoPlan.DataSource = olst;
                gdvTipoPlan.DataBind();
            }
        }

        protected void gdvTipoPlan_DataBinding(object sender, EventArgs e)
        {
            gdvTipoPlan.DataSource = Session["DXP_PLAN_ONU"];
        }

        protected void grdvOnusRegistro_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = grdvOnusRegistro.FindVisibleIndexByKeyValue(e.Keys[grdvOnusRegistro.KeyFieldName]);
            Hashtable copiedValues = null;
            string[] copiedFields = new string[] { "U_DXP_ABO_MIKROT", "U_DXP_ONU_CODABO", "U_DXP_ONU_TARJETA", "U_DXP_ONU_PUERTO",
                "U_DXP_ONU_ABONADO", "U_DXP_COD_ONU" , "U_DXP_ONU_TYPE","U_U_DXP_ONU_SERIAL", "U_DXP_ONU_ESTADO" };
            copiedValues = new Hashtable();
            foreach (string fieldName in copiedFields)
                copiedValues[fieldName] = grdvOnusRegistro.GetRowValues(i, fieldName);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"]).RemoveAll(item => item.U_DXP_ABO_MIKROT == Convert.ToString(copiedValues["U_DXP_ABO_MIKROT"]));

            grdvOnusRegistro.DataSource = ((List<BEOnu>)Session["DXP_REGISTRO_ONU"]);
            grdvOnusRegistro.DataBind();
        }
    }
}