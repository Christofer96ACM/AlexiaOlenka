using System;
using System.Web.UI;
using DevExpress.DashboardWeb;
using System.Data;
using BusinessEntities;
using BusinessRules;
using System.IO;
using DevExpress.XtraCharts;
using System.Collections.Generic;
using System.Linq;
using DevExpress.Web.ASPxClasses;
using System.Web;

namespace OneCommerce.Reportes
{
    public partial class Dashboard : System.Web.UI.Page
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
        private  BRLogin obrl;
        protected string XML_Filename = "~/Reportes/Config/DashboardVentas.xml";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var obec = ((BEParameters)Session["InitPar"]);

                caleInicio.Value = new DateTime(DateTime.Now.Year, 1, 1);
                caleFin.Value = new DateTime(DateTime.Now.Year, 12, 31);
                hffechaInicio.Value = ((DateTime)caleInicio.Value).ToString("dd/MM/yyyy");
                hffechaFin.Value = ((DateTime)caleFin.Value).ToString("dd/MM/yyyy");
                var obep = new BEParameters()
                {
                    DateIn = (DateTime)caleInicio.Value,
                    DateFi = (DateTime)caleFin.Value,
                    Project = "",
                    Socied = obec.Socied,
                    UserName = obec.UserName
                };



                obrl = new BRLogin();
                List<BELogin> olst = obrl.Get_DS_SCSP_LSPJ_OPRJ(obep);

                var str = String.Join(",", olst.Select(p => p.PrjCode));
                obep.Project = str;

                Session["obep"] = obep;


                var seleccionar = new BELogin
                {
                    PrjName = "<Todos>",
                    PrjCode = "-"
                };
                olst.Add(seleccionar);

                navigateComboBox.DataSource = olst;
                navigateComboBox.DropDownStyle = DevExpress.Web.ASPxEditors.DropDownStyle.DropDownList;
                navigateComboBox.DataBind();
                navigateComboBox.SelectedIndex = olst.Count() - 1;

                cargarDasboard(obep);
            }

        

      
            


        }
        void cargarDasboard(BEParameters obep)
        {
            var obrd = new BRDocument();
            var oVentas = obrd.Get_DS_OSCSP_SRCH_OINV(obep);
            Session["Ventas"] = oVentas;

            var oProducto = obrd.Get_DS_OSCSP_SRCH_INV1(obep);
            Session["Producto"] = oProducto;

            var oOrden = obrd.Get_DS_OSCSP_SRCH_ORDR(obep);
            Session["Orden"] = oOrden;

            var oCotizacion = obrd.Get_DS_OSCSP_SRCH_OQUT(obep);
            Session["Cotizacion"] = oOrden;
        }
        protected void dashboardViewer1_DashboardLoading(object sender, DashboardLoadingEventArgs e)
        {
            var xml = Server.MapPath(XML_Filename);
            string dashboardDefinition = File.ReadAllText(xml);
            e.DashboardXml = dashboardDefinition;

        }
        protected void dashboardViewer1_DataLoading(object sender, DataLoadingWebEventArgs e)
        {
            if (e.DataSourceName == "Ventas")
                e.Data = Session["Ventas"];
            else if (e.DataSourceName == "Producto")
                e.Data = Session["Producto"];
            else if (e.DataSourceName == "Orden")
                e.Data = Session["Orden"];
            else if (e.DataSourceName == "Cotizacion")
                e.Data = Session["Cotizacion"];
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            BEParameters obep = (BEParameters)Session["obep"];
            if (navigateComboBox.Value.ToString() == "-")
            {
                obrl = new BRLogin();
                List<BELogin> olst = obrl.Get_DS_SCSP_LSPJ_OPRJ(obep);

                var str = String.Join(",", olst.Select(p => p.PrjCode));
                obep.Project = str;
            }
            else
            {
                obep.Project = navigateComboBox.Value.ToString();
            }
            obep.DateIn = (DateTime)caleInicio.Value;
            obep.DateFi = (DateTime)caleFin.Value;
            hffechaInicio.Value = ((DateTime)caleInicio.Value).ToString("dd/MM/yyyy");
            hffechaFin.Value = ((DateTime)caleFin.Value).ToString("dd/MM/yyyy");
            cargarDasboard(obep);
           
        }
   
    }
}