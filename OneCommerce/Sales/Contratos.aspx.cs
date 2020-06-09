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

namespace OneCommerce.Sales
{
    public partial class Contratos : Page
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
            Session["odrf"] = new List<BEDocument>();
            Session["drf1"] = new List<BEDocumentLine>();

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

        private string UpdtContract()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BETipoCambio();
            //obj.RateDate = Convert.ToDateTime(dteFecha.Text);
            //obj.UserSing = obec.CardName;

            //if(txtDolar.Text != "0.00")
            //{
            //    obj.CurrencyUSD = "USD";
            //    obj.RateUSD = Convert.ToDecimal(txtDolar.Text);
            //}
            //if (txtEuro.Text != "0.00")
            //{
            //    obj.CurrencyEUR = "EUR";
            //    obj.RateEUR = Convert.ToDecimal(txtDolar.Text);
            //}

            using (var obrd = new BRDocument())
            {
                obrd.SaveCurrencyDates(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
            //Init_VarSessions();
            return (_err);
        }

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("UpdtContract"))
                {
                    e.Result = UpdtContract();
                }
                else
                {
                    e.Result = string.Empty;
                }
            }
            catch (Exception ex)
            {
                e.Result = ex.Message;
            }
        }

        protected void grdvContratos_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            //if (e.VisibleIndex == -1) return;
            //var obec = ((BEParameters)Session["InitPar"]);

            //if (e.ButtonType == ColumnCommandButtonType.Edit)
            //{
            //    e.Enabled = true;
            //}
            
        }

        protected void grdvContratos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var Detalle = "";
            if (e.Parameters.Contains("INIT"))
            {
                //var spl = e.Parameters.Split(':');
                var obep1 = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = txtCliente.Text,
                    Id_Dire = txtIdDirec.Text,
                    Code = txtCode.Text
                };
                var obrd = new BRDocument();
                var olst1 = obrd.DXP_GET_CONTRATOS(obep1);

                olst1.ForEach(item =>
                {
                    Detalle = "";
                    var obep2 = new BEParameters()
                    {
                        Socied = obec.Socied,
                        DocNum = Convert.ToInt32(item.DocNum),
                        CardCode = item.CardCode,
                        ObjType = 17
                    };
                    var olst2 = obrd.DXP_GETDETALLE_BORRADOR_OV(obep2);
                    olst2.Where(i => i.ActivoC == "Y").ToList().ForEach(item2 =>
                    {
                        Detalle += item2.ItemName + ",";
                    });

                    item.Detalle = Detalle.Substring(0, Detalle.Length - 1);
                });

                Session["orcp"] = olst1;
                grdvContratos.DataSource = Session["orcp"];
                grdvContratos.DataBind();
            }
        }

        protected void grdvContratos_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = grdvContratos.EditingRowVisibleIndex;
            string[] x = new string[15];
            DateTime? fch = new DateTime();
            //if(((List<BEAlmacen>)Session["oitw"])[index].Tiempo == "Existente")

            ((List<BEContratos>)Session["orcp"])[index].Code = Convert.ToString(e.NewValues["Code"]);
            ((List<BEContratos>)Session["orcp"])[index].Dscription = Convert.ToString(e.NewValues["Dscription"]);
            ((List<BEContratos>)Session["orcp"])[index].Frequency = Convert.ToString(e.NewValues["Frequency"]);
            ((List<BEContratos>)Session["orcp"])[index].Remind = Convert.ToInt32(e.NewValues["Remind"]);
            ((List<BEContratos>)Session["orcp"])[index].DocNum = Convert.ToString(e.NewValues["DocNum"]);
            ((List<BEContratos>)Session["orcp"])[index].StartDate = Convert.ToDateTime(e.NewValues["StartDate"]);
            ((List<BEContratos>)Session["orcp"])[index].EndDate = Convert.ToDateTime(e.NewValues["EndDate"]);
            ((List<BEContratos>)Session["orcp"])[index].EndDate2 = Convert.ToString(e.NewValues["EndDate2"]);
            var absentry = 0;
            if (((List<BEContratos>)Session["orcp"])[index].EndDate2 == "")
            {
                fch = null;
            }
            else
            {
                x = ((List<BEContratos>)Session["orcp"])[index].EndDate2.Substring(0, 10).Split('/');
                fch = Convert.ToDateTime(x[1] + "/" + x[0] + "/" + x[2]);
            }

            ((List<BEContratos>)Session["orcp"]).Where(i => i.Code == Convert.ToString(e.NewValues["Code"]) &&
                                                            i.DocNum == Convert.ToString(e.NewValues["DocNum"]) &&
                                                            i.CardCode == Convert.ToString(e.NewValues["CardCode"])).ToList().ForEach(item =>
                                                            {
                                                                absentry = item.AbsEntry;
                                                            });


            var obep = new BEParameters();
            obep.Socied = obec.Socied;
            obep.accion = 2;
            obep.AbsEntryUpdt = absentry;
            obep.FechaUpdt = fch;
            obep.Descripcion = ((List<BEContratos>)Session["orcp"])[index].Dscription;
            obep.DraftEntry = 0;

            var obrd = new BRDocument();
            obrd.CRUD_CONTRATO(obep);
            var olst = obrd.DXP_GET_CONTRATOS(obep);

            grdvContratos.CancelEdit();
            e.Cancel = true;
            grdvContratos.DataSource = olst;
            grdvContratos.DataBind();
        }
        protected void grdvContratos_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {

        }

        protected void grdvContratos_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "DocObjType", false) == 0 ||
                string.Compare(e.Column.FieldName, "CardCode", false) == 0 ||
                string.Compare(e.Column.FieldName, "CardName", false) == 0 ||
                string.Compare(e.Column.FieldName, "AbsEntry", false) == 0 ||
                string.Compare(e.Column.FieldName, "StartDate", false) == 0 ||
                string.Compare(e.Column.FieldName, "Frequency", false) == 0 ||
                string.Compare(e.Column.FieldName, "Remind", false) == 0 ||
                string.Compare(e.Column.FieldName, "DocNum", false) == 0 ||
                string.Compare(e.Column.FieldName, "Code", false) == 0)
            {
                e.Editor.ReadOnly = true;
            }
            else
            {
                e.Editor.ReadOnly = false;
            }
            if (string.Compare(e.Column.FieldName, "EndDate", false) == 0)
            {
                e.Editor.Focus();
            }
        }

        protected void grdvContratos_DataBinding(object sender, EventArgs e)
        {
            grdvContratos.DataSource = Session["orcp"];
        }

        protected void gdvServicio_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("INIT"))
            {
                var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocNum = Convert.ToInt32(spl[1]),
                    CardCode = spl[2],
                    ObjType = 17
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GETDETALLE_BORRADOR_OV(obep);
                Session["drf1"] = olst;
                gdvServicio.DataSource = Session["drf1"];
                gdvServicio.DataBind();
            }
        }

        protected void gdvServicio_DataBinding(object sender, EventArgs e)
        {
            gdvServicio.DataSource = Session["drf1"];
        }
    }
}