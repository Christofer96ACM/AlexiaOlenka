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
    public partial class Client : Page
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
            Session["cnoi"] = null;
            Session["inv1"] = new List<BEDocumentLine>();
            Session["inv2"] = new List<BEDocumentLine>();
            Session["ocrd"] = new List<BEClient>();
            Session["oitm"] = new List<BEProduct>();
            Session["oinv"] = new List<BEDocument>();
            Session["bord"] = new List<BEDocumentLine>();
            Session["crd1"] = new List<BEContactLines>();
            Session["dire"] = new List<BEClientAddress>();
            Session["drcn"] = new List<BEClientAddress>();
            hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
            hdfTemp.Add("_emid", obec.U_BF_EMID);
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("_proj", obec.Project);
            hdfTemp.Add("_whsc", obec.WhsCode);
            hdfTemp.Add("_cpnadd", obec.CompanyAddress.ToUpper());
            //hdfTemp.Add("_phone", obec.Phone);
            //hdfTemp.Add("_SerieM", obec.SerieMaqr);
        }
        //!+ RUTINAS AJAX
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEBusinessPartner> GET_CLIENTES_GENERAL_CS(string socied, string cardcode, int accion)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                CardCode = cardcode,
                accion = accion
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_CLIENTES_GENERAL(obep);
            return (olst);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEContactLines> GET_CLIENTES_CONTACTOS_CS(string socied, string cardcode, int accion)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                CardCode = cardcode,
                accion = accion
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_CLIENTES_CONTACTOS(obep);
            return (olst);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEClientAddress> GET_CLIENTES_DIRECCIONES_CS(string socied, string cardcode, int accion)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                CardCode = cardcode,
                accion = accion
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_CLIENTES_DIRECCIONES(obep);
            ListaDirecciones = olst;
            return (olst);
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
            var olst = obrd.Get_OSCSP_OITM(obep);
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
        /// <summary>
        ///  LISTA LOS CLIENTES
        /// </summary>
        /// <returns></returns>
        protected void gdvClientSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("SRCH"))
            {
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
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEClient>)Session["ocrd"]).Clear();
                gdvClientSearch.DataSource = Session["ocrd"];
                gdvClientSearch.DataBind();
            }
            
        }
        protected void gdvClientSearch_DataBinding(object sender, EventArgs e)
        {
            gdvClientSearch.DataSource = Session["ocrd"];
        }
        /// <summary>
        ///  LISTA LOS PRODUCTOS
        /// </summary>
        /// <returns></returns>


        protected void gvcontacto_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "FirstName", false) == 0 ||
                string.Compare(e.Column.FieldName, "LastName", false) == 0 ||
                string.Compare(e.Column.FieldName, "Cellolar", false) == 0||
                string.Compare(e.Column.FieldName, "E_MailL", false) == 0||
                string.Compare(e.Column.FieldName, "Active", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
        }

        protected void gvcontacto_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            if (!string.IsNullOrWhiteSpace(txtCrCardCode.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New || e.ButtonType == ColumnCommandButtonType.Delete
                    || e.ButtonType == ColumnCommandButtonType.Edit)
                    e.Enabled = true;
            }
        }
        //PARA ELIMINAR DE LA TABLA CONTACTOS Y LIST DIRECCIONES
        /*protected void gdvinv1_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gdvinv1.FindVisibleIndexByKeyValue(e.Keys[gdvinv1.KeyFieldName]);
            var _lnm = (i + 1);
            ((List<BEDocumentLine>)Session["inv1"]).RemoveAll(item => item.LineNum == _lnm);
            Set_LineNum();

            gdvinv1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvinv1.DataSource = ((List<BEDocumentLine>)Session["inv1"]);
            gdvinv1.DataBind();
        }*/
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
            obj.Currency = Convert.ToString(cbbCurrency.Value);
            obj.U_BPP_BPTP = Convert.ToString(cbbCrPersonType.Value);
            obj.U_BPP_BPTD = Convert.ToString(cbbCrDocumentType.Value);
            obj.GroupNum = Convert.ToString(GroupNum.Value);
            obj.ListNum = Convert.ToString(ListNum.Value);
            obj.Lines = ((List<BEContactLines>)Session["crd1"]);
            obj.Lines2 = ((List<BEClientAddress>)Session["dire"]);
            using (var obrd = new BRDocument())
            {
                obrd.SaveBusinessPartner(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
            //Init_VarSessions();
            return (_err);
        }
        private string Modify()
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
            obj.U_BPP_BPTP = Convert.ToString(cbbCrPersonType.Value);
            obj.U_BPP_BPTD = Convert.ToString(cbbCrDocumentType.Value);
            obj.GroupNum = Convert.ToString(GroupNum.Value);
            obj.Currency = Convert.ToString(cbbCurrency.Value);
            obj.ListNum = Convert.ToString(ListNum.Value);
            obj.Active = Convert.ToString(rbtnestado.SelectedItem.Value);
            obj.Lines = ((List<BEContactLines>)Session["crd1"]);
            obj.Lines2 = ((List<BEClientAddress>)Session["dire"]);
            using (var obrd = new BRDocument())
            {
                obrd.UpdateBusinessPartner(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKUPDBP";
            //Init_VarSessions();
            return (_err);
        }
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("CrClient"))
                {
                    //var spl = e.Parameter.Split(':');
                    //BEClientAddress line;

                    //if (!string.IsNullOrWhiteSpace(spl[1]))
                    //{
                    //    var direc = spl[1].Split('=');

                    //    for (var i = 0; i < direc.Count(); i++)
                    //    {
                    //        var item = direc[i].Split(';');

                    //        line = new BEClientAddress()
                    //        {
                    //            Address = item[0].Trim(),
                    //            Street = item[1].Trim(),
                    //            Country = "PE",
                    //            AdresType = item[8].Trim(),
                    //            State = item[3].Trim(),
                    //            U_DXP_BIZ_COPR = item[4].Trim(),
                    //            U_DXP_BIZ_PROV = item[5].Trim(),
                    //            U_DXP_BIZ_CODI = item[6].Trim(),
                    //            U_DXP_BIZ_DIST = item[7].Trim(),
                    //            Linea = i,
                    //        };
                    //        ((List<BEClientAddress>)Session["dire"]).Add(line);
                    //        Set_LineNum_Direcciones();
                    //    }
                    //}
                    e.Result = BusinessPartner();
                }
                else if (e.Parameter.Contains("Modify"))
                {
                    //var spl = e.Parameter.Split(':');
                    //BEClientAddress line;
                    //if (!string.IsNullOrWhiteSpace(spl[1]))
                    //{
                    //    var direc = spl[1].Split('=');

                    //    for (var i = 0; i < direc.Count(); i++)
                    //    {
                    //        var item = direc[i].Split(';');

                    //        line = new BEClientAddress()
                    //        {
                    //            Address = item[0].Trim(),
                    //            Street = item[1].Trim(),
                    //            Country = "PE",
                    //            AdresType = item[8].Trim(),
                    //            State = item[3].Trim(),
                    //            U_DXP_BIZ_COPR = item[4].Trim(),
                    //            U_DXP_BIZ_PROV = item[5].Trim(),
                    //            U_DXP_BIZ_CODI = item[6].Trim(),
                    //            U_DXP_BIZ_DIST = item[7].Trim(),
                    //            Linea = i,
                    //        };
                    //        ((List<BEClientAddress>)Session["dire"]).Add(line);
                    //        Set_LineNum_Direcciones();
                    //    }
                    //}
                    e.Result = Modify();
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

        protected void gvcontacto_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            //gvcontacto.DoRowValidation();
            var obec = ((BEParameters)Session["InitPar"]);
            var x = ((List<BEContactLines>)Session["crd1"]).Count;
            var line = new BEContactLines()
            {
                FirstName = Convert.ToString(e.NewValues["FirstName"]),
                LastName = Convert.ToString(e.NewValues["LastName"]),
                Cellolar = Convert.ToString(e.NewValues["Cellolar"]),
                E_MailL = Convert.ToString(e.NewValues["E_MailL"]),
                Active = Convert.ToString(e.NewValues["Active"]),
                Linea = x
            };

            ((List<BEContactLines>)Session["crd1"]).Add(line);
            Set_CntctCode();
            gvcontacto.CancelEdit();
            e.Cancel = true;
            gvcontacto.DataSource = ((List<BEContactLines>)Session["crd1"]);
            gvcontacto.DataBind();
        }
        protected void gvcontacto_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gvcontacto.FindVisibleIndexByKeyValue(e.Keys[gvcontacto.KeyFieldName]);
            var _lnm = (i + 1);
            ((List<BEContactLines>)Session["crd1"]).RemoveAll(item => item.CntctCode == _lnm);
            Set_LineNum();

            //gvcontacto.JSProperties["cpSubTotal"] = ((List<BEContactLines>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gvcontacto.DataSource = ((List<BEContactLines>)Session["crd1"]);
            gvcontacto.DataBind();
        
        }
        protected void listdirecciones_Callback(object sender, CallbackEventArgsBase e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            //var x = listdirecciones.SelectedItems[1].Text;


            if (e.Parameter.Contains("ADDITEM"))
            {
                var spl = e.Parameter.Split(':');
                BEClientAddress line;
                var direc = spl[1].Split('-');

                for (var i = 0; i< direc.Count(); i++)
                {
                    var item = direc[i].Split(';');

                    line = new BEClientAddress() {
                        Address = item[0].Trim(),
                        Street = item[1].Trim(),
                        Country = "PE",
                        AdresType = item[8].Trim(),
                        State = item[3].Trim(),
                        U_DXP_BIZ_COPR = item[4].Trim(),
                        U_DXP_BIZ_PROV = item[5].Trim(),
                        U_DXP_BIZ_CODI = item[6].Trim(),
                        U_DXP_BIZ_DIST = item[7].Trim(),
                        Linea = i,
                    };

                    ((List<BEClientAddress>)Session["dire"]).Add(line);
                    Set_LineNum_Direcciones();
                }


                //var line = new BEClientAddress();

                //line.Address = textAddress.Text;
                //line.Street = txtStreet.Text;
                //line.Country = "PE";
                //line.AdresType = rdbtntipofact.SelectedItem.Value.ToString();
                //line.State = cbbState.Value.ToString();
                //line.U_DXP_BIZ_COPR = cbbU_DXP_BIZ_COPR.Value.ToString();
                //line.U_DXP_BIZ_PROV = cbbU_DXP_BIZ_COPR.Text;
                //line.U_DXP_BIZ_CODI = cbbU_DXP_BIZ_CODI.Value.ToString();
                //line.U_DXP_BIZ_DIST = cbbU_DXP_BIZ_CODI.Text;

                //((List<BEClientAddress>)Session["dire"]).Add(line);
                //Set_LineNum_Direcciones();
            }
            else if (e.Parameter.Contains("SRCH"))
            {
                var lista = "";
                var spl = e.Parameter.Split(':');
                ListaDirecciones.Where(i => i.Address == spl[0]).ToList().ForEach(item =>
                {
                    lista = item.Address + ","+item.Street+","+item.State+","
                    +item.U_DXP_BIZ_COPR+','+item.U_DXP_BIZ_CODI+","+item.AdresType;
                });
                
            }

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GET_DIRECCION(string address)
        {
            var lista = "";
            ListaDirecciones.Where(i => i.Address == address).ToList().ForEach(item =>
            {
                lista = item.Address + "," + item.Street + "," + item.State + ","
                + item.U_DXP_BIZ_COPR + ',' + item.U_DXP_BIZ_CODI;
            });
            return lista;
        }
        protected void gvcontacto_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("GET")) {
                var splv = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = splv[1],
                    accion = 2,
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_CLIENTES_CONTACTOS(obj);
                Session["crd1"] = olst;
                gvcontacto.DataSource = olst;
                gvcontacto.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEContactLines>)Session["crd1"]).Clear();
                gvcontacto.DataSource = Session["crd1"];
                gvcontacto.DataBind();
            }
        }

        protected void gvcontacto_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gvcontacto.EditingRowVisibleIndex;

            ((List<BEContactLines>)Session["crd1"])[index].FirstName = Convert.ToString(e.NewValues["FirstName"]);
            ((List<BEContactLines>)Session["crd1"])[index].LastName = Convert.ToString(e.NewValues["LastName"]);
            ((List<BEContactLines>)Session["crd1"])[index].Cellolar = Convert.ToString(e.NewValues["Cellolar"]);
            ((List<BEContactLines>)Session["crd1"])[index].E_MailL = Convert.ToString(e.NewValues["E_MailL"]);
            ((List<BEContactLines>)Session["crd1"])[index].Active = Convert.ToString(e.NewValues["Active"]);

            gvcontacto.CancelEdit();
            e.Cancel = true;
            gvcontacto.DataSource = ((List<BEContactLines>)Session["crd1"]);
            gvcontacto.DataBind();
        }

        protected void gvDirecciones_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "Address", false) == 0 ||
                string.Compare(e.Column.FieldName, "Street", false) == 0 ||
                string.Compare(e.Column.FieldName, "Active", false) == 0 ||
                string.Compare(e.Column.FieldName, "AdresType", false) == 0 ||
                string.Compare(e.Column.FieldName, "StreetNo", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
        }

        protected void gvDirecciones_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gvDirecciones.EditingRowVisibleIndex;

            ((List<BEClientAddress>)Session["dire"])[index].Address = Convert.ToString(e.NewValues["Address"]);
            ((List<BEClientAddress>)Session["dire"])[index].Street = Convert.ToString(e.NewValues["Street"]);
            ((List<BEClientAddress>)Session["dire"])[index].State = Convert.ToString(e.NewValues["State"]);
            ((List<BEClientAddress>)Session["dire"])[index].StateName = Convert.ToString(e.NewValues["StateName"]);
            ((List<BEClientAddress>)Session["dire"])[index].Active = Convert.ToString(e.NewValues["Active"]);
            ((List<BEClientAddress>)Session["dire"])[index].AdresType = Convert.ToString(e.NewValues["AdresType"]);
            ((List<BEClientAddress>)Session["dire"])[index].U_DXP_BIZ_COPR = Convert.ToString(e.NewValues["U_DXP_BIZ_COPR"]);
            ((List<BEClientAddress>)Session["dire"])[index].U_DXP_BIZ_PROV = Convert.ToString(e.NewValues["U_DXP_BIZ_PROV"]);
            ((List<BEClientAddress>)Session["dire"])[index].U_DXP_BIZ_DIST = Convert.ToString(e.NewValues["U_DXP_BIZ_DIST"]);
            ((List<BEClientAddress>)Session["dire"])[index].U_DXP_BIZ_CODI = Convert.ToString(e.NewValues["U_DXP_BIZ_CODI"]);
            ((List<BEClientAddress>)Session["dire"])[index].U_DXP_BIZ_ZONA = Convert.ToString(e.NewValues["U_DXP_BIZ_ZONA"]);
            ((List<BEClientAddress>)Session["dire"])[index].GlblLocNum = Convert.ToString(e.NewValues["GlblLocNum"]);
            ((List<BEClientAddress>)Session["dire"])[index].Building = Convert.ToString(e.NewValues["Building"]);
            ((List<BEClientAddress>)Session["dire"])[index].StreetNo = Convert.ToString(e.NewValues["StreetNo"]);

            Set_LineNum_Direcciones();
            gvDirecciones.CancelEdit();
            e.Cancel = true;
            gvDirecciones.DataSource = ((List<BEClientAddress>)Session["dire"]);
            gvDirecciones.DataBind();
        }

        protected void gvDirecciones_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            if (!string.IsNullOrWhiteSpace(txtCrCardCode.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New || e.ButtonType == ColumnCommandButtonType.Delete
                    || e.ButtonType == ColumnCommandButtonType.Edit)
                    e.Enabled = true;
            }
        }

        protected void gvDirecciones_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("GET"))
            {
                var splv = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = splv[1],
                    accion = 3,
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_CLIENTES_DIRECCIONES(obj);
                Session["dire"] = olst;
                Set_LineNum_Direcciones();
                gvDirecciones.DataSource = olst;
                gvDirecciones.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEClientAddress>)Session["dire"]).Clear();
                gvDirecciones.DataSource = Session["dire"];
                gvDirecciones.DataBind();
            }
            
        }

        protected void gvDirecciones_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var x = ((List<BEClientAddress>)Session["dire"]).Count;
            var line = new BEClientAddress()
            {
                Address = Convert.ToString(e.NewValues["Address"]),
                Street = Convert.ToString(e.NewValues["Street"]),
                State = Convert.ToString(e.NewValues["State"]),
                StateName = Convert.ToString(e.NewValues["StateName"]),
                AdresType = Convert.ToString(e.NewValues["AdresType"]),
                Active = Convert.ToString(e.NewValues["Active"]),
                U_DXP_BIZ_COPR = Convert.ToString(e.NewValues["U_DXP_BIZ_COPR"]),
                U_DXP_BIZ_PROV = Convert.ToString(e.NewValues["U_DXP_BIZ_PROV"]),
                U_DXP_BIZ_CODI = Convert.ToString(e.NewValues["U_DXP_BIZ_CODI"]),
                U_DXP_BIZ_DIST = Convert.ToString(e.NewValues["U_DXP_BIZ_DIST"]),
                U_DXP_BIZ_ZONA = Convert.ToString(e.NewValues["U_DXP_BIZ_ZONA"]),
                GlblLocNum = Convert.ToString(e.NewValues["GlblLocNum"]),
                Building = Convert.ToString(e.NewValues["Building"]),
                StreetNo = Convert.ToString(e.NewValues["StreetNo"]),
                Linea = x
            };

            ((List<BEClientAddress>)Session["dire"]).Add(line);
            Set_LineNum_Direcciones();
            gvDirecciones.CancelEdit();
            e.Cancel = true;
            gvDirecciones.DataSource = ((List<BEClientAddress>)Session["dire"]);
            gvDirecciones.DataBind();
        }

        protected void gvDirecciones_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gvDirecciones.FindVisibleIndexByKeyValue(e.Keys[gvDirecciones.KeyFieldName]);
            var _lnm = (i + 1);
            ((List<BEClientAddress>)Session["dire"]).Where(item => item.LineNum == i).ToList().ForEach(x=>
            {
                x.Borrar = "Y";
            });
            Set_LineNum_Direcciones();

            //gvcontacto.JSProperties["cpSubTotal"] = ((List<BEContactLines>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gvDirecciones.DataSource = ((List<BEClientAddress>)Session["dire"]).Where(z=>z.Borrar!="Y");
            gvDirecciones.DataBind();
        }

        protected void gdvDepartamento_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var spl = e.Parameters.Split(':');
            if (e.Parameters.Contains("SRCH"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    departamento = spl[1],
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_DEPARTAMENTOS(obj);
                Session["drcn"] = olst;
                gdvDepartamento.DataSource = olst;
                gdvDepartamento.DataBind();
            }
        }

        protected void gdvDepartamento_DataBinding(object sender, EventArgs e)
        {
            gdvDepartamento.DataSource = Session["drcn"];
        }

        protected void gdvProvincia_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("SRCH"))
            {
                var spl = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    departamento = spl[1],
                    provincia = spl[2],
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_PROVINCIAS(obj);
                Session["drcn"] = olst;
                gdvProvincia.DataSource = olst;
                gdvProvincia.DataBind();
            }
        }

        protected void gdvProvincia_DataBinding(object sender, EventArgs e)
        {
            gdvProvincia.DataSource = Session["drcn"];
        }

        protected void gdvDistrito_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("SRCH"))
            {
                var spl = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    provincia = spl[1],
                    distrito = spl[2],
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_DISTRITOS(obj);
                Session["drcn"] = olst;
                gdvDistrito.DataSource = olst;
                gdvDistrito.DataBind();
            }
        }

        protected void gdvDistrito_DataBinding(object sender, EventArgs e)
        {
            gdvDistrito.DataSource = Session["drcn"];
        }

        protected void gvDirecciones_DataBinding(object sender, EventArgs e)
        {
            gvDirecciones.DataSource = ((List<BEClientAddress>)Session["dire"]).Where(z => z.Borrar != "Y"); ;
        }
        protected void gvDirecciones_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
        {
            var LicTradNum = txtCrLicTradNum.Text;
            var contador_direcciones = ((List<BEClientAddress>)Session["dire"]).Count+1;


            if (!string.IsNullOrWhiteSpace(LicTradNum)) { 
                e.NewValues["Active"] = "Activo";
                e.NewValues["Address"] = LicTradNum+"00"+contador_direcciones;
                
            }

        }

        protected void gvcontacto_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Active"] = "Y";
        }

        protected void gdvUrbanizacion_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("SRCH"))
            {
                var spl = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    distrito = spl[1]
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_URBANIZACIONES(obj);
                Session["drcn"] = olst;
                gdvUrbanizacion.DataSource = olst;
                gdvUrbanizacion.DataBind();
            }
        }

        protected void gdvUrbanizacion_DataBinding(object sender, EventArgs e)
        {
            gdvUrbanizacion.DataSource = Session["drcn"];
        }

        protected void gdvGabinete_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("SRCH"))
            {
                var spl = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_GABINETES(obj);
                Session["drcn"] = olst;
                gdvGabinete.DataSource = olst;
                gdvGabinete.DataBind();
            }
        }

        protected void gdvGabinete_DataBinding(object sender, EventArgs e)
        {
            gdvGabinete.DataSource = Session["drcn"];
        }
    }
}