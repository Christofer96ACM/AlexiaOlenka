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
    public partial class DashboardService : System.Web.UI.Page
    {
        protected string XML_Filename = "~/Reportes/Config/DashboardServicios.xml";
        private BRLogin obrl;
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
                    UserName = obec.UserName,
                    CardCode= "0"
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
            obep.CardCode = "0";
            var oLlamadaServicio = obrd.Get_DS_OSCSP_SRCH_OSCL(obep);
            Session["LlamadaServicio"] = oLlamadaServicio;

            obep.CardCode = "";
            var oLlamadaServicioTecnico = obrd.Get_DS_OSCSP_SRCH_OSCL(obep);
            Session["LlamadaServicioTecnico"] = oLlamadaServicioTecnico;

         
        }
        protected void dashboardViewer1_DashboardLoading(object sender, DashboardLoadingEventArgs e)
        {
            var xml = Server.MapPath(XML_Filename);
            string dashboardDefinition = File.ReadAllText(xml);
            e.DashboardXml = dashboardDefinition;

        }
        protected void dashboardViewer1_DataLoading(object sender, DataLoadingWebEventArgs e)
        {
            if (e.DataSourceName == "LlamadaServicio")
                e.Data = Session["LlamadaServicio"];
            else if (e.DataSourceName == "LlamadaServicioTecnico")
                e.Data = Session["LlamadaServicioTecnico"];
    
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