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

namespace OneCommerce.Account
{
    public partial class Recoverer : Page
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
        }
        protected void clbSession_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            try
            {
                e.Result = string.Empty;
                var obrd = new BRLogin();
                var brdoc = new BRDocument();
                var obec = ((BEParameters)Session["InitPar"]);
                var obep = new BEParameters();

                obep.UserName = UserName.Text;
                obep.Password = Password.Text;
                obep.SAPPASSWORD = tbPasswordConfirm.Text;

                List<BEParameters> lval = obrd.Get_val_usu(obep.UserName.Trim(), obec.Socied, obec.U_DXP_SEDE);

                if (obep.Password != obep.SAPPASSWORD)
                {
                    throw new KeyNotFoundException();
                }
                else if (lval.Count == 0)
                {
                    throw new KeyNotFoundException();
                }
                else
                {
                    brdoc.Recoverer(obep);
                    e.Result = "PERM#" + "Cambio Exitoso";
                }
            }
            catch (KeyNotFoundException ex)
            {
                e.Result = ex.Message;
            }
        }

        protected void Button_Click(object sender, EventArgs e)
        {
            var obj = new BEParameters();
            obj.UserName = UserName.Text;
            obj.Password = Password.Text;
            obj.SAPPASSWORD = tbPasswordConfirm.Text;


        }
    }
}