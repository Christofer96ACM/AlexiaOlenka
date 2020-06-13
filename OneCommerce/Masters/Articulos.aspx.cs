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
    public partial class Articulos : Page
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

            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Masters").Visible = true;
            /*if (obec.Permition == "001")
            {
                if (obec.Socied == "DX")
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = true;*/
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARInvoice").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARReserva").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("CreditNote").Enabled = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Reports").Visible = true;
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Tools").Visible = true;
            /*}
            else if (obec.Permition == "003")
            {
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("SalesOrder").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = true;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = true;*/
            /*}
            if (obec.U_BF_ADMIN==0)*/
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Administrator").Visible = true;
        }
        private void Init_VarSessions()
        {
            var obec = ((BEParameters)Session["InitPar"]);

            Session["oitw"] = new List<BEAlmacen>();
            Session["oitm"] = new List<BEProduct>();
            Session["owhs"] = new List<BEWhsCode>();
            Session["opln"] = new List<BEPrice>();

            hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
            //hdfTemp.Add("_emid", obec.U_BF_EMID);
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
        public static List<BEParameters> GET_VALORES_ARTICULOS_F(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_VALORES_ARTICULOS(obep);
            return (olst);
        }

        private string SaveItem()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEProduct();

            obj.ItemCode = txtItemcode.Text;
            obj.ItemName = txtItemname.Text;
            //obj.ItemType = Convert.ToString(cbbItemType.Value);
            obj.ItmsGrpCod = Convert.ToString(cbbItmsGrpCod.Value);
            obj.IssueMthd = Convert.ToString(cbbIssueMthd.Value);
            //obj.MngMethod = Convert.ToString(cbbMngMethod.Value);
            obj.U_BPP_TIPEXIST = Convert.ToString(cbbTipExist.Value);
            obj.GLMethod = Convert.ToString(cbbGLMethod.Value);
            obj.U_GOS_MARCA = txtMarca.Text;
            obj.U_GOS_MODELO = txtModelo.Text;
            /*PRECIOS CON SU LISTA - BOTON AGREGAR PARA AÑADIR PRECIO SEGUN SELECTED INDEX*/
            obj.InvntItem = Convert.ToString(checkArticuloInventario.Value);
            obj.U_DXP_PLANINT = Convert.ToString(cbbPlan.Text);
            obj.SellItem = Convert.ToString(checkArticuloVenta.Value);
            obj.PrchseItem = Convert.ToString(checkArticuloCompra.Value);
            obj.ByWh = Convert.ToString(checkByWh.Value);
            obj.Active = Convert.ToString(rbtnestado.SelectedItem.Value);
            obj.BuyUnitMsr = Convert.ToString(cbbBuyUnitMsr.Value);
            obj.NumInBuy = Convert.ToInt32(txtNuminBuy.Text);
            obj.PurPackMsr = Convert.ToString(cbbPurPackMsr.Value);
            obj.PurPackUn = Convert.ToInt32(txtPurPackUn.Text);
            obj.DetalleServicio = Convert.ToString(cbbDetalleServicio.Value);
            obj.TaxCodeAP = Convert.ToString(cbbTaxCodeAP.Value);
            obj.SalUnitMsr = Convert.ToString(cbbSalUnitMsr.Value);
            obj.NumInSale = Convert.ToInt32(txtNuminSale.Text);
            obj.SalPackMsr = Convert.ToString(cbbSalPackMsr.Value);
            obj.SalPackUn = Convert.ToInt32(txtSalPackUn.Text);
            obj.TaxCodeAR = Convert.ToString(cbbTaxCodeAR.Value);
            obj.ActivoC = Convert.ToString(checkContrato.Value);
            obj.ActivoS = Convert.ToString(checkServicio.Value);
            obj.NoFacturable = Convert.ToString(checkFacturable.Value);
            obj.InvntryUom = Convert.ToString(cbbInvntryUOM.Value);
            //obj.LastPurCur = "SOL";
            //obj.LastPurPrc = Convert.ToDecimal(txtPrice.Text);

            obj.Almacenes = ((List<BEAlmacen>)Session["oitw"]);
            obj.Precios = ((List<BEPrice>)Session["opln"]);

            using (var obrd = new BRDocument())
            {
                obrd.SaveItems(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
            //Init_VarSessions();
            return (_err);
        }
        private string UpdateItem()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEProduct();

            obj.ItemCode = txtItemcode.Text;
            obj.ItemName = txtItemname.Text;
            //obj.ItemType = Convert.ToString(cbbItemType.Value);
            obj.ItmsGrpCod = Convert.ToString(cbbItmsGrpCod.Value);
            obj.IssueMthd = Convert.ToString(cbbIssueMthd.Value);
            //obj.MngMethod = Convert.ToString(cbbMngMethod.Value);
            obj.U_BPP_TIPEXIST = Convert.ToString(cbbTipExist.Value);
            obj.GLMethod = Convert.ToString(cbbGLMethod.Value);
            /*PRECIOS CON SU LISTA - BOTON AGREGAR PARA AÑADIR PRECIO SEGUN SELECTED INDEX*/
            obj.InvntItem = Convert.ToString(checkArticuloInventario.Value);
            obj.SellItem = Convert.ToString(checkArticuloVenta.Value);
            obj.U_GOS_MARCA = txtMarca.Text;
            obj.U_DXP_PLANINT = Convert.ToString(cbbPlan.Text);
            obj.DetalleServicio = Convert.ToString(cbbDetalleServicio.Value);
            obj.U_GOS_MODELO = txtModelo.Text;
            obj.PrchseItem = Convert.ToString(checkArticuloCompra.Value);
            obj.ByWh = Convert.ToString(checkByWh.Value);
            obj.Active = Convert.ToString(rbtnestado.SelectedItem.Value);
            obj.BuyUnitMsr = Convert.ToString(cbbBuyUnitMsr.Value);
            obj.NumInBuy = Convert.ToInt32(txtNuminBuy.Text);
            obj.PurPackMsr = Convert.ToString(cbbPurPackMsr.Value);
            obj.PurPackUn = Convert.ToInt32(txtPurPackUn.Text);
            obj.TaxCodeAP = Convert.ToString(cbbTaxCodeAP.Value);
            obj.SalUnitMsr = Convert.ToString(cbbSalUnitMsr.Value);
            obj.NumInSale = Convert.ToInt32(txtNuminSale.Text);
            obj.SalPackMsr = Convert.ToString(cbbSalPackMsr.Value);
            obj.SalPackUn = Convert.ToInt32(txtSalPackUn.Text);
            obj.TaxCodeAR = Convert.ToString(cbbTaxCodeAR.Value);
            obj.ActivoC = Convert.ToString(checkContrato.Value);
            obj.ActivoS = Convert.ToString(checkServicio.Value);
            obj.NoFacturable = Convert.ToString(checkFacturable.Value);
            obj.InvntryUom = Convert.ToString(cbbInvntryUOM.Value);
            //obj.LastPurCur = "SOL";
            //obj.LastPurPrc = Convert.ToDecimal(txtPrice.Text);

            obj.Almacenes = ((List<BEAlmacen>)Session["oitw"]);
            obj.Precios = ((List<BEPrice>)Session["opln"]);

            using (var obrd = new BRDocument())
            {
                obrd.UpdateItems(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKUPDBP";
            //Init_VarSessions();
            return (_err);
        }

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveItem"))
                {
                    e.Result = SaveItem();
                }
                else if (e.Parameter.Contains("Modify"))
                {
                    e.Result = UpdateItem();
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

        protected void gdvWhsCodeSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("ALMCN"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    ParValue = txtParAlmacen.Text.Trim(),
                    ColumnIndex = ((GridViewDataColumn)gdvWhsCodeSearch.GetSortedColumns().ElementAt(0)).VisibleIndex
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_OWHS(obj);
                Session["owhs"] = olst;
                gdvWhsCodeSearch.DataSource = olst;
                gdvWhsCodeSearch.DataBind();
            }
            
        }

        protected void gdvWhsCodeSearch_DataBinding(object sender, EventArgs e)
        {
            gdvWhsCodeSearch.DataSource = Session["owhs"];
        }

        protected void grdvAlmacenes_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            var obec = ((BEParameters)Session["InitPar"]);

            if (!string.IsNullOrWhiteSpace(txtItemcode.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New ||
                    e.ButtonType == ColumnCommandButtonType.Edit)
                {
                    e.Enabled = true;
                }
            }
        }
        protected void grdvAlmacenes_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("SRCH"))
            {
                var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    accion = 2,
                    ItemCode = spl[1],
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_ARTICULOS_Almacen(obep);
                Session["oitw"] = olst;
                grdvAlmacenes.DataSource = olst;
                grdvAlmacenes.DataBind();
            }
            else if (e.Parameters.Contains("INIT"))
            {
                var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    accion = 2,
                    //ItemCode = spl[1],
                    ParValue = txtParAlmacen.Text.Trim(),
                    ColumnIndex = ((GridViewDataColumn)gdvWhsCodeSearch.GetSortedColumns().ElementAt(0)).VisibleIndex
                };
                var obrd = new BRDocument();
                var olst = obrd.Get_OSCSP_OWHS(obep);
                Session["oitw"] = olst;
                grdvAlmacenes.DataSource = olst;
                grdvAlmacenes.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEAlmacen>)Session["oitw"]).Clear();
                grdvAlmacenes.DataSource = Session["oitw"];
                grdvAlmacenes.DataBind();
            }
        }
        protected void grdvAlmacenes_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = grdvAlmacenes.EditingRowVisibleIndex;

            //if(((List<BEAlmacen>)Session["oitw"])[index].Tiempo == "Existente")

            ((List<BEAlmacen>)Session["oitw"])[index].WhsCode = Convert.ToString(e.NewValues["WhsCode"]);
            ((List<BEAlmacen>)Session["oitw"])[index].WhsName = Convert.ToString(e.NewValues["WhsName"]);
            ((List<BEAlmacen>)Session["oitw"])[index].OnHand = Convert.ToInt32(e.NewValues["OnHand"]);
            ((List<BEAlmacen>)Session["oitw"])[index].IsCommited = Convert.ToInt32(e.NewValues["IsCommited"]);
            ((List<BEAlmacen>)Session["oitw"])[index].OnOrder = Convert.ToInt32(e.NewValues["OnOrder"]);
            ((List<BEAlmacen>)Session["oitw"])[index].Locked = Convert.ToString(e.NewValues["Locked"]);
            ((List<BEAlmacen>)Session["oitw"])[index].Disponible = Convert.ToInt32(e.NewValues["Disponible"]);
            ((List<BEAlmacen>)Session["oitw"])[index].RevenuesAc = Convert.ToString(e.NewValues["RevenuesAc"]);
            ((List<BEAlmacen>)Session["oitw"])[index].ExpensesAc = Convert.ToString(e.NewValues["ExpensesAc"]);
            ((List<BEAlmacen>)Session["oitw"])[index].Tiempo = Convert.ToString(e.NewValues["Tiempo"]);
            grdvAlmacenes.CancelEdit();
            e.Cancel = true;
            grdvAlmacenes.DataSource = ((List<BEAlmacen>)Session["oitw"]);
            grdvAlmacenes.DataBind();
        }

        protected void grdvAlmacenes_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            //gvcontacto.DoRowValidation();
            var obec = ((BEParameters)Session["InitPar"]);
            var x = ((List<BEAlmacen>)Session["oitw"]).Count;
            var line = new BEAlmacen()
            {
                WhsCode = Convert.ToString(e.NewValues["WhsCode"]),
                WhsName = Convert.ToString(e.NewValues["WhsName"]),
                OnHand = Convert.ToInt32(e.NewValues["OnHand"]),
                IsCommited = Convert.ToInt32(e.NewValues["IsCommited"]),
                OnOrder = Convert.ToInt32(e.NewValues["OnOrder"]),
                Locked = Convert.ToString(e.NewValues["Locked"]),
                Disponible = Convert.ToInt32(e.NewValues["Disponible"]),
                RevenuesAc = Convert.ToString(e.NewValues["RevenuesAc"]),
                ExpensesAc = Convert.ToString(e.NewValues["ExpensesAc"]),
                Linea = x
            };

            ((List<BEAlmacen>)Session["oitw"]).Add(line);
            grdvAlmacenes.CancelEdit();
            e.Cancel = true;
            grdvAlmacenes.DataSource = ((List<BEAlmacen>)Session["oitw"]);
            grdvAlmacenes.DataBind();
        }

        protected void grdvPrecios_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
        }
        protected void grdvPrecios_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("CMPLT"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_PRICELIST(obj);
                Session["opln"] = olst;
                grdvPrecios.DataSource = olst;
                grdvPrecios.DataBind();
            }
            if (e.Parameters.Contains("PRICEDF"))
            {
                var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    accion = 3,
                    ItemCode = spl[1],
                };
                var obrd = new BRDocument();
                var olst = obrd.GET_ARTICULOS_PRECIOS(obep);
                Session["opln"] = olst;
                grdvPrecios.DataSource = olst;
                grdvPrecios.DataBind();
            }
        }

        protected void grdvPrecios_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = grdvPrecios.EditingRowVisibleIndex;

            ((List<BEPrice>)Session["opln"])[index].ListNum = Convert.ToString(e.NewValues["ListNum"]);
            ((List<BEPrice>)Session["opln"])[index].ListName = Convert.ToString(e.NewValues["ListName"]);
            ((List<BEPrice>)Session["opln"])[index].Price = Convert.ToString(e.NewValues["Price"]);

            grdvPrecios.CancelEdit();
            e.Cancel = true;
            grdvPrecios.DataSource = ((List<BEPrice>)Session["opln"]);
            grdvPrecios.DataBind();
        }

        protected void grdvPrecios_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "ListNum", false) == 0 ||
                string.Compare(e.Column.FieldName, "ListName", false) == 0)
            {
                e.Editor.ReadOnly = true;
            }
            else
            {
                e.Editor.ReadOnly = false;
            }
            if (string.Compare(e.Column.FieldName, "Price", false) == 0)
            {
                e.Editor.Focus();
            }
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

        protected void grdvAlmacenes_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            //if (string.Compare(e.Column.FieldName, "WhsCode", false) == 0 ||
            //    string.Compare(e.Column.FieldName, "txtWhsName", false) == 0 ||
            //    string.Compare(e.Column.FieldName, "txtOnHand", false) == 0 ||
            //    string.Compare(e.Column.FieldName, "txtIsCommited", false) == 0 ||
            //    string.Compare(e.Column.FieldName, "txtOnOrder", false) == 0 ||
            //    string.Compare(e.Column.FieldName, "txtDisponible", false) == 0)
            //{
            //    e.Editor.ReadOnly = false;
            //}
            //else
            //{
            //    e.Editor.ReadOnly = true;
            //}
            //if (string.Compare(e.Column.FieldName, "WhsCode", false) == 0)
            //{
            //    e.Editor.Focus();
            //}
            if (string.Compare(e.Column.FieldName, "Locked", false) == 0 ||
                string.Compare(e.Column.Caption, "Operación", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
        }

        protected void grdvPrecios_DataBinding(object sender, EventArgs e)
        {
            grdvPrecios.DataSource = Session["opln"];
        }
    }
}