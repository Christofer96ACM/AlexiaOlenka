using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessEntities;
using BusinessRules;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using BusinessServices;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxCallback;
using System.Web.Services;
using System.Web.Script.Services;
using DevExpress.Web.ASPxNavBar;
using DevExpress.Web.ASPxClasses;

namespace OneCommerce.Sales
{
    public partial class RegisterConsult1 : System.Web.UI.Page
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
                ASPxWebControl.GlobalTheme = "Office2003Blue";
            }
        }
        private static BEDocument ocno;
        private BRDocument brd = new BRDocument();
        private BEParameters bepar = new BEParameters();
        private  List<BEInitialData> beparlist = new List<BEInitialData>();
        private List<BEInitialData> beplistauto = new List<BEInitialData>();
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
                    if (obec.Permition == "001")
                    {
                        FormsAuthentication.SignOut();
                        FormsAuthentication.RedirectToLoginPage();
                    }
                    else
                    {
                        Session["dln1"] = new List<BEDocumentLine>();
                        Session["ocrd"] = new List<BEClient>();
                        Session["oitm"] = new List<BEProduct>();
                        hdfTemp.Add("theme", ASPxWebControl.GlobalTheme);
                        hdfTemp.Add("_emid", obec.U_BF_EMID);
                        hdfTemp.Add("_soci", obec.Socied);
                        hdfTemp.Add("_proj", obec.Project);
                        hdfTemp.Add("Reserve", string.Empty);
                        hdfTemp.Add("_distri", string.Empty);
                        hdfTemp.Add("_xmsg", string.Empty);
                        if (Session["cnoi"] != null)
                        {
                            ocno = (BEDocument)Session["cnoi"];
                            var i = 1;
                            ocno.Lines.ForEach(item =>
                            {
                                item.LineNum = i;
                                i += 1;
                            });

                            hdfTemp.Set("Reserve", ocno.Reserve);
                            Session["dln1"] = ocno.Lines;
                            Session["cnoi"] = null;
                        }
                        //Init_VarSessions();
                        Set_Permissions();
                        var mmp = ((ASPxNavBar)Master.FindControl("nvbMain"));
                       
                        var _sd = ((string.Compare(obec.Socied, "BT", false) == 0) ? "Botica Francesa" : "Belmay");
                        ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Socied")).InnerText = _sd;
                        ((HtmlAnchor)BSFindControl.FindControlRecursive(Master, "Local")).InnerText = obec.DscpLocal;
                        ((ASPxLabel)BSFindControl.FindControlRecursive(Master, "lblTypeChange")).Text = "Tipo de Cambio: " + obec.Rate.ToString("c3");
                    }


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
            FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Masters").Visible = false;
            var obec = ((BEParameters)Session["InitPar"]);
            if (obec.Permition == "001")
            {
                if (obec.Socied == "BM")
                    FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("ARInvoice").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("CreditNote").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Reports").Visible = false;
            }
            else if (obec.Permition == "003")
            {
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("Quotation").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("SalesOrder").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("APInvoice").Enabled = false;
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Sales").Items.FindByName("DeliveryNote").Enabled = false;
            }
            if (obec.U_BF_ADMIN == 0)
                FindControl<ASPxNavBar>(Master, "nvbMain").Groups.FindByName("Administrator").Visible = false;
        }
        //private void Init_VarSessions()
        //{
        //    var obec = ((BEParameters)Session["InitPar"]);
        //    Session["cnoi"] = null;
        //    Session["inv1"] = new List<BEDocumentLine>();
        //    Session["inv2"] = new List<BEDocumentLine>();
        //    Session["ocrd"] = new List<BEClient>();
        //    Session["oitm"] = new List<BEProduct>();
        //    Session["oinv"] = new List<BEDocument>();
        //    Session["bord"] = new List<BEDocumentLine>();
        //    hdfTemp.Add("_emid", obec.U_BF_EMID);
        //    hdfTemp.Add("_soci", obec.Socied);
        //    hdfTemp.Add("_proj", obec.Project);
        //    hdfTemp.Add("_whsc", obec.WhsCode);
        //    hdfTemp.Add("_cpnadd", obec.CompanyAddress.ToUpper());
        //    hdfTemp.Add("_phone", obec.Phone);
        //    hdfTemp.Add("_SerieM", obec.SerieMaqr);
        //}
        /// <summary>
        /// LISTA DEPARTAMENTO,PROVINCIA,DISTRITO
        /// </summary>
        /// <param name="socied"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEInitialData> Get_Dat_prov(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_SP_LIST_DIST(obep);
            return (olst);
        }
        /// <summary>
        /// Datos Iniciales
        /// </summary>
        /// <param name="socied"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEInitialData> Get_InitialData(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_DAIN(obep);
            return (olst);
        }
        /// <summary>
        /// LISTA SOLO DISTRITO
        /// </summary>
        /// <param name="socied"></param>
        /// <param name="prov"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEInitialData> Get_InitialDistri(string socied, string prov)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
                Prov = prov
            };
            var obrd = new BRDocument();
            var olst = obrd.Get_SP_LIST_DIST_PROV(obep);
            return (olst);
        }
        /// <summary>
        /// Lista de Tipo de Cliente
        /// </summary>
        /// <param name="socied"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEInitialData> Get_InitialTipClie(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied,
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_SP_TIP_CLIE(obep);
            return (olst);
        }
        private string cod_user(string socied) {
            bepar.Socied = socied;
            bepar.ItemCode = cboresponsableventa.SelectedItem.Text;
            beparlist = brd.Get_SP_CODIGO_USUARIO(bepar);
            string codigo = beparlist[0].Code.ToString();
            return codigo;
        }
        private string BusinessPartner()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            bepar.Socied = obec.Socied;
            if (cbbCrPersonType.Value.ToString() == "TPN")
                beplistauto = brd.Get_sp_selCodigoNAIAH(bepar);
            else
                beplistauto = brd.Get_sp_selCodigoRUCNAIAH(bepar);
            var obj = new BEBusinessPartner();
            obj.Socied = obec.Socied;
            obj.CardCode = txtCrCardCode.Text;
            obj.CardName = txtapepater.Text +" "+ txtapemater.Text+" "+ txtCrCardName.Text;
            obj.U_PN_Docum = txtCrLicTradNum.Text;
            obj.LicTradNum = beplistauto[0].DNI;
            obj.Phone1 = txtCrPhone1.Text;
            obj.Cellular = txtCrCellular.Text;
            obj.E_Mail = txtCrE_Mail.Text;
            //obj.U_BPP_BPTP = "TPN";
            //obj.U_BPP_BPTD = "1";
            obj.U_BPP_BPTP = cbbCrPersonType.Value.ToString();
            obj.U_BPP_BPTD = cbbCrDocumentType.Value.ToString();
            obj.U_BPP_BPAP = txtapepater.Text;
            obj.U_BPP_BPAM = txtapemater.Text;
            obj.U_BPP_BPNO = txtCrCardName.Text;
            obj.U_PN_CodGrup = cbonegocio.Value.ToString();//verificar q salga descripcion
            obj.SlpCode =Convert.ToInt32(cod_user(obj.Socied));//Convert.ToInt32(cboresponsableventa.Value.ToString());
            obj.U_PN_DirVive = rbttipovilla.SelectedItem.Text + ". " + txtnombredirec.Text; ;
            obj.U_PN_DepDirVive = cbodepartamento.SelectedItem.Text;
            obj.U_PN_ProvDirVive = cboprovincia.SelectedItem.Text;
            obj.U_PN_DistDirVive = cbodistrito.SelectedItem.Text;//cbodistrito.Value.ToString(); ;
            obj.U_PN_DirViveRefe = txtreferencia.Text;
            obj.U_PN_Vend = rbtnsexo.SelectedItem.Text;
            obj.Free_Text = memocoment.Text;

            var obec2 = ((BEParameters)Session["InitPar2"]);
            var obj2 = new BEBusinessPartner();
            obj2.Socied = (obec.Socied=="BM")?"BT":"BM";
            obj2.CardCode = txtCrCardCode.Text;
            obj2.CardName = txtapepater.Text + " " + txtapemater.Text + " " + txtCrCardName.Text;
            obj2.U_PN_Docum = txtCrLicTradNum.Text;
            obj2.LicTradNum = beplistauto[0].DNI;
            obj2.Phone1 = txtCrPhone1.Text;
            obj2.Cellular = txtCrCellular.Text;
            obj2.E_Mail = txtCrE_Mail.Text;
            //obj2.U_BPP_BPTP = "TPN";
            //obj2.U_BPP_BPTD = "1";
            obj2.U_BPP_BPTP = cbbCrPersonType.Value.ToString();
            obj2.U_BPP_BPTD = cbbCrDocumentType.Value.ToString();
            obj2.U_BPP_BPAP = txtapepater.Text;
            obj2.U_BPP_BPAM = txtapemater.Text;
            obj2.U_BPP_BPNO =  txtCrCardName.Text;
            obj2.U_PN_CodGrup = cbonegocio.Value.ToString();//verificar q salga descripcion
            obj2.SlpCode = Convert.ToInt32(cod_user(obj2.Socied));//Convert.ToInt32(cboresponsableventa.Value.ToString());
            obj2.U_PN_DirVive = rbttipovilla.SelectedItem.Text + ". " + txtnombredirec.Text; ;
            obj2.U_PN_DepDirVive = cbodepartamento.SelectedItem.Text;
            obj2.U_PN_ProvDirVive = cboprovincia.SelectedItem.Text;
            obj2.U_PN_DistDirVive = cbodistrito.SelectedItem.Text;//cbodistrito.Value.ToString(); ;
            obj2.U_PN_DirViveRefe = txtreferencia.Text;
            obj2.U_PN_Vend = rbtnsexo.SelectedItem.Text;
            obj2.Free_Text = memocoment.Text;
            using (var obrd = new BRDocument())
            {
                obrd.SaveBusinessPartnerNaiah(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
                obrd.SaveBusinessPartnerNaiah(obj2, ((BEParameters)Session["InitPar2"]).objSapSbo);
            }
            var _err="";
            if (!string.IsNullOrWhiteSpace(obj.Msg))
            {
                _err = obj.Msg;
            }
            else {
                _err = "OKBP";
                bepar.dni = txtCrLicTradNum.Text;
                if (cbbCrPersonType.Value.ToString() == "TPN")
                    brd.set_dninaiah(bepar);
                else
                    brd.set_rucnaiah(bepar);
            }
            
            return (_err);
        }
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
               
                if (string.Compare(e.Parameter, "CrClient", false) == 0)
                {
                    e.Result = BusinessPartner();
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
    }
}