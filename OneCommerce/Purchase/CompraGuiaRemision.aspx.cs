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
using System.Globalization;
using System.Threading;

namespace OneCommerce.Purchase
{
    public partial class CompraGuiaRemision : Page
    {
        private static BEDocument ocno;
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
                    {*/
                    gdvdln1.Columns[10].Visible = true;
                    gdvdln1.Columns[11].Visible = true;
                    //gdvdln1.Columns[12].Visible = true;
                    Set_Permissions();
                    Session["odln"] = new List<BEDocument>();
                    Session["dln1"] = new List<BEDocumentLine>();
                    Session["ordr"] = new List<BEDocument>();
                    Session["rdr1"] = new List<BEDocumentLine>();
                    Session["ocrd"] = new List<BEClient>();
                    Session["oitm"] = new List<BEProduct>();
                    Session["crd1"] = new List<BEClientAddress>();
                    Session["lote"] = new List<BELotes>();
                    Session["owhs"] = new List<BEWhsCode>();
                    hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
                    hdfTemp.Add("_emid", obec.U_BF_EMID);
                    hdfTemp.Add("_soci", obec.Socied);
                    hdfTemp.Add("_proj", obec.Project);
                    hdfTemp.Add("Reserve", string.Empty);
                    hdfTemp.Add("Currency", string.Empty);
                    hdfTemp.Add("Rate", obec.Rate);

                    if (Session["cnoi"] != null)
                    {
                        ocno = (BEDocument)Session["cnoi"];
                        var i = 1;
                        ocno.Lines.ForEach(item =>
                        {
                            item.LineNum = i;
                            i += 1;
                        });
                        ((BEParameters)Session["InitPar"]).Currency = "CARGADO";
                        hdfTemp.Set("Reserve", ocno.Reserve);
                        hdfTemp.Set("Currency", ocno.Currency);
                        Session["dln1"] = ocno.Lines;
                        gdvdln1.DataSource = ocno.Lines;
                        gdvdln1.DataBind();
                        Session["cnoi"] = null;
                    }

                    var _sd = obec.RAZON_SOCIAL;
                    ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Socied")).InnerText = _sd;
                    ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Local")).InnerText = obec.DscpLocal;
                    ((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "Tipo de Cambio: " + obec.Rate.ToString("c3");
                    //}
                }
                ((BEParameters)Session["InitPar"]).Currency = "CARGADO";


                //if (((BEParameters)Session["InitPar"]).Band && ((BEParameters)Session["InitPar"]).Currency != "")
                //{

                //    if (hdfTemp.Get("Currency").ToString() == "USD")
                //    {
                //        CultureInfo culture;
                //        culture = CultureInfo.CreateSpecificCulture("en-US");
                //        Thread.CurrentThread.CurrentCulture = culture;
                //        Thread.CurrentThread.CurrentUICulture = culture;

                //    }
                //    else if (hdfTemp.Get("Currency").ToString() == "EUR")
                //    {
                //        CultureInfo culture;
                //        culture = CultureInfo.CreateSpecificCulture("fr-FR");
                //        Thread.CurrentThread.CurrentCulture = culture;
                //        Thread.CurrentThread.CurrentUICulture = culture;
                //    }
                //    else
                //    {
                //        //MONEDA LOCAL
                //    }
                //}
                //else ((BEParameters)Session["InitPar"]).Band = true;
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
            //FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Masters").Visible = true;
            var obec = ((BEParameters)Session["InitPar"]);
            obec.Permisos.ForEach(item => {
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName(item.GRUPO_MENU).Items.FindByName(item.PARTICULAR_MENU).Enabled = Convert.ToBoolean(item.PERMISO);
            });
        }

        //!+ RUTINAS AJAX

        /// <summary>
        /// DOCUMENTO ORIGEN
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static BEDocument Get_DeliveryNote()
        {
            return (ocno);
        }
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
            var msbl = new string[] { "09" };
            olst.RemoveAll(item => !msbl.Contains(item.U_BPP_NDTD));
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
        private List<BEProduct> SerialNumber()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var olist = new List<BEProduct>();
            var listaSN = new List<BEProduct>();


            ((List<BEDocumentLine>)Session["dln1"]).ForEach(item =>
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = item.ItemCode
                };
                using (var obrd = new BRDocument())
                {
                    olist = obrd.Get_SerialNumber(obj);
                }
                listaSN.AddRange(olist);
            });
            return (listaSN);
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
        public static List<BEProduct> Get_OneProduct(string socied, string whscode, string cardcode, string pricelist, string itemcode)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                CardCode = cardcode,
                PriceList = Convert.ToInt16(pricelist),
                //WhsCode = //obec.WhsCode, 
                ParValue = itemcode,
                ColumnIndex = 0,
                Sw = 2,
                Kit = false
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OITM(obep);
            return (olst);
        }
        /// <summary>
        /// ENUMERA LA LINEAS DEL DETALLE
        /// </summary>
        private void Set_LineNum()
        {
            var i = 1;
            ((List<BEDocumentLine>)Session["dln1"]).ForEach(item =>
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
                CardName = txtRazonS.Text,
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
            if (e.Parameters.Contains("BUSCAR"))
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    Project = obec.Project,
                    CardCode = txtCardCode.Text,
                    PriceList = Convert.ToInt16(cbbListNum.Value),
                    WhsCode = "",
                    ParValue = txtParProduct.Text.Trim(),
                    ColumnIndex = ((GridViewDataColumn)gdvProductSearch.GetSortedColumns().ElementAt(0)).VisibleIndex,
                    Sw = 2,
                    Kit = false,
                    Moneda = cbbDocCur.Value.ToString(),
                    DateIn = Convert.ToDateTime(dteDocDate.Text),
                    Descripcion = txtDescription.Text,
                    SerieMaqr = txtMarca.Text
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_OITM_P(obep);
                Session["oitm"] = olst;
                gdvProductSearch.DataSource = olst;
                gdvProductSearch.DataBind();
            }
            else if (e.Parameters.Contains("CLEAR"))
            {
                ((List<BEProduct>)Session["oitm"]).Clear();
                gdvProductSearch.DataSource = Session["oitm"];
                gdvProductSearch.DataBind();
            }
        }
        protected void gdvProductSearch_DataBinding(object sender, EventArgs e)
        {
            gdvProductSearch.DataSource = Session["oitm"];
        }
        protected void gdvdln1_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            //if (string.Compare(e.Column.FieldName, "Quantity", false) == 0)           
            //    e.Editor.ReadOnly = false;
            //else
            //    e.Editor.ReadOnly = true;
            gdvdln1.Columns[0].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
            gdvdln1.Columns[1].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
            gdvdln1.Columns[2].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
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

            gdvdln1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["dln1"]).Sum(item => Math.Round(item.LineTotal, 2));
        }
        protected void gdvdln1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            //if (!string.IsNullOrWhiteSpace(txtDocEntry.Text))
            //{
            //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
            //        e.Enabled = false;
            //}
            if (!string.IsNullOrWhiteSpace(txtDocEntry.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New ||
                    e.ButtonType == ColumnCommandButtonType.Edit ||
                    e.ButtonType == ColumnCommandButtonType.Delete)
                {
                    e.Enabled = true;
                }
            }
            if (txtDocStatus.Text == "Cerrado")
            {
                if (e.ButtonType == ColumnCommandButtonType.New ||
                    e.ButtonType == ColumnCommandButtonType.Edit ||
                    e.ButtonType == ColumnCommandButtonType.Delete)
                {
                    e.Enabled = false;
                }
            }
        }
        protected void gdvdln1_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            gdvdln1.DoRowValidation();
            var index = gdvdln1.EditingRowVisibleIndex;
            ((List<BEDocumentLine>)Session["dln1"])[index].Quantity = Convert.ToDecimal(e.NewValues["Quantity"]);
            ((List<BEDocumentLine>)Session["dln1"])[index].LineTotal = Convert.ToDecimal(e.NewValues["LineTotal"]);
            ((List<BEDocumentLine>)Session["dln1"])[index].DiscPrcnt = Convert.ToDecimal(e.NewValues["DiscPrcnt"]);
            ((List<BEDocumentLine>)Session["dln1"])[index].Price = Convert.ToDecimal(e.NewValues["Price"]);
            ((List<BEDocumentLine>)Session["dln1"])[index].GTotal = Convert.ToDecimal(e.NewValues["GTotal"]);
            ((List<BEDocumentLine>)Session["dln1"])[index].Serie = Convert.ToString(e.NewValues["Serie"]);
            ((List<BEDocumentLine>)Session["dln1"])[index].WhsCode = Convert.ToString(e.NewValues["WhsCode"]);

            gdvdln1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["dln1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvdln1.CancelEdit();
            e.Cancel = true;
            gdvdln1.DataSource = ((List<BEDocumentLine>)Session["dln1"]);
            gdvdln1.DataBind();
        }
        protected void gdvdln1_RowValidating(object sender, ASPxDataValidationEventArgs e)
        {
            if (Convert.ToInt32(e.NewValues["Quantity"]) == 0)
                e.RowError = BSMessage.MsExQuantityZero;
            //if (gdvdln1.IsEditing)
            //{
            //    var index = gdvdln1.EditingRowVisibleIndex;
            //    if (Convert.ToInt32(e.NewValues["Quantity"]) > ((List<BEDocumentLine>)Session["dln1"])[index]._Quantity)
            //        e.RowError = BSMessage.MsExQuantityMino;
            //}

            var items = new List<string>();
            //((List<BEDocumentLine>)Session["dln1"]).Where(item => string.IsNullOrWhiteSpace(item.U_BF_CodKit) && item.InGift == 0)
            //                                       .ToList()
            //                                       .ForEach(item =>
            //                                       {
            //                                           items.Add(item.ItemCode);
            //                                       });
            if (e.IsNewRow)
                items.Add(Convert.ToString(e.NewValues["ItemCode"]));
            var exprd = items.Where(item => item == Convert.ToString(e.NewValues["ItemCode"])).Count();
            if (exprd > 1)
            {
                e.RowError = BSMessage.MsExistItemCode;
            }
        }
        protected void gdvdln1_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gdvdln1.FindVisibleIndexByKeyValue(e.Keys[gdvdln1.KeyFieldName]);
            var _lnm = (i + 1);
            ((List<BEDocumentLine>)Session["dln1"]).RemoveAll(item => item.LineNum == _lnm);
            Set_LineNum();

            gdvdln1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["dln1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvdln1.DataSource = ((List<BEDocumentLine>)Session["dln1"]);
            gdvdln1.DataBind();
        }
        protected void gdvdln1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("QK"))
            {
                
                //var obep = new BEParameters() 
                //{ 
                //    Socied = obec.Socied, 
                //    CardCode = txtCardCode.Text, 
                //    PriceList = Convert.ToInt16(cbbListNum.Value), 
                //    WhsCode = obec.WhsCode, 
                //    ParValue = e.Parameters.Replace("QK:", "").ToUpper().Replace("K", "").Trim(), 
                //    ColumnIndex = 0, 
                //    Sw = 2                    
                //};
                //var obrd = new BRDocument();
                //var olst = obrd.Get_OSCSP_KITS(obep);

                //var _qtk = (chkKit.Checked) ? Convert.ToInt32(txtQuantityKit.Text) : Convert.ToInt32(txtQKit.Text);                
                //olst.ForEach(item =>
                //{
                //    var line = new BEDocumentLine() 
                //    { ItemCode = item.ItemCode, 
                //        ItemName = item.ItemName, 
                //        Quantity = _qtk, 
                //        PriceBefDi = item.PriceBefDi, 
                //        DiscPrcnt = item.DiscPrcnt, 
                //        Price = item.Price, 
                //        LineTotal = Convert.ToDecimal(_qtk * item.Price), 
                //        GTotal = Convert.ToDecimal(_qtk * item.PriceVat), 
                //        BatchNum = item.BatchNum, 
                //        WhsCode = obec.WhsCode,
                //        U_BF_CodKit = item.U_BF_CodKit
                //    };
                //    ((List<BEDocumentLine>)Session["dln1"]).Add(line);
                //});
                //Set_LineNum();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                Session["cnoi"] = null;
                ocno = new BEDocument();
                ((List<BEDocumentLine>)Session["dln1"]).Clear();
            }
            else if (e.Parameters.Contains("SRCH"))
            {
                var seriesUsadas = new List<BEProduct>();
                var cadena = "";
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocEntry = Convert.ToInt32(txtDocEntry.Text)
                };
                var obrd = new BRDocument();
                var olist = obrd.Get_OSCSP_SRCH_PDN1(obep);
                //olist.ForEach(item => {
                //    var parametros = new BEParameters()
                //    {
                //        Socied = obec.Socied,
                //        DocEntry = Convert.ToInt32(txtDocEntry.Text),
                //        DocNum = Convert.ToInt32(txtDocNum.Text),
                //        ItemCode = item.ItemCode,
                //        CardCode = txtCardCode.Text,

                //    };
                //    if (item.IssueMthd.Substring(0, 1) == "M")
                //    {
                //        seriesUsadas = obrd.GET_SERIES_USADAS_COMPRAS(parametros);
                //        seriesUsadas.ForEach(y =>
                //        {
                //            cadena += y.SysNumber.ToString() + ",";
                //            //item.Serie = cadena.Substring(0, cadena.Length - 1);
                //        });
                //        item.Serie = cadena.Substring(0, cadena.Length - 1);
                //    } else;

                //});
                Session["dln1"] = olist;
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
                            WhsCode = cbbWareHouse.Value.ToString(),
                            ParValue = item.Code,
                            ColumnIndex = 0,
                            Sw = 2,
                            Kit = false,
                            Moneda = cbbDocCur.Value.ToString(),
                            DateIn = Convert.ToDateTime(dteDocDate.Text),
                            Descripcion = "",
                            SerieMaqr = ""
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
                            line.NumInBuy = Convert.ToInt32(padre[8]);
                            line.ActivoC = padre[9];
                            line.ActivoS = padre[10];
                            line.InvntItem = padre[11];
                            line.LastPurCur = padre[12];
                            band = false;
                            suprimir = item.SUPRIMIR_MATERIALES;
                            ((List<BEDocumentLine>)Session["dln1"]).Add(line);
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
                            line2.NumInBuy = item.Quantity;
                            line2.ActivoC = a.ActivoC;
                            line2.ActivoS = a.ActivoS;
                            line2.InvntItem = a.InvntItem;
                            line2.LastPurCur = a.LastPurCur;
                            ((List<BEDocumentLine>)Session["dln1"]).Add(line2);
                            Set_LineNum();
                        });
                    });
                    if (suprimir == "N")
                    {
                        ((List<BEDocumentLine>)Session["dln1"]).Where(i => i.TreeType == "S" && i.Father == padre[0]).ToList().ForEach(x =>
                        {
                            x.PriceBefDi = Convert.ToDecimal(0.00);
                            x.Price = Convert.ToDecimal(0.00);
                            x.LineTotal = Convert.ToDecimal(0.00);
                            x.GTotal = Convert.ToDecimal(0.00);
                        });
                    }
                    else if (suprimir == "Y")
                    {
                        ((List<BEDocumentLine>)Session["dln1"]).Where(i => i.TreeType == "I" && i.Father == padre[0]).ToList().ForEach(x =>
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
                    line.NumInBuy = Convert.ToInt32(padre[8]);
                    line.ActivoC = padre[9];
                    line.ActivoS = padre[10];
                    line.InvntItem = padre[11];
                    line.LastPurCur = padre[12];
                    band = false;
                    //suprimir = item.SUPRIMIR_MATERIALES;
                    ((List<BEDocumentLine>)Session["dln1"]).Add(line);
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
                    WhsCode = cbbWareHouse.Value.ToString(),
                    ParValue = _spl[1],
                    ColumnIndex = 0,
                    Sw = 2,
                    Kit = false,
                    ItemCode = _spl[1],
                    Moneda = cbbDocCur.Value.ToString(),
                    DateIn = Convert.ToDateTime(dteDocDate.Text),
                    Descripcion = "",
                    SerieMaqr = ""
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
                        line.NumInBuy = Convert.ToInt32(item.NumInBuy);
                        line.ActivoC = item.ActivoC;
                        line.ActivoS = item.ActivoS;
                        line.InvntItem = item.InvntItem;
                        line.LastPurCur = item.LastPurCur;

                        ((List<BEDocumentLine>)Session["dln1"]).Add(line);
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
                        line.NumInBuy = Convert.ToInt32(i.NumInBuy);
                        line.ActivoC = i.ActivoC;
                        line.ActivoS = i.ActivoS;
                        line.InvntItem = i.InvntItem;
                        line.LastPurCur = i.LastPurCur;

                        ((List<BEDocumentLine>)Session["dln1"]).Add(line);
                        Set_LineNum();

                        listamateriales.ForEach(j =>
                        {
                            obep = new BEParameters()
                            {
                                Socied = obec.Socied,
                                Project = obec.Project,
                                CardCode = "",
                                PriceList = Convert.ToInt16(_spl[2]),
                                WhsCode = cbbWareHouse.Value.ToString(),
                                ParValue = j.Code,
                                ColumnIndex = 0,
                                Sw = 2,
                                Kit = false,
                                Moneda = cbbDocCur.Value.ToString(),
                                DateIn = Convert.ToDateTime(dteDocDate.Text),
                                Descripcion = "",
                                SerieMaqr = ""
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
                                line2.NumInBuy = j.Quantity;
                                line2.ActivoC = a.ActivoC;
                                line2.ActivoS = a.ActivoS;
                                line2.InvntItem = a.InvntItem;
                                line2.LastPurCur = a.LastPurCur;

                                ((List<BEDocumentLine>)Session["dln1"]).Add(line2);
                                Set_LineNum();
                            });
                        });
                        if (suprimir == "N")
                        {
                            ((List<BEDocumentLine>)Session["dln1"]).Where(a => (a.TreeType == "S" && a.Father == i.ItemCode)).ToList().ForEach(x =>
                            {
                                x.PriceBefDi = Convert.ToDecimal(0.00);
                                x.Price = Convert.ToDecimal(0.00);
                                x.LineTotal = Convert.ToDecimal(0.00);
                                x.GTotal = Convert.ToDecimal(0.00);
                            });
                        }
                        else if (suprimir == "Y")
                        {
                            ((List<BEDocumentLine>)Session["dln1"]).Where(a => (a.TreeType == "I" && a.Father == i.ItemCode)).ToList().ForEach(x =>
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
            else if (e.Parameters.Contains("UPDTPRICE"))
            {
                var _spl = e.Parameters.Split(':');
                ((List<BEDocumentLine>)Session["dln1"]).Where(i => (i.TreeType == "N" && i.Father == _spl[5]))
                    .ToList().ForEach(item =>
                    {
                        item.PriceBefDi = Convert.ToDecimal(_spl[1]);
                        item.Price = Convert.ToDecimal(_spl[2]);
                        item.LineTotal = Convert.ToDecimal(_spl[3]);
                        item.GTotal = Convert.ToDecimal(_spl[4]);
                        item.Quantity = Convert.ToDecimal(_spl[6]);
                    });
            }
            else if (e.Parameters.Contains("QTY"))
            {
                var _spl = e.Parameters.Split(':');
                var band = true;
                ((List<BEDocumentLine>)Session["dln1"]).Where(i => ((i.TreeType == "I" || i.TreeType == "S" || i.TreeType == "N") && i.Father == _spl[2]))
                    .ToList().ForEach(item =>
                    {
                        band = false;
                        if (item.TreeType == "N")
                        {
                            item.Quantity = Convert.ToDecimal(_spl[1]);
                            item.LineTotal = item.Quantity * item.Price;
                            item.GTotal = item.LineTotal * Convert.ToDecimal(1.18);
                        }
                        else if (item.TreeType == "S" || item.TreeType == "I")
                        {
                            if (item.TreeType == "S")
                            {
                                item.Quantity = Convert.ToDecimal(_spl[1]);
                                item.LineTotal = item.Quantity * item.Price;
                                item.GTotal = item.LineTotal * Convert.ToDecimal(1.18);
                            }
                            else if (item.TreeType == "I")
                            {
                                item.Quantity = Convert.ToDecimal(item.NumInBuy) * Convert.ToDecimal(_spl[1]);
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
                var cabe = _spl[1].Split(',');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocEntry = Convert.ToInt32(cabe[0])
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_SRCH_POR12(obep);
                Session["dln1"] = olst;

                //Set_Promotion();
                Set_LineNum();
            }

            gdvdln1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["dln1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvdln1.CancelEdit();
            gdvdln1.DataSource = ((List<BEDocumentLine>)Session["dln1"]);
            gdvdln1.DataBind();
        }
        private void Qua_BatchNum()
        {
            ((List<BEDocumentLine>)Session["dln1"]).ForEach(item =>
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
        public string alphanumeric(string x)
        {
            var texto = x.ToCharArray();
            var rslt = "";
            for (int i = 0; i < x.Length; i++)
            {
                if (char.IsDigit(texto[i]) || texto[i] == '.' || texto[i] == ',')
                {
                    if (texto[i] == '.' || texto[i] == ',')
                    {
                        if (cbbDocCur.Value.ToString() == "EUR") rslt += ",";
                        else rslt += ".";
                    }

                    else
                        rslt += texto[i];
                }
            }
            return rslt;
        }
        private string Save()
        {
            var _err = string.Empty;
            if (((List<BEDocumentLine>)Session["dln1"]).Count == 0)
                _err = BSMessage.MsExLinesCount;
            if (cbeOwnerCode.Value == null)
                _err = BSMessage.MsExLinesCount;

            if (string.IsNullOrWhiteSpace(_err))
            {

                var obec = ((BEParameters)Session["InitPar"]);
                var obj = new BEDocument();
                obj.Socied = obec.Socied;
                obj.DocDate = Convert.ToDateTime(dteDocDate.Text);
                obj.TaxDate = Convert.ToDateTime(dteDocumentoDate.Text);
                obj.CardCode = txtCardCode.Text;
                obj.CardName = bteCardName.Text.Trim();
                obj.LicTradNum = bteLicTradNum.Text.Trim();
                obj.U_BPP_MDTD = cbbU_BPP_MDTD.Value.ToString();
                obj.U_BPP_MDSD = txtU_BPP_MDSD.Text;
                obj.U_BPP_MDCD = txtU_BPP_MDCD.Text;
                obj.NumAtCard = NumAtCard.Text;
                obj.ShipToCode = txtShipToCode.Text;
                obj.PayToCode = txtBillToCode.Text;
                obj.DiscPrcntTotal = Convert.ToDecimal(alphanumeric(txtDiscPrcntTotal.Value.ToString()));
                obj.TotalExpns = Convert.ToDecimal(alphanumeric(txtTotalExpns.Value.ToString()));
                obj.SlpCode = Convert.ToInt16(cbeSalesPerson.Value);
                obj.OwnerCode = Convert.ToInt32(cbeOwnerCode.Value);
                obj.GroupNum = Convert.ToInt16(cbbGroupNum.Value);
                obj.Comments = mmoComments.Text;
                obj.Currency = cbbDocCur.Value.ToString();
                //obj.U_BF_PED_ORIG = txtU_BF_PED_ORIG0.Text;
                obj.Project = ((BEParameters)Session["InitPar"]).Project;
                obj.CntctCode = Convert.ToInt32(cbbPersonContact.Value.ToString());
                //obj.U_BF_PickRmrk = User.Identity.Name;
                //Qua_BatchNum();
                List<BEProduct> listSN = SerialNumber();
                obj.Lines = ((List<BEDocumentLine>)Session["dln1"]);
                obj.Reserve = hdfTemp.Get("Reserve").ToString();
                using (var obrd = new BRDocument())
                {
                    obrd.SavePurchaseDeliveryNote(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
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
        private string Cancel()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEDocument();
            obj.Socied = obec.Socied;
            obj.DocEntry = Convert.ToInt32(txtDocEntry.Text);
            using (var obrd = new BRDocument())
            {
                obrd.CancelDeliveryNote(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKOC";
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
                else if (string.Compare(e.Parameter, "Modify", false) == 0)
                {
                    //e.Result = Modify();
                }
                else if (string.Compare(e.Parameter, "Cancel", false) == 0)
                {
                    e.Result = Cancel();
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
        protected void gdvodlnSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                DateIn = (DateTime?)dteDateIn.Value,
                DateFi = (DateTime?)dteDateFi.Value,
                NumAtCard = txtNumAtCards.Text,
                CardCode = txtsCardCode.Text,
                CardName = txtsCardName.Text,
                Id_Dire = txtdirec.Text,
                Project = obec.Project,
                Code = txtCorrelativo.Text,
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_OPDN(obj);
            Session["odln"] = olst;
            gdvodlnSearch.DataSource = olst;
            gdvodlnSearch.DataBind();
        }
        protected void gdvodlnSearch_DataBinding(object sender, EventArgs e)
        {
            gdvodlnSearch.DataSource = Session["odln"];
        }
        protected void gdvdln1_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            //var lnum = Convert.ToInt32(e.GetValue("LineNum"));
            //var igf = ((List<BEDocumentLine>)Session["rdr1"]).Where(item => item.LineNum == lnum).FirstOrDefault();
            //var U_BF_CodKit = Convert.ToString(e.GetValue("U_BF_CodKit"));
            //if (!string.IsNullOrWhiteSpace(U_BF_CodKit))
            //    e.Row.BackColor = Color.Lavender;
        }

        protected void gdvOrdrSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
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
            var olst = obrd.Get_OSCSP_SRCH_OPOR2(obj);
            Session["rdr1"] = olst;
            gdvOrdrSearch.DataSource = olst;
            gdvOrdrSearch.DataBind();
        }

        protected void gdvOrdrSearch_DataBinding(object sender, EventArgs e)
        {
            gdvOrdrSearch.DataSource = Session["rdr1"];
        }

        protected void gdvdln1_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            var beNe = new BRDocument();
            gdvdln1.DoRowValidation();
            var obec = ((BEParameters)Session["InitPar"]);
            string almacen = "";
            /*if (obec.Socied == "BM")
            {    
                if (beNe.getStockAlmacen(Convert.ToString(e.NewValues["ItemCode"])) <= 0)
                    almacen = "BL010";
                else
                    almacen = obec.WhsCode;
            }
            if (obec.Socied == "BT")
            {*/
            almacen = obec.WhsCode;
            //}
            var line = new BEDocumentLine()
            {
                ItemCode = Convert.ToString(e.NewValues["ItemCode"]),
                ItemName = Convert.ToString(e.NewValues["ItemName"]),
                Quantity = Convert.ToDecimal(e.NewValues["Quantity"]),
                PriceBefDi = Convert.ToDecimal(e.NewValues["PriceBefDi"]),
                DiscPrcnt = Convert.ToDecimal(e.NewValues["DiscPrcnt"]),
                Price = Convert.ToDecimal(e.NewValues["Price"]),
                LineTotal = Convert.ToDecimal(e.NewValues["LineTotal"]),
                GTotal = Convert.ToDecimal(e.NewValues["GTotal"]),
                IssueMthd = Convert.ToString(e.NewValues["IssueMthd"]),
                WhsCode = almacen,
                U_StoDiBE = Convert.ToDecimal(e.NewValues["U_StoDiBE"]),
                U_BF_StoDiYo = Convert.ToDecimal(e.NewValues["U_BF_StoDiYo"]),
                //BL050 = Convert.ToDecimal(e.NewValues["BL050"]),
                //BL010 = Convert.ToDecimal(e.NewValues["BL010"]),
                //U_U_BF_CompTot = Convert.ToDecimal(e.NewValues["U_U_BF_CompTot"]),
                //U_BIZ_DREC = Convert.ToString(e.NewValues["U_BIZ_DREC"]),
                //U_BIZ_FFAR = Convert.ToString(e.NewValues["U_BIZ_FFAR"]),
                //U_BIZ_CANT = Convert.ToDecimal(e.NewValues["U_BIZ_CANT"]),
                //U_BF_FECH_EXPE = DateTime.Today.ToShortDateString(),
                //U_BF_FECH_VENC = DateTime.Today.AddDays(90).ToShortDateString(),
                //U_BF_CodKit = string.Empty,
                OItemCode = Convert.ToString(e.NewValues["OItemCode"]),
                OnDscOrg = Convert.ToDecimal(e.NewValues["OnDscOrg"]),
                Serie = Convert.ToString(e.NewValues["Serie"])
                //PASAR EL SERIALNUMBER PARA LUEGO HACER EL DATASOURCE AL DETALLE
            };

            line.InDscOrg = (line.OnDscOrg == 0) ? 1 : 0;
            ((List<BEDocumentLine>)Session["dln1"]).Add(line);
            //Set_Promotion();
            Set_LineNum();

            gdvdln1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["dln1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvdln1.CancelEdit();
            e.Cancel = true;
            gdvdln1.DataSource = ((List<BEDocumentLine>)Session["dln1"]);
            gdvdln1.DataBind();
        }

        protected void ListSeries_Callback(object sender, CallbackEventArgsBase e)
        {
            var _spl = e.Parameter.Split(';');
            var obep = new BEParameters()
            {
                ItemCode = _spl[1],
                Socied = _spl[0]
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_SerialNumber(obep);

            ListSeries.DataSource = olst;
            ListSeries.DataBind();
        }
        protected void hdfTemp_CustomCallback(object sender, CallbackEventArgsBase e)
        {
            ((BEParameters)Session["InitPar"]).Currency = e.Parameter.ToString();
        }

        protected void gdvdln1_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {

        }

        protected void gdvdln1_HtmlCommandCellPrepared(object sender, ASPxGridViewTableCommandCellEventArgs e)
        {
            if (e.CommandCellType == GridViewTableCommandCellType.Data)
            {
                var count = ((List<BEDocumentLine>)Session["dln1"]).Count;
                if (count > 0)
                {
                    if (e.KeyValue != null)
                    {
                        var obj = ((List<BEDocumentLine>)Session["dln1"]).Where(_obj => _obj.LineNum == Convert.ToInt32(e.KeyValue)).ElementAt(0);
                        if (!string.IsNullOrWhiteSpace(obj.U_BF_CodKit))
                            e.Cell.Controls[0].Visible = false;
                    }
                }
            }
        }

        protected void gdvAddress_DataBinding(object sender, EventArgs e)
        {
            gdvAddress.DataSource = Session["crd1"];
        }

        protected void gdvAddress_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("INICIAR"))
            {
                var x = e.Parameters.Split(':');
                var olst = new List<BEClientAddress>();
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = x[1],
                };
                var obrd = new BRDocument();
                olst = obrd.Get_OSCSP_CRD1(obj);
                Session["crd1"] = olst;//.Where(item => item.AdresType == "S");
                //gdvAddress.DataSource = olst;
                //gdvAddress.DataBind();
            }
            else if (e.Parameters.Contains("DirecDestino"))
            {
                var x = e.Parameters.Split(':');
                var olst = new List<BEClientAddress>();
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = x[1],
                };
                var obrd = new BRDocument();
                olst = obrd.Get_OSCSP_CRD1(obj);
                Session["crd1"] = olst.Where(item => item.AdresType == "S");
                gdvAddress.DataSource = olst;
                gdvAddress.DataBind();
            }
            else if (e.Parameters.Contains("DirecFactura"))
            {
                var x = e.Parameters.Split(':');
                var olst = new List<BEClientAddress>();
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = x[1],
                };
                var obrd = new BRDocument();
                olst = obrd.Get_OSCSP_CRD1(obj);
                Session["crd1"] = olst.Where(item => item.AdresType == "B");
                gdvAddress.DataSource = olst;
                gdvAddress.DataBind();
            }
        }
        protected void gdvLotes_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GETLOTE"))
            {
                var spl = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = spl[1],
                };
                var obrd = new BRDocument();
                Session["lote"] = obrd.Get_LotesNumber(obj);
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BELotes>)Session["lote"]).Clear();
            }
            //Session["lote"] = olst;
            gdvLotes.DataSource = Session["lote"];
            gdvLotes.DataBind();
        }

        protected void gdvLotes_DataBinding(object sender, EventArgs e)
        {
            gdvLotes.DataSource = Session["lote"];
        }

        protected void gdvLotes_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "Cantidad", false) == 0 ||
                string.Compare(e.Column.FieldName, "Lote", false) == 0 ||
                string.Compare(e.Column.FieldName, "DueDate", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
            if (string.Compare(e.Column.FieldName, "Lote", false) == 0)
            {
                e.Editor.Focus();
            }
        }

        protected void gdvLotes_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            //object fieldValue = gdvdln1.GetRowValues(e.VisibleIndex, "ItemCode");
            //if (e.VisibleIndex >= 0 && !string.IsNullOrWhiteSpace(e.VisibleIndex.ToString()))
            //{
            //    if (!String.IsNullOrWhiteSpace(fieldValue.ToString()))
            //    {
            if (e.ButtonType == ColumnCommandButtonType.Delete)
            {
                e.Enabled = false;
            }
            //    }
            //}
        }

        protected void gdvLotes_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            gdvLotes.DoRowValidation();
            var index = gdvLotes.EditingRowVisibleIndex;
            var fch = Convert.ToString(e.NewValues["DueDate"]).Substring(0, 10).Split('/');
            ((List<BELotes>)Session["lote"])[index].Lote = Convert.ToString(e.NewValues["Lote"]);
            ((List<BELotes>)Session["lote"])[index].Cantidad = Convert.ToDecimal(e.NewValues["Cantidad"]);
            ((List<BELotes>)Session["lote"])[index].DueDate = fch[1] + "/" + fch[0] + "/" + fch[2];

            gdvLotes.CancelEdit();
            e.Cancel = true;
            gdvLotes.DataSource = ((List<BELotes>)Session["lote"]);
            gdvLotes.DataBind();
        }

        protected void gdvLotes_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var x = Convert.ToString(e.NewValues["DueDate"]);
            var line = new BELotes();

            if(x == "")
            {
                line.DueDate = "/";
            }
            else
            {
                var fch = Convert.ToString(e.NewValues["DueDate"]).Substring(0, 10).Split('/');
                line.DueDate = fch[1] + "/" + fch[0] + "/" + fch[2];
            }

            

            
            line.Lote = Convert.ToString(e.NewValues["Lote"]);
            line.Cantidad = Convert.ToDecimal(e.NewValues["Cantidad"]);
            
            ((List<BELotes>)Session["lote"]).Add(line);

            gdvLotes.CancelEdit();
            e.Cancel = true;
            gdvLotes.DataSource = ((List<BELotes>)Session["lote"]);
            gdvLotes.DataBind();
        }
        protected void gdvWhsCodeSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("ALMCN"))
            {
                var splt = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    ParValue = txtParAlmacen.Text.Trim(),
                    ColumnIndex = ((GridViewDataColumn)gdvWhsCodeSearch.GetSortedColumns().ElementAt(0)).VisibleIndex,
                    ItemCode = splt[1],
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_OITW(obj);
                Session["owhs"] = olst;
                gdvWhsCodeSearch.DataSource = olst;
                gdvWhsCodeSearch.DataBind();
            }

        }

        protected void gdvWhsCodeSearch_DataBinding(object sender, EventArgs e)
        {
            gdvWhsCodeSearch.DataSource = Session["owhs"];
        }
        protected void cbbPersonContact_Callback(object sender, CallbackEventArgsBase e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameter.Contains("INICIAR"))
            {
                var x = e.Parameter.Split(':');
                var olst = new List<BEContactLines>();
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = x[1],
                };
                var obrd = new BRDocument();
                olst = obrd.Get_Contact_Person(obj);
                if (olst.Count != 0)
                {
                    olst.ForEach(ite =>
                    {
                        cbbPersonContact.Items.Add(ite.Name, ite.CntctCode);
                    });
                    cbbPersonContact.SelectedIndex = 0;
                }
                else
                {
                    cbbPersonContact.Items.Add("", 0);
                    cbbPersonContact.SelectedIndex = 0;
                }
            }
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            gexData.WriteXlsxToResponse();
        }
    }
}