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

namespace OneCommerce.GestionBancos
{
    public partial class PagosEfectuados : Page
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

            Session["oact"] = new List<BECuentasPago>();
            Session["rct4"] = new List<BECuentasPago>();
            Session["ocrd"] = new List<BEBusinessPartner>();
            Session["tcns"] = new List<BEBusinessPartner>();
            Session["tecn"] = new List<BEDocument>();
            hdfTemp.Add("_soci", obec.Socied);
            hdfTemp.Add("adrtype", string.Empty);
            hdfTemp.Add("rateusd", obec.Rate);
            hdfTemp.Add("rateeur", obec.RateEur);
        }
        private void Set_LineNum()
        {
            var i = 1;
            ((List<BECuentasPago>)Session["rct4"]).ForEach(item =>
            {
                item.LineNum = i;
                i += 1;
            });
        }
        //!+ RUTINAS AJAX
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<BEParameters> DXP_VALORES_GESTIONBANCOS(string socied)
        {
            var obep = new BEParameters()
            {
                Socied = socied
            };
            var obrd = new BRDocument();
            var olst = obrd.DXP_VALORES_GESTIONBANCOS(obep);
            return (olst);
        }
        public static string Right(string param, int length)
        {
            int value = param.Length - length;
            string result = param.Substring(value, length);
            return result;
        }
        private string Payment()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obrd = new BRDocument();
            var obj = new BEDocument();
            obj.Socied = obec.Socied;
            obj.Comments = rbtnType.Value.ToString();
            obj.DocEntry = Convert.ToInt32(txtNroOperacion.Value);
            obj.TaxDate = Convert.ToDateTime(txtdocDate1.Text);
            obj.DocDueDate = Convert.ToDateTime(txtcloseDate1.Text);
            obj.DocDate = Convert.ToDateTime(txtcreateDate1.Text);
            obj.CardCode = bteCustomer.Text;
            obj.CardName = txtCustomerName.Text.Trim();
            obj.CntctCode = Convert.ToInt32(txtcontctCode1.Value);
            obj.Project = cbbProyecto.Value.ToString();
            obj.Address2 = cbbMedioPago.Value.ToString();
            obj.Address = cbbAddress.Text;
            obj.DocCur = cbbDocCur.Value.ToString();
            obj.Active = checkPagoCuenta.Value.ToString();
            obj.DiscSum = Convert.ToDecimal(txtDocTotalCP.Text);
            obj.DiscPrcntTotal = Convert.ToDecimal(txtimportetotal.Text);
            obj.DpmAmnt = Convert.ToDecimal(txtimportetotal2.Text);
            //obj.Project = ((BEParameters)Session["InitPar"]).Project;
            obj.Lineas = ((List<BEDocument>)Session["tecn"]);
            obj.CuentasPago = ((List<BECuentasPago>)Session["rct4"]);

            var obep = new BEParameters()
            {
                Socied = obec.Socied
            };
            var olst = obrd.GET_CUENTAS_PAGO(obep);
            if (checkpagoefe.Value.ToString() == "Y")
            {
                olst.Where(i => i.Project == obec.Project).ToList().ForEach(item => {
                    if (cbbCurPagoEfe.Value.ToString() == item.ActCurr)
                        obj.CashAccount = item.AcctCode;
                });
                obj.MedPayment = "EF";
                obj.DocCur = cbbCurPagoEfe.Value.ToString();
                obj.CashSum = Convert.ToDecimal(txtSalEfe2.Value);
            }
            if (checkpagotar.Value.ToString() == "Y")
            {
                obj.MedPayment2 = "TC";
                obj.DocDate1 = Convert.ToDateTime(dteDocDateTarj.Text);
                var _stc = cbbCreditCard1.Value.ToString().Split('_');
                obj.CreditCard = Convert.ToInt16(_stc[0]);
                obj.NumAtCard = txtNumOperacion.Text;
                obj.CashAccount2 = _stc[1];
                obj.CashSum2 = Convert.ToDecimal(txtSalTar2.Value);
                var _ccn = ("0000000000000" + txtNumTarjeta.Text);
                obj.DocCur2 = cbbCurPagoTar.Value.ToString();
                obj.CreditCardNumber = Right(_ccn, 13);
                obj.VoucherNum = txtNumTarjeta.Text;
            }
            if (checkpagotrans.Value.ToString() == "Y")
            {
                obj.MedPayment3 = "TR";
                obj.DocCur3 = cbbCurPagoTrans.Value.ToString();
                obj.CashAccount3 = cbbCuentaTrans.Value.ToString(); ;
                obj.CashSum3 = Convert.ToDecimal(txtSalTrans2.Value);
                obj.DocDate3 = Convert.ToDateTime(dteDocDateTrans.Text);
                obj.NumAtCard3 = txtNumOperacion2.Text;
            }
            obrd.SavePaymentPagoEfectuado(obj, ((BEParameters)Session["InitPar"]).objSapSbo);

            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : string.Format("OKBP#{0}#{1}", obj.DocNum, obj.DocEntry);
            return (_err);
        }
        private string Cancel()
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obj = new BEDocument();

            if(rbtnType.Value.ToString() == "Y")
                obj.DocEntry = Convert.ToInt32(txtDocNum.Text);
            else
                obj.DocEntry = Convert.ToInt32(txtDocNum2.Text);
            using (var obrd = new BRDocument())
            {
                obrd.CancelPaymentEfectuado(obj, ((BEParameters)Session["InitPar"]).objSapSbo);
            }
            var _err = !string.IsNullOrWhiteSpace(obj.Msg) ? obj.Msg : "CANC";
            //Init_VarSessions();
            return (_err);
        }
        protected void clbOperation_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (string.Compare(e.Parameter, "Payment", false) == 0)
                {
                    e.Result = Payment();
                }
                else if (string.Compare(e.Parameter, "Cancel", false) == 0)
                {
                    e.Result = Cancel();
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
            var olst = obrd.Get_OSCSP_OCRD_P(obj);
            Session["ocrd"] = olst;
            gdvClientSearch.DataSource = olst;
            gdvClientSearch.DataBind();
        }
        protected void gdvClientSearch_DataBinding(object sender, EventArgs e)
        {
            gdvClientSearch.DataSource = Session["ocrd"];
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

        protected void gdvPR_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("GET"))
            {
                var splv = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = txtCliente.Text,
                    Internal = txtnrodoc.Text,
                    DateIn = Convert.ToDateTime(dteFecha.Text),
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_PAGOF(obj);
                Session["oscl"] = olst;
                gdvPR.DataSource = olst;
                gdvPR.DataBind();
            }
        }

        protected void gdvPR_DataBinding(object sender, EventArgs e)
        {
            gdvPR.DataSource = Session["oscl"];
        }
        protected void gdvFacturas_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {

        }
        protected void gdvFacturas_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gdvFacturas.EditingRowVisibleIndex;
            var moneda = "";
            var band = true;
            var total = 0.0;
            var controlador = "";

            ((List<BEDocument>)Session["tecn"])[index].PagoTotal = Convert.ToDecimal(e.NewValues["PagoTotal"]);
            ((List<BEDocument>)Session["tecn"])[index].Descto = Convert.ToString(e.NewValues["Descto"]);
            ((List<BEDocument>)Session["tecn"])[index].Active = Convert.ToString(e.NewValues["Active"]);

            ((List<BEDocument>)Session["tecn"]).Where(i => i.Active == "Y").ToList().ForEach(x => {
                if (band)
                {
                    moneda = x.DocCur;
                    band = false;
                }
                if (x.DocCur == moneda)
                {
                    total += Convert.ToDouble(x.PagoTotal);
                }
                else
                    controlador = "XXXX";
            });

            ((List<BEDocument>)Session["tecn"]).ForEach(i =>
            {
                if (i.DocCur == "SOL")
                {
                    i.DocTotal = i.PagoTotal;
                }
                else if (i.DocCur == "USD")
                {
                    i.DocTotal = i.PagoTotal * obec.Rate;
                }
                else if (i.DocCur == "EUR")
                {
                    i.DocTotal = i.PagoTotal * obec.RateEur;
                }
            });

            gdvFacturas.JSProperties["cpSubTotal"] = ((List<BEDocument>)Session["tecn"]).Where(i => i.Active == "Y").ToList().Sum(item => Math.Round(item.DocTotal, 2));
            if (controlador == "")
            {
                gdvFacturas.JSProperties["cpTotalito"] = total;
            }
            else
                gdvFacturas.JSProperties["cpTotalito"] = controlador;

            gdvFacturas.CancelEdit();
            e.Cancel = true;
            gdvFacturas.DataSource = ((List<BEDocument>)Session["tecn"]);
            gdvFacturas.DataBind();
        }
        protected void gdvFacturas_DataBinding(object sender, EventArgs e)
        {
            gdvFacturas.DataSource = Session["tecn"];
        }
        protected void gdvFacturas_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {

        }
        protected void gdvFacturas_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "Descto", false) == 0 ||
                string.Compare(e.Column.FieldName, "PagoTotal", false) == 0 ||
                string.Compare(e.Column.FieldName, "Active", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
        }
        protected void gdvFacturas_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {

        }
        protected void gdvFacturas_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            if (e.Parameters.Contains("GET"))
            {
                var spl = e.Parameters.Split(':');
                var tecnico = new BEBusinessPartner();
                ((List<BEDocument>)Session["tecn"]).Clear();

                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    CardCode = spl[1],
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_FACTURAS_PROVEEDORES(obj);
                Session["tecn"] = olst;
            }
            else if (e.Parameters.Contains("CLR"))
            {
                ((List<BEDocument>)Session["tecn"]).Clear();
            }
            ((List<BEDocument>)Session["tecn"]).ForEach(i =>
            {
                if (i.DocCur == "SOL")
                {
                    i.DocTotal = i.PagoTotal;
                }
                else if (i.DocCur == "USD")
                {
                    i.DocTotal = i.PagoTotal * obec.Rate;
                }
                else if (i.DocCur == "EUR")
                {
                    i.DocTotal = i.PagoTotal * obec.RateEur;
                }
            });

            gdvFacturas.JSProperties["cpSubTotal"] = ((List<BEDocument>)Session["tecn"]).Where(i => i.Active == "Y").ToList().Sum(item => Math.Round(item.DocTotal, 2));

            gdvFacturas.DataSource = Session["tecn"];
            gdvFacturas.DataBind();
        }
        protected void gdvCuentas_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {

        }

        protected void gdvCuentas_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            Set_LineNum();
            gdvCuentas.DataSource = ((List<BECuentasPago>)Session["rct4"]);
            gdvCuentas.DataBind();
        }

        protected void gdvCuentas_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var index = gdvCuentas.EditingRowVisibleIndex;

            ((List<BECuentasPago>)Session["rct4"])[index].AcctCode = Convert.ToString(e.NewValues["AcctCode"]);
            ((List<BECuentasPago>)Session["rct4"])[index].AcctName = Convert.ToString(e.NewValues["AcctName"]);
            ((List<BECuentasPago>)Session["rct4"])[index].CurrTotal = Convert.ToString(e.NewValues["CurrTotal"]);

            //gdvFacturas.JSProperties["cpSubTotal"] = ((List<BEDocument>)Session["tecn"]).Where(i => i.Active == "Y").ToList().Sum(item => Math.Round(item.PagoTotal, 2));

            Set_LineNum();
            ((List<BECuentasPago>)Session["rct4"]).ForEach(i =>
            {
                if (i.ActCurr == "SOL")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal);
                }
                else if (i.ActCurr == "USD")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal) * obec.Rate;
                }
                else if (i.ActCurr == "EUR")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal) * obec.RateEur;
                }
            });

            gdvCuentas.JSProperties["cpSubTotalPlanCuenta"] = ((List<BECuentasPago>)Session["rct4"]).Sum(item => Math.Round(item.Total, 2));

            gdvCuentas.CancelEdit();
            e.Cancel = true;
            gdvCuentas.DataSource = ((List<BECuentasPago>)Session["rct4"]);
            gdvCuentas.DataBind();
        }

        protected void gdvCuentas_DataBinding(object sender, EventArgs e)
        {
            gdvCuentas.DataSource = Session["rct4"];
        }

        protected void gdvCuentas_RowDeleting(object sender, ASPxDataDeletingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            e.Cancel = true;
            int j = gdvCuentas.FindVisibleIndexByKeyValue(e.Keys[gdvCuentas.KeyFieldName]);
            var _lnm = (j + 1);

            ((List<BECuentasPago>)Session["rct4"]).RemoveAll(item => item.LineNum == _lnm);
            Set_LineNum();
            ((List<BECuentasPago>)Session["rct4"]).ForEach(i =>
            {
                if (i.ActCurr == "SOL")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal);
                }
                else if (i.ActCurr == "USD")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal) * obec.Rate;
                }
                else if (i.ActCurr == "EUR")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal) * obec.RateEur;
                }
            });

            gdvCuentas.JSProperties["cpSubTotalPlanCuenta"] = ((List<BECuentasPago>)Session["rct4"]).Sum(item => Math.Round(item.Total, 2));

            gdvCuentas.DataSource = ((List<BECuentasPago>)Session["rct4"]);
            gdvCuentas.DataBind();
        }

        protected void gdvCuentas_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (string.Compare(e.Column.FieldName, "CurrTotal", false) == 0 ||
                string.Compare(e.Column.FieldName, "AcctName", false) == 0)
            {
                e.Editor.ReadOnly = false;
            }
            else
            {
                e.Editor.ReadOnly = true;
            }
        }

        protected void gdvCuentas_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var line = new BECuentasPago()
            {
                AcctCode = Convert.ToString(e.NewValues["AcctCode"]),
                AcctName = Convert.ToString(e.NewValues["AcctName"]),
                CurrTotal = Convert.ToString(e.NewValues["CurrTotal"]),
                ActCurr = Convert.ToString(e.NewValues["ActCurr"]),
            };

            ((List<BECuentasPago>)Session["rct4"]).Add(line);

            Set_LineNum();
            ((List<BECuentasPago>)Session["rct4"]).ForEach(i =>
            {
                if (i.ActCurr == "SOL")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal);
                }
                else if (i.ActCurr == "USD")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal) * obec.Rate;
                }
                else if (i.ActCurr == "EUR")
                {
                    i.Total = Convert.ToDecimal(i.CurrTotal) * obec.RateEur;
                }
            });

            gdvCuentas.JSProperties["cpSubTotalPlanCuenta"] = ((List<BECuentasPago>)Session["rct4"]).Sum(item => Math.Round(item.Total, 2));
            gdvCuentas.CancelEdit();
            e.Cancel = true;
            gdvCuentas.DataSource = ((List<BECuentasPago>)Session["rct4"]);
            gdvCuentas.DataBind();
        }

        protected void gdvCuentassrch_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            var obec = ((BEParameters)Session["InitPar"]);

            if (e.Parameters.Contains("GET"))
            {
                var splv = e.Parameters.Split(':');
                var obj = new BEParameters()
                {
                    Socied = obec.Socied,
                    Code = txtCuenta.Text,
                    Currency = cbbDocCur.Value.ToString(),
                    //ItemCode = txtitemCode.Text,
                };
                var obrd = new BRDocument();
                var olst = obrd.DXP_GET_CUENTASGENERAL(obj);
                Session["oact"] = olst;
                gdvCuentassrch.DataSource = olst;
                gdvCuentassrch.DataBind();
            }
        }
        protected void gdvCuentassrch_DataBinding(object sender, EventArgs e)
        {
            gdvCuentassrch.DataSource = Session["oact"];
        }
        protected void cbbCuentaTrans_Callback(object sender, CallbackEventArgsBase e)
        {
            var obec = ((BEParameters)Session["InitPar"]);
            var obep = new BEParameters()
            {
                Socied = obec.Socied
            };
            var obrd = new BRDocument();
            var olst = obrd.GET_CUENTAS_PAGO(obep);
            if (olst.Count != 0)
            {
                olst.Where(i => i.Clave == "SC").ToList().ForEach(item =>
                {
                    cbbCuentaTrans.Items.Add(item.AcctName, item.AcctCode);
                });
                cbbCuentaTrans.SelectedIndex = 0;
            }
            else
            {
                cbbCuentaTrans.Items.Add("", 0);
                cbbCuentaTrans.SelectedIndex = 0;
            }

        }
    }
}