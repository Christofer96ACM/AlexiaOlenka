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

namespace OneCommerce.Servicio
{
    public partial class LlamadaServicio : Page
    {
        private static BEDocument ocno;
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

            Session["oitm"] = new List<BEProduct>();
            Session["Prodllamada"] = new List<BEProduct>();
            Session["oscl"] = new List<BELlamadaServicio>();
            Session["ocrd"] = new List<BEBusinessPartner>();
            Session["tcns"] = new List<BEBusinessPartner>();
            Session["tecn"] = new List<BEBusinessPartner>();
            Session["lote"] = new List<BELotes>();
            Session["dln1"] = new List<BEDocumentLine>();
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("adrtype", string.Empty);
        }
        //!+ RUTINAS AJAX
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEParameters> GET_VALORES_SERVICIO(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_VALORES_SERVICIO(obep);
            return (olst);
        }
        private void Set_LineNum()
        {
            var i = 1;
            ((List<BEBusinessPartner>)Session["tecn"]).ForEach(item =>
            {
                item.LineNum = i;
                i += 1;
            });
        }
        private void Set_LineNum2()
        {
            var i = 1;
            ((List<BEDocumentLine>)Session["dln1"]).ForEach(item =>
           
            {
                item.LineNum = i;
                i += 1;
            });
        }
        private string SaveServicio()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BELlamadaServicio();
            var MSJ = "";

