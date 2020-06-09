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

namespace OneCommerce.Mikrotik
{
    public partial class Planes : Page
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


            hdfTemp.Add("IP", obec.DIRECCIONIP);
            hdfTemp.Add("Sociedad", obec.Socied);
            hdfTemp.Add("UNMK", obec.USUARIOMKT);
            hdfTemp.Add("PSWMK", obec.PASSWORDMKT);
            hdfTemp.Add("SEDE", obec.U_DXP_SEDE);
            if (obec.Band)
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    //U_DXP_COD_ABONADO = txtCliente.Text,
                    //U_DXP_DIREC_ABO = txtDireccion.Text,
                    DIRECCIONIP = obec.DIRECCIONIP,
                    PASSWORDMKT = obec.PASSWORDMKT,
                    USUARIOMKT = obec.USUARIOMKT,
                };
                var obrd = new BRDocument();
                ((BEParameters)Session["InitPar"]).Band = false;
               // obrd.Leer_Mikrotik_Active(obep, obec.objSapSbo);
            }

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
            var olst = obrd.GET_VALORES_MK(obep);
            return (olst);
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
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEAbonado> GET_VALORES_ABONADO(string IP, string USERNAME, string PASSWORD, string ABONADO)
        {
           
           var obep = new BEParameters()
            {
               
                 DIRECCIONIP = IP,
                USUARIOMKT = USERNAME,
                PASSWORDMKT = PASSWORD,
                U_DXP_COD_ABONADO = ABONADO
            };
            var obrd = new BRDocument();
            var olst = obrd.Leer_Mikrotik_ConsumosXAbonado(obep);
            return (olst);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEAbonado> GET_VALORES_ABONADO2(string SOCIEDAD, string ABONADO, string fechai, string fechaf, string IP)
        {

            var obep = new BEParameters();

            obep.DIRECCIONIP = IP;
            obep.Socied = SOCIEDAD;
            obep.U_DXP_COD_ABONADO = ABONADO;
            if (fechai == "")
            {
                obep.DateIn = DateTime.Today.AddDays(-7);
            }
            else
            {
                obep.DateIn = DateTime.Parse(fechai);
            }

            if (fechaf == "")
            {
                obep.DateFi = DateTime.Today.AddDays(-1);
            }
            else
            {
                obep.DateFi = DateTime.Parse(fechaf);
            }

           
            
            var obrd = new BRDocument();
            var olst = obrd.HISTORICO_ABONADO(obep);
            return (olst);
        }




        protected void grdvPlanes_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = grdvPlanes.EditingRowVisibleIndex;
            string[] x = new string[15];
            DateTime? fch = new DateTime();
            DateTime? fch1 = new DateTime();
            DateTime? fch2 = new DateTime();

            //if(((List<BEAlmacen>)Session["oitw"])[index].Tiempo == "Existente")

            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].Code = Convert.ToString(e.NewValues["Code"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].Name = Convert.ToString(e.NewValues["Name"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_COD_ABONADO = Convert.ToString(e.NewValues["U_DXP_COD_ABONADO"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_PLAN_INT = Convert.ToString(e.NewValues["U_DXP_PLAN_INT"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FECHA_REG = Convert.ToDateTime(e.NewValues["U_DXP_FECHA_REG"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FECHA_REG1 = Convert.ToString(e.NewValues["U_DXP_FECHA_REG1"]);
            if (((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FECHA_REG1 == "")
            {
                fch = null;

            }
            else
            {
                x = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FECHA_REG1.Substring(0, 10).Split('/');
                fch = Convert.ToDateTime(x[1] + "/" + x[0] + "/" + x[2]);

            }


            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FEC_CORT_INT = Convert.ToDateTime(e.NewValues["U_DXP_FEC_CORT_INT"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FEC_CORT_INT1 = Convert.ToString(e.NewValues["U_DXP_FEC_CORT_INT1"]);

            if (((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FEC_CORT_INT1 == "")
            {
                fch1 = null;
              

            }
            else
            {
                x = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FEC_CORT_INT1.Substring(0, 10).Split('/');
                fch1 = Convert.ToDateTime(x[1] + "/" + x[0] + "/" + x[2]);
                

            }


            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FEC_CORT_CABLE = Convert.ToDateTime(e.NewValues["U_DXP_FEC_CORT_CABLE"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FEC_CORT_CABLE1 = Convert.ToString(e.NewValues["U_DXP_FEC_CORT_CABLE1"]);

            if (((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FEC_CORT_CABLE1 == "")
            {
                fch2 = null;

            }
            else
            {
                x = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_FEC_CORT_CABLE1.Substring(0, 10).Split('/');
                fch2 = Convert.ToDateTime(x[1] + "/" + x[0] + "/" + x[2]);

            }

            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_DIRECCION = Convert.ToString(e.NewValues["U_DXP_DIRECCION"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_MAC_EQUIPO = Convert.ToString(e.NewValues["U_DXP_MAC_EQUIPO"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_ESTADO_INT = Convert.ToString(e.NewValues["U_DXP_ESTADO_INT"]);
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_ESTADO_CABLE = Convert.ToString(e.NewValues["U_DXP_ESTADO_CABLE"]);

            var sede = cbbssede.Value.ToString().Split('$');

            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].DIRECCIONIP = sede[0];
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].USUARIOMKT = sede[1];
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].PASSWORDMKT = sede[2];

            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_USUARIO_MOD = obec.UserName;
            ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_U_DXP_FECHA =DateTime.Today;

            //var obep = new BEParameters();
            //obep.Socied = obec.Socied;
            //obep.U_DXP_FECHA_REG = fch;
            //obep.U_DXP_FEC_CORT_INT = fch1;
            //obep.U_DXP_FEC_CORT_CABLE = fch2;
            //obep.U_DXP_ESTADO_INT = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_ESTADO_INT;
            //obep.U_DXP_ESTADO_CABLE = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_ESTADO_CABLE;
            //obep.U_DXP_COD_ABONADO = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_COD_ABONADO;
            //obep.U_DXP_PLAN_INT = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].U_DXP_PLAN_INT;
            //obep.Code = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index].Code;

            //var code="";
            //((List<BEAbonado>)Session["DXP_ISP_REGISTRO"]).Where(i => i.U_DXP_COD_ABONADO == Convert.ToString(e.NewValues["U_DXP_COD_ABONADO"])).ToList().ForEach(item =>
            //                                                {

            //                                                    code = item.Code;
            //                                                });

            var obrd = new BRDocument();
            //obrd.CRUD_ABONADOS(obep);
            //UPDATE EN MIKROTIK
            obrd.UpdateMikrotikAbonado(((List<BEAbonado>)Session["DXP_ISP_REGISTRO"])[index], obec.objSapSbo);
            //var olst = obrd.DXP_GET_ISP_REGISTRO(obep);

            grdvPlanes.CancelEdit();
            e.Cancel = true;
            grdvPlanes.DataSource = ((List<BEAbonado>)Session["DXP_ISP_REGISTRO"]);
            grdvPlanes.DataBind();
        }


        protected void grdvPlanes_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
       {
          var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("INIT"))
            {
                //var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    U_DXP_COD_ABONADO = txtCliente.Text,
                    U_DXP_ABONADO= txtabo.Text,
                    DateIn = (DateTime?)dterdDateIn.Value,
                    DateFi = (DateTime?)dterdDateFi.Value,
                    U_DXP_DIRECCION = txtipDirec.Text,
                    U_DXP_DIREC_ABO = txtDireccion.Text,
                    DIRECCIONIP = obec.DIRECCIONIP,
                    PASSWORDMKT=obec.PASSWORDMKT,
                    USUARIOMKT=obec.USUARIOMKT,
                    U_DXP_SEDE=obec.U_DXP_SEDE
                    
           

                };
                var obrd = new BRDocument();
                //obrd.ACTUALIZAR_DEUDAS_ABONADO(obep, obec.objSapSbo);
                var olst = obrd.DXP_GET_ISP_REGISTRO(obep);

                Session["DXP_ISP_REGISTRO"] = olst;
                grdvPlanes.DataSource = olst;
                grdvPlanes.DataBind();
            }
            if (e.Parameters.Contains("CHANGE"))
            {
                var  sede = cbbssede.Value.ToString().Split('$');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    U_DXP_COD_ABONADO = txtCliente.Text,
                    U_DXP_ABONADO = txtabo.Text,
                    DateIn = (DateTime?)dterdDateIn.Value,
                    DateFi = (DateTime?)dterdDateFi.Value,
                    U_DXP_DIRECCION = txtipDirec.Text,
                    U_DXP_DIREC_ABO = txtDireccion.Text,
                    DIRECCIONIP = sede[0],
                    PASSWORDMKT = sede[1],
                    USUARIOMKT = sede[2],
                    U_DXP_SEDE = cbbssede.Text



                };
                var obrd = new BRDocument();
                //obrd.ACTUALIZAR_DEUDAS_ABONADO(obep, obec.objSapSbo);
                var olst = obrd.DXP_GET_ISP_REGISTRO(obep);

                Session["DXP_ISP_REGISTRO"] = olst;
                grdvPlanes.DataSource = olst;
                grdvPlanes.DataBind();
            }
                //else if (e.Parameters.Contains("UNAVEZ"))
                //{

                //    var obep = new BEParameters()
                //    {
                //        Socied = obec.Socied,
                //        //U_DXP_COD_ABONADO = txtCliente.Text,
                //        //U_DXP_DIREC_ABO = txtDireccion.Text,
                //        DIRECCIONIP = obec.DIRECCIONIP,
                //        PASSWORDMKT = obec.PASSWORDMKT,
                //        USUARIOMKT = obec.USUARIOMKT,
                //    };
                //    var obrd = new BRDocument();
                //    obrd.Leer_Mikrotik_Active(obep, obec.objSapSbo);

                //}
            }


        protected void grdvPlanes_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.ButtonType == ColumnCommandButtonType.Edit)
            {
                e.Enabled = true;
            }

        }

        protected void grdvPlanes_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {

        }

        protected void grdvPlanes_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "Name", false) == 0 ||
               string.Compare(e.Column.FieldName, "U_DXP_COD_ABONADO", false) == 0 ||
               string.Compare(e.Column.FieldName, "U_DXP_ABONADO", false) == 0 ||
               //string.Compare(e.Column.FieldName, "U_DXP_DIRECCION", false) == 0 ||
                string.Compare(e.Column.FieldName, "U_DXP_DIREC_ABO", false) == 0 ||
               string.Compare(e.Column.FieldName, "U_DXP_FECHA_REG1", false) == 0 ||
               string.Compare(e.Column.FieldName, "U_DXP_MAC_EQUIPO", false) == 0 ||
               string.Compare(e.Column.FieldName, "Remind", false) == 0 ||
               string.Compare(e.Column.FieldName, "DocNum", false) == 0 ||
               string.Compare(e.Column.FieldName, "U_U_DXP_DEUDA_ACT", false) == 0 ||
               string.Compare(e.Column.FieldName, "U_DXP_ULT_PAGO1", false) == 0 ||
               string.Compare(e.Column.FieldName, "name", false) == 0)
            {
                e.Editor.ReadOnly = true;
            }
            else
            {
                e.Editor.ReadOnly = false;
            }
            if (string.Compare(e.Column.FieldName, "U_DXP_PLAN_INT", false) == 0 ||
                string.Compare(e.Column.FieldName, "U_DXP_FEC_CORT_INT1", false) == 0 ||
                string.Compare(e.Column.FieldName, "U_DXP_FEC_CORT_CABLE1", false) == 0 ||
                string.Compare(e.Column.FieldName, "U_DXP_DIRECCION", false) == 0 ||
                string.Compare(e.Column.FieldName, " U_DXP_ESTADO_INT", false) == 0 ||
                string.Compare(e.Column.FieldName, " U_DXP_ESTADO_CABLE", false) == 0 )
            {
                e.Editor.Focus();
            }

        }

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {

        }

        protected void gdvPlan_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void gdvPlan_DataBinding(object sender, EventArgs e)
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
                    U_DXP_SEDE = cbbssede.Text


                };
                var obrd = new BRDocument();
                if(obj.U_DXP_SEDE=="CE JULIACA")
                {
                    obj.U_DXP_SEDE = "02";
                }
                else if (obj.U_DXP_SEDE == "CE PUNO")
                {
                    obj.U_DXP_SEDE = "01";
                }
                var olst = obrd.GET_TIPOPLAN(obj);
                Session["DXP_IP_POOL"] = olst;
                gdvTipoPlan.DataSource = olst;
                gdvTipoPlan.DataBind();
            }
        }

        protected void gdvTipoPlan_DataBinding(object sender, EventArgs e)
        {
            gdvTipoPlan.DataSource = Session["DXP_IP_POOL"];
        }

        protected void grdvPlanes_DataBinding(object sender, EventArgs e)

        {
            grdvPlanes.DataSource = Session["DXP_ISP_REGISTRO"];
        }

        protected void gdvConsumo_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void gdvConsumo_DataBinding(object sender, EventArgs e)
        {

        }

        protected void gdvStatus_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {

        }

        protected void gdvStatus_DataBinding(object sender, EventArgs e)
        {

        }

        protected void cbbssede_Callback(object sender, CallbackEventArgsBase e)
        {

        }
    }
}