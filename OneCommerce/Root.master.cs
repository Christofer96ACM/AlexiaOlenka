using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxClasses.Internal;

namespace OneCommerce {
    public partial class RootMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            ASPxLabel2.Text = DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright by ALEXIA CLOUD");
        }
    }
}