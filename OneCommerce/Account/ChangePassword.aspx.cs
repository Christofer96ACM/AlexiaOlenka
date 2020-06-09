using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace OneCommerce {
	public partial class ChangePassword : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
		
        }

        protected void btnChangePassword_Click(object sender, EventArgs e) {
            MembershipUser user = Membership.GetUser(User.Identity.Name);
            if (!Membership.ValidateUser(user.UserName, tbCurrentPassword.Text)) {
                tbCurrentPassword.ErrorText = "Contraseña anterior no es válida";
                tbCurrentPassword.IsValid = false;
            }
            else if (!user.ChangePassword(tbCurrentPassword.Text, tbPassword.Text)) {
                tbPassword.ErrorText = "La contraseña no es válida";
                tbPassword.IsValid = false;
            }
            else
                Response.Redirect("~/");
        }
    }
}