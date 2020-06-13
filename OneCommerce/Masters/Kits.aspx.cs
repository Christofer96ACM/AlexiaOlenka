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
    public partial class Kits : Page
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

            Session["oitt"] = new List<BEProduct>();
            Session["oitm"] = new List<BEProduct>();
            Session["owhs"] = new List<BEWhsCode>();
            Session["itt1"] = new List<BEProduct>();
            Session["oitw"] = new List<BEProduct>();

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
        protected void gdvProductSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GENERAL"))
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = txtParProduct.Text.Trim(),
                    WhsCode = obec.WhsCode,
                    VALOR = txtmarc.Text,
                    Descripcion = txtdescrip.Text
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_KITS(obep);
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
        private string SaveKits()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEProduct();

            obj.ItemCode = bteItemcode.Text;
            obj.ItemName = txtItemName.Text;
            obj.TreeType = cbbTreeType.Value.ToString();
            obj.HideComp = checkHideComp.Value.ToString();
            obj.Hijos = ((List<BEProduct>)Session["itt1"]);

            using (var obrd = new BRDocument())
            {
                obrd.SaveKits(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
            return (_err);
        }
        private string UpdateKits()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEProduct();

            obj.ItemCode = bteItemcode.Text;
            obj.ItemName = txtItemName.Text;
            obj.TreeType = cbbTreeType.Value.ToString();
            obj.HideComp = checkHideComp.Value.ToString();
            obj.Hijos = ((List<BEProduct>)Session["itt1"]);

            using (var obrd = new BRDocument())
            {
                obrd.UpdateKits(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "OKBP";
            return (_err);
        }

        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveKits"))
                {
                    e.Result = SaveKits();
                }
                else if (e.Parameter.Contains("UpdateKits"))
                {
                    e.Result = UpdateKits(); ;
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

        protected void gdvHijos_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.VisibleIndex == -1) return;
            var obec = ((BEParameters)Session["InitPar"]);

            if (!string.IsNullOrWhiteSpace(bteItemcode.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New ||
                    e.ButtonType == ColumnCommandButtonType.Edit ||
                    e.ButtonType == ColumnCommandButtonType.Delete)
                {
                    e.Enabled = true;
                }
            }
        }

        protected void gdvHijos_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gdvHijos.EditingRowVisibleIndex;

            ((List<BEProduct>)Session["itt1"])[index].Code = Convert.ToString(e.NewValues["Code"]);
            ((List<BEProduct>)Session["itt1"])[index].ItemName = Convert.ToString(e.NewValues["ItemName"]);
            ((List<BEProduct>)Session["itt1"])[index].Quantity2 = Convert.ToDecimal(e.NewValues["Quantity2"]);
            ((List<BEProduct>)Session["itt1"])[index].InvntryUom = Convert.ToString(e.NewValues["InvntryUom"]);
            ((List<BEProduct>)Session["itt1"])[index].Warehouse = Convert.ToString(e.NewValues["Warehouse"]);
            Set_LineNum();
            gdvHijos.CancelEdit();
            e.Cancel = true;
            gdvHijos.DataSource = ((List<BEProduct>)Session["itt1"]);
            gdvHijos.DataBind();
        }
        private void Set_LineNum()
        {
            var i = 1;
            ((List<BEProduct>)Session["itt1"]).ForEach(item =>
            {
                item.ChildNum = i;
                i += 1;
            });
        }
        protected void gdvHijos_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "ItemName", false) == 0 ||
                string.Compare(e.Column.FieldName, "Warehouse", false) == 0 ||
                string.Compare(e.Column.FieldName, "InvntryUom", false) == 0)
            {
                e.Editor.ReadOnly = true;
            }
            else
            {
                e.Editor.ReadOnly = false;
            }
            if (string.Compare(e.Column.FieldName, "Code", false) == 0)
            {
                e.Editor.Focus();
            }
        }

        protected void gdvHijos_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var x = ((List<BEProduct>)Session["itt1"]).Count;
            var line = new BEProduct()
            {
                Code = Convert.ToString(e.NewValues["Code"]),
                ItemName = Convert.ToString(e.NewValues["ItemName"]),
                Warehouse = Convert.ToString(e.NewValues["Warehouse"]),
                Quantity2 = Convert.ToDecimal(e.NewValues["Quantity2"]),
                InvntryUom = Convert.ToString(e.NewValues["InvntryUom"]),
                Linea = x
            };
            Set_LineNum();
            ((List<BEProduct>)Session["itt1"]).Add(line);
            gdvHijos.CancelEdit();
            e.Cancel = true;
            gdvHijos.DataSource = ((List<BEProduct>)Session["itt1"]);
            gdvHijos.DataBind();
        }

        protected void gdvHijos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GET"))
            {
                var spl = e.Parameters.Split(':');
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = spl[1],
                    //WhsCode = obec.WhsCode
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_HIJOS_KITS(obep);
                Session["itt1"] = olst;
                gdvHijos.DataSource = olst;
                gdvHijos.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEProduct>)Session["itt1"]).Clear();
                gdvHijos.DataSource = Session["itt1"];
                gdvHijos.DataBind();
            }
            else if (e.Parameters.Contains("ADDPRODUCT"))
            {
                var spl = e.Parameters.Split(':');
                var Hijo = spl[1].Split(',');
                var line = new BEProduct()
                {
                    Code = Hijo[0],
                    ItemName = Hijo[1],
                    Quantity2 = Convert.ToDecimal(Hijo[2]),
                    InvntryUom = Hijo[4],
                    Warehouse = Hijo[3]
                };
                ((List<BEProduct>)Session["itt1"]).Add(line);
                Set_LineNum();
                gdvHijos.DataSource = Session["itt1"];
                gdvHijos.DataBind();
            }
        }

        protected void gdvHijos_DataBinding(object sender, EventArgs e)
        {
            gdvHijos.DataSource = Session["itt1"];
        }

        protected void gdvProductSearch2_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GENERAL"))
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = txtParProduct2.Text.Trim(),
                    WhsCode = obec.WhsCode,
                    VALOR = txtmarc2.Text,
                    Descripcion = txtdescrip2.Text
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_ITEM_SEGUN_ALMACEN(obep);
                Session["oitw"] = olst;
                gdvProductSearch2.DataSource = olst;
                gdvProductSearch2.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEProduct>)Session["oitw"]).Clear();
                gdvProductSearch2.DataSource = Session["oitw"];
                gdvProductSearch2.DataBind();
            }
        }

        protected void gdvProductSearch2_DataBinding(object sender, EventArgs e)
        {
            gdvProductSearch2.DataSource = Session["oitw"];
        }

        protected void gdvHijos_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gdvHijos.FindVisibleIndexByKeyValue(e.Keys[gdvHijos.KeyFieldName]);
            var _lnm = (i + 1);
            {
                ((List<BEProduct>)Session["itt1"]).RemoveAll(item => item.ChildNum == _lnm);
            }
            Set_LineNum();
            gdvHijos.DataSource = ((List<BEProduct>)Session["itt1"]);
            gdvHijos.DataBind();
        }

        protected void gdvProductSearch3_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GENERAL"))
            {
                var obep = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = txtParProduct3.Text.Trim(),
                    WhsCode = obec.WhsCode,
                    VALOR = txtmarc3.Text,
                    Descripcion = txtdescrip3.Text
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_ITEM_SEGUN_ALMACEN(obep);
                Session["oitt"] = olst;
                gdvProductSearch3.DataSource = olst;
                gdvProductSearch3.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEProduct>)Session["oitt"]).Clear();
                gdvProductSearch3.DataSource = Session["oitt"];
                gdvProductSearch3.DataBind();
            }
        }

        protected void gdvProductSearch3_DataBinding(object sender, EventArgs e)
        {
            gdvProductSearch3.DataSource = Session["oitt"];
        }
    }
}