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
using System.Collections;

namespace OneCommerce.Finanzas
{
    public partial class Asiento : Page
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

            Session["oitm"] = new List<BEProduct>();
            Session["oscl"] = new List<BELlamadaServicio>();
            Session["ocrd"] = new List<BEBusinessPartner>();
            Session["tcns"] = new List<BEBusinessPartner>();
            Session["tecn"] = new List<BEBusinessPartner>();

            Session["asiento"] = new List<BEAsiento>();
            Session["asientoPrinc"] = new List<BEDocumentLine>();
            Session["proyecto"] = new List<BEAsiento>();
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("adrtype", string.Empty);
        }
        //!+ RUTINAS AJAX
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEParameters> DXP_GET_VALORES_ASIENTO(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_VALORES_ASIENTO(obep);
            return (olst);
        }

        private string SaveAsiento()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEAsiento();

            obj.Series = cbbnumero.Text;
            obj.Number = Convert.ToInt32(cbbnumero.Value);
            obj.RefDate = Convert.ToDateTime(txtRefDate.Value);
            obj.DueDate= Convert.ToDateTime(txtDueDate.Value);
            obj.TaxDate= Convert.ToDateTime(txtTaxDate.Value);
            obj.Memo = txtmemo.Text;
            obj.Indicator = Convert.ToString(cbbIndicator.Value);
            obj.Project = bteProject.Text;
            obj.TransCode = Convert.ToString(cbbTransCode.Value);
            obj.Ref1 = txtRef1.Text;
            obj.Ref2 = txtRef2.Text;
            obj.Ref3 = txtRef3.Text;

            if (chktipocamb.Value == "Y"){
                obj.Transrate = Convert.ToDecimal(txttipocambio.Text);
            }
           
            
            obj.OrignCurr = Convert.ToString(cbbmoneda.Value);
            obj.StornoDate = Convert.ToDateTime(txtanular.Value);

            obj.AutoStorno = Convert.ToString(chkretencion.Value);
            obj.AdjTran= Convert.ToString(chkajuste.Value);
            obj.AutoVAT= Convert.ToString(chkimpu.Value);
            obj.AutoWT= Convert.ToString(chkretencion.Value);
            obj.TipoC= Convert.ToString(chktipocamb.Value);

            obj.U_GOS_ESTDOC_LE = Convert.ToString(cbbestadodoc.Value);
            obj.U_GOS_FECHA_LE = txtlibroelec.Text;
            obj.U_MSS_TransIdAD =Convert.ToInt32(txtdocdes.Text);

            obj.Lines = ((List<BEDocumentLine>)Session["asientoPrinc"]);

            
            

            using (var obrd = new BRDocument())
            {
              obrd.SaveAsiento(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKBP", obj.TransId);
            //Init_VarSessions();
            return (_err);
        }
        private string UpdtAsiento()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEAsiento();
            obj.Series = cbbnumero.Text;
            obj.TransId = Convert.ToInt32(txtTransId.Text);
            obj.DueDate = Convert.ToDateTime(txtDueDate.Value);
            obj.Memo = txtmemo.Text;
            obj.Indicator = Convert.ToString(cbbIndicator.Value);
            obj.Project = bteProject.Text;
            obj.TransCode = Convert.ToString(cbbTransCode.Value);
            obj.Ref1 = txtRef1.Text;
            obj.Ref2 = txtRef2.Text;
            obj.Ref3 = txtRef3.Text;
            obj.TipoC =  Convert.ToString(chktipocamb.Value);
            obj.AutoStorno = Convert.ToString(chkanular.Value);
            obj.StornoDate = Convert.ToDateTime(txtanular.Value);
            obj.AdjTran = Convert.ToString(chkajuste.Value);

            obj.U_GOS_ESTDOC_LE = Convert.ToString(cbbestadodoc.Value);
            obj.U_GOS_FECHA_LE = txtlibroelec.Text;
            obj.U_MSS_TransIdAD = Convert.ToInt32(txtdocdes.Text);

            obj.Lines = ((List<BEDocumentLine>)Session["asientoPrinc"]);

            using (var obrd = new BRDocument())
            {
                obrd.UpdtAsiento(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "IKCC";
            //Init_VarSessions();
            return (_err);
        }
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (e.Parameter.Contains("SaveAsiento"))
                {
                    e.Result = SaveAsiento();
                }
                else if (e.Parameter.Contains("UpdtAsiento"))
                {
                    e.Result = UpdtAsiento();
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
       
       
     

        protected void gdvAsiento_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtTransId.Text))
            {
                if (e.ButtonType == ColumnCommandButtonType.New ||
                   
                    e.ButtonType == ColumnCommandButtonType.Delete)
                {
                    e.Enabled = false;
                }
               
            }

        }

        protected void gdvAsiento_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obep = new BEParameters();

            if (e.Parameters.Contains("SRCH"))
            {
                obep.Socied = obec.Socied;
                obep.TransId = Convert.ToInt32(txtTransId.Text);



                var olst = new List<BEDocumentLine>();
                var obrd = new BRDocument();
                olst = obrd.Get_OSCSP_SRCH_JDT1(obep);
                Session["asientoPrinc"] = olst;
                gdvAsiento.DataSource = ((List<BEDocumentLine>)Session["asientoPrinc"]);
                gdvAsiento.DataBind();
            }

           

            else  if (e.Parameters.Contains("CLR"))
            {
                
                ((List<BEDocumentLine>)Session["asientoPrinc"]).Clear();
                gdvAsiento.DataSource = Session["asientoPrinc"];
                gdvAsiento.DataBind();
            }

        }

        protected void gdvAsiento_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            gdvAsiento.DoRowValidation();
            var index = gdvAsiento.EditingRowVisibleIndex;
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].Credit = Convert.ToDecimal(e.NewValues["Credit"]);
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].Debit = Convert.ToDecimal(e.NewValues["Debit"]);
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].Price = Convert.ToDecimal(e.NewValues["Price"]);
            var x1 = Convert.ToString(e.NewValues["DueDated"]).Substring(0, 10).Split('/');
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].DueDated = x1[1] + "/" + x1[0] + "/" + x1[2];

            
            //((List<BEDocumentLine>)Session["asientoPrinc"])[index].DueDated = Convert.ToString(e.NewValues["DueDated"]);
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].Projectd = Convert.ToString(e.NewValues["Projectd"]);
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].LineMemo = Convert.ToString(e.NewValues["LineMemo"]);
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].Ref1d = Convert.ToString(e.NewValues["Ref1d"]);
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].Ref2d = Convert.ToString(e.NewValues["Ref2d"]);
            ((List<BEDocumentLine>)Session["asientoPrinc"])[index].Ref3Line = Convert.ToString(e.NewValues["Ref3Line"]);

            // gdvAsiento.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvAsiento.CancelEdit();
            e.Cancel = true;
            gdvAsiento.DataSource = ((List<BEDocumentLine>)Session["asientoPrinc"]);
            gdvAsiento.DataBind();
        }

        protected void gdvAsiento_DataBinding(object sender, EventArgs e)
        {

            gdvAsiento.DataSource = Session["asientoPrinc"];
           
           
        }

        protected void gdvAsiento_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            gdvAsiento.DoRowValidation();
            var obec = ((BEParameters)Session["InitPar"]);
            var line = new BEDocumentLine();

            line.ShortName = Convert.ToString(e.NewValues["ShortName"]);
            line.AcctName = Convert.ToString(e.NewValues["AcctName"]);
            line.Account = Convert.ToString(e.NewValues["Account"]);
            line.Debit = Convert.ToDecimal(e.NewValues["Debit"]);
            line.Credit = Convert.ToDecimal(e.NewValues["Credit"]);

            line.LineMemo = Convert.ToString(e.NewValues["LineMemo"]);
            line.Ref1d = Convert.ToString(e.NewValues["Ref1d"]);
            line.Ref2d = Convert.ToString(e.NewValues["Ref2d"]);
            line.Ref3Line = Convert.ToString(e.NewValues["Ref3Line"]);
            
            var x1 = Convert.ToString(e.NewValues["DueDated"]).Substring(0,10).Split('/');
            line.DueDated = x1[1] + "/" + x1[0] + "/" + x1[2];

            line.RefDated = Convert.ToString(DateTime.Today);

            var x2 = Convert.ToString(e.NewValues["TaxDated"]).Substring(0, 10).Split('/');
            line.TaxDated = x2[1] + "/" + x2[0] + "/" + x2[2];
            line.Projectd = Convert.ToString(e.NewValues["Projectd"]);
            
            ((List<BEDocumentLine>)Session["asientoPrinc"]).Add(line);
            Set_LineNum();

            //gdvAsiento.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["asiento"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvAsiento.CancelEdit();
            e.Cancel = true;
            gdvAsiento.DataSource = ((List<BEDocumentLine>)Session["asientoPrinc"]);
            gdvAsiento.DataBind();
        }

        protected void gdvAsiento_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
              if (txtTransId.Text != "" &&
              (string.Compare(e.Column.FieldName, "ShortName", false) == 0 ||
              string.Compare(e.Column.FieldName, "AcctName", false) == 0 ||
               string.Compare(e.Column.FieldName, "Account", false) == 0 ||
                string.Compare(e.Column.FieldName, "Debit_ME", false) == 0 ||
                 string.Compare(e.Column.FieldName, "Credit_ME", false) == 0 ||
                string.Compare(e.Column.FieldName, "Credit", false) == 0 ||
                string.Compare(e.Column.FieldName, "Debit", false) == 0 ||
                string.Compare(e.Column.FieldName, "Debit_MS", false) == 0 ||
                 string.Compare(e.Column.FieldName, "Credit_MS", false) == 0 ||
                string.Compare(e.Column.FieldName, "RefDated", false) == 0 ||
                string.Compare(e.Column.FieldName, "TaxDated", false) == 0))
            {
                e.Editor.ReadOnly = true;
            }


            else if ((string.Compare(e.Column.FieldName, "AcctName", false) == 0 ||
                string.Compare(e.Column.FieldName, "Debit", false) == 0 ||
                string.Compare(e.Column.FieldName, "Credit", false) == 0 ||
                string.Compare(e.Column.FieldName, "LineMemo", false) == 0 ||
                string.Compare(e.Column.FieldName, "Ref1d", false) == 0 ||
                string.Compare(e.Column.FieldName, "Ref2d", false) == 0 ||
                string.Compare(e.Column.FieldName, "Ref3Line", false) == 0 ||
                string.Compare(e.Column.FieldName, "DueDated", false) == 0 ||
                string.Compare(e.Column.FieldName, "TaxDated", false) == 0 ||   
                string.Compare(e.Column.FieldName, "Projectd", false) == 0))
            {
                e.Editor.ReadOnly = false;
            }
           
            else
            {
                e.Editor.ReadOnly = true;
            }
            if (string.Compare(e.Column.FieldName, "ShortName", false) == 0)
            {
                e.Editor.Focus();
            }

            

            if (txtTransId.Text != "" &&
             string.Compare(e.Column.FieldName, "DueDated", false) == 0 ||
            string.Compare(e.Column.FieldName, "Ref1d", false) == 0 ||
             string.Compare(e.Column.FieldName, "Ref2d", false) == 0 ||
              string.Compare(e.Column.FieldName, "Ref3Line", false) == 0 ||
              string.Compare(e.Column.FieldName, "LineMemo", false) == 0 ||
            string.Compare(e.Column.FieldName, "Projectd", false) == 0)
            {
                e.Editor.ReadOnly = false;
            if(string.Compare(e.Column.FieldName, "LineMemo", false) == 0)
                {
                    e.Editor.Focus();
                }  
            }


        }

        protected void gdvAsiento_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            e.Cancel = true;
            int i = gdvAsiento.FindVisibleIndexByKeyValue(e.Keys[gdvAsiento.KeyFieldName]);
            var _lnm = (i + 1);
            var father = "";
            ((List<BEDocumentLine>)Session["asientoPrinc"]).Where(item => item.LineNum == _lnm).ToList().ForEach(x => {
                father = x.Father;
            });
            ((List<BEDocumentLine>)Session["asientoPrinc"]).RemoveAll(item => item.Father == father);
            Set_LineNum();

            //gdvAsiento.JSProperties["cpSubTotal"] = ((List<BEDocumentLine>)Session["inv1"]).Sum(item => Math.Round(item.LineTotal, 2));

            gdvAsiento.DataSource = ((List<BEDocumentLine>)Session["asientoPrinc"]);
            gdvAsiento.DataBind();
        }

        protected void gdvAccountsrch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                cuenta = txtcuenta.Text,
                
            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_CUENTAS_ASIENTO(obj);
            Session["asiento"] = olst;
            gdvAccountsrch.DataSource = olst;
            gdvAccountsrch.DataBind();
        }

        protected void gdvAccountsrch_DataBinding(object sender, EventArgs e)
        {
            gdvAccountsrch.DataSource = Session["asiento"];
        }

        protected void gdvAsiento_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
          
            
        }
        private void Set_LineNum()
        {
            var i = 1;
            ((List<BEDocumentLine>)Session["asientoPrinc"]).ForEach(item =>
            {
                item.LineNum = i;
                i += 1;
            });
        }

        protected void gdvProyectsrch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                Proyecto = txtPrjCode.Text,

            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_PROYECTO(obj);
            Session["proyecto"] = olst;
            gdvProyectsrch.DataSource = olst;
            gdvProyectsrch.DataBind();
        }

        protected void gdvProyectsrch_DataBinding(object sender, EventArgs e)
        {
            gdvProyectsrch.DataSource = Session["proyecto"];
        }

        protected void gdvProyect2srch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                Proyecto = txtPrjCode2.Text,

            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_PROYECTO(obj);
            Session["proyecto"] = olst;
            gdvProyect2srch.DataSource = olst;
            gdvProyect2srch.DataBind();

        }

        protected void gdvProyect2srch_DataBinding(object sender, EventArgs e)
        {
            gdvProyect2srch.DataSource = Session["proyecto"];
        }

        protected void gdvAccountsrch2_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters()
            {
                Socied = obec.Socied,
                cuenta = txtcuenta.Text,

            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_GET_CUENTAS_ASIENTO(obj);
            Session["asiento"] = olst;
            gdvAccountsrch2.DataSource = olst;
            gdvAccountsrch2.DataBind();
        }

        protected void gdvAccountsrch2_DataBinding(object sender, EventArgs e)
        {
            gdvAccountsrch2.DataSource = Session["asiento"];
        }

        protected void gdvAsientoSearch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEParameters();

            obj.Socied = obec.Socied;
            obj.DateIn = Convert.ToDateTime(dteDateIn.Text);
            obj.DateFi = Convert.ToDateTime(dteDateFi.Text);
            obj.BaseRef = txtNumAtCards.Text;
            
            var obrd = new BRDocument();
            var olst = obrd.Get_OSCSP_SRCH_OJDT(obj);
            Session["asiento"] = olst;
            gdvAsientoSearch.DataSource = olst;
            gdvAsientoSearch.DataBind();
        }

        protected void gdvAsientoSearch_DataBinding(object sender, EventArgs e)
        {
            gdvAsientoSearch.DataSource = Session["asiento"];
        }

      
        protected void gdvAsiento_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            var obrd = new BRDocument();
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.ButtonID != "Ver") return;
            Hashtable copiedValues = null;
            string[] copiedFields = new string[] { "ShortName", "AcctName", "Account","Debit_ME", "Credit_ME",
                "Debit", "Credit" , "Debit_MS","Credit_MS", "LineMemo", "Ref1d" ,"Ref2d","Ref3Line","DueDated","RefDated",
            "TaxDated","Projectd"};
            copiedValues = new Hashtable();
            foreach (string fieldName in copiedFields)
                copiedValues[fieldName] = gdvAsiento.GetRowValues(e.VisibleIndex, fieldName);

            txtShortname.Text = Convert.ToString(copiedValues["ShortName"]);
            txtAcctName.Text = Convert.ToString(copiedValues["AcctName"]);
            txtAccount.Text = Convert.ToString(copiedValues["Account"]);
            txtdebitome.Text = Convert.ToString(copiedValues["Debit_ME"]);
            txtcreditome.Text = Convert.ToString(copiedValues["Credit_ME"]);
            txtdebito.Text = Convert.ToString(copiedValues["Debit"]);
            txtcredito.Text = Convert.ToString(copiedValues["Credit"]);
            txtdebitoms.Text = Convert.ToString(copiedValues["Debit_MS"]);
            txtcreditoms.Text = Convert.ToString(copiedValues["Debit_MS"]);
            txtlinememomodo.Text = Convert.ToString(copiedValues["LineMemo"]);
            txtRefmodo1.Text = Convert.ToString(copiedValues["Ref1d"]);
            txtRefmodo2.Text = Convert.ToString(copiedValues["Ref2d"]);
            txtRefmodo3.Text = Convert.ToString(copiedValues["Ref3Line"]);
            txtDueDatemodo.Text = Convert.ToString(copiedValues["DueDated"]);
            txtRefDatemodo.Text = Convert.ToString(copiedValues["RefDated"]);
            txtTaxDatemodo.Text = Convert.ToString(copiedValues["TaxDated"]);
            txtProjectmodo.Text = Convert.ToString(copiedValues["Projectd"]);


        }
    }
}