            obj.CardCode = bteCustomer.Text;
            obj.CardName = txtCustomerName.Text;
            obj.ContactPerson = Convert.ToString(txtcontctCode1.Value);
            obj.Estado = Convert.ToString(cbStatus.Value);
            obj.Prioridad = Convert.ToString(cbbPriority.Value);
            obj.SerieFab = txtmanufSN1.Text;
            obj.SerieInt = txtinternalSN.Text;
            obj.ItemCode = txtitemCode.Text;
            obj.ItemName = txtItemName.Text;
            obj.Asunto = txtSubject.Text;
            obj.IdDireccion = cbbAddress.Text;
            obj.Origen = Convert.ToString(cbbOrigin.Value);
            obj.TipoProblema = Convert.ToString(cbbProblemTyp.Value);
            obj.DetalleServicio = Convert.ToString(cbbCallType.Value);
            obj.Tecnico = Convert.ToString(cbbTecnico.Value);
            //obj.HoraInicio = Convert.ToString(dteDocDateInit.Value);
            //obj.HoraFin = Convert.ToString(dteDocDateFin.Value);
            //obj.Duracion = txtDuration.Text;
            obj.Resolucion = mmoResolution.Text;
            obj.Comentario = mmoComments.Text;
            obj.lineatecnicos = ((List<BEBusinessPartner>)Session["tecn"]);
            var x = Convert.ToString(cbbAddress.Value).Split('$');
            obj.AddressType = x[4];
            using (var obrd = new BRDocument())
            {
                obrd.SaveService(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
                MSJ = Save();
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKBP#{0}#{1}", obj.CallId,MSJ);
            //Init_VarSessions();
            return (_err);
        }
        private string UpdtServicio()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BELlamadaServicio();
            var MSJ = "";

            obj.CallId = Convert.ToInt32(txtidllamada.Text);
            obj.CardCode = bteCustomer.Text;
            obj.CardName = txtCustomerName.Text;
            obj.ContactPerson = Convert.ToString(txtcontctCode1.Value);
            obj.Estado = Convert.ToString(cbStatus.Value);
            obj.Prioridad = Convert.ToString(cbbPriority.Value);
            obj.SerieFab = txtmanufSN1.Text;
            obj.SerieInt = txtinternalSN.Text;
            obj.ItemCode = txtitemCode.Text;
            obj.ItemName = txtItemName.Text;
            obj.Asunto = txtSubject.Text;
            obj.IdDireccion = cbbAddress.Text;
            obj.Origen = Convert.ToString(cbbOrigin.Value);
            obj.TipoProblema = Convert.ToString(cbbProblemTyp.Value);
            obj.DetalleServicio = Convert.ToString(cbbCallType.Value);
            obj.Tecnico = Convert.ToString(cbbTecnico.Value);
            //obj.HoraInicio = Convert.ToString(dteDocDateInit.Value);
            //obj.HoraFin = Convert.ToString(dteDocDateFin.Value);
            //obj.Duracion = txtDuration.Text;
            obj.Resolucion = mmoResolution.Text;
            obj.Comentario = mmoComments.Text;
            obj.AddressType = Convert.ToString(hdfTemp.Get("adrtype"));
            using (var obrd = new BRDocument())
            {
                BEParameters obep = new BEParameters();
                obep.Socied = obec.Socied;
                obep.TransId = Convert.ToInt32(obj.CallId);
                var bandera = obrd.DXP_VAL_LLAMADA_ENTREGA(obep);

                obrd.UpdtService(obj, ((BEParameters)Session["InitPar"]).objSapSbo);

                if (bandera == "TRUE")
                {

                }
                else
                {
                   MSJ = Save();
                    
                }
               
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("IKCC#{0}", MSJ);
            //Init_VarSessions();
            return (_err);
        }
        private string Save()
        {
            var _err = string.Empty;
            var MSJ = "";
            var band = false;
            if (((List<BEDocumentLine>)Session["dln1"]).Count == 0)
                _err = BSMessage.MsExLinesCount;
            

            if (string.IsNullOrWhiteSpace(_err))
            {
                var day = DateTime.Today;
                var obec = ((BEParameters)Session["InitPar"]);
                var obj = new BEDocument();
                obj.Socied = obec.Socied;
                obj.DocDate = Convert.ToDateTime(day);
                obj.TaxDate = Convert.ToDateTime(day);
                obj.CardCode = bteCustomer.Text;
                obj.CardName = txtCustomerName.Text;
                
                obj.U_BPP_MDTO= txtidllamada.Text;

                obj.Project = ((BEParameters)Session["InitPar"]).Project;
                
                List<BEProduct> listSN = SerialNumber();
                obj.Lines = ((List<BEDocumentLine>)Session["dln1"]);
                
                

                using (var obrd = new BRDocument())
                {
                   
                        obrd.SaveDeliveryNote2(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
                       
                }
                _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKS#{0}#{1}", obj.DocEntry, obj.DocNum);
            }
            return (_err);
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




        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveServicio"))
                {
                    e.Result = SaveServicio();
                }
                else if (e.Parameter.Contains("UpdtServicio"))
                {
                    e.Result = UpdtServicio();
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

        protected void txtcontctCode1_Callback(object sender, CallbackEventArgsBase e)
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
                        txtcontctCode1.Items.Add(ite.Name, ite.CntctCode);
                    });
                    txtcontctCode1.SelectedIndex = 0;
                }
                else
                {
                    txtcontctCode1.Items.Add("", 0);
                    txtcontctCode1.SelectedIndex = 0;
                }
            }

        }

        protected void cbbAddress_Callback(object sender, CallbackEventArgsBase e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameter.Contains("GET"))
            {
                var splv = e.Parameter.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = splv[1],
                    accion = 3,
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_CLIENTES_DIRECCIONES(obj);
                if (olst.Count != 0)
                {
                    cbbAddress.Items.Add("", 0);
                    olst.Where(i => i.AdresType != "B").ToList().ForEach(ite =>
                    {
                        cbbAddress.Items.Add(ite.Address, ite.Street + "$" + ite.StateName + "$" + ite.U_DXP_BIZ_PROV + "$" + ite.U_DXP_BIZ_DIST + "$" + ite.AdresType);
                    });
                    //cbbAddress.SelectedIndex = 0;
                }
                else
                {
                    cbbAddress.Items.Add("", 0);
                    cbbAddress.SelectedIndex = 0;
                }
            }
        }

        protected void gdvCards_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("GET"))
            {
                var splv = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = bteCustomer.Text,
                    ItemCode = txtitemCode.Text,
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_CARDS(obj);
                Session["oitm"] = olst;
                gdvCards.DataSource = olst;
                gdvCards.DataBind();
            }
        }

        protected void gdvCards_DataBinding(object sender, EventArgs e)
        {
            gdvCards.DataSource = Session["oitm"];
        }

        protected void gdvServicio_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("GET"))
            {
                var splv = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = txtCliente.Text,
                    ItemCode = txtProducto.Text,
                    DateFi = Convert.ToDateTime(dteFecha2.Text),
                    DateIn = Convert.ToDateTime(dteFecha.Text),
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_SERVICIO(obj);
                Session["oscl"] = olst;
                gdvServicio.DataSource = olst;
                gdvServicio.DataBind();

               // gdvdln1_CustomCallback(sender ,e);
            }
        }

        protected void gdvServicio_DataBinding(object sender, EventArgs e)
        {
            gdvServicio.DataSource = Session["oscl"];
        }
        protected void gdvTecnicos_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {

        }
        protected void gdvTecnicos_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {

        }
        protected void gdvTecnicos_DataBinding(object sender, EventArgs e)
        {
            gdvTecnicos.DataSource = Session["tecn"];
        }
        protected void gdvTecnicos_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gdvTecnicos.FindVisibleIndexByKeyValue(e.Keys[gdvTecnicos.KeyFieldName]);
            var _lnm = (i + 1);

            ((List<BEBusinessPartner>)Session["tecn"]).RemoveAll(item => item.LineNum == _lnm);
            Set_LineNum();

            gdvTecnicos.DataSource = ((List<BEBusinessPartner>)Session["tecn"]);
            gdvTecnicos.DataBind();
        }
        protected void gdvTecnicos_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

        }
        protected void gdvTecnicos_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {

        }
        protected void gdvTecnicos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("ADD"))
            {
                var spl = e.Parameters.Split(':');
                var tecnico = new BEBusinessPartner();

                tecnico.ID = spl[1];
                tecnico.Tecnico = spl[2];

                ((List<BEBusinessPartner>)Session["tecn"]).Add(tecnico);
            }
            else if (e.Parameters.Contains("GET"))
            {
                var spl = e.Parameters.Split(':');
                var tecnico = new BEBusinessPartner();
                ((List<BEBusinessPartner>)Session["tecn"]).Clear();

                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardName = "",
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_TECNICOAUX(obj);

                for (var i = 1; i < spl.Length; i++)
                {
                    olst.Where(item => item.ID == spl[i]).ToList().ForEach(x =>
                    {
                        ((List<BEBusinessPartner>)Session["tecn"]).Add(x);
                    });
                }
            }
            
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEBusinessPartner>)Session["tecn"]).Clear();
            }


            Set_LineNum();
            gdvTecnicos.DataSource = Session["tecn"];
            gdvTecnicos.DataBind();
        }
        protected void gdvTecnicosrch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                CardName = txttec.Text,
            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_TECNICOAUX(obj);
            Session["tcns"] = olst;
            gdvTecnicosrch.DataSource = olst;
            gdvTecnicosrch.DataBind();
        }

        protected void gdvTecnicosrch_DataBinding(object sender, EventArgs e)
        {
            gdvTecnicosrch.DataSource = Session["tcns"];
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
            if (string.Compare(e.Column.FieldName, "Cantidad", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
            if (string.Compare(e.Column.FieldName, "Cantidad", false) == 0)
            {
                e.Editor.Focus();
            }
        }

        protected void gdvLotes_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.New || e.ButtonType == ColumnCommandButtonType.Delete)
            {
                e.Enabled = false;
            }
        }

        protected void gdvLotes_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            gdvLotes.DoRowValidation();
            var index = gdvLotes.EditingRowVisibleIndex;
            ((List<BELotes>)Session["lote"])[index].Cantidad = Convert.ToDecimal(e.NewValues["Cantidad"]);

            gdvLotes.CancelEdit();
            e.Cancel = true;
            gdvLotes.DataSource = ((List<BELotes>)Session["lote"]);
            gdvLotes.DataBind();
        }

        protected void gdvdln1_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            gdvdln1.Columns[0].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
            gdvdln1.Columns[1].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
            gdvdln1.Columns[2].FixedStyle = DevExpress.Web.ASPxGridView.GridViewColumnFixedStyle.Left;
            var x = "";
            //if (e.VisibleIndex >= 0)
            //{
            //    x = gdvdln1.GetRowValues(e.VisibleIndex, "TreeType").ToString();
            //}
            if ((string.Compare(e.Column.FieldName, "ItemCode", false) == 0 ||
                string.Compare(e.Column.FieldName, "Quantity", false) == 0 ) )
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
                U_GOS_MARCA= Convert.ToString(e.NewValues["U_GOS_MARCA"]),
                Quantity = Convert.ToInt32(e.NewValues["Quantity"]),
                WhsCode = almacen,
                U_StoDiBE = Convert.ToDecimal(e.NewValues["U_StoDiBE"]),
                U_BF_StoDiYo = Convert.ToDecimal(e.NewValues["U_BF_StoDiYo"]),
                IssueMthd= Convert.ToString(e.NewValues["IssueMthd"]),
                TreeType = Convert.ToString(e.NewValues["TreeType"]),
                OItemCode = Convert.ToString(e.NewValues["OItemCode"]),
                OnDscOrg = Convert.ToDecimal(e.NewValues["OnDscOrg"]),
                Serie = Convert.ToString(e.NewValues["Serie"])
                //PASAR EL SERIALNUMBER PARA LUEGO HACER EL DATASOURCE AL DETALLE
            };

            line.InDscOrg = (line.OnDscOrg == 0) ? 1 : 0;
            ((List<BEDocumentLine>)Session["dln1"]).Add(line);
            //Set_Promotion();
            Set_LineNum2();

            

            gdvdln1.CancelEdit();
            e.Cancel = true;
            gdvdln1.DataSource = ((List<BEDocumentLine>)Session["dln1"]);
            gdvdln1.DataBind();
        }

        protected void gdvdln1_RowValidating(object sender, ASPxDataValidationEventArgs e)
        {
            if (Convert.ToInt32(e.NewValues["Quantity"]) == 0)
                e.RowError = BSMessage.MsExQuantityZero;
          

            var items = new List<string>();
           
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
            var father = "";
            ((List<BEDocumentLine>)Session["dln1"]).Where(item => item.LineNum == _lnm).ToList().ForEach(x => {
                father = x.Father;
            });
            ((List<BEDocumentLine>)Session["dln1"]).RemoveAll(item => item.Father == father);
            Set_LineNum();

            gdvdln1.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["dln1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvdln1.DataSource = ((List<BEDocumentLine>)Session["dln1"]);
            gdvdln1.DataBind();
        }

        protected void gdvdln1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obep = new BEParameters();

            if (e.Parameters.Contains("GET"))
            {
                var spl = e.Parameters.Split(':');

                if(spl[1]!="" && spl[1] != null)
                {
                    obep.Socied = obec.Socied;
                    obep.DocNum = Convert.ToInt32(spl[1]);

                    var olst = new List<BEDocumentLine>();
                    var obrd = new BRDocument();
                    olst = obrd.DXP_GET_GUIA_LLAMADA(obep);
                    Session["dln1"] = olst;
                    gdvdln1.DataSource = ((List<BEDocumentLine>)Session["dln1"]);
                    gdvdln1.DataBind();
                }
               
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEDocumentLine>)Session["dln1"]).Clear();
                gdvdln1.DataSource = Session["dln1"];
                gdvdln1.DataBind();
            }
        }

        protected void gdvdln1_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            //if (!string.IsNullOrWhiteSpace(txtDocEntry.Text))
            //{
            //    if (e.ButtonType == ColumnCommandButtonType.Edit || e.ButtonType == ColumnCommandButtonType.Delete)
            //        e.Enabled = false;
            //}
            object fieldValue = gdvdln1.GetRowValues(e.VisibleIndex, "TreeType");
           
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
            if (!string.IsNullOrWhiteSpace(txtguia.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New ||
                     e.ButtonType == ColumnCommandButtonType.Edit ||
                    e.ButtonType == ColumnCommandButtonType.Delete)
                {
                    e.Enabled = false;
                }

            }
        }

        protected void gdvdln1_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {

        }

        protected void gdvdln1_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            gdvdln1.DoRowValidation();
            var index = gdvdln1.EditingRowVisibleIndex;
            ((List<BEDocumentLine>)Session["dln1"])[index].Quantity = Convert.ToInt32(e.NewValues["Quantity"]);
           
            ((List<BEDocumentLine>)Session["dln1"])[index].Serie = Convert.ToString(e.NewValues["Serie"]);

          

            gdvdln1.CancelEdit();
            e.Cancel = true;
            gdvdln1.DataSource = ((List<BEDocumentLine>)Session["dln1"]);
            gdvdln1.DataBind();
        }

        protected void gdvdln1_AfterPerformCallback(object sender, ASPxGridViewAfterPerformCallbackEventArgs e)
        {

        }

        protected void gdvdln1_HtmlCommandCellPrepared(object sender, ASPxGridViewTableCommandCellEventArgs e)
        {

        }

        protected void gdvProductSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obep = new BEParameters()
            {
                Socied = obec.Socied,
                ItemCode = txtParProduct.Text,
                U_GOS_MARCA=txtmarcabus.Text
            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_ART_LLAMADA(obep);
            Session["Prodllamada"] = olst;
            gdvProductSearch.DataSource = olst;
            gdvProductSearch.DataBind();
        }

        protected void gdvProductSearch_DataBinding(object sender, EventArgs e)
        {
            gdvProductSearch.DataSource = Session["Prodllamada"];
        }

        protected void gdvdln1_DataBinding(object sender, EventArgs e)
        {
            gdvdln1.DataSource = Session["dln1"];
        }
    }


    
}