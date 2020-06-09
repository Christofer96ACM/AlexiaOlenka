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
    public partial class APInvoice : Page
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
                    /*if (obec.Permition != "002")
                    {
                        FormsAuthentication.SignOut();
                        FormsAuthentication.RedirectToLoginPage();  
                    }
                    else
                    {
                        if (obec.Socied == "BT")
                            obec.WhsCode = "YOB_PT";*/
                        gdvinv1.Columns[10].Visible = true;
                        gdvinv1.Columns[11].Visible = true;
                        gdvinv1.Columns[12].Visible = true;
                        gdvinv1.Columns[13].Visible = true;
                        Init_VarSessions();
                        Set_Permissions();
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
        private void Init_VarSessions()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            Session["cnoi"] = null;
            Session["inv1"] = new List<BEDocumentLine>();
            Session["ocrd"] = new List<BEClient>();
            Session["oitm"] = new List<BEProduct>();
            Session["oinv"] = new List<BEDocument>();
            hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
            hdfTemp.Add("_emid", obec.U_BF_EMID);
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("_proj", obec.Project);
            hdfTemp.Add("_whsc", obec.WhsCode);
            hdfTemp.Add("_cpnadd", obec.CompanyAddress.ToUpper());
            hdfTemp.Add("_phone", obec.Phone);
            hdfTemp.Add("_SerieM", obec.SerieMaqr);
        }
        //!+ RUTINAS AJAX

        /// <summary>
        /// LISTA LOS TIPOS DE DOCUMENTOS DE VENTA
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEDocumentType> Get_DocumentType(string project, string socied)
        {
            var obep = new BEParameters() 
            {
                Project = project,
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_TPDOVE(obep);
            var msbl = new string[] { "07", "09", "99" };
            olst.RemoveAll(item => msbl.Contains(item.U_BPP_NDTD));
            return (olst);            
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
            var olst = obrd.Get_OSCSP_DAIN(obep);
            return (olst);
        }
        /// <summary>
        /// LISTA UN PRODUCTO
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEProduct> Get_OneProduct(string socied,string project, string whscode, string cardcode, string pricelist, string itemcode)
        {
            var obep = new BEParameters() 
            {
                Socied = socied,
                Project = project,
                CardCode = cardcode, 
                PriceList = Convert.ToInt16(pricelist),
                WhsCode = whscode, 
                ParValue = itemcode, 
                ColumnIndex = 0, 
                Sw = 1,
                Kit = false
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OITM(obep);
            return (olst);
        }
        /// <summary>
        ///  LISTA LAS CONDICONES DE PAGO
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BECreditTarject> Get_CreditTarject(string socied)
        {
            var obep = new BEParameters() { Socied = socied };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OCRC(obep);
            return (olst);
        }
        /// <summary>
        /// ENUMERA LA LINEAS DEL DETALLE
        /// </summary>
        private void Set_LineNum()
        {
            var i = 1;
            ((List<BEDocumentLine>)Session["inv1"]).ForEach(item =>
            {
                item.LineNum = i;
                i += 1;
            });
        }
        /// <summary>
        ///  LISTA LOS CLIENTES
        /// </summary>
        /// <returns></returns>
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
        /// <summary>
        ///  LISTA LOS PRODUCTOS
        /// </summary>
        /// <returns></returns>
        protected void gdvProductSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obep = new BEParameters() 
            { 
                Socied = obec.Socied,
                Project = obec.Project,
                CardCode = txtCardCode.Text, 
                PriceList = Convert.ToInt16(cbbListNum.Value), 
                WhsCode = obec.WhsCode, 
                ParValue = txtParProduct.Text.Trim(), 
                ColumnIndex = ((GridViewDataColumn)gdvProductSearch.GetSortedColumns().ElementAt(0)).VisibleIndex, 
                Sw = 2,
                Kit = chkKit.Checked
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OITM(obep);
            Session["oitm"] = olst;
            gdvProductSearch.DataSource = olst;
            gdvProductSearch.DataBind();
        }
        protected void gdvProductSearch_DataBinding(object sender, EventArgs e)
        {
            gdvProductSearch.DataSource = Session["oitm"];
        }
        protected void gdvinv1_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "ItemCode", false) == 0 ||
                string.Compare(e.Column.FieldName, "PriceBefDi", false) == 0 ||
                string.Compare(e.Column.FieldName, "Quantity", false) == 0 ||
                string.Compare(e.Column.FieldName, "DiscPrcnt", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
            if (string.Compare(e.Column.FieldName, "ItemCode", false) == 0)
            {
                e.Editor.Focus();
            }

            gdvinv1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));
        }
        protected void gdvinv1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            if (!string.IsNullOrWhiteSpace(txtDocEntry.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New || e.ButtonType == ColumnCommandButtonType.Delete)
                    e.Enabled = false;
            }
        }
        protected void gdvinv1_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            gdvinv1.DoRowValidation();
            var obec = ((BEParameters)Session["InitPar"]);
            var line = new BEDocumentLine()
            {
                ItemCode = Convert.ToString(e.NewValues["ItemCode"]),
                ItemName = Convert.ToString(e.NewValues["ItemName"]),
                Quantity = Convert.ToInt32(e.NewValues["Quantity"]),
                PriceBefDi = Convert.ToDecimal(e.NewValues["PriceBefDi"]),
                DiscPrcnt = Convert.ToDecimal(e.NewValues["DiscPrcnt"]),
                Price = Convert.ToDecimal(e.NewValues["Price"]),
                LineTotal = Convert.ToDecimal(e.NewValues["LineTotal"]),
                GTotal = Convert.ToDecimal(e.NewValues["GTotal"]),
                BatchNum = Convert.ToString(e.NewValues["BatchNum"]),
                WhsCode = obec.WhsCode,
                U_BF_CodKit = string.Empty,
                NumInSale = Convert.ToDecimal(e.NewValues["NumInSale"]),
                OItemCode = Convert.ToString(e.NewValues["OItemCode"])
            };
            ((List<BEDocumentLine>)Session["inv1"]).Add(line);
            Set_LineNum();

            gdvinv1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvinv1.CancelEdit();
            e.Cancel = true;
            gdvinv1.DataSource = ((List<BEDocumentLine>)Session["inv1"]);
            gdvinv1.DataBind();
        }
        protected void gdvinv1_RowValidating(object sender, ASPxDataValidationEventArgs e)
        {
            var items = new List<string>();
            ((List<BEDocumentLine>)Session["inv1"]).Where(item => string.IsNullOrWhiteSpace(item.U_BF_CodKit) && item.InGift == 0)
                                                   .ToList()
                                                   .ForEach(item =>
                                                   {
                                                       items.Add(item.ItemCode);
                                                   });
            if (e.IsNewRow)
                items.Add(Convert.ToString(e.NewValues["ItemCode"]));
            var exprd = items.Where(item => item == Convert.ToString(e.NewValues["ItemCode"])).Count();

            if (string.IsNullOrWhiteSpace(Convert.ToString(e.NewValues["ItemName"])))
            {
                e.RowError = BSMessage.MsEmptyItemCode;
            }
            else if (Convert.ToInt32(e.NewValues["Quantity"]) == 0)
            {
                e.RowError = BSMessage.MsExQuantityZero;
            }
            else if (exprd > 1)
            {
                e.RowError = BSMessage.MsExistItemCode;
            }
            else if (Convert.ToString(e.NewValues["ItemCode"]).ToUpper().Trim() != Convert.ToString(e.NewValues["OItemCode"]).ToUpper().Trim())
            {
                e.RowError = BSMessage.MsDiferItemCode;
            }
        }
        protected void gdvinv1_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gdvinv1.FindVisibleIndexByKeyValue(e.Keys[gdvinv1.KeyFieldName]);
            var _lnm = (i + 1);
            ((List<BEDocumentLine>)Session["inv1"]).RemoveAll(item => item.LineNum == _lnm);
            Set_LineNum();

            gdvinv1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvinv1.DataSource = ((List<BEDocumentLine>)Session["inv1"]);
            gdvinv1.DataBind();
        }
        protected void gdvinv1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("QK"))
            {               
                var obep = new BEParameters() 
                { 
                    Socied = obec.Socied, 
                    CardCode = txtCardCode.Text, 
                    PriceList = Convert.ToInt16(cbbListNum.Value), 
                    WhsCode = obec.WhsCode, 
                    ParValue = e.Parameters.Replace("QK:", "").ToUpper().Replace("K", "").Trim(), 
                    ColumnIndex = 0, 
                    Sw = 2                    
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_KITS(obep);

                var _qtk = (chkKit.Checked) ? Convert.ToInt32(txtQuantityKit.Text) : Convert.ToInt32(txtQKit.Text);                
                olst.ForEach(item =>
                {
                    var line = new BEDocumentLine() 
                    { ItemCode = item.ItemCode, 
                        ItemName = item.ItemName, 
                        Quantity = _qtk, 
                        PriceBefDi = item.PriceBefDi, 
                        DiscPrcnt = item.DiscPrcnt, 
                        Price = item.Price, 
                        LineTotal = Convert.ToDecimal(_qtk * item.Price), 
                        GTotal = Convert.ToDecimal(_qtk * item.PriceVat), 
                        BatchNum = item.BatchNum, 
                        WhsCode = obec.WhsCode,
                        U_BF_CodKit = item.U_BF_CodKit
                    };
                    ((List<BEDocumentLine>)Session["inv1"]).Add(line);
                });
                Set_LineNum();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                Session["cnoi"] = null;
                ((List<BEDocumentLine>)Session["inv1"]).Clear();
            }
            else if (e.Parameters.Contains("SRCH"))
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocEntry = Convert.ToInt32(txtDocEntry.Text)
                };
                var obrd = new BRDocument();
                Session["inv1"] = obrd.Get_OSCSP_SRCH_INV1(obep);
            }

            gdvinv1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvinv1.CancelEdit();
            gdvinv1.DataSource = ((List<BEDocumentLine>)Session["inv1"]);
            gdvinv1.DataBind();
        }
        private void Qua_BatchNum()
        {
            ((List<BEDocumentLine>)Session["inv1"]).ForEach(item => 
            {
                if (!string.IsNullOrWhiteSpace(item.BatchNum))
                {
                    var _arlt = item.BatchNum.Split('#');
                    var _oibt = new List<BEProduct>();
                    _arlt.ToList()
                         .ForEach(i => 
                         {
                             var _larl = i.Split('!');
                             var _i = new BEProduct() { BatchNum = _larl[0], Quantity = Convert.ToInt32(_larl[1]) };
                             _oibt.Add(_i);                             
                         });

                    var batn = string.Empty;
                    var qtemp = item.Quantity;
                    var dobreak = false;
                    _oibt.ForEach(_item => 
                    {
                        if (dobreak) return;
                        var _quan = qtemp - _item.Quantity;
                        if (_quan <= 0)
                        {
                            batn = string.Format("{0}{1}¡{2}!", batn, _item.BatchNum, qtemp);
                            _item.Quantity = _item.Quantity - qtemp;
                            dobreak = true;
                        }
                        else
                        {
                            batn = string.Format("{0}{1}¡{2}!", batn, _item.BatchNum, _item.Quantity);
                            _item.Quantity = 0;
                            qtemp = _quan;
                        }
                    });
                    item.BatchNums = batn;
                    var _spl = item.BatchNums.Split('¡');
                    item.U_BF_LOTE = _spl[0];
                }
            });
        }
        private string Save()
        {            
            var _err = string.Empty;
            if (((List<BEDocumentLine>)Session["inv1"]).Count == 0)
                _err = BSMessage.MsExLinesCount;
            if (cbeOwnerCode.Value == null)
                _err = BSMessage.MsExLinesCount;

            if (string.IsNullOrWhiteSpace(_err))
            {
                var obec = ((BEParameters)Session["InitPar"]);
                var obj = new BEDocument();
                obj.Socied = obec.Socied;
                obj.DocDate = Convert.ToDateTime(dteDocDate.Text);
                obj.CardCode = txtCardCode.Text;
                obj.CardName = bteCardName.Text.Trim();
                obj.LicTradNum = bteLicTradNum.Text.Trim();
                obj.U_BPP_MDTD = cbbU_BPP_MDTD.Value.ToString();
                obj.U_BPP_MDSD = cbbU_BPP_MDSD.Value.ToString();
                obj.U_BPP_MDCD = txtU_BPP_MDCD.Text;
                obj.NumAtCard = txtNumAtCard.Text;
                obj.DiscPrcntTotal = Convert.ToDecimal(txtDiscPrcntTotal.Value);
                obj.TotalExpns = Convert.ToDecimal(txtTotalExpns.Value);
                obj.SlpCode = Convert.ToInt16(cbeSalesPerson.Value);
                obj.OwnerCode = Convert.ToInt32(cbeOwnerCode.Value);
                obj.GroupNum = Convert.ToInt16(cbbGroupNum.Value);
                obj.Comments = mmoComments.Text;
                obj.U_BF_PED_ORIG = txtU_BF_PED_ORIG0.Text;
                obj.Project = ((BEParameters)Session["InitPar"]).Project;
                obj.U_BF_PickRmrk = User.Identity.Name;
                Qua_BatchNum();
                obj.Lines = ((List<BEDocumentLine>)Session["inv1"]);
                obj.Reserve = "Y";
                using (var obrd = new BRDocument())
                {
                    obrd.SaveInvoice(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
                }

                _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKS#{0}#{1}", obj.DocEntry, obj.DocNum);
            }
            return (_err);
        }
        public static string Right(string param, int length)
        {
            int value = param.Length - length;
            string result = param.Substring(value, length);
            return result;
        }
        private string Payment()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEDocument();
            obj.Socied = obec.Socied;
            obj.DocEntry = Convert.ToInt32(txtDocEntry.Value);
            obj.DocDate = DateTime.Today;
            obj.CardCode = txtCardCode.Text;
            obj.CardName = bteCardName.Text.Trim();
            if (pgcPayment.ActiveTabIndex == 0)
            {
                obj.MedPayment = "EF";
                obj.CashAccount = "_SYS00000003803";
                obj.CashSum = Convert.ToDecimal(txtSalEfe.Value);
            }
            else
            {
                obj.MedPayment = "TC";
                var _stc = cbbCreditCard.Value.ToString().Split('_');
                obj.CreditCard = Convert.ToInt16(_stc[0]);
                obj.CashAccount = "_" + _stc[1];
                obj.CashSum = Convert.ToDecimal(txtSalTacre.Value);
                var _ccn = ("0000000000000" + txtCardNum.Text);
                obj.CreditCardNumber = Right(_ccn, 13);
                obj.VoucherNum = txtCardNum.Text;
            }                      
            obj.Project = ((BEParameters)Session["InitPar"]).Project;
            obj.PaidToDate = Convert.ToDecimal(txtPaidToDate.Value) + obj.CashSum;
            obj.PendingBal = Convert.ToDecimal(txtDocTotal.Value) - obj.PaidToDate;
            
            using (var obrd = new BRDocument())
            {
                obrd.SavePayment(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKP#{0}#{1}", obj.PaidToDate, obj.PendingBal);
            return (_err);
        }
        private string Notes(string par)
        {
            var obj = new BEDocument();
            obj.DocEntry = Convert.ToInt32(txtDocEntry.Value);
            obj.DocNum = Convert.ToInt32(txtDocNum.Value);
            obj.DocDate = Convert.ToDateTime(dteDocDate.Text);
            obj.CardCode = txtCardCode.Text;
            obj.CardName = bteCardName.Text.Trim();
            obj.LicTradNum = bteLicTradNum.Text.Trim();
            obj.NumAtCard = txtNumAtCard.Text;
            obj.DiscPrcntTotal = Convert.ToDecimal(txtDiscPrcntTotal.Value);
            obj.TotalExpns = Convert.ToDecimal(txtTotalExpns.Value);
            obj.SlpCode = Convert.ToInt16(cbeSalesPerson.Value);
            obj.OwnerCode = Convert.ToInt32(cbeOwnerCode.Value);
            obj.GroupNum = Convert.ToInt16(cbbGroupNum.Value);
            obj.Comments = mmoComments.Text;
            obj.Reserve = "Y";
            obj.Lines = ((List<BEDocumentLine>)Session["inv1"]).Where(i => i.LineStatus != "C").ToList();
            obj.Lines.ForEach(item =>
            {
                item.Quantity = item.OpenQty;
                item.BaseType = Convert.ToInt32(item.ObjType);
                item.BaseEntry = item.DocEntry;
                item.BaseLine = item.LineNum - 1;
                item._Quantity = item.Quantity;
                item.BatchNum = item.BatchNums;
            });
            Session["cnoi"] = obj;

            var _msg = "OKCN";
            if (par == "DlNote")
                _msg = "OKDN";
            return (_msg);
        }
        private string BusinessPartner()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEBusinessPartner();
            obj.Socied = obec.Socied;
            obj.CardCode = txtCrCardCode.Text;
            obj.CardName = txtCrCardName.Text;
            obj.LicTradNum = txtCrLicTradNum.Text;
            obj.Phone1 = txtCrPhone1.Text;
            obj.Cellular = txtCrCellular.Text;
            obj.E_Mail = txtCrE_Mail.Text;
            obj.U_PN_FecNac = dteCrU_PN_FecNac.Text;
            obj.U_BPP_BPTP = cbbCrPersonType.Value.ToString();
            obj.U_BPP_BPTD = cbbCrDocumentType.Value.ToString();

            using (var obrd = new BRDocument())
            {
                obrd.SaveBusinessPartner(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
            return (_err);
        }
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (string.Compare(e.Parameter, "Save", false) == 0)
                {
                    e.Result = Save();
                }
                else if (string.Compare(e.Parameter, "Payment", false) == 0)
                {
                    e.Result = Payment();
                }
                else if (string.Compare(e.Parameter, "CrNote", false) == 0 ||
                         string.Compare(e.Parameter, "DlNote", false) == 0)
                {
                    e.Result = Notes(e.Parameter);
                }
                else if (string.Compare(e.Parameter, "CrClient", false) == 0)
                {
                    e.Result = BusinessPartner();
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
        protected void gdvOinvSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters() 
            { 
                Socied = obec.Socied, 
                DateIn = (DateTime?)dteDateIn.Value, 
                DateFi = (DateTime?)dteDateFi.Value, 
                NumAtCard = txtNumAtCards.Text,
                Project = obec.Project,
                Reserve = "Y"
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_OINV(obj);
            Session["oinv"] = olst;
            gdvOinvSearch.DataSource = olst;
            gdvOinvSearch.DataBind();
        }
        protected void gdvOinvSearch_DataBinding(object sender, EventArgs e)
        {
            gdvOinvSearch.DataSource = Session["oinv"];
        }
        protected void gdvinv1_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            var U_BF_CodKit = Convert.ToString(e.GetValue("U_BF_CodKit"));
            if (!string.IsNullOrWhiteSpace(U_BF_CodKit))
                e.Row.BackColor = Color.Lavender;
        }
    }
}