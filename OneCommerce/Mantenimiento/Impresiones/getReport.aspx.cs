using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using BusinessEntities;
using BusinessRules;

namespace OneCommerce
{
    public partial class getReport : System.Web.UI.Page
    {
        private static BEDocument ocno;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["print"] != null)
            {
                ocno = (BEDocument)Session["print"];
                var obec = ((BEParameters)Session["InitPar"]);
                var obrd = new BRDocument();
                ReportDocument cryRpt = new ReportDocument();
                var list = obrd.DXP_GET_URL_FORMATOIMPRESION(new BEParameters() { Socied = obec.Socied });
                //
                list.Where(item => item.U_DXP_NOMBRE_PARAMET == ocno.formatoImpresion).ToList().ForEach(i =>
                {
                    cryRpt.Load(i.U_DXP_VALOR_PARAMETR);
                });

                string var1 = ocno.DocEntry.ToString();//Request.QueryString["docEnry"];
                String strServer = "SRV-SQL01";
                String strDatabase = obec.CompanyDB;
                String strUserID = "sa";
                String strPwd = "MPP@SW0RD";
                CrystalReportViewer1.Width = new Unit("2000px");
                CrystalReportViewer1.Height = new Unit("2000px");

                cryRpt.DataSourceConnections[0].SetConnection(strServer, strDatabase, strUserID, strPwd);

                cryRpt.SetParameterValue(0, var1);
                CrystalReportViewer1.ReportSource = cryRpt;

                cryRpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Crystal");
                Response.End();

            }

            ///////////////////////////////////////////////////////////////////////

            //ReportDocument cryRpt = new ReportDocument();
            ////string rpt = Request.QueryString["rpt"];
            //cryRpt.Load(Server.MapPath("FacturaOdex.rpt"));
            //string var1 = "18";//Request.QueryString["docEnry"];

            //String strServer = "SRV-SQL01";
            //String strDatabase = "SBO_DEXO";
            //String strUserID = "sa";
            //String strPwd = "MPP@SW0RD";
            //CrystalReportViewer1.Width = new Unit("2000px");
            //CrystalReportViewer1.Height = new Unit("2000px");

            //cryRpt.DataSourceConnections[0].SetConnection(strServer, strDatabase, strUserID, strPwd);

            //cryRpt.SetParameterValue(0, var1);
            //CrystalReportViewer1.ReportSource = cryRpt;

            //cryRpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Crystal");
            //Response.End();


        }
       
    }
}