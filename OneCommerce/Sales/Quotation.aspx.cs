using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DevExpress.Web.ASPxClasses;
using BusinessEntities;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using BusinessServices;
using DevExpress.Web.ASPxEditors;
using System.Web.Services;
using System.Web.Script.Services;
using BusinessRules;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxCallback;
using DevExpress.Web.ASPxNavBar;

namespace OneCommerce.Sales
{
    public partial class Quotation : Page
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
                    ASPxWebControl.GlobalTheme = "Office2003Blue";
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
                    /*if (obec.Permition == "003")
                    {
                        FormsAuthentication.SignOut();
                        FormsAuthentication.RedirectToLoginPage();  
                    }
                    else
                    {*/
                        Set_Permissions();
                        hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
                        hdfTemp.Add("_soci", obec.Socied);
                        hdfTemp.Add("_htmt", "Materia");
                        Session["maen"] = new List<BEProduct>();
                        Session["QUT17"] = new List<BEQuotation17>();
                        Session["QUT18"] = new List<BEQuotation18>();
                        Session["qut"] = new List<BEQuotation>();
                        Session["ocrd"] = new List<BEClient>();
                        Session["qlst"] = new List<BEQuotation>();

                        Set_TotalSummary();
                        var obrd = new BRDocument();
                        Session["olfc"] = obrd.Get_SCSP_MPFC_OITM(obec);
                        Session["pkph"] = obrd.Get_OSCSP_COPH(obec);
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
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Masters").Visible = true;
            var obec = ((BEParameters)Session["InitPar"]);
            /*if (obec.Permition == "001")
            {
                if (obec.Socied == "BM")
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = true;*/
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARInvoice").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("CreditNote").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Reports").Visible = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Tools").Visible = true;
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

        //!+ RUTINAS AJAX

        /// <summary>
        /// LISTA LOS TIPOS DE DOCUMENTOS DE VENTA
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
            var olst = obrd.Get_OSCSP_DAIN(obep);
            return (olst);
        }

        private void Set_TotalSummary()
        {
            if (((List<BEQuotation17>)Session["QUT17"]).Count() == 0)
            {
                gdvQUT17.JSProperties["cpTotalSummary"] = 0;
            }
            else
            {
                if (gdvQUT17.GetTotalSummaryValue(gdvQUT17.TotalSummary["U_BIZ_RESU"]) != null)
                {
                    gdvQUT17.JSProperties["cpTotalSummary"] = ((List<BEQuotation17>)Session["QUT17"]).Count() == 0 ? 0 : (decimal)gdvQUT17.GetTotalSummaryValue(gdvQUT17.TotalSummary["U_BIZ_RESU"]);
                    gdvQUT17.JSProperties["cpTotalPercent2"] = ((List<BEQuotation17>)Session["QUT17"]).Count() == 0 ? 0 : (decimal)gdvQUT17.GetTotalSummaryValue(gdvQUT17.TotalSummary["U_BIZ_PCTO"]);
                }
            }
           
            if (((List<BEQuotation18>)Session["QUT18"]).Count() == 0)
            {
                gdvQUT18.JSProperties["cpTotalSummary"] = 0;
            }
            else
            {
                if (gdvQUT18.GetTotalSummaryValue(gdvQUT18.TotalSummary["U_BIZ_RESU"]) != null)
                    gdvQUT18.JSProperties["cpTotalSummary"] = ((List<BEQuotation18>)Session["QUT18"]).Count() == 0 ? 0 : (decimal)gdvQUT18.GetTotalSummaryValue(gdvQUT18.TotalSummary["U_BIZ_RESU"]);
            }
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
        protected void gdvMaterialSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                ParValue = txtParMaterial.Text.Trim(),
                ColumnIndex = ((GridViewDataColumn)gdvMaterialSearch.GetSortedColumns().ElementAt(0)).VisibleIndex,
                TypeFilter = (e.Parameters.Contains("Materia")) ? "M" : "E"
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_MAEN(obj);
            Session["maen"] = olst;
            gdvMaterialSearch.DataSource = olst;
            gdvMaterialSearch.DataBind();
        }
        protected void gdvMaterialSearch_DataBinding(object sender, EventArgs e)
        {
            gdvMaterialSearch.DataSource = Session["maen"];
        }
        protected void gdvQUT17_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {            
            if (string.Compare(e.Column.FieldName, "U_BIZ_PCTO", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
            gdvQUT17.JSProperties["cpEditingRowIndex"] = gdvQUT17.IsEditing ? gdvQUT17.EditingRowVisibleIndex : -1;
            gdvQUT17.JSProperties["cpTotalPercent"] = (gdvQUT17.VisibleRowCount == 0) ? 0 : gdvQUT17.GetTotalSummaryValue(gdvQUT17.TotalSummary[0]);
            Set_TotalSummary();
        }
        protected void gdvQUT17_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {           
            gdvQUT17.DoRowValidation();
            var line = new BEQuotation17()
            {
                U_BIZ_CCOM = Convert.ToString(e.NewValues["U_BIZ_CCOM"]),
                U_BIZ_NCOM = Convert.ToString(e.NewValues["U_BIZ_NCOM"]),
                U_BIZ_PCTO = Convert.ToDecimal(e.NewValues["U_BIZ_PCTO"]),
                U_BIZ_COST = Convert.ToDecimal(e.NewValues["U_BIZ_COST"]),
                U_BIZ_RESU = Convert.ToDecimal(e.NewValues["U_BIZ_RESU"]),
                QuanPres = Convert.ToDecimal(bteU_BIZ_CNTP.Value)
            };

            var objfc = ((List<BEProduct>)Session["olfc"]).Where(lobj => string.Compare(lobj.ItemCode, line.U_BIZ_CCOM, false) == 0).ToList();
            var fc = objfc.Count > 0 ? objfc.ElementAt(0).U_BIZ_VAL : 0;
            var valp = line.U_BIZ_PCTO;
            if (fc > 0 && chkConvert.Checked)
                valp = line.U_BIZ_PCTO * Math.Round(fc, 3);

            var qutp = Convert.ToDecimal(bteU_BIZ_CNTP.Text);
            if (string.Compare(line.U_BIZ_CCOM, "10000683", false) == 0 && chkConvert.Checked)
                valp = Math.Round(((valp / 1000) * (100 / qutp)), 3);

            if (chkConvert.Checked)
            {
                line.U_BIZ_PCTO = valp;
                line.U_BIZ_RESU = (((qutp / 100) * valp) * line.U_BIZ_COST);
            }

            ((List<BEQuotation17>)Session["QUT17"]).Add(line);

            gdvQUT17.CancelEdit();
            e.Cancel = true;
            gdvQUT17.DataSource = ((List<BEQuotation17>)Session["QUT17"]);
            gdvQUT17.DataBind();
            Set_TotalSummary();
        }
        protected void gdvQUT17_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            gdvQUT17.DoRowValidation();
            var line = new BEQuotation17()
            {
                U_BIZ_CCOM = Convert.ToString(e.NewValues["U_BIZ_CCOM"]),
                U_BIZ_NCOM = Convert.ToString(e.NewValues["U_BIZ_NCOM"]),
                U_BIZ_PCTO = Convert.ToDecimal(e.NewValues["U_BIZ_PCTO"]),
                U_BIZ_COST = Convert.ToDecimal(e.NewValues["U_BIZ_COST"]),
                U_BIZ_RESU = Convert.ToDecimal(e.NewValues["U_BIZ_RESU"])
            };

            var objfc = ((List<BEProduct>)Session["olfc"]).Where(lobj => string.Compare(lobj.ItemCode, line.U_BIZ_CCOM, false) == 0).ToList();
            var fc = objfc.Count > 0 ? objfc.ElementAt(0).U_BIZ_VAL : 0;
            var valp = line.U_BIZ_PCTO;
            if (fc > 0 && chkConvert.Checked)
                valp = line.U_BIZ_PCTO * Math.Round(fc, 3);

            var qutp = Convert.ToDecimal(bteU_BIZ_CNTP.Text);
            if (string.Compare(line.U_BIZ_CCOM, "10000683", false) == 0 && chkConvert.Checked)
                valp = Math.Round(((valp / 1000) * (100 / qutp)), 3);

            var index = gdvQUT17.EditingRowVisibleIndex;
            ((List<BEQuotation17>)Session["QUT17"])[index].U_BIZ_CCOM = line.U_BIZ_CCOM;
            ((List<BEQuotation17>)Session["QUT17"])[index].U_BIZ_NCOM = line.U_BIZ_NCOM;
            ((List<BEQuotation17>)Session["QUT17"])[index].U_BIZ_PCTO = valp;
            ((List<BEQuotation17>)Session["QUT17"])[index].U_BIZ_COST = line.U_BIZ_COST;
            ((List<BEQuotation17>)Session["QUT17"])[index].U_BIZ_RESU = line.U_BIZ_RESU;
            gdvQUT17.CancelEdit();
            e.Cancel = true;
            gdvQUT17.DataSource = ((List<BEQuotation17>)Session["QUT17"]);
            gdvQUT17.DataBind();
            Set_TotalSummary();
        }
        protected void gdvQUT17_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int i = gdvQUT17.FindVisibleIndexByKeyValue(e.Keys[gdvQUT17.KeyFieldName]);
            e.Cancel = true;
            ((List<BEQuotation17>)Session["QUT17"]).RemoveAt(i);
            gdvQUT17.DataSource = ((List<BEQuotation17>)Session["QUT17"]);
            gdvQUT17.DataBind();
            Set_TotalSummary();
        }
        protected void gdvQUT17_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            var U_BIZ_CCOM = Convert.ToString(e.NewValues["U_BIZ_CCOM"]);
            var U_BIZ_NCOM = Convert.ToString(e.NewValues["U_BIZ_NCOM"]);
            var U_BIZ_PCTO = Convert.ToDecimal(e.NewValues["U_BIZ_PCTO"]);
            if (string.IsNullOrWhiteSpace(U_BIZ_CCOM) || string.IsNullOrWhiteSpace(U_BIZ_NCOM))
                e.RowError = BSMessage.MsgExSelMp;
            else if (U_BIZ_PCTO == 0)
                e.RowError = BSMessage.MsgExPerMayZero;

            var objfc = ((List<BEProduct>)Session["olfc"]).Where(lobj => string.Compare(lobj.ItemCode, U_BIZ_CCOM, false) == 0).ToList();
            var fc = objfc.Count > 0 ? objfc.ElementAt(0).U_BIZ_VAL : 0;
            var valp = U_BIZ_PCTO;
            if (fc > 0 && chkConvert.Checked)
                valp = U_BIZ_PCTO * Math.Round(fc, 3);

            string[] fiel = { "U_BIZ_PCTO" };
            decimal totalpercent = 0;
            if (e.IsNewRow)
            {
                var rows = gdvQUT17.GetCurrentPageRowValues(fiel);
                totalpercent = (U_BIZ_PCTO == 0) ? rows.Sum(_obj => Convert.ToDecimal(_obj)) : rows.Sum(_obj => Convert.ToDecimal(_obj)) + valp;
                totalpercent = Math.Round(totalpercent, 2);
                if (totalpercent > 100)
                    e.RowError = BSMessage.MsgExPerMiCien;
            }
            else
            {
                decimal pertemp = 0;
                int index = gdvQUT17.FindVisibleIndexByKeyValue(e.Keys[gdvQUT17.KeyFieldName]);
                for (int i = 0; i < gdvQUT17.GetCurrentPageRowValues(fiel).Count(); i++)
                {
                    if (index != i)
                    {
                        var obj = gdvQUT17.GetRowValues(i, fiel);
                        pertemp += (decimal)obj;
                    }
                }

                totalpercent = (U_BIZ_PCTO == 0) ? pertemp : pertemp + valp;
                totalpercent = Math.Round(totalpercent, 2);
                if (totalpercent > 100)
                    e.RowError = BSMessage.MsgExPerMiCien;
            }

            var items = new List<string>();
            ((List<BEQuotation17>)Session["QUT17"]).ForEach(item =>
                                                   {
                                                       items.Add(item.U_BIZ_CCOM);
                                                   });
            if (e.IsNewRow)
                items.Add(Convert.ToString(e.NewValues["U_BIZ_CCOM"]));
            var exprd = items.Where(item => item == Convert.ToString(e.NewValues["U_BIZ_CCOM"])).Count();
            if (exprd > 1)
            {
                e.RowError = BSMessage.MsExistItemCode;
            }
        }
        protected void gdvQUT17_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var splv = e.Parameters.Split(':'); 
            if (e.Parameters.Contains("RCC"))
            {
                ((List<BEQuotation17>)Session["QUT17"]).ForEach(item => 
                {
                    var resu = (((Convert.ToDecimal(splv[1]) / 100) * item.U_BIZ_PCTO) * item.U_BIZ_COST);
                    resu = Math.Round(resu, 6);
                    item.U_BIZ_RESU = resu;
                    item.QuanPres = Convert.ToDecimal(splv[1]);
                });
                gdvQUT17.CancelEdit();
                gdvQUT17.DataSource = ((List<BEQuotation17>)Session["QUT17"]);
                gdvQUT17.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEQuotation17>)Session["QUT17"]).Clear();
                gdvQUT17.DataSource = ((List<BEQuotation17>)Session["QUT17"]);
                gdvQUT17.DataBind();
            }
            else if (e.Parameters.Contains("SMP"))
            {
                gdvQUT17.DataSource = ((List<BEQuotation17>)Session["QUT17"]);
                gdvQUT17.DataBind();
            }
            Set_TotalSummary();
        }
        protected void gdvQUT18_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            e.Editor.ReadOnly = true;
            gdvQUT18.JSProperties["cpEditingRowIndex"] = gdvQUT18.IsEditing ? gdvQUT18.EditingRowVisibleIndex : -1;
            Set_TotalSummary();
        }
        protected void gdvQUT18_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ((List<BEQuotation18>)Session["QUT18"]).Clear();
            e.Cancel = true;
            gdvQUT18.DataSource = ((List<BEQuotation18>)Session["QUT18"]);
            gdvQUT18.DataBind();
            Set_TotalSummary();
        }
        protected void gdvQUT18_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var splv = e.Parameters.Split(':');
            if (e.Parameters.Contains("APH"))
            {
                Session["QUT18"] = ((List<BEQuotation18>)Session["pkph"]).Where(item => item.COD_PHANTOM == splv[1] && item.U_BF_GRUPO == splv[2]).ToList();
                gdvQUT18.CancelEdit();
                gdvQUT18.DataSource = ((List<BEQuotation18>)Session["QUT18"]);
                gdvQUT18.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEQuotation18>)Session["QUT18"]).Clear();
                gdvQUT18.DataSource = ((List<BEQuotation18>)Session["QUT18"]);
                gdvQUT18.DataBind();
            }
            else if (e.Parameters.Contains("SEV"))
            {
                gdvQUT18.DataSource = ((List<BEQuotation18>)Session["QUT18"]);
                gdvQUT18.DataBind();
            }
            Set_TotalSummary();
        }
        private string Save()
        {
            var _err = string.Empty;
            if (string.IsNullOrWhiteSpace(txtU_BIZ_COSN.Text))
                _err = BSMessage.MsEmptyCardCode;
            if (string.IsNullOrWhiteSpace(txtU_BF_DEET.Text))
                _err = BSMessage.MsEmptyDEET;            
            if (((List<BEQuotation17>)Session["QUT17"]).Count == 0)
                _err = BSMessage.MsExLinesCount;
            if (((List<BEQuotation18>)Session["QUT18"]).Count == 0)
                _err = BSMessage.MsExLinesCount;

            var oq17 = ((List<BEQuotation17>)Session["QUT17"]).Select(item => item.QuanPres).Distinct().ToList();
            if (oq17.Count == 1)
            {
                if (Convert.ToDecimal(oq17[0]) != Convert.ToDecimal(bteU_BIZ_CNTP.Value))
                    _err = BSMessage.MsExRecPres;
            }
            else
            {
                _err = BSMessage.MsExRecPres;
            }

            if (string.IsNullOrWhiteSpace(_err))
            {
                var obec = ((BEParameters)Session["InitPar"]);
                var obj = new BEQuotation();
                obj.Socied = obec.Socied;
                obj.U_BIZ_CODM = txtU_BIZ_CODM.Text;
                obj.U_BIZ_NOMM = txtU_BIZ_NOMM.Text;
                obj.U_BIZ_CNTP = Convert.ToDecimal(bteU_BIZ_CNTP.Value);
                obj.U_BIZ_CODR = txtU_BIZ_CODR.Text;
                obj.U_BIZ_NOMR = txtU_BIZ_NOMR.Text;
                obj.U_BIZ_TOTP = Convert.ToDecimal(gdvQUT17.GetTotalSummaryValue(gdvQUT17.TotalSummary[0]));
                obj.U_BIZ_COSC = Convert.ToDecimal(gdvQUT17.GetTotalSummaryValue(gdvQUT17.TotalSummary[1]));
                obj.U_BIZ_COSE = Convert.ToDecimal(gdvQUT18.GetTotalSummaryValue(gdvQUT18.TotalSummary[0]));
                obj.U_BIZ_COSM = Convert.ToDecimal(txtU_BIZ_COSM.Value);
                obj.U_BIZ_TOTC = Convert.ToDecimal(txtU_BIZ_TOTC.Value);
                obj.U_BIZ_PMAR = Convert.ToDecimal(bteU_BIZ_PMAR.Value);
                obj.U_BIZ_PREV = Convert.ToDecimal(txtU_BIZ_PREV.Value);
                obj.U_BIZ_DOCE = string.Empty;
                obj.U_BIZ_COSN = txtU_BIZ_COSN.Text;
                obj.U_BIZ_TOTM = Convert.ToDecimal(bteU_BIZ_PMAR.Value);
                obj.U_BIZ_UNPR = cbbU_BIZ_UNPR.Text;
                obj.U_BIZ_MIGV = Convert.ToDecimal(txtU_BIZ_MIGV.Value);
                obj.U_BIZ_PVMI = Convert.ToDecimal(txtU_BIZ_PVMI.Value);
                obj.U_BF_DEET = txtU_BF_DEET.Text.Trim();
                obj.U_BF_FOFA = cbbU_BF_FOFA.Value.ToString();
                obj.U_BF_HNCO = DateTime.Now.ToShortTimeString();
                obj.U_PickRmrk = User.Identity.Name;
                obj.qut17 = (List<BEQuotation17>)Session["QUT17"];
                obj.qut18 = (List<BEQuotation18>)Session["QUT18"];
                
                using (var obrd = new BRDocument())
                {
                    obrd.SaveQut(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
                }
                _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKSQ#{0}", obj.DocEntry);            
            }
            return (_err);
        }
        private string CreateOff(string dcet)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var _err = string.Empty;
            var qlst = ((List<BEQuotation>)Session["qlst"]).Where(_item => dcet.Contains(_item.DocEntry.ToString())).ToList();
            var obj = qlst.ElementAt(0);
            obj.Socied = obec.Socied;
            obj.CreateDate = DateTime.Today;
            obj.U_PickRmrk = User.Identity.Name;

            using (var obrd = new BRDocument())
            {
                obrd.SaveOfferSale(obj, qlst, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            if (string.IsNullOrWhiteSpace(obj.Msg))
                Session["qlst"] = new List<BEQuotation>();

            _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKOFV#{0}", obj.DocNum);
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
                else if (e.Parameter.Contains("CreateOff"))
                {
                    e.Result = CreateOff(e.Parameter);
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
        protected void gdvQUT17_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            if (!string.IsNullOrWhiteSpace(txtDocEntry.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New || 
                    e.ButtonType == ColumnCommandButtonType.Edit || 
                    e.ButtonType == ColumnCommandButtonType.Delete)
                    e.Enabled = false;
            }
        }
        protected void gdvQUT18_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            if (!string.IsNullOrWhiteSpace(txtDocEntry.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New || 
                    e.ButtonType == ColumnCommandButtonType.Delete)
                    e.Enabled = false;
            }
        }
        protected void gdvQutSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters();
            obj.Socied = obec.Socied;
            if (chkqDocEntry.Checked)
                obj.Internal = txtqDocEntry.Text.Trim();
            if (chkqCreateDate.Checked)
                obj.DateIn = dteqCreateDate.Date;
            if (chkqCardCode.Checked)
                obj.CardCode = txtqCardCode.Text.Trim();
            if (chkqCardName.Checked)
                obj.CardName = txtqCardName.Text.Trim();
            if (chkqActives.Checked)
                obj.Actives = txtqActives.Text.Trim();
            var obrd = new BRDocument();
            Session["qut"] = obrd.Get_OSCSP_SRCH_QUTT(obj);
            gdvQutSearch.DataSource = Session["qut"];
            gdvQutSearch.DataBind();
        }
        protected void gdvQutSearch_DataBinding(object sender, EventArgs e)
        {
            gdvQutSearch.DataSource = Session["qut"];
        }
        protected void gdvQutSearch_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Actives")
            {
                if (e.CellValue != null)
                {
                    string[] stringValues = e.CellValue.ToString().Split('-');
                    foreach (string item in stringValues)
                    {
                        if (!string.IsNullOrWhiteSpace(item))
                            e.Cell.Text += string.Format("- {0}<br />", item);
                    }
                }
            }
        }
        protected void clbQutSearch_Callback(object source, CallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                DocEntry = Convert.ToInt32(e.Parameter)
            };
            var obrd = new BRDocument();
            var oqut = obrd.Get_OSCSP_SRCH_QUTD(obj);
            Session["QUT17"] = oqut.qut17;
            Session["QUT18"] = oqut.qut18;
        }
        protected void gdvQuoteList_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (!e.Parameters.Contains("CLR"))
            {
                var obec = ((BEParameters)Session["InitPar"]);
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    DateIn = Convert.ToDateTime(dteDateIn.Text),
                    DateFi = Convert.ToDateTime(dteDateFi.Text)
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_LGOV(obj);
                Session["qlst"] = olst;
                gdvQuoteList.DataSource = olst;
                gdvQuoteList.DataBind();
            }
        }
        protected void gdvQuoteList_DataBinding(object sender, EventArgs e)
        {
            gdvQuoteList.DataSource = Session["qlst"];
        }
        protected void gdvQUT17_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            var tyma = hdfTemp.Get("_htmt").ToString();
            if (tyma == "Envase")
            {
                ((List<BEProduct>)Session["maen"]).Clear();
            }
        }
        protected void gdvQUT18_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            var tyma = hdfTemp.Get("_htmt").ToString();
            if (tyma == "Materia")
            {
                ((List<BEProduct>)Session["maen"]).Clear();
            }
        }


        protected void gvgroup_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var splv = e.Parameters.Split(':');
            if (e.Parameters.Contains("APH"))
            {
                Session["QUT18"] = ((List<BEQuotation18>)Session["pkph"]).Where(item => item.COD_PHANTOM == splv[1]).ToList();
                gvgroup.CancelEdit();
                gvgroup.DataSource = ((List<BEQuotation18>)Session["QUT18"]);
                gvgroup.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEQuotation18>)Session["QUT18"]).Clear();
                gvgroup.DataSource = ((List<BEQuotation18>)Session["QUT18"]);
                gvgroup.DataBind();
            }
            else if (e.Parameters.Contains("SEV"))
            {
                gvgroup.DataSource = ((List<BEQuotation18>)Session["QUT18"]);
                gvgroup.DataBind();
            }
        }

        protected void gvgroup_DataBinding(object sender, EventArgs e)
        {
            gvgroup.DataSource = Session["QUT18"];
           
        }

    }
}