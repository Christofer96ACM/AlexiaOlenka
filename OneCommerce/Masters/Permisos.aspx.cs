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

namespace OneCommerce.Masters
{
    public partial class Permisos : Page
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

                    Init_VarSessions();
                    Set_Permissions();
                    var mmp = ((ASPxNavBar)Master.FindControl("nvbMain"));
                    var _sd = obec.RAZON_SOCIAL;
                    ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Socied")).InnerText = _sd;
                    ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Local")).InnerText = obec.DscpLocal;
                    ((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "Tipo de Cambio: " + obec.Rate.ToString("c3");             
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
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                Project = obec.Project,
                U_DXP_SEDE = obec.U_DXP_SEDE,
            };
            var obrd = new BRDocument();
            var olst = obrd.USUARIOS(obj);
            if (olst.Count != 0)
            {
                cbbUsuario.Items.Add("", 0);
                olst.ForEach(ite =>
                {
                    cbbUsuario.Items.Add(ite.UserName, ite.UserName);
                });
            }
            else
            {
                cbbUsuario.Items.Add("", 0);
                cbbUsuario.SelectedIndex = 0;
            }
        }
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveItem"))
                {
                    //e.Result = SaveItem();
                }
                else if (e.Parameter.Contains("Modify"))
                {
                    //e.Result = "";
                }
                else
                {
                    //e.Result = string.Empty;
                }
            }
            catch (Exception ex)
            {
                e.Result = ex.Message;
            }
        }

        protected void gdvPermisos_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {

        }

        protected void gdvPermisos_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gdvPermisos.EditingRowVisibleIndex;

            ((List<BEParameters>)Session["perm"])[index].PERMISOR = Convert.ToString(e.NewValues["PERMISOR"]);

            gdvPermisos.CancelEdit();
            e.Cancel = true;
            gdvPermisos.DataSource = ((List<BEParameters>)Session["perm"]);
            gdvPermisos.DataBind();

            var x = new BEParameters();
            
            x.PERMISOR = Convert.ToString(e.NewValues["PERMISOR"]);
            if (x.PERMISOR == "Y")
                x.PERMISOR = "1";
            else
                x.PERMISOR = "0";
            x.Socied = obec.Socied;
            x.Project = obec.Project;
            x.UserName = obec.UserName;
            x.NOMBRE_OFICIAL = Convert.ToString(e.NewValues["NOMBRE_OFICIAL"]);

            using (var obrd = new BRDocument())
            {
                obrd.EDIT_PERMISOS(x);
            }
            var obrl = new BRLogin();
            ((BEParameters)Session["InitPar"]).Permisos = obrl.GET_PERMISOS(((BEParameters)Session["InitPar"]));
        }

        protected void gdvPermisos_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "UserName", false) == 0 ||
                string.Compare(e.Column.FieldName, "NOMBRE_OFICIAL", false) == 0)
            {
                e.Editor.ReadOnly = true;
            }
            else
            {
                e.Editor.ReadOnly = false;
            }
        }

        protected void gdvPermisos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("GET"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    Project = obec.Project,
                    UserName = cbbUsuario.Text
                };
                var obrd = new BRDocument();
                var olst = obrd.PERMISOS(obj);
                Session["perm"] = olst.Where(i => i.LOCAL == obec.Project).ToList();
                gdvPermisos.DataSource = olst;
                gdvPermisos.DataBind();
            }
        }

        protected void cbbUsuario_Callback(object sender, CallbackEventArgsBase e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameter.Contains("GET"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    Project = obec.Project,
                    U_DXP_SEDE = obec.U_DXP_SEDE,
                };
                var obrd = new BRDocument();
                var olst = obrd.USUARIOS(obj);
                if (olst.Count != 0)
                {
                    cbbUsuario.Items.Add("", 0);
                    olst.ForEach(ite =>
                    {
                        cbbUsuario.Items.Add(ite.UserName, ite.UserName);
                    });
                }
                else
                {
                    cbbUsuario.Items.Add("", 0);
                    cbbUsuario.SelectedIndex = 0;
                }
            }
        }
        protected void btnAddVistas_Click(object sender, EventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obrd = new BRDocument();
            var olst = obrd.VISTAS();
            var cant = ((List<BEParameters>)Session["perm"]).Count;
            var usuario = cbbUsuario.Text;
            var listavistas = new List<BEParameters>();
            if (cant == 0)
            {
                listavistas.Clear();
                olst.ForEach(item => {
                    var linea = new BEParameters();
                    linea.UserName = usuario;
                    linea.PERMISO = 1;
                    linea.Socied = obec.Socied;
                    linea.Project = obec.Project;
                    linea.GRUPO_MENU = item.GRUPO_MENU;
                    linea.PARTICULAR_MENU = item.PARTICULAR_MENU;
                    linea.NOMBRE_OFICIAL = item.NOMBRE_OFICIAL;

                    listavistas.Add(linea);
                });

            }
            else
            {
                listavistas.Clear();
                olst.ForEach(item => {
                    ((List<BEParameters>)Session["perm"]).ForEach(it =>{
                        if (item.NOMBRE_OFICIAL == it.NOMBRE_OFICIAL)
                            item.Band = true;
                    });
                });
                olst.Where(i => i.Band != true).ToList().ForEach(x => {
                    var linea = new BEParameters();
                    linea.UserName = usuario;
                    linea.PERMISO = 1;
                    linea.Socied = obec.Socied;
                    linea.Project = obec.Project;
                    linea.GRUPO_MENU = x.GRUPO_MENU;
                    linea.PARTICULAR_MENU = x.PARTICULAR_MENU;
                    linea.NOMBRE_OFICIAL = x.NOMBRE_OFICIAL;

                    listavistas.Add(linea);
                });

            }
            if(listavistas.Count != 0)
            {
                listavistas.ForEach(add => {
                    obrd.DXP_INSERT_VISTA_POR_USUARIO(add);
                });
            }
        }
    }
}