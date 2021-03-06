﻿using System;
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

namespace OneCommerce.Compras
{
    public partial class FacturaCompra : Page
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
                ASPxWebControl.GlobalTheme = "PlasticBlue";
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
                        gdvinv1.Columns[10].Visible = true;
                        gdvinv1.Columns[11].Visible = true;
                        //gdvinv1.Columns[12].Visible = true;
                        //gdvinv1.Columns[13].Visible = true;
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
            /*if (obec.Permition == "001")
            {
                if (obec.Socied == "DX")
                    FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = true;*/
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARInvoice").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("CreditNote").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Reports").Visible = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Masters").Visible = true;
            /*}
            else if (obec.Permition == "003")
            {
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("SalesOrder").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Masters").Visible = true;
            }
            if (obec.U_BF_ADMIN == 0)*/
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Administrator").Visible = true;
        }
        private void Init_VarSessions()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            Session["cnoi"] = null;
            Session["inv1"] = new List<BEDocumentLine>();
            Session["inv2"] = new List<BEDocumentLine>();
            Session["ocrd"] = new List<BEClient>();
            Session["oitm"] = new List<BEProduct>();
            Session["oinv"] = new List<BEDocument>();
            Session["bord"] = new List<BEDocumentLine>();
            Session["odln"] = new List<BEDocument>();
            Session["dln1"] = new List<BEDocumentLine>();
            Session["crd1"] = new List<BEContactLines>();
            Session["dire"] = new List<BEClientAddress>();
            hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
            hdfTemp.Add("_emid", obec.U_BF_EMID);
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("_proj", obec.Project);
            hdfTemp.Add("_whsc", obec.WhsCode);
            //hdfTemp.Add("_whsc", obec.WhsCode);
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
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BECuentasPago> DXP_CUENTAS_PAGO(string project, string socied)
        {
            var obep = new BEParameters()
            {
                Project = project,
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_CUENTAS_PAGO(obep);
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
                Project=project,
                CardCode = cardcode,
                PriceList = Convert.ToInt16(pricelist),
                WhsCode = whscode,
                ParValue = itemcode,
                ColumnIndex = 0,
                Sw = 1,
                Kit = false
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OITM_P(obep);
            return (olst);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEClientAddress> GET_PROVINCIAS_CS(string socied,string depa)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                departamento = depa
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_PROVINCIAS(obep);
            return (olst);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEClientAddress> GET_DISTRITOS_CS(string socied, string prov)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                provincia = prov
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_DISTRITOS(obep);
            return (olst);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEClientAddress> GET_DEPARTAMENTOS_CS(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_DEPARTAMENTOS(obep);
            return (olst);
        }
        /// <summary>
        /// LISTA UN PRODUCTO NAIAH
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEProduct> Get_OneProductNaiah(string socied, string whscode, string cardcode, string pricelist, string itemcode)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                CardCode = cardcode,
                PriceList = Convert.ToInt16(pricelist),
                WhsCode = whscode,
                ParValue = itemcode,
                ColumnIndex = 0,
                Sw = 1,
                Kit = false
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OITM_NAIAH(obep);
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
        /// Lista de orden por numped
        /// </summary>
        /// <param name="socied"></param>
        /// <param name="numped"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEDocument> Get_Pedido(string socied,string numped) {
            var obep = new BEParameters() { Socied = socied, NumAtCard = numped };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_ORDR_POR_NUMPED(obep);
            return (olst);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEDocumentLine> Get_DetaPedido(string socied, int DocEntrys)
        {
            var obep = new BEParameters() { Socied = socied, DocEntry = DocEntrys };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_RDR1(obep);
            return (olst);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEProduct> Get_SerialNumber_OneProduct(string socied, string itemcode)
        {
            var obep = new BEParameters()
            {
                ItemCode = itemcode,
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_SerialNumber(obep);
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
        private void Set_CntctCode()
        {
            var i = 1;
            ((List<BEContactLines>)Session["crd1"]).ForEach(item =>
            {
                item.CntctCode = i;
                i += 1;
            });
        }
        private void Set_LineNum_Direcciones()
        {
            var i = 0;
            ((List<BEClientAddress>)Session["dire"]).ForEach(item =>
            {
                item.LineNum = i;
                i += 1;
            });
        }
        protected void gdvOdlnSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                CardCode = txtCardCode.Text,
                DateIn = (DateTime?)dterdDateIn.Value,
                DateFi = (DateTime?)dterdDateFi.Value,
                NumAtCard = txtrdDocNum.Text.Trim()
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_OPDN2(obj);
            Session["odln"] = olst;
            gdvOdlnSearch.DataSource = Session["odln"];
            gdvOdlnSearch.DataBind();
        }

        protected void gdvOdlnSearch_DataBinding(object sender, EventArgs e)
        {
            gdvOrdrSearch.DataSource = Session["dln1"];
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
            var olst = obrd.Get_OSCSP_OCRD_P(obj);
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
                Project=obec.Project,
                CardCode = txtCardCode.Text, 
                PriceList = Convert.ToInt16(cbbListNum.Value), 
                WhsCode = obec.WhsCode, 
                ParValue = txtParProduct.Text.Trim(), 
                ColumnIndex = ((GridViewDataColumn)gdvProductSearch.GetSortedColumns().ElementAt(0)).VisibleIndex, 
                Sw = 2,
                Kit = chkKit.Checked
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OITM_P(obep);
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
                string.Compare(e.Column.FieldName, "Quantity", false) == 0 ||
                string.Compare(e.Column.FieldName, "DiscPrcnt", false) == 0 ||
                string.Compare(e.Column.FieldName, "PriceBefDi", false) == 0)
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
        protected void gvcontacto_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "FirstName", false) == 0 ||
                string.Compare(e.Column.FieldName, "LastName", false) == 0 ||
                string.Compare(e.Column.FieldName, "Cellolar", false) == 0||
                string.Compare(e.Column.FieldName, "E_MailL", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
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
        protected void gvcontacto_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
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
                //BatchNum = Convert.ToString(e.NewValues["BatchNum"]),
                WhsCode = obec.WhsCode,
                IssueMthd = Convert.ToString(e.NewValues["IssueMthd"]),
                Serie = Convert.ToString(e.NewValues["Serie"])
                //U_BF_CodKit = string.Empty,
                //NumInSale = Convert.ToDecimal(e.NewValues["NumInSale"]),
                //OItemCode = Convert.ToString(e.NewValues["OItemCode"])
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
            //((List<BEDocumentLine>)Session["inv1"]).Where(item => string.IsNullOrWhiteSpace(item.U_BF_CodKit) && item.InGift == 0)
            //                                       .ToList()
            //                                       .ForEach(item =>
            //                                       {
            //                                           items.Add(item.ItemCode);
            //                                       });
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
            else if (Convert.ToString(e.NewValues["ItemCode"]).ToUpper().Trim() != Convert.ToString(e.NewValues["ItemCode"]).ToUpper().Trim())
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
                string f = e.Parameters.Replace("QK:", "").ToUpper();
                string g = f.Substring(0, 1);
                var parval="";
                if(g=="K")
                parval=e.Parameters.Replace("QK:", "").ToUpper().Replace("K", "").Trim();
                else if(g=="N")
                parval = e.Parameters.Replace("QK:", "").ToUpper().Replace("N", "").Trim();         
                var obep = new BEParameters() 
                { 
                    Socied = obec.Socied, 
                    CardCode = txtCardCode.Text, 
                    PriceList = Convert.ToInt16(cbbListNum.Value), 
                    WhsCode = obec.WhsCode, 
                    ParValue =  parval,
                    ColumnIndex = 0, 
                    Sw = 2                    
                };
                var obrd = new BRDocument();
                var olst = new List<BEProduct>();
                if (g == "K"){
                 olst  = obrd.Get_OSCSP_KITS(obep);
                }
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
            else if (e.Parameters.Contains("UPDTPRICE"))
            {
                var _spl = e.Parameters.Split(':');
                ((List<BEDocumentLine>)Session["inv1"]).Where(i => (i.TreeType == "N" && i.Father == _spl[5]))
                    .ToList().ForEach(item =>
                    {
                        item.PriceBefDi = Convert.ToDecimal(_spl[1]);
                        item.Price = Convert.ToDecimal(_spl[2]);
                        item.LineTotal = Convert.ToDecimal(_spl[3]);
                        item.GTotal = Convert.ToDecimal(_spl[4]);
                        item.Quantity = Convert.ToInt32(_spl[6]);
                    });
            }
            else if (e.Parameters.Contains("KITNAIAH"))
            {
                var splv = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = txtCardCode.Text,
                    PriceList = Convert.ToInt16(cbbListNum.Value),
                    WhsCode = obec.WhsCode,
                    ParValue = splv[1],
                    ColumnIndex = 0,
                    ItemCode = splv[2],
                    Sw = 2
                };
                var obrd = new BRDocument();
                var p = obrd.OSCSP_KITS_NAIAH_Cod(obep);
                  var _qtk = (chkKit.Checked) ? Convert.ToInt32(txtQuantityKit.Text) : Convert.ToInt32(txtQKit.Text);  
                p.ForEach(item =>
                {
                    var line = new BEDocumentLine()
                    {
                        ItemCode = item.ItemCode,
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
                Session["inv1"] = obrd.Get_OSCSP_SRCH_PCH1(obep);
            }
            else if (e.Parameters.Contains("LM"))
            {
                var band = true;
                var suprimir = "";
                var _spl = e.Parameters.Split(':');
                var padre = _spl[1].Split(',');

                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = Convert.ToString(padre[0])
                };
                var obrd = new BRDocument();
                var olist = obrd.Get_ListdeMateriales(obep);
                if (olist.Count != 0)
                {
                    olist.ForEach(item =>
                    {

                        obep = new BEParameters()
                        {
                            Socied = obec.Socied,
                            Project = obec.Project,
                            CardCode = "",
                            PriceList = Convert.ToInt16(_spl[2]),
                            WhsCode = item.Warehouse,
                            ParValue = item.Code,
                            ColumnIndex = 0,
                            Sw = 2,
                            Kit = false
                        };
                        var olst = obrd.Get_OSCSP_OITM_P(obep);

                        var line = new BEDocumentLine();

                        if (band)
                        {
                            line.ItemCode = padre[0];
                            line.ItemName = padre[1];
                            line.PriceBefDi = Convert.ToDecimal(padre[3]);
                            line.Quantity = 1;
                            line.DiscPrcnt = Convert.ToDecimal(padre[4]);
                            line.Price = Convert.ToDecimal(padre[5]);
                            line.LineTotal = Convert.ToDecimal(padre[5]);
                            line.GTotal = Convert.ToDecimal(padre[6]);
                            line.IssueMthd = padre[7];
                            line.WhsCode = obec.WhsCode;
                            line.TreeType = "S";
                            line.Father = padre[0];
                            line.NumInSale = Convert.ToInt32(padre[8]);
                            band = false;
                            suprimir = item.SUPRIMIR_MATERIALES;
                            ((List<BEDocumentLine>)Session["inv1"]).Add(line);
                            Set_LineNum();
                        }
                        olst.ForEach(a =>
                        {
                            var line2 = new BEDocumentLine();
                            line2.ItemCode = a.ItemCode;
                            line2.ItemName = a.ItemName;
                            line2.PriceBefDi = a.PriceBefDi;
                            line2.Quantity = item.Quantity;
                            line2.DiscPrcnt = a.DiscPrcnt;
                            line2.Price = a.PriceBefDi - ((a.PriceBefDi * a.DiscPrcnt) / 100);
                            line2.LineTotal = item.Quantity * a.Price;
                            line2.GTotal = item.Quantity * a.PriceVat;
                            line2.IssueMthd = a.IssueMthd;
                            line2.WhsCode = obec.WhsCode;
                            line2.TreeType = "I";
                            line2.Father = padre[0];
                            line2.NumInSale = item.Quantity;
                            ((List<BEDocumentLine>)Session["inv1"]).Add(line2);
                            Set_LineNum();
                        });
                    });
                    if (suprimir == "N")
                    {
                        ((List<BEDocumentLine>)Session["inv1"]).Where(i => i.TreeType == "S" && i.Father == padre[0]).ToList().ForEach(x =>
                        {
                            x.PriceBefDi = Convert.ToDecimal(0.00);
                            x.Price = Convert.ToDecimal(0.00);
                            x.LineTotal = Convert.ToDecimal(0.00);
                            x.GTotal = Convert.ToDecimal(0.00);
                        });
                    }
                    else if (suprimir == "Y")
                    {
                        ((List<BEDocumentLine>)Session["inv1"]).Where(i => i.TreeType == "I" && i.Father == padre[0]).ToList().ForEach(x =>
                        {
                            x.PriceBefDi = Convert.ToDecimal(0.00);
                            x.Price = Convert.ToDecimal(0.00);
                            x.LineTotal = Convert.ToDecimal(0.00);
                            x.GTotal = Convert.ToDecimal(0.00);
                        });
                    }
                }
                else
                {
                    var line = new BEDocumentLine();
                    //return;
                    line.ItemCode = padre[0];
                    line.ItemName = padre[1];
                    line.PriceBefDi = Convert.ToDecimal(padre[3]);
                    line.Quantity = 1;
                    line.DiscPrcnt = Convert.ToDecimal(padre[4]);
                    line.Price = Convert.ToDecimal(padre[5]);
                    line.LineTotal = Convert.ToDecimal(padre[5]);
                    line.GTotal = Convert.ToDecimal(padre[6]);
                    line.IssueMthd = padre[7];
                    line.WhsCode = obec.WhsCode;
                    line.TreeType = "N";
                    line.Father = padre[0];
                    line.NumInSale = Convert.ToInt32(padre[8]);
                    band = false;
                    //suprimir = item.SUPRIMIR_MATERIALES;
                    ((List<BEDocumentLine>)Session["inv1"]).Add(line);
                    Set_LineNum();
                }
            }
            else if (e.Parameters.Contains("ADDPRODUCT"))
            {
                var _spl = e.Parameters.Split(':');
                var obep = new BEParameters();
                var obrd = new BRDocument();
                var suprimir = "";

                obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    Project = obec.Project,
                    CardCode = "",
                    PriceList = Convert.ToInt16(_spl[2]),
                    WhsCode = obec.WhsCode,
                    ParValue = _spl[1],
                    ColumnIndex = 0,
                    Sw = 2,
                    Kit = false,
                    ItemCode = _spl[1]
                };
                var articulo = obrd.Get_OSCSP_OITM_P(obep);
                var listamateriales = obrd.Get_ListdeMateriales(obep);

                if (listamateriales.Count == 0)
                {
                    articulo.ForEach(item =>
                    {
                        var line = new BEDocumentLine();

                        line.ItemCode = item.ItemCode;
                        line.ItemName = item.ItemName;
                        line.PriceBefDi = Convert.ToDecimal(item.PriceBefDi);
                        line.Quantity = 1;
                        line.DiscPrcnt = Convert.ToDecimal(item.DiscPrcnt);
                        line.Price = Convert.ToDecimal(item.Price);
                        line.LineTotal = Convert.ToDecimal(item.Price);
                        line.GTotal = Convert.ToDecimal(item.PriceVat);
                        line.IssueMthd = item.IssueMthd;
                        line.WhsCode = obec.WhsCode;
                        line.TreeType = "N";
                        line.Father = item.ItemCode;
                        line.NumInSale = Convert.ToInt32(item.NumInSale);

                        ((List<BEDocumentLine>)Session["inv1"]).Add(line);
                        Set_LineNum();
                    });
                }
                else
                {
                    articulo.ForEach(i =>
                    {
                        var line = new BEDocumentLine();

                        line.ItemCode = i.ItemCode;
                        line.ItemName = i.ItemName;
                        line.PriceBefDi = Convert.ToDecimal(i.PriceBefDi);
                        line.Quantity = 1;
                        line.DiscPrcnt = Convert.ToDecimal(i.DiscPrcnt);
                        line.Price = Convert.ToDecimal(i.Price);
                        line.LineTotal = Convert.ToDecimal(i.Price);
                        line.GTotal = Convert.ToDecimal(i.PriceVat);
                        line.IssueMthd = i.IssueMthd;
                        line.WhsCode = obec.WhsCode;
                        line.TreeType = "S";
                        line.Father = i.ItemCode;
                        line.NumInSale = Convert.ToInt32(i.NumInSale);

                        ((List<BEDocumentLine>)Session["inv1"]).Add(line);
                        Set_LineNum();

                        listamateriales.ForEach(j =>
                        {
                            obep = new BEParameters()
                            {
                                Socied = obec.Socied,
                                Project = obec.Project,
                                CardCode = "",
                                PriceList = Convert.ToInt16(_spl[2]),
                                WhsCode = obec.WhsCode,
                                ParValue = j.Code,
                                ColumnIndex = 0,
                                Sw = 2,
                                Kit = false
                            };

                            var articulosdelista = obrd.Get_OSCSP_OITM_P(obep);
                            suprimir = j.SUPRIMIR_MATERIALES;

                            articulosdelista.ForEach(a =>
                            {
                                var line2 = new BEDocumentLine();

                                line2.ItemCode = a.ItemCode;
                                line2.ItemName = a.ItemName;
                                line2.PriceBefDi = a.PriceBefDi;
                                line2.Quantity = j.Quantity;
                                line2.DiscPrcnt = a.DiscPrcnt;
                                line2.Price = a.PriceBefDi - ((a.PriceBefDi * a.DiscPrcnt) / 100);
                                line2.LineTotal = j.Quantity * a.Price;
                                line2.GTotal = j.Quantity * a.PriceVat;
                                line2.IssueMthd = a.IssueMthd;
                                line2.WhsCode = obec.WhsCode;
                                line2.TreeType = "I";
                                line2.Father = i.ItemCode;
                                line2.NumInSale = j.Quantity;

                                ((List<BEDocumentLine>)Session["inv1"]).Add(line2);
                                Set_LineNum();
                            });
                        });
                        if (suprimir == "N")
                        {
                            ((List<BEDocumentLine>)Session["inv1"]).Where(a => (a.TreeType == "S" && a.Father == i.ItemCode)).ToList().ForEach(x =>
                            {
                                x.PriceBefDi = Convert.ToDecimal(0.00);
                                x.Price = Convert.ToDecimal(0.00);
                                x.LineTotal = Convert.ToDecimal(0.00);
                                x.GTotal = Convert.ToDecimal(0.00);
                            });
                        }
                        else if (suprimir == "Y")
                        {
                            ((List<BEDocumentLine>)Session["inv1"]).Where(a => (a.TreeType == "I" && a.Father == i.ItemCode)).ToList().ForEach(x =>
                            {
                                x.PriceBefDi = Convert.ToDecimal(0.00);
                                x.Price = Convert.ToDecimal(0.00);
                                x.LineTotal = Convert.ToDecimal(0.00);
                                x.GTotal = Convert.ToDecimal(0.00);
                            });
                        }
                    });
                }
            }
            else if (e.Parameters.Contains("QTY"))
            {
                var _spl = e.Parameters.Split(':');
                var band = true;
                ((List<BEDocumentLine>)Session["inv1"]).Where(i => ((i.TreeType == "I" || i.TreeType == "S" || i.TreeType == "N") && i.Father == _spl[2]))
                    .ToList().ForEach(item =>
                    {
                        band = false;
                        if (item.TreeType == "N")
                        {
                            item.Quantity = Convert.ToInt32(_spl[1]);
                            item.LineTotal = item.Quantity * item.Price;
                            item.GTotal = item.LineTotal * Convert.ToDecimal(1.18);
                        }
                        else if (item.TreeType == "S" || item.TreeType == "I")
                        {
                            if (item.TreeType == "S")
                            {
                                item.Quantity = Convert.ToInt32(_spl[1]);
                                item.LineTotal = item.Quantity * item.Price;
                                item.GTotal = item.LineTotal * Convert.ToDecimal(1.18);
                            }
                            else if (item.TreeType == "I")
                            {
                                item.Quantity = Convert.ToInt32(item.NumInSale) * Convert.ToInt32(_spl[1]);
                                item.LineTotal = item.Quantity * item.Price;
                                item.GTotal = item.LineTotal * Convert.ToDecimal(1.18);
                            }

                        }
                    });
                if (band)
                {
                    return;
                }

            }
            else if (e.Parameters.Contains("ORDR"))
            {
                var _spl = e.Parameters.Split(';');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocEntry = Convert.ToInt32(_spl[1])
                };
                var obrd = new BRDocument();
                Session["inv1"] = obrd.Get_OSCSP_SRCH_RDR12(obep);
                Set_LineNum();
            }
            else if (e.Parameters.Contains("ODLN"))
            {
                var _spl = e.Parameters.Split(';');
                var cabe = _spl[1].Split(',');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocEntry = Convert.ToInt32(cabe[0])
                };
                var obrd = new BRDocument();
                //var olst = 
                Session["inv1"] = obrd.Get_OSCSP_SRCH_PDN12(obep);

                //Set_Promotion();
                Set_LineNum();
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
        public int ValidarDocumento( string U_BPP_MDTD, string U_BPP_MDSD, string U_BPP_MDCD)
        {
            string concat = U_BPP_MDTD + U_BPP_MDSD + U_BPP_MDCD;
            var obj = new BEParameters();
            var obec = ((BEParameters)Session["InitPar"]);
            obj.Socied = obec.Socied;
            using (var obrd = new BRDocument())
            {
                var count = obrd.Get_ValidarCorrelativo(obj, concat);
                return count.Count();
            }
        }
        private string Save()
        {
            var _err = string.Empty;
            if (((List<BEDocumentLine>)Session["inv1"]).Count == 0)
                _err = BSMessage.MsExLinesCount;
            if (cbeOwnerCode.Value == null)
                _err = BSMessage.MsExLinesCount;
            int re = 0;//ValidarDocumento(cbbU_BPP_MDTD.Value.ToString(), cbbU_BPP_MDSD.Value.ToString(), txtU_BPP_MDCD.Text);
            //int reejmbot = ValidarDocumento("12", "021", "0000254");
            //int reejmbel = ValidarDocumento("12", "017", "0000688");
           
                if (string.IsNullOrWhiteSpace(_err))
                {
                    if (re != 0)
                    {
                        _err = "El número de correlativo ya existe!!";
                    }
                    else
                    {
                    var obec = ((BEParameters)Session["InitPar"]);
                    var obj = new BEDocument();
                    obj.Socied = obec.Socied;
                    obj.DocDate = Convert.ToDateTime(dteDocDate.Text);
                    obj.CardCode = txtCardCode.Text;
                    obj.CardName = bteCardName.Text.Trim();
                    obj.LicTradNum = bteLicTradNum.Text.Trim();
                    obj.U_BPP_MDTD = cbbU_BPP_MDTD.Value.ToString();
                    //obj.U_BPP_MDSD = cbbU_BPP_MDSD.Value.ToString();
                    //obj.U_BPP_MDCD = txtU_BPP_MDCD.Text;
                    obj.NumAtCard = txtNumAtCard.Text;
                    obj.DiscPrcntTotal = Convert.ToDecimal(txtDiscPrcntTotal.Value);
                    obj.TotalExpns = Convert.ToDecimal(txtTotalExpns.Value);
                    obj.SlpCode = Convert.ToInt16(cbeSalesPerson.Value);
                    obj.OwnerCode = Convert.ToInt32(cbeOwnerCode.Value);
                    obj.GroupNum = Convert.ToInt16(cbbGroupNum.Value);
                    obj.Comments = mmoComments.Text;
                    //obj.U_BF_PED_ORIG = txtU_BF_PED_ORIG.Text;
                    obj.Project = ((BEParameters)Session["InitPar"]).Project;
                    //obj.U_BF_PickRmrk = User.Identity.Name;
                    Qua_BatchNum();
                    obj.Lines = ((List<BEDocumentLine>)Session["inv1"]);
                    obj.Reserve = "N";
                    using (var obrd = new BRDocument())
                    {
                        obrd.SavePurchaseInvoice(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
                    }

                    _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKS#{0}#{1}", obj.DocEntry, obj.DocNum);
                }
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
                var obep = new BEParameters()
                {
                    Project = obec.Project,
                    Socied = obec.Socied
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_CUENTAS_PAGO(obep);

                olst.ForEach(item => {
                    //obj.CashAccount = item.U_EFECTIVO_MN;
                });

                obj.MedPayment = "EF";
                //obj.CashAccount = "101101";//////////ANALIZAR EL CASHACCOUNT
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
        private string CreditNote()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var cuentaMayor = new List<BEProduct>();
            var seriesUsadas = new List<BEProduct>();
            var cadena = "";

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
            obj.SlpCode = Convert.ToInt32(cbeSalesPerson.Value);
            obj.OwnerCode = Convert.ToInt32(cbeOwnerCode.Value);
            obj.GroupNum = Convert.ToInt32(cbbGroupNum.Value);
            obj.Comments = mmoComments.Text;
            obj.Reserve = "N";
            obj.Lines = ((List<BEDocumentLine>)Session["inv1"]).Where(i => i.LineStatus != "C").ToList();
            obj.Lines.ForEach(item => 
            {
                item.Quantity = item.OpenQty;
                item.BaseType = Convert.ToInt32(item.ObjType);
                item.BaseEntry = item.DocEntry;
                item.BaseLine = item.LineNum - 1;
                item._Quantity = item.Quantity;
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = item.ItemCode,
                    WhsCode = item.WhsCode,
                    DocEntry = Convert.ToInt32(txtDocEntry.Value),
                    DocNum = Convert.ToInt32(txtDocNum.Value),
                    CardCode = txtCardCode.Text,
                };
                using (var obrd = new BRDocument())
                {
                    //cuentaMayor = obrd.GET_CUENTA_MAYOR(obep);
                    seriesUsadas = obrd.GET_SERIES_USADAS_COMPRAS(obep);
                }
                //cuentaMayor.ForEach(x =>
                //{
                //    item.AcctCode = x.AcctCode;
                //});
                seriesUsadas.ForEach(y =>
                {
                    cadena += y.SysNumber.ToString() + ",";
                    item.Serie = cadena.Substring(0, cadena.Length - 1);
                });
            });
            Session["cnoi"] = obj;
            return ("OKCN");
        }
        private string BusinessPartner()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEBusinessPartner();
            obj.Socied = obec.Socied;
            obj.CardCode = txtCrCardCode.Text;
            obj.CardName = txtCrCardName.Text;
            //cbbCrDocumentType
            obj.LicTradNum = txtCrLicTradNum.Text;
            //obj.GroupCode = 
            obj.Phone1 = txtCrPhone1.Text;
            obj.Cellular = txtCrCellular.Text;
            obj.E_Mail = txtCrE_Mail.Text;
            obj.U_PN_FecNac = dteCrU_PN_FecNac.Text;
            obj.U_BPP_BPTP = cbbCrPersonType.Value.ToString();
            obj.U_BPP_BPTD = cbbCrDocumentType.Value.ToString();
            obj.Lines = ((List<BEContactLines>)Session["crd1"]);
            obj.Lines2 = ((List<BEClientAddress>)Session["dire"]);
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
                else if (string.Compare(e.Parameter, "CrNote", false) == 0)
                {
                    e.Result = CreditNote();
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
                Reserve = "N"
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_OPCH(obj);
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
        ///  LISTA LAS OFERTAS DE VENTA
        /// </summary>
        /// <returns></returns>
        protected void gdvOrdrSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                Project = obec.Project,
                CardCode = txtCardCode.Text,
                NumAtCard = txtorDocNum.Text.Trim(),
                DateIn = (DateTime?)dteorDateIn.Value,
                DateFi = (DateTime?)dteorDateFi.Value                
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_ORDR2(obj);
            Session["bord"] = olst;
            gdvOrdrSearch.DataSource = olst;
            gdvOrdrSearch.DataBind();
        }
        protected void gdvOrdrSearch_DataBinding(object sender, EventArgs e)
        {
            gdvOrdrSearch.DataSource = Session["bord"];
        }

        protected void dgkitnaih_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            ((List<BEDocumentLine>)Session["inv2"]).Clear();
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("QK"))
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = txtCardCode.Text,
                    PriceList = Convert.ToInt16(cbbListNum.Value),
                    WhsCode = obec.WhsCode,
                    ParValue = e.Parameters.Replace("QK:", "").ToUpper().Replace("N", "").Trim(),
                    ColumnIndex = 0,
                    Sw = 2
                };
                var obrd = new BRDocument();

                var olst = obrd.Get_OSCSP_KITS_NAIAH(obep);

                var _qtk = (chkKit.Checked) ? Convert.ToInt32(txtQuantityKit.Text) : Convert.ToInt32(txtQKit.Text);
                olst.ForEach(item =>
                {
                    var line = new BEDocumentLine()
                    {
                        ItemCode = item.ItemCode,
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
                    ((List<BEDocumentLine>)Session["inv2"]).Add(line);
                });
               // Set_LineNum();
              
                dgkitnaih.DataSource = ((List<BEDocumentLine>)Session["inv2"]);
                dgkitnaih.DataBind();
            }
         
        }
        protected void dgkitnaih_DataBinding(object sender, EventArgs e)
        {
            dgkitnaih.DataSource = Session["inv2"];
        }

        protected void gvcontacto_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            //gvcontacto.DoRowValidation();
            var obec = ((BEParameters)Session["InitPar"]);
            var line = new BEContactLines()
            {
                //CardCode = txtCrCardCode.Text,
                //Name = Convert.ToString(e.NewValues["FirstName"]),
                FirstName = Convert.ToString(e.NewValues["FirstName"]),
                LastName = Convert.ToString(e.NewValues["LastName"]),
                Cellolar = Convert.ToString(e.NewValues["Cellolar"]),
                E_MailL = Convert.ToString(e.NewValues["E_MailL"]),
            };
            
            ((List<BEContactLines>)Session["crd1"]).Add(line);
            Set_CntctCode();
            gvcontacto.CancelEdit();
            e.Cancel = true;
            gvcontacto.DataSource = ((List<BEContactLines>)Session["crd1"]);
            gvcontacto.DataBind();
        }
        protected void listdirecciones_ItemInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var line = new BEClientAddress();
            line.Address = textAddress.Text;
            line.Street = txtStreet.Text;
            line.Country = "PE";
            line.AdresType = rdbtntipofact.SelectedItem.Value.ToString();
            line.State = cbbState.Value.ToString().Substring(0,2);
            line.U_DXP_BIZ_COPR = cbbU_DXP_BIZ_COPR.Value.ToString().Substring(0,4);
            line.U_DXP_BIZ_PROV = cbbU_DXP_BIZ_COPR.Value.ToString().Substring(7);
            line.U_DXP_BIZ_CODI = cbbU_DXP_BIZ_CODI.Value.ToString().Substring(0,6);
            line.U_DXP_BIZ_DIST = cbbU_DXP_BIZ_CODI.Value.ToString().Substring(9);
            /*{
                Address = txtAddress.Value.ToString(),
                Street = txtStreet.Value.ToString(),
                Country = "PE",
                State = cbbState.Value.ToString().Substring(5),
                U_DXP_BIZ_COPR = cbbU_DXP_BIZ_COPR.Value.ToString().Substring(7),
                U_DXP_BIZ_CODI = cbbU_DXP_BIZ_CODI.Value.ToString().Substring(9)
            };*/

            ((List<BEClientAddress>)Session["dire"]).Add(line);
            Set_LineNum_Direcciones();
        }

        protected void gdvinv1_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            gdvinv1.DoRowValidation();
            var index = gdvinv1.EditingRowVisibleIndex;

            ((List<BEDocumentLine>)Session["inv1"])[index].PriceBefDi = Convert.ToDecimal(e.NewValues["PriceBefDi"]);
            ((List<BEDocumentLine>)Session["inv1"])[index].Quantity = Convert.ToInt32(e.NewValues["Quantity"]);
            ((List<BEDocumentLine>)Session["inv1"])[index].LineTotal = Convert.ToDecimal(e.NewValues["LineTotal"]);
            ((List<BEDocumentLine>)Session["inv1"])[index].DiscPrcnt = Convert.ToDecimal(e.NewValues["DiscPrcnt"]);
            ((List<BEDocumentLine>)Session["inv1"])[index].Price = Convert.ToDecimal(e.NewValues["Price"]);
            ((List<BEDocumentLine>)Session["inv1"])[index].GTotal = Convert.ToDecimal(e.NewValues["GTotal"]);
            ((List<BEDocumentLine>)Session["inv1"])[index].Serie = Convert.ToString(e.NewValues["Serie"]);

            gdvinv1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvinv1.CancelEdit();
            e.Cancel = true;
            gdvinv1.DataSource = ((List<BEDocumentLine>)Session["inv1"]);
            gdvinv1.DataBind();
        }




        /*      protected void listdirecciones_ItemInserted(object sender, ASPxDataInsertedEventArgs e)
{
var obec = ((BEParameters)Session["InitPar"]);
var line2 = new BEClientAddress()
{
Address = txtAddress.Value.ToString(),
Street = txtStreet.Value.ToString(),
Country = "PE",
State = cbbState.Value.ToString().Substring(5),
U_DXP_BIZ_COPR = cbbU_DXP_BIZ_COPR.Value.ToString().Substring(7),
U_DXP_BIZ_CODI = cbbU_DXP_BIZ_CODI.Value.ToString().Substring(9)
};

((List<BEClientAddress>)Session["dire"]).Add(line2);
Set_LineNum_Direcciones();
}

protected void btnagregardirecc_Click(object sender, EventArgs e)
{
var obec = ((BEParameters)Session["InitPar"]);
var line2 = new BEClientAddress()
{
Address = txtAddress.Value.ToString(),
Street = txtStreet.Value.ToString(),
Country = "PE",
State = cbbState.Value.ToString().Substring(5),
U_DXP_BIZ_COPR = cbbU_DXP_BIZ_COPR.Value.ToString().Substring(7),
U_DXP_BIZ_CODI = cbbU_DXP_BIZ_CODI.Value.ToString().Substring(9)
};

((List<BEClientAddress>)Session["dire"]).Add(line2);
Set_LineNum_Direcciones();
}

protected void listdirecciones_ItemInserting(object sender, ASPxDataInsertingEventArgs e)
{
var obec = ((BEParameters)Session["InitPar"]);
var line2 = new BEClientAddress()
{
Address = txtAddress.Value.ToString(),
Street = txtStreet.Value.ToString(),
Country = "PE",
State = cbbState.Value.ToString().Substring(5),
U_DXP_BIZ_COPR = cbbU_DXP_BIZ_COPR.Value.ToString().Substring(7),
U_DXP_BIZ_CODI = cbbU_DXP_BIZ_CODI.Value.ToString().Substring(9)
};

((List<BEClientAddress>)Session["dire"]).Add(line2);
Set_LineNum_Direcciones();
}
protected void btnagregardirecc_Click(object sender, EventArgs e)
{

var obec = ((BEParameters)Session["InitPar"]);
var line2 = new BEClientAddress()
{
Address = txtAddress.Value.ToString(),
Street = txtStreet.Value.ToString(),
Country = "PE",
State = cbbState.Value.ToString().Substring(5),
U_DXP_BIZ_COPR = cbbU_DXP_BIZ_COPR.Value.ToString().Substring(7),
U_DXP_BIZ_CODI = cbbU_DXP_BIZ_CODI.Value.ToString().Substring(9)
};

((List<BEClientAddress>)Session["dire"]).Add(line2);
Set_LineNum_Direcciones();
}*/
    }
}