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
    public partial class TarjetaEquipo : Page
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

            Session["oins"] = new List<BETarjetaEquipo>();
            Session["oscl"] = new List<BELlamadaServicio>();
            Session["oitm"] = new List<BEProduct>();
            Session["ocrd"] = new List<BEClient>();

        }
        private string SaveTarjeta()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BETarjetaEquipo();

            obj.CardCode = bteCustomer.Text;
            obj.CardName = txtcustmrName.Text;
            obj.Status = cbbstatus.Value.ToString();
            obj.ItemCode = bteitemCode.Text;
            obj.ItemName = txtitemName.Text;
            obj.manufSN = txtmanufSN.Text;
            obj.internalSN = txtinternalSN.Text;
            obj.instLction = cbbAddress.Text;
            obj.street = txtStreets1.Text;
            obj.county = txtDistrito1.Text;
            obj.state = txtDepartamento1.Text;
            obj.U_GOS_MARCA = txtMarca.Text;
            obj.U_GOS_MODELO = txtModelo.Text;
            //obj.ContactPerson = Convert.ToString(txtcontctCode1.Value);
            
            using (var obrd = new BRDocument())
            {
                obrd.SaveTarjeta(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKBP#{0}", obj.insID);
            //Init_VarSessions();
            return (_err);
        }
        private string UpdtTarjeta()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BETarjetaEquipo();

            obj.Status = cbbstatus.Value.ToString();
            obj.insID = Convert.ToInt32(txtinsID.Text);

            using (var obrd = new BRDocument())
            {
                obrd.UpdtTarjeta(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "IKCC";
            //Init_VarSessions();
            return (_err);
        }
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveTarjeta"))
                {
                    e.Result = SaveTarjeta();
                }
                else if (e.Parameter.Contains("UpdtTarjeta"))
                {
                    e.Result = UpdtTarjeta();
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

        protected void gdvTarjeta_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GET"))
            {
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = txtProducto.Text,
                    CardCode = txtCliente.Text,
                    SerieMaqr = txtSerie.Text
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_TARJETAEQUIPO(obj);
                Session["oins"] = olst;
                gdvTarjeta.DataSource = olst;
                gdvTarjeta.DataBind();
            }
        }

        protected void gdvTarjeta_DataBinding(object sender, EventArgs e)
        {
            gdvTarjeta.DataSource = Session["oins"];
        }

        protected void grdvLlamada_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GET"))
            {
                var spl = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    ItemCode = spl[2],
                    CardCode = spl[1],
                    SerieMaqr = spl[3]
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_SERVICIO_TJ(obj);
                Session["oscl"] = olst;
                grdvLlamada.DataSource = olst;
                grdvLlamada.DataBind();
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BELlamadaServicio>)Session["oscl"]).Clear();
                grdvLlamada.DataSource = Session["oscl"];
                grdvLlamada.DataBind();
            }
        }

        protected void grdvLlamada_DataBinding(object sender, EventArgs e)
        {
            grdvLlamada.DataSource = Session["oscl"];
        }
    }
}