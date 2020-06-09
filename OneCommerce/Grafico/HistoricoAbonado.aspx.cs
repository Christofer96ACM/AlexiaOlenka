using BusinessEntities;
using BusinessRules;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OneCommerce.Grafico
{
    public partial class HistoricoAbonado: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEAbonado> GET_VALORES_ABONADO(string IP, string USERNAME, string PASSWORD)
        {
            var obep = new BEParameters()
            {
                DIRECCIONIP = IP,
                USUARIOMKT = USERNAME,
                PASSWORDMKT = PASSWORD,
                U_DXP_COD_ABONADO = "0036",
            };
            var obrd = new BRDocument();
            var olst = obrd.HISTORICO_ABONADO(obep);
            return (olst);
        }

    }
}