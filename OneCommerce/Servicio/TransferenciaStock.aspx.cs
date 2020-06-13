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
    public partial class TransferenciaStock : Page
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
                    ((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "";
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
            Session["owtr"] = new List<BEDocument>();
            Session["wtr1"] = new List<BEDocumentLine>();
            Session["ocrd"] = new List<BEBusinessPartner>();
            Session["lote"] = new List<BELotes>();
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("_emid", obec.U_BF_EMID);
            //hdfTemp.Add("adrtype", string.Empty);
        }
        private void Set_LineNum()
        {
            var i = 1;
            ((List<BEDocumentLine>)Session["wtr1"]).ForEach(item =>
            {
                item.LineNum = i;
                i += 1;
            });
        }
        private string SaveTS()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEDocument();

            obj.CardCode = bteCustomer.Text;
            obj.CardName = txtCustomerName.Text;
            obj.Address = txtAddress.Text;
            obj.DocDate = Convert.ToDateTime(txtcreateDate1.Text);
            obj.SlpCode = Convert.ToInt32(cbeOwnerCode.Value);
            obj.AlmacenO = cbbalmacenorigen.Value.ToString();
            obj.AlmacenD = cbbalmacendestino.Value.ToString();
            obj.Lines = ((List<BEDocumentLine>)Session["wtr1"]);

            using (var obrd = new BRDocument())
            {
                obrd.SaveTransferenciaStock(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKBP#{0}#{1}", obj.DocEntry, obj.DocNum);
            //Init_VarSessions();
            return (_err);
        }

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveTS"))
                {
                    e.Result = SaveTS();
                }
                else if (e.Parameter.Contains("UpdtServicio"))
                {
                    //e.Result = UpdtServicio();
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
                CardName = txtRazonS.Text,
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

        //protected void cbbAddress_Callback(object sender, CallbackEventArgsBase e)
        //{
        //    var obec = ((BEParameters)Session["InitPar"]);

        //    if (e.Parameter.Contains("GET"))
        //    {
        //        var splv = e.Parameter.Split(':');
        //        var obj = new BEParameters()
        //        {
        //            Socied = obec.Socied,
        //            CardCode = splv[1],
        //            accion = 3,
        //        };
        //        var obrd = new BRDocument();
        //        var olst = obrd.GET_CLIENTES_DIRECCIONES(obj);
        //        if (olst.Count != 0)
        //        {
        //            cbbAddress.Items.Add("", 0);
        //            olst.Where(i => i.AdresType != "S").ToList().ForEach(ite =>
        //            {
        //                cbbAddress.Items.Add(ite.Address, ite.Street + "$" + ite.StateName + "$" + ite.U_DXP_BIZ_PROV + "$" + ite.U_DXP_BIZ_DIST + "$" + ite.AdresType);
        //            });
        //            //cbbAddress.SelectedIndex = 0;
        //        }
        //        else
        //        {
        //            cbbAddress.Items.Add("", 0);
        //            cbbAddress.SelectedIndex = 0;
        //        }
        //    }
        //}
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
        protected void gdvWhsCodeSearch1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("ALMCN"))
            {
                var splt = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    ParValue = txtParAlmacen.Text.Trim(),
                    ColumnIndex = ((GridViewDataColumn)gdvWhsCodeSearch1.GetSortedColumns().ElementAt(0)).VisibleIndex,
                    ItemCode = splt[1],
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_OITW(obj);
                Session["owhs"] = olst;
                gdvWhsCodeSearch1.DataSource = olst;
                gdvWhsCodeSearch1.DataBind();
            }

        }

        protected void gdvWhsCodeSearch1_DataBinding(object sender, EventArgs e)
        {
            gdvWhsCodeSearch1.DataSource = Session["owhs"];
        }

        protected void gdvArticulos_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gdvArticulos.FindVisibleIndexByKeyValue(e.Keys[gdvArticulos.KeyFieldName]);
            var _lnm = (i + 1);
            
            ((List<BEDocumentLine>)Session["wtr1"]).RemoveAll(item => item.LineNum == _lnm);
            Set_LineNum();

            gdvArticulos.DataSource = ((List<BEDocumentLine>)Session["wtr1"]);
            gdvArticulos.DataBind();
        }

        protected void gdvArticulos_DataBinding(object sender, EventArgs e)
        {
            gdvArticulos.DataSource = ((List<BEDocumentLine>)Session["wtr1"]);
        }
        protected void gdvArticulos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("ADD"))
            {
                var spl = e.Parameters.Split(':');
                var line = new BEDocumentLine();
                line.ItemCode = spl[1];
                line.ItemName = spl[2];
                line.Quantity = 1;
                line.WhsCode = cbbalmacenorigen.Value.ToString();
                line.WareHouse = cbbalmacendestino.Value.ToString();
                line.IssueMthd = spl[3];
                line.Serie = "";
                ((List<BEDocumentLine>)Session["wtr1"]).Add(line);
            }
            else if (e.Parameters.Contains("GET"))
            {
                var _spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    DocEntry = Convert.ToInt32(_spl[1]),
                };
                var obrd = new BRDocument();
                var list = obrd.DXP_GET_TRANSTOCK_DETALLE(obep);
                Session["wtr1"] = list;
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEDocumentLine>)Session["wtr1"]).Clear();
            }
            gdvArticulos.DataSource = ((List<BEDocumentLine>)Session["wtr1"]);
            gdvArticulos.DataBind();
            Set_LineNum();
        }

        protected void gdvArticulos_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            gdvArticulos.DoRowValidation();
            var index = gdvArticulos.EditingRowVisibleIndex;
            ((List<BEDocumentLine>)Session["wtr1"])[index].ItemCode = Convert.ToString(e.NewValues["ItemCode"]);
            ((List<BEDocumentLine>)Session["wtr1"])[index].ItemName = Convert.ToString(e.NewValues["ItemName"]);
            ((List<BEDocumentLine>)Session["wtr1"])[index].IssueMthd = Convert.ToString(e.NewValues["IssueMthd"]);
            ((List<BEDocumentLine>)Session["wtr1"])[index].Quantity = Convert.ToInt32(e.NewValues["Quantity"]);
            ((List<BEDocumentLine>)Session["wtr1"])[index].Serie = Convert.ToString(e.NewValues["Serie"]);
            ((List<BEDocumentLine>)Session["wtr1"])[index].WhsCode = Convert.ToString(e.NewValues["WhsCode"]);
            ((List<BEDocumentLine>)Session["wtr1"])[index].WareHouse = Convert.ToString(e.NewValues["WareHouse"]);

            gdvArticulos.CancelEdit();
            e.Cancel = true;
            gdvArticulos.DataSource = ((List<BEDocumentLine>)Session["wtr1"]);
            gdvArticulos.DataBind();
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
            //object fieldValue = gdvdln1.GetRowValues(e.VisibleIndex, "ItemCode");
            //if (e.VisibleIndex >= 0 && !string.IsNullOrWhiteSpace(e.VisibleIndex.ToString()))
            //{
            //    if (!String.IsNullOrWhiteSpace(fieldValue.ToString()))
            //    {
            if (e.ButtonType == ColumnCommandButtonType.New || e.ButtonType == ColumnCommandButtonType.Delete)
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
            ((List<BELotes>)Session["lote"])[index].Cantidad = Convert.ToDecimal(e.NewValues["Cantidad"]);

            gdvLotes.CancelEdit();
            e.Cancel = true;
            gdvLotes.DataSource = ((List<BELotes>)Session["lote"]);
            gdvLotes.DataBind();
        }
        protected void gdvProductSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GENERAL"))
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    accion = 1,
                    ItemCode = txtParProduct.Text.Trim(),
                    VALOR = txtmarc.Text,
                    Descripcion = txtdescrip.Text
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_ARTICULOS_GENERAL(obep);
                Session["oitm"] = olst;
                gdvProductSearch.DataSource = olst;
                gdvProductSearch.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
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

        protected void cbbalmacenorigen_Callback(object sender, CallbackEventArgsBase e)
        {

        }

        protected void cbbalmacendestino_Callback(object sender, CallbackEventArgsBase e)
        {

        }

        protected void gdvtranSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                DateIn = (DateTime?)dteDateIn.Value,
                DateFi = (DateTime?)dteDateFi.Value,
                NumAtCard = txtNumAtCards.Text,
            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_TRANSTOCK(obj);
            Session["srch"] = olst;
            gdvtranSearch.DataSource = olst;
            gdvtranSearch.DataBind();
        }
        protected void gdvtranSearch_DataBinding(object sender, EventArgs e)
        {
            gdvtranSearch.DataSource = Session["srch"];
        }
    }
}