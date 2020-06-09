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
    public partial class Onus : Page
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

            hdfTemp.Add("IPONU", obec.IPONU);
            hdfTemp.Add("Sociedad", obec.Socied);
            hdfTemp.Add("UNON", obec.USUARIONU);
            hdfTemp.Add("PSWON", obec.PASSWORDONU);
            hdfTemp.Add("SEDE", obec.U_DXP_SEDE);
            hdfTemp.Add("MensajeSalida", false);
            hdfTemp.Add("Mensaje1", false);
            hdfTemp.Add("Mensaje2", false);


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

        protected void grdvRegistroOnus_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
         var obec = ((BEParameters)Session["InitPar"]);
            string mensaje = "Inicio";

                if (e.Parameters.Contains("INIT"))
            {
                //var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    U_DXP_ABO_MIKROT = txtCliente.Text,
                    U_DXP_ONU_SEDE = obec.U_DXP_SEDE,
                    U_DXP_ABONADO=txtabo.Text,
                    U_U_DXP_ONU_SERIAL=txtserial.Text,
                    U_DXP_COD_ONU=txtonu.Text,
                    U_DXP_ONU_TYPE=txttypeonu.Text


                };
                var obrd = new BRDocument();
                if (obep.IPONU == "" || obep.USUARIONU == "" || obep.PASSWORDONU == "" || obep.IPONU == "null" || obep.USUARIONU == "null" || obep.PASSWORDONU == "null"
                    || obep.IPONU == null || obep.USUARIONU == null || obep.PASSWORDONU == null)
                {
                    
                    mensaje = "No existe OLT registrada";
                    hdfTemp.Set("MensajeSalida", mensaje);
                    var olst = obrd.DXP_GET_REGISTROONUS(obep);

                    Session["DXP_REGISTRO_ONU"] = olst;
                    grdvRegistroOnus.DataSource = olst;
                    grdvRegistroOnus.DataBind();
                }
                else
                {
                    var olst = obrd.DXP_GET_REGISTROONUS(obep);

                    Session["DXP_REGISTRO_ONU"] = olst;
                    grdvRegistroOnus.DataSource = olst;
                    grdvRegistroOnus.DataBind();
                }

                
            }
            if (e.Parameters.Contains("CHANGE"))
            {
                var sede = cbbssede.Value.ToString().Split('$');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    U_DXP_ABO_MIKROT = txtCliente.Text,
                    IPONU = sede[0],
                    PASSWORDONU = sede[1],
                    USUARIONU = sede[2],
                    U_DXP_ONU_SEDE = cbbssede.Text,
                    U_DXP_ABONADO = txtabo.Text,
                    U_U_DXP_ONU_SERIAL = txtserial.Text,
                    U_DXP_COD_ONU = txtonu.Text,
                    U_DXP_ONU_TYPE = txttypeonu.Text
                };
                var obrd = new BRDocument();
                if (obep.IPONU == "" || obep.USUARIONU == "" || obep.PASSWORDONU == "" || obep.IPONU == "null" || obep.USUARIONU == "null" || obep.PASSWORDONU == "null"
                    || obep.IPONU == null || obep.USUARIONU == null || obep.PASSWORDONU == null)
                {
                    mensaje = "No existe OLT registrada";
                    hdfTemp.Set("MensajeSalida", mensaje);
                    var olst = obrd.DXP_GET_REGISTROONUS(obep);

                    Session["DXP_REGISTRO_ONU"] = olst;
                    grdvRegistroOnus.DataSource = olst;
                    grdvRegistroOnus.DataBind();
                }
                else
                {
                    var olst = obrd.DXP_GET_REGISTROONUS(obep);

                    Session["DXP_REGISTRO_ONU"] = olst;
                    grdvRegistroOnus.DataSource = olst;
                    grdvRegistroOnus.DataBind();
                }
                
            }
        }

        protected void grdvRegistroOnus_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {

        }

        protected void grdvRegistroOnus_DataBinding(object sender, EventArgs e)
        {
            grdvRegistroOnus.DataSource = Session["DXP_REGISTRO_ONU"];
        }

        protected void grdvRegistroOnus_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (
              string.Compare(e.Column.FieldName, "U_DXP_ONU_CODABO", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_TARJETA", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_PUERTO", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_ABONADO", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_COD_ONU", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_ESTADO", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ABO_MIKROT", false) == 0 ||
              string.Compare(e.Column.FieldName, "U_DXP_ONU_TYPE", false) == 0)
            {
                e.Editor.ReadOnly = true;
            }
            else
            {
                e.Editor.ReadOnly = false;
            }
            
        
    }

        protected void grdvRegistroOnus_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {

        }

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {

        }

        protected void grdvRegistroOnus_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            var obrd = new BRDocument();
            var obec = ((BEParameters)Session["InitPar"]);
            var sede = cbbssede.Value.ToString().Split('$');
            var mensajesalida = "";
            var abonado = "";


            if (e.ButtonID != "Cortar" && e.ButtonID != "Eliminar" && e.ButtonID!="Activar") return;
            Hashtable copiedValues = null;
            string[] copiedFields = new string[] { "Code","U_DXP_ABO_MIKROT", "U_DXP_ONU_CODABO", "U_DXP_ONU_TARJETA", "U_DXP_ONU_PUERTO",
                "U_DXP_ONU_ABONADO", "U_DXP_COD_ONU" , "U_DXP_ONU_TYPE","U_U_DXP_ONU_SERIAL", "U_DXP_ONU_ESTADO" };
            copiedValues = new Hashtable();

            abonado = Convert.ToString(copiedValues["U_DXP_ONU_CODABO"]);

            foreach (string fieldName in copiedFields)
                copiedValues[fieldName] = grdvRegistroOnus.GetRowValues(e.VisibleIndex, fieldName);
            var obj = new BEOnu()
            {
                Code = Convert.ToString(copiedValues["Code"]),
                U_DXP_ABO_MIKROT = Convert.ToString(copiedValues["U_DXP_ABO_MIKROT"]),
                U_DXP_ONU_CODABO = Convert.ToString(copiedValues["U_DXP_ONU_CODABO"]),
                U_DXP_ONU_TARJETA = Convert.ToString(copiedValues["U_DXP_ONU_TARJETA"]),
                U_DXP_ONU_PUERTO = Convert.ToString(copiedValues["U_DXP_ONU_PUERTO"]),
                U_DXP_ONU_ABONADO = Convert.ToString(copiedValues["U_DXP_ONU_ABONADO"]),
                U_DXP_COD_ONU = Convert.ToString(copiedValues["U_DXP_COD_ONU"]),
                U_DXP_ONU_TYPE = Convert.ToString(copiedValues["U_DXP_ONU_TYPE"]),
                U_U_DXP_ONU_SERIAL = Convert.ToString(copiedValues["U_U_DXP_ONU_SERIAL"]),
                U_DXP_ONU_ESTADO = Convert.ToString(copiedValues["U_DXP_ONU_ESTADO"]),
                TIPO_CORTE = e.ButtonID,
                
                


                IPONU= sede[0],
                USUARIONU = sede[1],
                PASSWORDONU = sede[2],
                Socied = obec.Socied,
                U_DXP_ONU_SEDE = cbbssede.Text
            };

            var objs = new BEParameters()
            {
                Code = Convert.ToString(copiedValues["Code"]),
                U_DXP_ABO_MIKROT = Convert.ToString(copiedValues["U_DXP_ABO_MIKROT"]),
                U_DXP_ONU_CODABO = Convert.ToString(copiedValues["U_DXP_ONU_CODABO"]),
                U_DXP_ONU_TARJETA = Convert.ToString(copiedValues["U_DXP_ONU_TARJETA"]),
                U_DXP_ONU_PUERTO = Convert.ToString(copiedValues["U_DXP_ONU_PUERTO"]),
                U_DXP_ONU_ABONADO = Convert.ToString(copiedValues["U_DXP_ONU_ABONADO"]),
                U_DXP_COD_ONU = Convert.ToString(copiedValues["U_DXP_COD_ONU"]),
                U_DXP_ONU_TYPE = Convert.ToString(copiedValues["U_DXP_ONU_TYPE"]),
                U_U_DXP_ONU_SERIAL = Convert.ToString(copiedValues["U_U_DXP_ONU_SERIAL"]),
                U_DXP_ONU_ESTADO = Convert.ToString(copiedValues["U_DXP_ONU_ESTADO"]),
               



                IPONU = sede[0],
                USUARIONU = sede[1],
                PASSWORDONU = sede[2],
                Socied = obec.Socied,
                U_DXP_ONU_SEDE = cbbssede.Text
            };





            var mensaje = obrd.BAJA_ONU(objs, obj);
            if (obj.TIPO_CORTE=="Eliminar"&& mensaje.Contains("[Successful]") && !mensaje.Contains("invalid"))
            {
                mensajesalida = "La onu " + obj.U_DXP_ONU_CODABO + " ha Sido Eliminada";
                hdfTemp.Set("mensaje1",mensajesalida);
                objs.U_DXP_ONU_ESTADO = "ELIMINADO";
                obrd.ONU_DELETE(objs, obec.objSapSbo);
                grdvRegistroOnus.DeleteRow(e.VisibleIndex);
                grdvRegistroOnus.DataSource = Session["DXP_REGISTRO_ONU"];
            }
            else if (obj.TIPO_CORTE == "Cortar")
            {
                if (mensaje.Contains("OK"))
                {
                    mensajesalida = "La onu " + obj.U_DXP_ONU_CODABO + " ha Sido Cortada";
                    objs.U_DXP_ONU_ESTADO = "CORTE";
                    obrd.ACTUALIZAR_ONUSAP(objs, obec.objSapSbo);
                    grdvRegistroOnus.DataSource = Session["DXP_REGISTRO_ONU"];
                }
                else
                {
                    mensajesalida = "Error de Conexion,vuelva a intentarlo";
                    grdvRegistroOnus.DataSource = Session["DXP_REGISTRO_ONU"];
                }
            }
            else if(obj.TIPO_CORTE == "Activar")
            {
                if (mensaje.Contains("OK"))
                {
                    mensajesalida = "La onu " + obj.U_DXP_ONU_CODABO + " ha Sido Activada";
                    objs.U_DXP_ONU_ESTADO = "READY ";
                    obrd.ACTUALIZAR_ONUSAP(objs, obec.objSapSbo);
                    grdvRegistroOnus.DataSource = Session["DXP_REGISTRO_ONU"];
                }
                else
                {
                    mensajesalida = "Error de Conexion,vuelva a intentarlo";
                    grdvRegistroOnus.DataSource = Session["DXP_REGISTRO_ONU"];
                }
            }
            

            grdvRegistroOnus.DataSource = Session["DXP_REGISTRO_ONU"];
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

        protected void hdfTemp_CustomCallback(object sender, CallbackEventArgsBase e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameter.Contains("MensajeSalida"))
            {
                hdfTemp.Set("MensajeSalida", "No existe OLT registrada");
            }
        }

        protected void grdvRegistroOnus_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = grdvRegistroOnus.FindVisibleIndexByKeyValue(e.Keys[grdvRegistroOnus.KeyFieldName]);
            Hashtable copiedValues = null;
            string[] copiedFields = new string[] { "Code","U_DXP_ABO_MIKROT", "U_DXP_ONU_CODABO", "U_DXP_ONU_TARJETA", "U_DXP_ONU_PUERTO",
                "U_DXP_ONU_ABONADO", "U_DXP_COD_ONU" , "U_DXP_ONU_TYPE","U_U_DXP_ONU_SERIAL", "U_DXP_ONU_ESTADO" };
            copiedValues = new Hashtable();
            foreach (string fieldName in copiedFields)
                copiedValues[fieldName] = grdvRegistroOnus.GetRowValues(i, fieldName);
            ((List<BEOnu>)Session["DXP_REGISTRO_ONU"]).RemoveAll(item => item.Code == Convert.ToString(copiedValues["Code"]));

            grdvRegistroOnus.DataSource = ((List<BEOnu>)Session["DXP_REGISTRO_ONU"]);
            grdvRegistroOnus.DataBind();
        }
    }
}