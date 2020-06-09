using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using BusinessEntities;
using BusinessRules;
using DevExpress.Web.ASPxEditors;
using BusinessServices;

namespace OneCommerce {
    public partial class Login : System.Web.UI.Page
    {

        private readonly BRLogin obrl;
        static string valor_sociedad = "";
        static string NOMBRE_BD = "";
        public static List<BELogin> proyectos;
        public Login()
        {
            obrl = new BRLogin();
        }
        /// <summary>
        /// LISTA LOS LOCALES
        /// </summary>
        /// <returns></returns>
        
        private void Get_Locals()
        {
            var obep = new BEParameters() { Socied = "ApplicationServices",
                RUC = txtruc.Text,
            };
            var olst = obrl.Get_SCSP_LSPJ_OPRJ(obep);
            bool band = true;
            proyectos = olst;

            olst.ForEach(item =>
            {
                if (band)
                {
                    valor_sociedad = item.alf_soci;
                    NOMBRE_BD = item.NOMBRE_BD;
                    band = false;
                }
            });

            /*
            var _arl = new string[olst.Count];
            bool band = true;
            int y = 0;
            olst.ForEach(item =>
            {
                _arl[y] = string.Format("{0},{1},{2},{3},{4},{5},{6},{7},{8},{9},{10},{11}",   item.PrjCode, item.PrjName, item.alf_soci,
                                                                                               item.WhsCode, item.Rate, item.Permition,
                                                                                               item.CompanyAddress, item.Phone, item.SerieMaqr,
                                                                                               item.RUC, item.RAZON_SOCIAL,item.NOMBRE_BD);
                ((BEParameters)Session["InitPar"]).Rate = item.Rate;
                if (band) { 
                    valor_sociedad = item.alf_soci;
                    NOMBRE_BD = item.NOMBRE_BD;
                    band = false;
                }
                y += 1;
            });
            hdfLocal.Set("_lcl", _arl);*/
            hdfLocal.Set("_proyc", "");
            olst.Where(i => i.RUC == txtruc.Text)
                .ToList()
                .ForEach(item =>
                {
                    cbbProject.Items.Add(item.PrjName, item.PrjCode);
                });
            cbbProject.SelectedIndex = 0;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                Session["InitPar"] = new BEParameters();
                //Session["InitPar2"] = new BEParameters();
                //Get_Locals();
            }
        }
        protected void clbSession_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
        {
            try
            {
                e.Result = string.Empty;
                
                if (Membership.ValidateUser(UserName.Text.Trim(), Password.Text))
                {
                    string proyect =Convert.ToString(hdfLocal.Get("_proyc"));
                    List<BEParameters> lval = obrl.Get_val_usu(UserName.Text.Trim(), valor_sociedad, proyect);
                    if (lval.Count == 0 || lval[0].Permition == "0")
                    {
                        e.Result = "Val#";
                        FormsAuthentication.SignOut();
                    }
                    else
                    {
                        var _par = e.Parameter.Split(';');
                        ((BEParameters)Session["InitPar"]).Socied = valor_sociedad;
                        ((BEParameters)Session["InitPar"]).Project = _par[0];
                        ((BEParameters)Session["InitPar"]).DscpLocal = " - Local: " + _par[1];
 
                        proyectos.ToList().ForEach(item =>
                        {
                            if (item.alf_soci == valor_sociedad && item.PrjCode == _par[0])
                            {
                                ((BEParameters)Session["InitPar"]).WhsCode = item.WhsCode;
                                ((BEParameters)Session["InitPar"]).Rate = Convert.ToDecimal(item.Rate);
                                ((BEParameters)Session["InitPar"]).Permition = item.Permition;
                                ((BEParameters)Session["InitPar"]).CompanyAddress = item.CompanyAddress;
                                ((BEParameters)Session["InitPar"]).Phone = item.Phone;
                                ((BEParameters)Session["InitPar"]).SerieMaqr = item.SerieMaqr;
                                ((BEParameters)Session["InitPar"]).U_BF_ADMIN = lval[0].U_BF_ADMIN;
                                ((BEParameters)Session["InitPar"]).Band = false;
                                ((BEParameters)Session["InitPar"]).Currency = "";
                            }
                        });
                        /*((string[])hdfLocal.Get("_lcl")).ToList()
                                                        .ForEach(item =>
                                                        {
                                                            var _spl = item.Split(',');
                                                            if (_spl[2] == valor_sociedad && _spl[0] == _par[0])
                                                            {
                                                                ((BEParameters)Session["InitPar"]).WhsCode = _spl[3];
                                                                ((BEParameters)Session["InitPar"]).Rate = Convert.ToDecimal(_spl[4]);
                                                                ((BEParameters)Session["InitPar"]).Permition = _spl[5];
                                                                ((BEParameters)Session["InitPar"]).CompanyAddress = _spl[6];
                                                                ((BEParameters)Session["InitPar"]).Phone = _spl[7];
                                                                ((BEParameters)Session["InitPar"]).SerieMaqr = _spl[8];
                                                                ((BEParameters)Session["InitPar"]).U_BF_ADMIN = lval[0].U_BF_ADMIN;
                                                            }
                                                        });*/
                        var obep = new BEParameters();
                        obep.Socied = valor_sociedad;
                        obep.UserName = UserName.Text.Trim();
                        ((BEParameters)Session["InitPar"]).U_BF_EMID = obrl.Get_OSCSP_IDOH(obep);
                        obep.CompanyDB = NOMBRE_BD;
                        var osbo = new BRSboConnect();
                        ((BEParameters)Session["InitPar"]).objSapSbo = osbo.Get_ComConnect(obep);
                        if (!string.IsNullOrWhiteSpace(obep.Msg))
                        {
                            Session["InitPar"] = new BEParameters();
                            e.Result = obep.Msg;
                            FormsAuthentication.SignOut();
                        }
                        else
                        {
                            e.Result = "PERM#" + ((BEParameters)Session["InitPar"]).Permition;
                            FormsAuthentication.SetAuthCookie(UserName.Text.Trim(), false);
                        }
                    }
                }
                else
                {
                    e.Result = "USI#";
                }
            }
            catch (KeyNotFoundException ex)
            {
                e.Result = ex.Message;
            }
        }
        protected void cbbProject_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameter.Contains("Locales"))
            {
                Get_Locals();
            }
        }
    }
}