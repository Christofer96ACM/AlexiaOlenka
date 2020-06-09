using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
using DevExpress.Web.Data;
using System.Drawing;
using DevExpress.Web.ASPxCallback;
using DevExpress.Web.ASPxNavBar;
using System.Data;
using System.ComponentModel;
using System.Globalization;
using System.Threading;

namespace OneCommerce.Sales
{
    public partial class OrdenVenta : Page
    {
        //const bool moneda = false;
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
                    /*if (obec.Permition == "003")
                    {
                        FormsAuthentication.SignOut();
                        FormsAuthentication.RedirectToLoginPage();  
                    }
                    else
                    {
                        if (obec.Project == "DX")
                            obec.WhsCode = "YOB_PT";*/

                    gdvrdr1.Columns[0].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
                    gdvrdr1.Columns[1].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
                    gdvrdr1.Columns[2].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
                    //gdvrdr1.Columns[15].Visible = true;
                    //gdvrdr1.Columns[16].Visible = true;
                    //gdvrdr1.Columns[17].Visible = true;
                    //gdvrdr1.Columns[18].Visible = true;
                    //gdvrdr1.Columns[19].Visible = true;
                    //gdvrdr1.Columns[20].Visible = true;
                    //gdvrdr1.Columns[21].Visible = true;
                    txtU_BF_PickRmrk.Text = User.Identity.Name;
                    Clear_VarSessions();
                    Set_Permissions();
                    var _sd = obec.RAZON_SOCIAL;
                    ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Socied")).InnerText = _sd;
                    ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Local")).InnerText = obec.DscpLocal;
                    ((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "Tipo de Cambio: " + obec.Rate.ToString("c3");
                    //}
                }
                ((BEParameters)Session["InitPar"]).Currency = "CARGADO";


                if (((BEParameters)Session["InitPar"]).Band && ((BEParameters)Session["InitPar"]).Currency != "")
                {

                    //if (hdfTemp.Get("Currency").ToString() == "USD")
                    //{
                    //    CultureInfo culture;
                    //    culture = CultureInfo.CreateSpecificCulture("en-US");
                    //    Thread.CurrentThread.CurrentCulture = culture;
                    //    Thread.CurrentThread.CurrentUICulture = culture;

                    //}
                    //else if (hdfTemp.Get("Currency").ToString() == "EUR")
                    //{
                    //    CultureInfo culture;
                    //    culture = CultureInfo.CreateSpecificCulture("fr-FR");
                    //    Thread.CurrentThread.CurrentCulture = culture;
                    //    Thread.CurrentThread.CurrentUICulture = culture;
                    //}
                    //else
                    //{
                    //    //MONEDA LOCAL
                    //}
                }
                else ((BEParameters)Session["InitPar"]).Band = true;
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
        private void Clear_VarSessions()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obrd = new BRDocument();
            hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
            hdfTemp.Add("_emid", obec.U_BF_EMID);
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("_whsc", obec.WhsCode);
            hdfTemp.Add("_ubig", string.Empty);
            hdfTemp.Add("_movi", "0");
            hdfTemp.Add("_dtbel", "0");
            hdfTemp.Add("_perm", obec.Permition);
            hdfTemp.Add("Rate", obec.Rate);
            //hdfTemp.Add("_cpnadd", obec.CompanyAddress.ToUpper());
            //hdfTemp.Add("_phone", obec.Phone);
            hdfTemp.Add("_client", string.Empty);
            hdfTemp.Add("_brows", Request.Browser.Id);
            hdfTemp.Add("Currency", string.Empty);

            Session["oitm"] = new List<BEProduct>();
            Session["ocrd"] = new List<BEClient>();
            Session["crd1"] = new List<BEClientAddress>();
            Session["medi"] = new List<BEDoctor>();
            Session["ordr"] = new List<BEDocument>();
            Session["rdr1"] = new List<BEDocumentLine>();
            Session["oqut"] = new List<BEDocumentLine>();
            //Session["movi"] = obrd.Get_SCSP_LSPR_MOVI(obec);
            //Session["rega"] = obrd.Get_SCSP_LSRG_BFREGA(obec);
        }
        /// <summary>
        /// ENUMERA LA LINEAS DEL DETALLE
        /// </summary>
        private void Set_LineNum()
        {
            var i = 1;
            ((List<BEDocumentLine>)Session["rdr1"]).ForEach(item =>
            {
                item.LineNum = i;
                i += 1;
            });
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
        /// <summary>
        /// MOVILIDAD BELMAY
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string Get_Movi(string socied, string DocNumBel)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                DocEntry = Convert.ToInt32(DocNumBel)
            };
            var obrd = new BRDocument();
            var movi = obrd.Get_OSCSP_MVBM(obep);
            return (movi);
        }
        /// <summary>
        /// LISTA DEPARTAMENTO,PROVINCIA,DISTRITO
        /// </summary>
        /// <param name="socied"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEInitialData> Get_Dat_prov(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_SP_LIST_DIST(obep);
            return (olst);
        }
        /// <summary>
        /// LISTA SOLO DISTRITO
        /// </summary>
        /// <param name="socied"></param>
        /// <param name="prov"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEInitialData> Get_InitialDistri(string socied, string prov)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                Prov = prov
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_SP_LIST_DIST_PROV(obep);
            return (olst);
        }
        /// <summary>
        /// LISTA UN PRODUCTO
        /// </summary>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEProduct> Get_OneProduct(string socied, string project, string whscode, string cardcode, string pricelist, string itemcode)
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
                Kit = false,
                //Moneda = cbb
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_OITM(obep);
            return (olst);
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
        ///  LISTA LAS DIRECCIONES DEL CLIENTE SELECCIONADO
        /// </summary>
        /// <returns></returns>
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
        protected void gdvAddress_DataBinding(object sender, EventArgs e)
        {
            gdvAddress.DataSource = Session["crd1"];
        }
        /// <summary>
        ///  LISTA LAS DIRECCIONES DEL CLIENTE SELECCIONADO
        /// </summary>
        /// <returns></returns>
        protected void gdvDoctor_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var olst = new List<BEDoctor>();
            var medi = e.Parameters.Split('!');
            if (medi.Count() > 0)
            {
                medi.ToList()
                    .ForEach(item =>
                    {
                        var _med = item.Split('?');
                        if (_med.Count() > 0)
                        {
                            var obj = new BEDoctor();
                            obj.U_BIZ_MEDI = _med[0];
                            obj.U_BIZ_COLE = _med[1];
                            obj.U_BIZ_ESPE = _med[2];
                            obj.U_BIZ_DIRE_MED = _med[3];
                            if (!string.IsNullOrWhiteSpace(obj.U_BIZ_COLE))
                                olst.Add(obj);
                        }
                    });
            }
            Session["medi"] = olst;
            gdvDoctor.DataSource = olst;
            gdvDoctor.DataBind();
        }
        protected void gdvDoctor_DataBinding(object sender, EventArgs e)
        {
            gdvDoctor.DataSource = Session["medi"];
        }
        /// <summary>
        /// ARTICULOS
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void gdvrdr1_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            gdvrdr1.Columns[0].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
            gdvrdr1.Columns[1].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
            gdvrdr1.Columns[2].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
            var x = "";
            if (e.VisibleIndex >= 0)
            {
                x = gdvrdr1.GetRowValues(e.VisibleIndex, "TreeType").ToString();
            }
            if ((string.Compare(e.Column.FieldName, "ItemCode", false) == 0 ||
                string.Compare(e.Column.FieldName, "Quantity", false) == 0 ||
                string.Compare(e.Column.FieldName, "DiscPrcnt", false) == 0 ||
                string.Compare(e.Column.FieldName, "PriceBefDi", false) == 0) && x != "I")
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

            gdvrdr1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["rdr1"]).Sum(item => Math.Round(item.LineTotal, 2));
            //gdvrdr1.JSProperties["cpImpuesto"] = Convert.ToDouble(gdvrdr1.JSProperties["cpSubTotal"].ToString()) * 0.18;
        }
        protected void gdvrdr1_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            var beNe = new BRDocument();
            gdvrdr1.DoRowValidation();
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
                Quantity = Convert.ToInt32(e.NewValues["Quantity"]),
                PriceBefDi = Convert.ToDecimal(e.NewValues["PriceBefDi"]),
                DiscPrcnt = Convert.ToDecimal(e.NewValues["DiscPrcnt"]),
                Price = Convert.ToDecimal(e.NewValues["Price"]),
                LineTotal = Convert.ToDecimal(e.NewValues["LineTotal"]),
                GTotal = Convert.ToDecimal(e.NewValues["GTotal"]),
                WhsCode = almacen,
                IssueMthd = Convert.ToString(e.NewValues["IssueMthd"]),
                TreeType = "N",
                //U_StoDiBE = Convert.ToDecimal(e.NewValues["U_StoDiBE"]),
                //U_BF_StoDiYo = Convert.ToDecimal(e.NewValues["U_BF_StoDiYo"]),
                //BL050 = Convert.ToDecimal(e.NewValues["BL050"]),
                //BL010 = Convert.ToDecimal(e.NewValues["BL010"]),
                //U_U_BF_CompTot = Convert.ToDecimal(e.NewValues["U_U_BF_CompTot"]),
                //U_BIZ_DREC = Convert.ToString(e.NewValues["U_BIZ_DREC"]),
                //U_BIZ_FFAR = Convert.ToString(e.NewValues["U_BIZ_FFAR"]),
                //U_BIZ_CANT = Convert.ToDecimal(e.NewValues["U_BIZ_CANT"]),
                //U_BF_FECH_EXPE = DateTime.Today.ToShortDateString(),
                //U_BF_FECH_VENC = DateTime.Today.AddDays(90).ToShortDateString(),
                //U_BF_CodKit = string.Empty,
                //OItemCode = Convert.ToString(e.NewValues["OItemCode"]),
                //OnDscOrg = Convert.ToDecimal(e.NewValues["OnDscOrg"])        
            };

            line.InDscOrg = (line.OnDscOrg == 0) ? 1 : 0;
            ((List<BEDocumentLine>)Session["rdr1"]).Add(line);
            //Set_Promotion();
            Set_LineNum();

            gdvrdr1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["rdr1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvrdr1.CancelEdit();
            e.Cancel = true;
            gdvrdr1.DataSource = ((List<BEDocumentLine>)Session["rdr1"]);
            gdvrdr1.DataBind();
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
        protected void gdvrdr1_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            gdvrdr1.DoRowValidation();
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gdvrdr1.EditingRowVisibleIndex;
            ((List<BEDocumentLine>)Session["rdr1"])[index].ItemCode = Convert.ToString(e.NewValues["ItemCode"]);
            ((List<BEDocumentLine>)Session["rdr1"])[index].ItemName = Convert.ToString(e.NewValues["ItemName"]);
            ((List<BEDocumentLine>)Session["rdr1"])[index].Quantity = Convert.ToInt32(e.NewValues["Quantity"]);
            ((List<BEDocumentLine>)Session["rdr1"])[index].PriceBefDi = Convert.ToDecimal(e.NewValues["PriceBefDi"]);
            ((List<BEDocumentLine>)Session["rdr1"])[index].DiscPrcnt = Convert.ToDecimal(e.NewValues["DiscPrcnt"]);
            ((List<BEDocumentLine>)Session["rdr1"])[index].Price = Convert.ToDecimal(e.NewValues["Price"]);
            ((List<BEDocumentLine>)Session["rdr1"])[index].LineTotal = Convert.ToDecimal(e.NewValues["LineTotal"]);
            ((List<BEDocumentLine>)Session["rdr1"])[index].GTotal = Convert.ToDecimal(e.NewValues["GTotal"]);
            ((List<BEDocumentLine>)Session["rdr1"])[index].WhsCode = obec.WhsCode;
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_StoDiBE = Convert.ToDecimal(e.NewValues["U_StoDiBE"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_BF_StoDiYo = Convert.ToDecimal(e.NewValues["U_BF_StoDiYo"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].BL050 = Convert.ToDecimal(e.NewValues["BL050"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].BL010 = Convert.ToDecimal(e.NewValues["BL010"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_U_BF_CompTot = Convert.ToDecimal(e.NewValues["U_U_BF_CompTot"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_BIZ_DREC = Convert.ToString(e.NewValues["U_BIZ_DREC"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_BIZ_FFAR = Convert.ToString(e.NewValues["U_BIZ_FFAR"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_BIZ_CANT = Convert.ToDecimal(e.NewValues["U_BIZ_CANT"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_BF_FECH_EXPE = DateTime.Today.ToShortDateString();
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_BF_FECH_VENC = DateTime.Today.AddDays(90).ToShortDateString();
            //((List<BEDocumentLine>)Session["rdr1"])[index].U_BF_CodKit = string.Empty;
            //((List<BEDocumentLine>)Session["rdr1"])[index].OItemCode = Convert.ToString(e.NewValues["OItemCode"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].OnDscOrg = Convert.ToDecimal(e.NewValues["OnDscOrg"]);
            //((List<BEDocumentLine>)Session["rdr1"])[index].InDscOrg = (Convert.ToDecimal(e.NewValues["OnDscOrg"]) == 0) ? 1 : 0;
            //Set_Promotion();
            Set_LineNum();

            gdvrdr1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["rdr1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvrdr1.CancelEdit();
            e.Cancel = true;
            gdvrdr1.DataSource = ((List<BEDocumentLine>)Session["rdr1"]);
            gdvrdr1.DataBind();
        }
        protected void gdvrdr1_RowValidating(object sender, ASPxDataValidationEventArgs e)
        {
            //var items = new List<string>();
            //((List<BEDocumentLine>)Session["rdr1"]).Where(item => string.IsNullOrWhiteSpace(item.U_BF_CodKit) && item.InGift == 0)
            //                                       .ToList()
            //                                       .ForEach(item =>
            //                                       {
            //                                           items.Add(item.ItemCode);
            //                                       });
            //if (e.IsNewRow)
            //    items.Add(Convert.ToString(e.NewValues["ItemCode"]));
            //var exprd = items.Where(item => item == Convert.ToString(e.NewValues["ItemCode"])).Count();

            if (string.IsNullOrWhiteSpace(Convert.ToString(e.NewValues["ItemName"])))
            {
                e.RowError = BSMessage.MsEmptyItemCode;
            }
            else if (Convert.ToInt32(e.NewValues["Quantity"]) == 0)
            {
                e.RowError = BSMessage.MsExQuantityZero;
            }
            //else if (exprd > 1)
            //{
            //    e.RowError = BSMessage.MsExistItemCode;
            //}
            else if (Convert.ToString(e.NewValues["ItemCode"]).ToUpper().Trim() != Convert.ToString(e.NewValues["ItemCode"]).ToUpper().Trim())
            {
                e.RowError = BSMessage.MsDiferItemCode;
            }
        }
        protected void gdvrdr1_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gdvrdr1.FindVisibleIndexByKeyValue(e.Keys[gdvrdr1.KeyFieldName]);
            var _lnm = (i + 1);
            var father = "";
            ((List<BEDocumentLine>)Session["rdr1"]).Where(item => item.LineNum == _lnm).ToList().ForEach(x => {
                father = x.Father;
            });
            ((List<BEDocumentLine>)Session["rdr1"]).RemoveAll(item => item.Father == father);
            Set_LineNum();

            gdvrdr1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["rdr1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvrdr1.DataSource = ((List<BEDocumentLine>)Session["rdr1"]);
            gdvrdr1.DataBind();
        }
        protected void gdvrdr1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("CLR"))
            {
                ((List<BEDocumentLine>)Session["rdr1"]).Clear();
            }
            else if (e.Parameters.Contains("SRCH"))
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocEntry = Convert.ToInt32(txtDocEntry.Text)
                };
                var obrd = new BRDocument();
                //Session["rdr1"] = obrd.Get_OSCSP_SRCH_RDR1(obep);

                var list = obrd.Get_OSCSP_SRCH_RDR1(obep);
                list.ForEach(item => {
                    if (item.TreeType == "S")
                    {
                        item.Father = item.ItemCode;
                        for (var i = item.LineNum; i < list.Count && list[i].TreeType == "I"; i++)
                        {
                            list[i].Father = item.ItemCode;
                        }
                    }
                    else if (item.TreeType == "N")
                    {
                        item.Father = item.ItemCode;
                    }
                });
                Session["rdr1"] = list;
            }
            else if (e.Parameters.Contains("UPDTPRICE"))
            {
                var _spl = e.Parameters.Split(':');
                ((List<BEDocumentLine>)Session["rdr1"]).Where(i => (i.TreeType == "N" && i.Father == _spl[5]))
                    .ToList().ForEach(item =>
                    {
                        item.PriceBefDi = Convert.ToDecimal(_spl[1]);
                        item.Price = Convert.ToDecimal(_spl[2]);
                        item.LineTotal = Convert.ToDecimal(_spl[3]);
                        item.GTotal = Convert.ToDecimal(_spl[4]);
                        item.Quantity = Convert.ToInt32(_spl[6]);
                    });
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
                            Kit = false,
                            Moneda = cbbDocCur.Value.ToString(),
                            DateIn = Convert.ToDateTime(dteDocDate.Text),
                            Descripcion = txtDescription.Text,
                            SerieMaqr = txtMarca.Text
                        };
                        var olst = obrd.Get_OSCSP_OITM(obep);

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
                            line.IssueMthd = padre[8];
                            line.WhsCode = obec.WhsCode;
                            line.TreeType = "S";
                            line.Father = padre[0];
                            line.NumInSale = Convert.ToInt32(padre[7]);
                            line.ActivoC = padre[9];
                            line.ActivoS = padre[10];
                            band = false;
                            suprimir = item.SUPRIMIR_MATERIALES;
                            ((List<BEDocumentLine>)Session["rdr1"]).Add(line);
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
                            line2.ActivoC = a.ActivoC;
                            line2.ActivoS = a.ActivoS;

                            ((List<BEDocumentLine>)Session["rdr1"]).Add(line2);
                            Set_LineNum();
                        });
                    });
                    if (suprimir == "N")
                    {
                        ((List<BEDocumentLine>)Session["rdr1"]).Where(i => (i.TreeType == "S" && i.Father == padre[0])).ToList().ForEach(x =>
                        {
                            x.PriceBefDi = Convert.ToDecimal(0.00);
                            x.Price = Convert.ToDecimal(0.00);
                            x.LineTotal = Convert.ToDecimal(0.00);
                            x.GTotal = Convert.ToDecimal(0.00);
                        });
                    }
                    else if (suprimir == "Y")
                    {
                        ((List<BEDocumentLine>)Session["rdr1"]).Where(i => (i.TreeType == "I" && i.Father == padre[0])).ToList().ForEach(x =>
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
                    //return;
                    var line = new BEDocumentLine();

                    line.ItemCode = padre[0];
                    line.ItemName = padre[1];
                    line.PriceBefDi = Convert.ToDecimal(padre[3]);
                    line.Quantity = 1;
                    line.DiscPrcnt = Convert.ToDecimal(padre[4]);
                    line.Price = Convert.ToDecimal(padre[5]);
                    line.LineTotal = Convert.ToDecimal(padre[5]);
                    line.GTotal = Convert.ToDecimal(padre[6]);
                    line.IssueMthd = padre[8];
                    line.WhsCode = obec.WhsCode;
                    line.TreeType = "N";
                    line.Father = padre[0];
                    line.NumInSale = Convert.ToInt32(padre[7]);
                    line.ActivoC = padre[9];
                    line.ActivoS = padre[10];
                    band = false;
                    //suprimir = item.SUPRIMIR_MATERIALES;
                    ((List<BEDocumentLine>)Session["rdr1"]).Add(line);
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
                    ItemCode = _spl[1],
                    Moneda = cbbDocCur.Value.ToString(),
                    DateIn = Convert.ToDateTime(dteDocDate.Text),
                    Descripcion = txtDescription.Text,
                    SerieMaqr = txtMarca.Text
                };
                var articulo = obrd.Get_OSCSP_OITM(obep);
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
                        line.ActivoC = item.ActivoC;
                        line.ActivoS = item.ActivoS;

                        ((List<BEDocumentLine>)Session["rdr1"]).Add(line);
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
                        line.ActivoC = i.ActivoC;
                        line.ActivoS = i.ActivoS;

                        ((List<BEDocumentLine>)Session["rdr1"]).Add(line);
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
                                Kit = false,
                                Moneda = cbbDocCur.Value.ToString(),
                                DateIn = Convert.ToDateTime(dteDocDate.Text),
                                Descripcion = txtDescription.Text,
                                SerieMaqr = txtMarca.Text
                            };

                            var articulosdelista = obrd.Get_OSCSP_OITM(obep);
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
                                line2.ActivoC = a.ActivoC;
                                line2.ActivoS = a.ActivoS;

                                ((List<BEDocumentLine>)Session["rdr1"]).Add(line2);
                                Set_LineNum();
                            });
                        });
                        if (suprimir == "N")
                        {
                            ((List<BEDocumentLine>)Session["rdr1"]).Where(a => (a.TreeType == "S" && a.Father == i.ItemCode)).ToList().ForEach(x =>
                            {
                                x.PriceBefDi = Convert.ToDecimal(0.00);
                                x.Price = Convert.ToDecimal(0.00);
                                x.LineTotal = Convert.ToDecimal(0.00);
                                x.GTotal = Convert.ToDecimal(0.00);
                            });
                        }
                        else if (suprimir == "Y")
                        {
                            ((List<BEDocumentLine>)Session["rdr1"]).Where(a => (a.TreeType == "I" && a.Father == i.ItemCode)).ToList().ForEach(x =>
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
            else if (e.Parameters.Contains("OQUT"))
            {
                var _spl = e.Parameters.Split(';');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocEntry = Convert.ToInt32(_spl[1])
                };
                var obrd = new BRDocument();
                //Session["rdr1"] = obrd.Get_OSCSP_SRCH_QUT1(obep);

                var list = obrd.Get_OSCSP_SRCH_QUT1(obep);
                list.ForEach(item => {
                    if (item.TreeType == "S")
                    {
                        item.Father = item.ItemCode;
                        for (var i = item.LineNum; i < list.Count && list[i].TreeType == "I"; i++)
                        {
                            list[i].Father = item.ItemCode;
                        }
                    }
                    else if (item.TreeType == "N")
                    {
                        item.Father = item.ItemCode;
                    }
                });
                Session["rdr1"] = list;
                Set_LineNum();
            }
            else if (e.Parameters.Contains("QTY"))
            {
                var _spl = e.Parameters.Split(':');
                var band = true;
                ((List<BEDocumentLine>)Session["rdr1"]).Where(i => ((i.TreeType == "I" || i.TreeType == "S" || i.TreeType == "N") && i.Father == _spl[2]))
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
                //var list2 = ((List<BEDocumentLine>)Session["rdr1"]).Where(i => !(i.TreeType == "I" || i.TreeType == "S")).ToList();
                //((List<BEDocumentLine>)Session["rdr1"])/*.Where(i => (i.TreeType == "I" || i.TreeType == "S")&& i.Father==_spl[2]).ToList()*/.ForEach(item =>
                //{
                //    if (string.IsNullOrWhiteSpace(item.Father))
                //    {
                //        return;
                //    }
                //    else
                //    {
                //        item.Quantity = item.Quantity * Convert.ToInt32(_spl[1]);
                //        item.LineTotal = item.Quantity * item.Price;
                //        item.GTotal = item.LineTotal * Convert.ToDecimal(1.18);
                //    }
                //});
            }

            gdvrdr1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["rdr1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvrdr1.CancelEdit();
            gdvrdr1.DataSource = ((List<BEDocumentLine>)Session["rdr1"]);
            gdvrdr1.DataBind();
        }
        protected string getAlmacen(String itemCode)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            /*var beNe = new BRDocument();
            string almacen = "";
            if (obec.Socied == "BM")
            {
                if (beNe.getStockAlmacen(Convert.ToString(itemCode)) <= 0)
                    almacen = "BL010";
                else
                    almacen = "BL008";
            }
            if (obec.Socied == "BT")
                 almacen = "YOB_PT";*/
            return obec.WhsCode;
        }
        protected void gdvrdr1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            var obec = ((BEParameters)Session["InitPar"]);
            object fieldValue = gdvrdr1.GetRowValues(e.VisibleIndex, "TreeType");
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
            if (e.VisibleIndex >= 0)
            {
                if (fieldValue.ToString() == "I")
                {
                    if (e.ButtonType == ColumnCommandButtonType.Delete)
                    {
                        e.Enabled = false;
                    }
                }
            }
        }
        protected void gdvrdr1_HtmlCommandCellPrepared(object sender, ASPxGridViewTableCommandCellEventArgs e)
        {
            if (e.CommandCellType == GridViewTableCommandCellType.Data)
            {
                var count = ((List<BEDocumentLine>)Session["rdr1"]).Count;
                if (count > 0)
                {
                    if (e.KeyValue != null)
                    {
                        var obj = ((List<BEDocumentLine>)Session["rdr1"]).Where(_obj => _obj.LineNum == Convert.ToInt32(e.KeyValue)).ElementAt(0);
                        if (!string.IsNullOrWhiteSpace(obj.U_BF_CodKit))
                            e.Cell.Controls[0].Visible = false;
                    }
                }
            }
        }
        protected void gdvrdr1_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            //var U_BF_CodKit = Convert.ToString(e.GetValue("U_BF_CodKit"));
            //if (!string.IsNullOrWhiteSpace(U_BF_CodKit))
            //    e.Row.BackColor = Color.Lavender;

            var lnum = Convert.ToInt32(e.GetValue("LineNum"));
            var igf = ((List<BEDocumentLine>)Session["rdr1"]).Where(item => item.LineNum == lnum).FirstOrDefault();
            //if (igf.InGift == 1)
            //    e.Row.BackColor = Color.LemonChiffon;
        }
        protected void gdvrdr1_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            //var ubig = hdfTemp.Get("_ubig").ToString();
            var dtbel = Convert.ToDecimal(hdfTemp.Get("_dtbel"));
            //var _yesm = Get_CalcMovility(ubig, dtbel);
            //gdvrdr1.JSProperties.Add("cpMovi", _yesm);
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
                Kit = chkKit.Checked,
                Moneda = cbbDocCur.Value.ToString(),
                DateIn = Convert.ToDateTime(dteDocDate.Text),
                Descripcion = txtDescription.Text,
                SerieMaqr = txtMarca.Text
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
        private string Get_CalcMovility(string ubig, decimal dtbel)
        {
            var obj = new BEDocument();
            //obj.U_BIZ_LUEN = cbbU_BIZ_LUEN.Value.ToString();
            obj.U_BIZ_CODI = ubig;
            obj.DocDueDate = dteDocDueDate.Date;
            obj.DocTotal = ((List<BEDocumentLine>)Session["rdr1"]).Sum(item => item.GTotal) + dtbel;

            var _val = "N";
            var _err = BSSalesOrder.Get_Mobility(obj, ((List<BEParMovility>)Session["movi"]));
            if (_err)
                _val = "S";

            return (_val);
        }
        private string Save()
        {
            var _err = string.Empty;
            if (!string.IsNullOrWhiteSpace(txtDocEntry.Text))
                _err = BSMessage.MsNotEmptyDocEntry;
            if (((List<BEDocumentLine>)Session["rdr1"]).Count == 0)
                _err = BSMessage.MsExLinesCount;
            //if (cbeOwnerCode.Value == null)
            //    _err = BSMessage.MsExLinesCount;

            if (string.IsNullOrWhiteSpace(_err))
            {
                var obec = ((BEParameters)Session["InitPar"]);
                var obj = new BEDocument();
                obj.Socied = obec.Socied;
                obj.CardCode = txtCardCode.Text;
                obj.CardName = bteCardName.Text.Trim();
                obj.DocDate = Convert.ToDateTime(dteDocDate.Text);
                obj.DocDueDate = Convert.ToDateTime(dteDocDueDate.Text);
                obj.NumAtCard = txtNumAtCard.Text;
                obj.Currency = cbbDocCur.Value.ToString();
                obj.ShipToCode = txtShipToCode.Text;
                obj.PayToCode = txtBillToCode.Text;
                obj.SlpCode = Convert.ToInt16(cbeSalesPerson.Value);
                obj.OwnerCode = Convert.ToInt32(cbeOwnerCode.Value);
                obj.GroupNum = Convert.ToInt16(cbbGroupNum.Value);
                obj.DiscPrcntTotal = Convert.ToDecimal(txtDiscPrcntTotal.Value);
                //obj.TotalExpns = Convert.ToDecimal(txtTotalExpns.Value);
                obj.Comments = mmoComment.Text;
                obj.Project = ((BEParameters)Session["InitPar"]).Project;
                obj.CntctCode = Convert.ToInt32(cbbPersonContact.Value.ToString());

                obj.Lines = ((List<BEDocumentLine>)Session["rdr1"]);
                using (var obrd = new BRDocument())
                {
                    obrd.SaveOrderSale(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
                }
                _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKOS#{0}#{1}", obj.DocEntry, obj.DocNum);
            }
            return (_err);
        }
        private string Modify()
        {
            var _err = string.Empty;
            if (((List<BEDocumentLine>)Session["rdr1"]).Count == 0)
                _err = BSMessage.MsExLinesCount;
            //if (cbeOwnerCode.Value == null)
            //    _err = BSMessage.MsExLinesCount;

            if (string.IsNullOrWhiteSpace(_err))
            {
                var obec = ((BEParameters)Session["InitPar"]);
                var obj = new BEDocument();
                obj.Socied = obec.Socied;
                obj.DocEntry = Convert.ToInt32(txtDocEntry.Text);
                obj.DocNum = Convert.ToInt32(txtDocNum.Text);
                obj.CardCode = txtCardCode.Text;
                obj.CardName = bteCardName.Text.Trim();
                obj.DocDate = Convert.ToDateTime(dteDocDate.Text);
                obj.DocDueDate = Convert.ToDateTime(dteDocDueDate.Text);
                obj.NumAtCard = txtNumAtCard.Text;
                obj.Currency = cbbDocCur.Value.ToString();
                obj.ShipToCode = txtShipToCode.Text;
                obj.PayToCode = txtBillToCode.Text;
                obj.SlpCode = Convert.ToInt16(cbeSalesPerson.Value);
                obj.OwnerCode = Convert.ToInt32(cbeOwnerCode.Value);
                obj.GroupNum = Convert.ToInt16(cbbGroupNum.Value);
                obj.DiscPrcntTotal = Convert.ToDecimal(txtDiscPrcntTotal.Value);
                //obj.TotalExpns = Convert.ToDecimal(txtTotalExpns.Value);
                obj.Comments = mmoComment.Text;
                obj.Currency = cbbDocCur.Value.ToString();
                obj.CntctCode = Convert.ToInt32(cbbPersonContact.Value.ToString());

                obj.Lines = ((List<BEDocumentLine>)Session["rdr1"]);
                var param = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocNum = obj.DocNum,
                    CardCode = obj.CardCode,
                    ObjType = 17,
                };
                using (var obrd = new BRDocument())
                {
                    obj.DocEntryBorrador = obrd.DXP_GETO_BORRADOR_OV(param);
                    obrd.ModifyOrderSale(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
                }
                _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKOM#{0}#{1}", obj.DocEntry, obj.DocNum);
            }
            return (_err);
        }
        private string Cancel()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEDocument();
            obj.Socied = obec.Socied;
            obj.DocEntry = Convert.ToInt32(txtDocEntry.Text);
            using (var obrd = new BRDocument())
            {
                obrd.CancelOrderSale(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKOC";
            return (_err);
        }
        private string Imprimir()
        {
            var obec = ((BEParameters)Session["InitPar"]);

            var obj = new BEDocument();
            obj.DocEntry = Convert.ToInt32(txtDocEntry.Value);
            obj.DocNum = Convert.ToInt32(txtDocNum.Value);
            obj.CardCode = txtCardCode.Text;
            //obj.LicTradNum = bteLicTradNum.Text.Trim();
            obj.NumAtCard = txtNumAtCard.Text;
            obj.formatoImpresion = "FORMATOORDENVENTA";

            Session["print"] = obj;
            return ("OKAPRINT");
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
                    e.Result = Modify();
                }
                else if (string.Compare(e.Parameter, "Print", false) == 0)
                {
                    e.Result = Imprimir();
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
        /// <summary>
        ///  LISTA LAS ORDENES DE VENTA
        /// </summary>
        /// <returns></returns>
        protected void gdvOrdrSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                DateIn = string.IsNullOrWhiteSpace(dteDateIn.Text) ? null : (DateTime?)dteDateIn.Value,
                DateFi = string.IsNullOrWhiteSpace(dteDateFi.Text) ? null : (DateTime?)dteDateFi.Value,
                NumAtCard = txtDocNums.Text,
                CardCode = txtsCardCode.Text,
                CardName = txtsCardName.Text,
                Id_Dire = txtdirec.Text,
                Project = obec.Project
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_ORDR(obj);
            Session["ordr"] = olst;
            gdvOrdrSearch.DataSource = olst;
            gdvOrdrSearch.DataBind();
        }
        protected void gdvOrdrSearch_DataBinding(object sender, EventArgs e)
        {
            gdvOrdrSearch.DataSource = Session["ordr"];
        }
        /// <summary>
        ///  LISTA LAS OFERTAS DE VENTA
        /// </summary>
        /// <returns></returns>
        protected void gdvOqutSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GET"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = txtCardCode.Text,
                    DateIn = (DateTime?)dtequDateIn.Value,
                    DateFi = (DateTime?)dtequDateFi.Value,
                    NumAtCard = txtquDocNum.Text.Trim()
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_SRCH_OQUT(obj);
            
                Session["oqut"] = olst;
                gdvOqutSearch.DataSource = olst;
                gdvOqutSearch.DataBind();
            }
            else if(e.Parameters.Contains("INIT"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = txtCardCode.Text,
                    DateIn = DateTime.Parse("01-01-2000"),
                    DateFi = DateTime.Today,
                    NumAtCard = txtquDocNum.Text.Trim()
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_SRCH_OQUT(obj);

                Session["oqut"] = olst;
                gdvOqutSearch.DataSource = olst;
                gdvOqutSearch.DataBind();
            }
        }
        protected void gdvOqutSearch_DataBinding(object sender, EventArgs e)
        {
            gdvOqutSearch.DataSource = Session["oqut"];
        }
        /// <summary>
        /// CALCULANDO EL TOTAL DEL PEDIDO PARA LOS REGALOS
        /// </summary>
        /// <returns></returns>
        private decimal Get_Total()
        {
            decimal doct = 0;
            if (!string.IsNullOrWhiteSpace(txtCardCode.Text))
            {
                var ldtl = ((List<BEDocumentLine>)Session["rdr1"]);
                decimal subt = ldtl.Where(item => item.InGift == 0).Sum(item => Math.Round(item.LineTotal, 2));
                var dsc = Convert.ToDecimal(txtDiscPrcntTotal.Value);
                var tdsc = Math.Round(((subt * dsc) / 100), 2);
                var mmov = Convert.ToDecimal(hdfTemp["_movi"]);
                var subr = (subt - tdsc) + mmov;
                var igv = Math.Round(((subr * 18) / 100), 2);
                doct = subr + igv;
            }
            return (doct);
        }
        /// <summary>
        /// AGREGAR LAS PROMOCIONES VIGENTES
        /// </summary>
        private void Set_Promotion()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (chkPromotion.Checked)
            {
                //! AGREGANDO DESCUENTOS POR MONTO
                var ldtl = ((List<BEDocumentLine>)Session["rdr1"]);
                decimal total = ldtl.Where(item => item.InGift == 0 && item.InDscOrg == 1 &&
                                                   string.IsNullOrWhiteSpace(item.U_BF_CodKit))
                                    .Sum(item => item.Quantity * Math.Round((item.PriceBefDi * Convert.ToDecimal(1.18)), 2));
                var dsct = BSSalesOrder.Get_Discount(Math.Round(total, 2), obec.Socied);

                ((List<BEDocumentLine>)Session["rdr1"]).Where(item => item.InGift == 0 && item.InDscOrg == 1 &&
                                                                      string.IsNullOrWhiteSpace(item.U_BF_CodKit))
                                                       .ToList()
                                                       .ForEach(item =>
                                                       {
                                                           item.DiscPrcnt = dsct;
                                                           var price = Math.Round((item.PriceBefDi - ((item.PriceBefDi * dsct) / 100)), 6);
                                                           item.Price = price;
                                                           item.LineTotal = (item.Quantity * item.Price);
                                                           item.GTotal = (item.LineTotal * Convert.ToDecimal(1.18));
                                                       });

                //! AGREGANDO REGALOS POR MONTO
                ((List<BEDocumentLine>)Session["rdr1"]).RemoveAll(item => item.InGift == 1);
                var lprg = (List<BEProduct>)Session["rega"];
                var treg = Get_Total();
                var lreg = BSSalesOrder.Get_Present(treg, lprg);
                lreg.Where(item => item.U_BF_DEFA == 1)
                    .ToList()
                    .ForEach(item =>
                {
                    var obj = new BEDocumentLine();
                    obj.ItemCode = item.ItemCode;
                    obj.ItemName = item.ItemName;
                    obj.Quantity = item.Quantity;
                    obj.PriceBefDi = item.PriceBefDi;
                    obj.DiscPrcnt = item.DiscPrcnt;
                    obj.Price = item.Price;
                    obj.WhsCode = obec.WhsCode;
                    obj.LineTotal = 0;
                    obj.GTotal = 0;
                    obj.U_StoDiBE = item.U_StoDiBE;
                    obj.U_BF_StoDiYo = item.U_BF_StoDiYo;
                    obj.BL050 = item.BL050;
                    obj.BL010 = item.BL010;
                    obj.U_U_BF_CompTot = item.U_U_BF_CompTot;
                    obj.U_BIZ_DREC = item.U_BIZ_DREC;
                    obj.U_BIZ_FFAR = string.Empty;
                    obj.U_BIZ_CANT = 0;
                    obj.U_BF_FECH_EXPE = DateTime.Today.ToShortDateString();
                    obj.U_BF_FECH_VENC = DateTime.Today.AddDays(90).ToShortDateString();
                    obj.U_BF_CodKit = string.Empty;
                    obj.InGift = 1;
                    obj.OItemCode = item.ItemCode;
                    obj.OnDscOrg = item.DiscPrcnt;

                    ((List<BEDocumentLine>)Session["rdr1"]).Add(obj);
                });
            }
        }
        protected void cbbDocCur_Callback(object sender, CallbackEventArgsBase e)
        {
            CultureInfo culture;
            culture = CultureInfo.CreateSpecificCulture("en-US");
            Thread.CurrentThread.CurrentCulture = culture;
            Thread.CurrentThread.CurrentUICulture = culture;
        }

        protected void hdfTemp_CustomCallback(object sender, CallbackEventArgsBase e)
        {
            ((BEParameters)Session["InitPar"]).Currency = e.Parameter.ToString();
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
    }
}