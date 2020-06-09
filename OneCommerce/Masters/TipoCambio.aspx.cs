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
    public partial class TipoCambio : Page
    {
        public static decimal Rate1 = 0;
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
                    ((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "";
                    //}                 
                }
            }

            DateTime hoy = DateTime.Today;
            var mes = hoy.Month;
            var año = hoy.Year;
            var j = 0;
            for(var i = (año-5); j<=10; j++, i++)
            {
                cbbAnio.Items.Add(i.ToString(),i);
            }

            cbbMes.Items.Add("Enero", 1);
            cbbMes.Items.Add("Febrero", 2);
            cbbMes.Items.Add("Marzo", 3);
            cbbMes.Items.Add("Abril", 4);
            cbbMes.Items.Add("Mayo", 5);
            cbbMes.Items.Add("Junio", 6);
            cbbMes.Items.Add("Julio", 7);
            cbbMes.Items.Add("Agosto", 8);
            cbbMes.Items.Add("Setiembre", 9);
            cbbMes.Items.Add("Octubre", 10);
            cbbMes.Items.Add("Noviembre", 11);
            cbbMes.Items.Add("Diciembre", 12);

            cbbMes.SelectedIndex = mes-1;
            cbbAnio.Value = año;

            //((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "Tipo de Cambio: " + Rate1.ToString("c3");
        }
        public  List<DateTime> GetDates(int mes1, int año1)
        {
            DateTime hoy = DateTime.Today;
            var mes = mes1;
            var año = año1;
            var dates = new List<DateTime>();

            for (var date = new DateTime(año, mes, 1); date.Month == mes; date = date.AddDays(1))
            {
                dates.Add(date.Date);
            }
            return dates;
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

            Session["ortt"] = new List<BETipoCambio>();
        }


        protected void gdvTipoCambio_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.ButtonType == ColumnCommandButtonType.Edit)
            {
                e.Enabled = true;
            }
        }

        protected void gdvTipoCambio_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gdvTipoCambio.EditingRowVisibleIndex;

            //if(((List<BEAlmacen>)Session["oitw"])[index].Tiempo == "Existente")

            ((List<BETipoCambio>)Session["ortt"])[index].RateUSD = Convert.ToDecimal(e.NewValues["RateUSD"]);
            ((List<BETipoCambio>)Session["ortt"])[index].RateEUR = Convert.ToDecimal(e.NewValues["RateEUR"]);

            BETipoCambio tp = new BETipoCambio();
            tp.RateDate = Convert.ToDateTime(e.NewValues["RateDate"]);
            tp.RateUSD = Convert.ToDecimal(e.NewValues["RateUSD"]);
            tp.RateEUR = Convert.ToDecimal(e.NewValues["RateEUR"]);

            gdvTipoCambio.CancelEdit();
            e.Cancel = true;
            gdvTipoCambio.DataSource = ((List<BETipoCambio>)Session["ortt"]);
            gdvTipoCambio.DataBind();

            using (var obrd = new BRDocument())
            {
                obrd.SaveCurrencyDates(tp, ((BEParameters)Session["InitPar"]).objSapSbo);
                ((BEParameters)Session["InitPar"]).Rate = tp.RateUSD;
                ((BEParameters)Session["InitPar"]).RateEur = tp.RateEUR;
                //Rate1 = tp.RateUSD;
            }

        }
        protected void gdvTipoCambio_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "RateUSD", false) == 0 ||
                string.Compare(e.Column.FieldName, "RateEUR", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
        }
        protected void gdvTipoCambio_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            ((List<BETipoCambio>)Session["ortt"]).Clear();
            if (e.Parameters.Contains("INIT"))
            {
                var spl = e.Parameters.Split(':');
                var listdias = GetDates(Convert.ToInt32(spl[1]), Convert.ToInt32(spl[2]));
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    mes = Convert.ToInt32(spl[1]),
                    año = Convert.ToInt32(spl[2]),
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_TIPOCAMBIO(obep);

                listdias.ForEach(i => {
                    BETipoCambio tp = new BETipoCambio();
                    tp.RateDate = i;
                    ((List<BETipoCambio>)Session["ortt"]).Add(tp);
                });
                olst.ForEach(item => {
                    ((List<BETipoCambio>)Session["ortt"]).Where(tp => tp.RateDate == item.RateDate).ToList().ForEach(x => {
                        if (item.Currency == "USD") x.RateUSD = item.Rate;
                        else if (item.Currency == "EUR") x.RateEUR = item.Rate;
                    });
                });
                gdvTipoCambio.DataSource = Session["ortt"];
                gdvTipoCambio.DataBind();
            }
        }
    }
}