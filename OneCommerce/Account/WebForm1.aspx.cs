using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessRules;
using BusinessServices;
using System.Web.Security;
using BusinessEntities;
using System.Web.Services;
using System.Web.Script.Services;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxNavBar;
namespace OneCommerce.Account
{
    public partial class WebForm1 :Page
    {
        private readonly BRLogin obrl;
       
        public WebForm1() {
            obrl = new BRLogin();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(User.Identity.Name))
            {
                FormsAuthentication.SignOut();
                FormsAuthentication.RedirectToLoginPage();
            }
            else { 
            if(!IsPostBack && !IsCallback){

                var obec = ((BEParameters)Session["InitPar"]);
                Session["Val"] = new List<BELocalValidar>();
                Set_Permissions();
                //if (obec.Socied == "BM")
                //{
                    //FormsAuthentication.SignOut();
                    //FormsAuthentication.RedirectToLoginPage();
                //}
                //else
                //{
                  //  HiddenFieldPar.Add("_Socied", obec.Socied);
                  //  ver();
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
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Masters").Visible = true;
            /*var obec = ((BEParameters)Session["InitPar"]);
            if (obec.Permition == "001")
            {
                if (obec.Socied == "BM")*/
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARInvoice").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARReserva").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("CreditNote").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Reports").Visible = true;
            /*}
            else if (obec.Permition == "003")
            {
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("SalesOrder").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = false;
            }
            if (obec.U_BF_ADMIN == 0)*/
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Administrator").Visible = true;
        }
        /// <summary>
        /// LISTA LOS DATOS BASICOS
        /// </summary>
        /// <param name="socied"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEAdministrator> getdatos()
        {
            var obrd = new BRDocument();
            var list = obrd.Get_list_user_admin();
            return (list);
        }
        protected void dgPermisos_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            var obj = new BEParameters()
            {
                UserName=Convert.ToString(cbouser.Value)
            };
            var obrd = new BRLogin();
            var va = obrd.Get_SP_LISTARLOCALVAL(obj);
            Session["Val"] = va;
            dgPermisos.DataSource = va;
            dgPermisos.DataBind();
        }
        protected void dgPermisos_DataBinding(object sender, EventArgs e)
        {
            dgPermisos.DataSource = Session["Val"];
        }

        protected void dgPermisos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            dgPermisos.DoRowValidation();
            var index = dgPermisos.EditingRowVisibleIndex;
            ((List<BELocalValidar>)Session["Val"])[index].PrjCode = Convert.ToString(e.NewValues["PrjCode"]);
            ((List<BELocalValidar>)Session["Val"])[index].PrjName = Convert.ToString(e.NewValues["PrjName"]);
            ((List<BELocalValidar>)Session["Val"])[index].alf_soci = Convert.ToString(e.NewValues["alf_soci"]);
            ((List<BELocalValidar>)Session["Val"])[index].Permition = Convert.ToBoolean(e.NewValues["Permition"]);
            var obj = new BEParameters()
            {
                UserName = Convert.ToString(cbouser.Value),
                Socied=Convert.ToString(e.NewValues["alf_soci"]),
                Project=Convert.ToString(e.NewValues["PrjName"])
            };
            var obrd = new BRLogin();
            var liVal = obrd.Get_SP_VAL_UPDATE_LOCAL(obj);
            if (liVal.Count > 0)
            {
                obrd.SET_SP_EDITAR_VALLOCAL(obj, Convert.ToBoolean(e.NewValues["Permition"]));
            }
            else
            {
                obrd.SET_SP_INSERTAR_LOCAL(obj, Convert.ToBoolean(e.NewValues["Permition"]));
            }
            //Set_Promotion();
            //Set_LineNum();
            //gdvrdr1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["rdr1"]).Sum(item => Math.Round(item.LineTotal, 2));
            dgPermisos.CancelEdit();
            e.Cancel = true;
            dgPermisos.DataSource = ((List<BELocalValidar>)Session["Val"]);
            dgPermisos.DataBind();
        }
    }
}