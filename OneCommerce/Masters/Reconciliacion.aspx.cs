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
    public partial class Reconciliacion : Page
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
        protected void gdvClientSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                ParValue = txtParClient.Text.Trim(),
                ColumnIndex = ((GridViewDataColumn)gdvClientSearch.GetSortedColumns().ElementAt(0)).VisibleIndex
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OCRD(obj);
            Session["ocrd"] = olst;
            gdvClientSearch.DataSource = olst;
            gdvClientSearch.DataBind();
        }
        protected void gdvClientSearch_DataBinding(object sender, EventArgs e)
        {
            gdvClientSearch.DataSource = Session["ocrd"];
        }
        private void Init_VarSessions()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            Session["jdt1"] = new List<BEDocument>();
        }
        private string Save()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEDocument();

            obj.CardCode = bteCustomer.Text;
            obj.DocDate = Convert.ToDateTime(txtcreateDate1.Text);
            obj.Lineas = ((List<BEDocument>)Session["jdt1"]);
            obj.Credit = Convert.ToDecimal(txtCred.Text);
            obj.Debit = Convert.ToDecimal(txtDeb.Text);
            obj.Socied = obec.Socied;
            using (var obrd = new BRDocument())
            {
                obrd.SaveRecon(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
            return (_err);
        }
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("Save"))
                {
                    e.Result = Save();
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

        protected void gdvFacturas_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GET"))
            {
                var spl = e.Parameters.Split(':');
                var tecnico = new BEBusinessPartner();
                ((List<BEDocument>)Session["jdt1"]).Clear();

                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = spl[1],
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_SALDOS(obj);
                olst.ForEach(i => {
                    if (i.Debit != 0)
                        i.DocTotal = i.Debit;
                    else
                        i.DocTotal = i.Credit;
                    if (i.BalScCred != 0)
                        i.SaldoVenc = i.BalScCred;
                    else
                        i.SaldoVenc = i.BalScDeb;
                });
                Session["jdt1"] = olst;
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEDocument>)Session["jdt1"]).Clear();
            }

            gdvFacturas.JSProperties["cpDebit"] = ((List<BEDocument>)Session["jdt1"]).Where(i => i.Active == "Y").ToList().Sum(item => Math.Round(Convert.ToDouble(item.BalScDeb), 2));
            gdvFacturas.JSProperties["cpCredit"] = ((List<BEDocument>)Session["jdt1"]).Where(i => i.Active == "Y").ToList().Sum(item => Math.Round(Convert.ToDouble(item.BalScCred), 2));

            gdvFacturas.DataSource = Session["jdt1"];
            gdvFacturas.DataBind();
        }

        protected void gdvFacturas_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "BalScCred", false) == 0 ||
                string.Compare(e.Column.FieldName, "BalScDeb", false) == 0 ||
                string.Compare(e.Column.FieldName, "Active", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
        }

        protected void gdvFacturas_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gdvFacturas.EditingRowVisibleIndex;

            ((List<BEDocument>)Session["jdt1"])[index].BalScCred = Convert.ToDecimal(e.NewValues["BalScCred"]);
            ((List<BEDocument>)Session["jdt1"])[index].BalScDeb = Convert.ToDecimal(e.NewValues["BalScDeb"]);
            ((List<BEDocument>)Session["jdt1"])[index].Active = Convert.ToString(e.NewValues["Active"]);

            gdvFacturas.JSProperties["cpDebit"] = ((List<BEDocument>)Session["jdt1"]).Where(i => i.Active == "Y").ToList().Sum(item => Math.Round(Convert.ToDouble(item.BalScDeb), 2));
            gdvFacturas.JSProperties["cpCredit"] = ((List<BEDocument>)Session["jdt1"]).Where(i => i.Active == "Y").ToList().Sum(item => Math.Round(Convert.ToDouble(item.BalScCred), 2));

            gdvFacturas.CancelEdit();
            e.Cancel = true;
            gdvFacturas.DataSource = ((List<BEDocument>)Session["jdt1"]);
            gdvFacturas.DataBind();
        }

        protected void gdvFacturas_DataBinding(object sender, EventArgs e)
        {
            gdvFacturas.DataSource = Session["jdt1"];
        }

        protected void gdvFacturas_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {

        }
    }
}