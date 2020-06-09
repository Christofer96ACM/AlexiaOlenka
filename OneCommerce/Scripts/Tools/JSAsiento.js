var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    //pestañascrearclie();
    try {
        Set_VisibleOption();
        Get_InitialData();
        InitControls();
    } catch (e) {
        alert(e.Message);
    }
});

function checktipocambio() {
    if (chktipocamb.GetValue() == "Y") {
        txttipocambio.SetEnabled(true);
        cbbmoneda.SetEnabled(true)
    }
    else {
        txttipocambio.SetEnabled(false);
        cbbmoneda.SetEnabled(false)

    }
}

function checkAnular() {
    if (chkanular.GetValue() == "Y") {
        txtanular.SetEnabled(true);

    }
    else {
        txtanular.SetEnabled(false);
    }
}


function Get_Proyect1() {
    gdvProyectsrch.PerformCallback();

}
function Get_Proyect(s, e) {
    gdvProyectsrch.PerformCallback();
    //if (e.htmlEvent.keyCode === 13) {
    gdvProyectsrch.SetFocusedRowIndex(0);
    OKProyect();
    ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    //}
}
function OKProyect() {
    var rowc = gdvProyectsrch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    }
    else if (gdvProyectsrch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    }
    else {
        gdvProyectsrch.GetRowValues(gdvProyectsrch.GetFocusedRowIndex(), "PrjCode;PrjName", OnGetRowValuesProyect);
    }
}

function OnGetRowValuesProyect(values) {
    if (!isNullOrWhiteSpace(values[0])) {
        bteProject.SetText(values[0]);
        

        //    bteItemCode.SetText(values[0]);
        //    bteItemName.SetText(values[1]);
        //    txtPriceBefDi.SetText(values[3]);
        //    txtQuantity.SetText("1");
        //    txtDiscPrcnt.SetText(values[4].toString());
        //    txtPrice.SetText(values[5]);
        //    txtLineTotal.SetText(values[5]);
        //    txtGTotal.SetText(values[6]);
        //    txtIssueMthd.SetText(values[7]);
        //txtBatchNum.SetText(values[7]);
        //txtU_BF_CodKit.SetText(values[8]);
        //txtNumInSale.SetText(values[9]);
        //txtOItemCode.SetText(values[0]);
    }

    gdvProyectsrch.SetFocusedRowIndex(-1);
    ppcProyectSearch.Hide();
    //}
    //else {
    //    if (!chkKit.GetChecked()) {
    //        alert("El registro seleccionado es un kit.\nActivar el check de kit e ingresar la catidad.");
    //    }
    //    else {
    //        var _qtk = parseInt(txtQuantityKit.GetValue());
    //        if (_qtk === 0) {
    //            alert("Ingrese cantidad mayor a 0.");
    //            txtQuantityKit.Focus();
    //            txtQuantityKit.SelectAll();
    //        }
    //        else {
    //            gdvinv1.PerformCallback("QK:" + values[8]);
    //            gdvProductSearch.SetFocusedRowIndex(-1);
    //            ppcProductSearch.Hide();
    //        }
    //    }
    //}
}


function Get_Proyectp1() {
    gdvProyect2srch.PerformCallback();

}
function Get_Proyectp(s, e) {
    gdvProyect2srch.PerformCallback();
    //if (e.htmlEvent.keyCode === 13) {
    gdvProyect2srch.SetFocusedRowIndex(0);
    OKProyect2();
    ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    //}
}
function OKProyect2() {
    var rowc = gdvProyect2srch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    }
    else if (gdvProyect2srch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    }
    else {
        gdvProyect2srch.GetRowValues(gdvProyect2srch.GetFocusedRowIndex(), "PrjCode;PrjName", OnGetRowValuesProyect2);
    }
}

function OnGetRowValuesProyect2(values) {
    if (!isNullOrWhiteSpace(values[0])) {
        Projectd.SetText(values[0]);


        //    bteItemCode.SetText(values[0]);
        //    bteItemName.SetText(values[1]);
        //    txtPriceBefDi.SetText(values[3]);
        //    txtQuantity.SetText("1");
        //    txtDiscPrcnt.SetText(values[4].toString());
        //    txtPrice.SetText(values[5]);
        //    txtLineTotal.SetText(values[5]);
        //    txtGTotal.SetText(values[6]);
        //    txtIssueMthd.SetText(values[7]);
        //txtBatchNum.SetText(values[7]);
        //txtU_BF_CodKit.SetText(values[8]);
        //txtNumInSale.SetText(values[9]);
        //txtOItemCode.SetText(values[0]);
    }

    gdvProyect2srch.SetFocusedRowIndex(-1);
    ppcProyectSearch2.Hide();
    //}
    //else {
    //    if (!chkKit.GetChecked()) {
    //        alert("El registro seleccionado es un kit.\nActivar el check de kit e ingresar la catidad.");
    //    }
    //    else {
    //        var _qtk = parseInt(txtQuantityKit.GetValue());
    //        if (_qtk === 0) {
    //            alert("Ingrese cantidad mayor a 0.");
    //            txtQuantityKit.Focus();
    //            txtQuantityKit.SelectAll();
    //        }
    //        else {
    //            gdvinv1.PerformCallback("QK:" + values[8]);
    //            gdvProductSearch.SetFocusedRowIndex(-1);
    //            ppcProductSearch.Hide();
    //        }
    //    }
    //}
}

function Get_Cuenta1() {
    gdvAccountsrch.PerformCallback();
   
}
function Get_Cuenta2() {
    gdvAccountsrch2.PerformCallback();

}
function Get_Cuenta(s, e) {
    gdvAccountsrch.PerformCallback();
    //if (e.htmlEvent.keyCode === 13) {
        gdvAccountsrch.SetFocusedRowIndex(0);
        OkCuenta();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    //}
}




function OkCuenta() {
    var rowc = gdvAccountsrch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    }
    else if (gdvAccountsrch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    }
    else {
        gdvAccountsrch.GetRowValues(gdvAccountsrch.GetFocusedRowIndex(), "AcctCode;AcctName;CurrTotal;FormatCode;Project", OnGetRowValuesCuenta);
    }
}
function OnGetRowValuesCuenta(values) {
    if (!isNullOrWhiteSpace(values[0])) {
        ShortName.SetText(values[0]);
        AcctName.SetText(values[1]);
        Account.SetText(values[3]);
        Projectd.SetText(values[4]);
      
        //    bteItemCode.SetText(values[0]);
        //    bteItemName.SetText(values[1]);
        //    txtPriceBefDi.SetText(values[3]);
        //    txtQuantity.SetText("1");
        //    txtDiscPrcnt.SetText(values[4].toString());
        //    txtPrice.SetText(values[5]);
        //    txtLineTotal.SetText(values[5]);
        //    txtGTotal.SetText(values[6]);
        //    txtIssueMthd.SetText(values[7]);
        //txtBatchNum.SetText(values[7]);
        //txtU_BF_CodKit.SetText(values[8]);
        //txtNumInSale.SetText(values[9]);
        //txtOItemCode.SetText(values[0]);
    }

    gdvAccountsrch.SetFocusedRowIndex(-1);
    ppcAccountSearch.Hide();
    //}
    //else {
    //    if (!chkKit.GetChecked()) {
    //        alert("El registro seleccionado es un kit.\nActivar el check de kit e ingresar la catidad.");
    //    }
    //    else {
    //        var _qtk = parseInt(txtQuantityKit.GetValue());
    //        if (_qtk === 0) {
    //            alert("Ingrese cantidad mayor a 0.");
    //            txtQuantityKit.Focus();
    //            txtQuantityKit.SelectAll();
    //        }
    //        else {
    //            gdvinv1.PerformCallback("QK:" + values[8]);
    //            gdvProductSearch.SetFocusedRowIndex(-1);
    //            ppcProductSearch.Hide();
    //        }
    //    }
    //}
}
function OkCuenta2() {
    var rowc = gdvAccountsrch2.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    }
    else if (gdvAccountsrch2.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    }
    else {
        gdvAccountsrch2.GetRowValues(gdvAccountsrch2.GetFocusedRowIndex(), "AcctCode;AcctName;CurrTotal;FormatCode;Project", OnGetRowValuesCuenta2);
    }
}

function OnGetRowValuesCuenta2(values) {
    if (!isNullOrWhiteSpace(values[0])) {
        txtShortname.SetText(values[0]);
        txtAcctName.SetText(values[1]);
        txtAccount.SetText(values[3]);
        txtProjectmodo.SetText(values[4]);

        //    bteItemCode.SetText(values[0]);
        //    bteItemName.SetText(values[1]);
        //    txtPriceBefDi.SetText(values[3]);
        //    txtQuantity.SetText("1");
        //    txtDiscPrcnt.SetText(values[4].toString());
        //    txtPrice.SetText(values[5]);
        //    txtLineTotal.SetText(values[5]);
        //    txtGTotal.SetText(values[6]);
        //    txtIssueMthd.SetText(values[7]);
        //txtBatchNum.SetText(values[7]);
        //txtU_BF_CodKit.SetText(values[8]);
        //txtNumInSale.SetText(values[9]);
        //txtOItemCode.SetText(values[0]);
    }

    gdvAccountsrch2.SetFocusedRowIndex(-1);
    ppcAccountSearch2.Hide();
    //}
    //else {
    //    if (!chkKit.GetChecked()) {
    //        alert("El registro seleccionado es un kit.\nActivar el check de kit e ingresar la catidad.");
    //    }
    //    else {
    //        var _qtk = parseInt(txtQuantityKit.GetValue());
    //        if (_qtk === 0) {
    //            alert("Ingrese cantidad mayor a 0.");
    //            txtQuantityKit.Focus();
    //            txtQuantityKit.SelectAll();
    //        }
    //        else {
    //            gdvinv1.PerformCallback("QK:" + values[8]);
    //            gdvProductSearch.SetFocusedRowIndex(-1);
    //            ppcProductSearch.Hide();
    //        }
    //    }
    //}
}
function Ok_Detalle(s,e) {
    if (e.buttonID != "Ver") return;
    rowVisibleIndex = e.visibleIndex;
    s.GetRowValues(e.visibleIndex, "ShortName;AcctName;Account;Debit_ME;Credit_ME;Debit;Credit;Debit_MS;Credit_MS;LineMemo;Ref1d;Ref2d;Ref3Line;DueDated;RefDated;TaxDated;Projectd", ShowDetalle)
    
   
}
function ShowDetalle(values) {
    
   // alert(values[0]);

    txtShortname.SetText(values[0]);
    txtAcctName.SetText(values[1]);
    txtAccount.SetText(values[2]);
    txtdebitome.SetText(values[3]);
    txtcreditome.SetText(values[4]);
    txtdebito.SetText(values[5]);
    txtcredito.SetText(values[6]);
    txtdebitoms.SetText(values[7]);
    txtcreditoms.SetText(values[8]);

    txtlinememomodo.SetText(values[9]);
    txtRefmodo1.SetText(values[10]);
    txtRefmodo2.SetText(values[11]);
    txtRefmodo3.SetText(values[12]);
    txtDueDatemodo.SetText(values[13]);
    txtRefDatemodo.SetText(values[14]);
    txtTaxDatemodo.SetText(values[15]);
    txtProjectmodo.SetText(values[16]);
  
    //gdvAsiento.SetFocusedRowIndex(-1);
}





function OkAsiento() {
    var rowc = gdvAsientoSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvAsientoSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvAsientoSearch.GetRowValues(gdvAsientoSearch.GetFocusedRowIndex(), "Series;Number;RefDate;DueDate;TaxDate;Memo;BaseRef;TransId;Indicator;Project;TransCode;Ref1;Ref2;Ref3;AutoStorno;StornoDate;AdjTran;AutoVAT;AutoWT;U_GOS_ESTDOC_LE;U_GOS_FECHA_LE;U_MSS_TransIdAD", OnGetRowValuesAsiento);
    }
}

function OnGetRowValuesAsiento(values) {
   
   
    cbbnumero.SetValue(values[0]);
    cbbnumero.SetEnabled(false);

    var x = new Date(values[2]);
    var y = new Date(values[3]);
    var z = new Date(values[4]);
    var c = new Date(values[15]);

    //alert("" + c + "ddd" + values[14]);


    txtRefDate.SetDate(x);
    txtDueDate.SetText(y);
    txtTaxDate.SetText(z);
    txtRefDate.SetEnabled(false);
   // txtRefDate.SetDate(new Date());
   
    txtDueDate.SetEnabled(true);
    
    txtTaxDate.SetEnabled(false);
    
    if (values[13] == "Y") {
        chkanular.SetValue("Y");
        txtanular.SetDate(c);
    }
    
    txtmemo.SetText(values[5]);
    txtmemo.SetEnabled(true);
    txtBaseRef.SetText(values[6]);
    txtBaseRef.SetEnabled(false);

    if (values[15] == "Y") {
        chkajuste.SetValue("Y");
    }
    txtTransId.SetText(values[7]);
    cbbIndicator.SetValue(values[8]);

    if (values[17] == "Y") {
        chkimpu.SetValue("Y");
    }
    chkimpu.SetEnabled(false);

    bteProject.SetValue(values[8]);
    cbbTransCode.SetValue(values[9]);

    if (values[18] == "Y") {
        chkretencion.SetValue("Y");
    }
    chkretencion.SetEnabled(false);
    txtRef1.SetText(values[11]);
    txtRef2.SetText(values[12]);
    txtRef3.SetText(values[13]);

    cbbestadodoc.SetValue(values[19]);
    txtlibroelec.SetText(values[20]);
    txtdocdes.SetText(values[21]);

    gdvAsiento.PerformCallback("SRCH");
    gdvAsientoSearch.SetFocusedRowIndex(-1);
    ppcAsientoSearch.Hide();
   

    mnuOper.GetItemByName("Save").SetText("Modificar");
}







function Get_Asiento() {
    gdvAsientoSearch.SetFocusedRowIndex(-1);
    gdvAsientoSearch.PerformCallback();
}


function CancelAsiento() {
    ppcAsientoSearch.Hide();
}

function EndAsientoSearch() {
    gdvAsientoSearch.SetFocusedRowIndex(0);
    ppcAsientoSearch.UpdatePosition();
}



function Show_ProyectSearch() {
    ppcProyectSearch.Show();
}

function Show_ProyectSearch2() {
    ppcProyectSearch2.Show();
}

function Show_AccountSearch() {
    ppcAccountSearch.Show();
}

function Show_AccountSearch2() {
    ppcAccountSearch2.Show();
}

function CancelCuenta() {
    gdvAccountsrch.Hide();
}
function CancelCuenta2() {
    gdvAccountsrch2.Hide();
}
function CancelProyect() {
    gdvProyectsrch.Hide();
}
function CancelProyect2() {
    gdvProyect2srch.Hide();
}
function Show_CuentaSearch() {
    gdvAccountsrch.Show();
}
function Show_CuentaSearch2() {
    gdvAccountsrch2.Show();
}
function Get_Service() {
    gdvServicio.PerformCallback("GET");
}
function Get_Service1() {

}
function Get_Service2(s, e) {

}

function Get_Detalle(s, e) {

    txtShortname.SetText(e.ShortName);
    txtAcctName.SetText(e.AcctName);
    txtAccount.SetText(e.Account);
    txtRefmodo1.SetText(e.Ref1);
    txtRefmodo2.SetText(e.Ref2);
    txtRefmodo3.SetText(e.Ref3);
    txtcuentacontra.SetText(e.cuentacontra);
    txtdebitome.SetText(e.debitome);
    txtcreditome.SetText(e.creditome);
    txtdebito.SetText(e.debito);
    txtcredito.SetText (e.credito);
    txtdebitoms.SetText(e.debitoms);
    txtcreditoms.SetText(e.creditoms);
    txtRefDatemodo.SetText(e.RefDated);
    txtDueDatemodo.SetText(e.Duedated);
    txtTaxDatemodo.SetText(e.TaxDated);
    txtlinememomodo.SetText(e.LineMemo);
    txtProjectmodo.SetText(e.Projectd);

}


function okServicio() {
    var rowc = gdvServicio.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvServicio.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvServicio.GetRowValues(gdvServicio.GetFocusedRowIndex(), "CallId;ItemCode;ItemName;CardCode;CardName;SerieFab;SerieInt;ItmsGrpCod;IdDireccion;Street;State;U_DXP_BIZ_PROV;U_DXP_BIZ_DIST;Asunto;Estado;Prioridad;Creacion;Cerrado;NroContrato;Origen;TipoProblema;Tecnico;DetalleServicio;Comentario;Resolucion;Cellular;ContactPerson;AddressType;U_GOS_TECN1;U_GOS_TECN2;U_GOS_TECN3;U_GOS_TECN4;U_GOS_TECN5;U_GOS_TECN6", OnGetRowValuesServicio);
    }
}




function OnGetRowValuesServicio(values) {
    txtcontctCode1.PerformCallback("INICIAR:" + values[3]);
    //cbbAddress.PerformCallback("GET:" + values[3]);
    bteCustomer.SetText(values[3]);
    txtCustomerName.SetText(values[4]);
    hdfTemp.Set("adrtype", values[27]);
    cbStatus.SetValue(values[14])
    txttelf.SetText(values[25]);
    cbbPriority.SetValue(values[15]);
    txtcontctCode1.SetText(values[26]);
    txtidllamada.SetText(values[0]);
    
    txtDepartamento1.SetText(values[10]);
    txtProvincia1.SetText(values[11]);
    txtDistrito1.SetText(values[12]);
    txtStreets1.SetText(values[9]);
    txtmanufSN1.SetText(values[5]);
    txtinternalSN.SetText(values[6]);
    txtcreateDate1.SetText(values[16]);
    txtcloseDate1.SetText(values[17]);
    txtitemCode.SetText(values[1]);
    txtItemName.SetText(values[2]);
    txtnumContrato.SetText("");
    //txtcntrctDate
    //txtItemGroup.SetText(values[7]);
    txtSubject.SetText(values[13]);
    cbbOrigin.SetValue(values[19])
    cbbProblemTyp.SetValue(values[20])
    cbbCallType.SetValue(values[22])
    cbbTecnico.SetValue(values[21])
    mmoResolution.SetText(values[24]);
    mmoComments.SetText(values[23]);
    cbbAddress.SetText(values[8]);
    gdvTecnicos.PerformCallback("GET:" + values[28] + ":" + values[29] + ":" + values[30] + ":" + values[31] + ":" + values[32] + ":" + values[33]);
    mnuOper.GetItemByName("Save").SetText("Modificar");
    ppcServicioSearch.Hide();
}
function CancelServicio() {
    ppcServicioSearch.Hide();
}
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Finanzas/Asiento.aspx/DXP_GET_VALORES_ASIENTO",
        data: '{"socied":"' + socied + '"}',
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            Set_InitialData(result);
        },
        error: function (result) {
            alert(result);
        }
    });
}
function Set_InitialData(result) {
    txtTaxDate.SetDate(new Date());
    txtRefDate.SetDate(new Date());
    txtDueDate.SetDate(new Date());
    cbbnumero.SetText("DIA2005");
   
    
 
    
    //bteCustomer.SetEnabled(false);
    //txtCustomerName.SetEnabled(false);
    //txttelf.SetEnabled(false);
    //txtidllamada.SetEnabled(false);

    //txtDepartamento1.SetEnabled(false);
    //txtProvincia1.SetEnabled(false);
    //txtDistrito1.SetEnabled(false);
    //txtStreets1.SetEnabled(false);
    //txtmanufSN1.SetEnabled(false);
    //txtinternalSN.SetEnabled(false);
    //txtcreateDate1.SetEnabled(false);
    //txtcloseDate1.SetEnabled(false);
    //txtitemCode.SetEnabled(false);
    //txtItemName.SetEnabled(false);
    //txtnumContrato.SetEnabled(false);
    var _rs1 = result.d.where(function (item) { return (item.CLAVE === "IN"); });
    cbbIndicator.BeginUpdate();
    cbbIndicator.ClearItems();
    _rs1.forEach(function (item) {
        cbbIndicator.AddItem(item.VALOR, item.INDEX);
    });
    cbbIndicator.EndUpdate();
    cbbIndicator.SetValue(0);

    var _rs = result.d.where(function (item) { return (item.CLAVE === "TR"); });
    cbbTransCode.BeginUpdate();
    cbbTransCode.ClearItems();
    _rs.forEach(function (item) {
        cbbTransCode.AddItem(item.VALOR, item.INDEX);
    });
    cbbTransCode.EndUpdate();
    cbbTransCode.SetSelectedIndex(0);

    var _rs = result.d.where(function (item) { return (item.CLAVE === "SR"); });
    cbbnumero.BeginUpdate();
    cbbnumero.ClearItems();
    _rs.forEach(function (item) {
        cbbnumero.AddItem(item.INDEX, item.VALOR);
       
    });
    cbbnumero.EndUpdate();
    
    cbbnumero.SetSelectedIndex('DIA2005');

 

    var _rs = result.d.where(function (item) { return (item.CLAVE === "MN"); });
    cbbmoneda.BeginUpdate();
    cbbmoneda.ClearItems();
    _rs.forEach(function (item) {
        cbbmoneda.AddItem(item.INDEX, item.VALOR);
    });
    cbbmoneda.EndUpdate();
    cbbmoneda.SetSelectedIndex('sol');

    var _rs = result.d.where(function (item) { return (item.CLAVE === "ED"); });
    cbbestadodoc.BeginUpdate();
    cbbestadodoc.ClearItems();
    _rs.forEach(function (item) {
        cbbestadodoc.AddItem(item.INDEX, item.VALOR);
    });
    cbbestadodoc.EndUpdate();
    //cbbestadodoc.SetSelectedIndex('0');

}
function cambio_direccion() {
    var val = cbbAddress.GetValue();
    if (val != 0) {
        var spl = val.split("$");
        txtStreets1.SetText(spl[0]);
        txtDepartamento1.SetText(spl[1]);
        txtProvincia1.SetText(spl[2]);
        txtDistrito1.SetText(spl[3]);
    }
    else {
        txtStreets1.SetText("");
        txtDepartamento1.SetText("");
        txtProvincia1.SetText("");
        txtDistrito1.SetText("");
    }
}
function Set_VisibleOption() {
    mnuOper.GetItemByName("Cancel").SetVisible(false);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetVisible(false);
    mnuOper.GetItemByName("PaymentIn").SetVisible(false);
    mnuOper.GetItemByName("Print").SetVisible(false);
    mnuOper.GetItemByName("CopyFrom").SetVisible(false);
    mnuOper.GetItemByName("CopyTo").SetVisible(false);
    mnuOper.GetItemByName("Recursos").SetVisible(false);

    mnuOper.GetItemByName("Export").SetEnabled(false);
    mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
    mnuOper.GetItemByName("Print").SetEnabled(false);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
    mnuOper.GetItemByName("CopyTo").SetEnabled(false);
}

function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
function uniqueBy(arr, fn) {
    var unique = {};
    var distinct = [];
    arr.forEach(function (x) {
        var key = fn(x);
        if (!unique[key]) {
            distinct.push(key);
            unique[key] = true;
        }
    });
    return distinct;
}
function ClearControl() {
    InitControls();
    cbbnumero.SetEnabled(true);
    txtRefDate.SetEnabled(true);
    txtTaxDate.SetEnabled(true);
    txtBaseRef.SetEnabled(false);
    chkimpu.SetEnabled(true);
    chkretencion.SetEnabled(true);
    mnuOper.GetItemByName("Save").SetText("Crear");
    gdvAsiento.PerformCallback("CLR");
    
}

function InitControls() {
    //------------------------------------
    txttipocambio.SetText("");
    txtanular.SetText("");
    cbbmoneda.SetText("");
    txtBaseRef.SetText("");
    txtTransId.SetText("");
    cbbnumero.SetText("");
    txtRefDate.SetDate(new Date());
    chktipocamb.SetValue("N");
    cbbmoneda.SetText("");
    txttipocambio.SetText("");
    txtDueDate.SetDate(new Date());
    txtTaxDate.SetDate(new Date());
    chkanular.SetValue("N");
    txtanular.SetDate();
    txtmemo.SetText("");
    txtBaseRef.SetText("");
    chkajuste.SetValue("N");
    txtTransId.SetText("");
    cbbIndicator.SetText("");
    chkimpu.SetValue("N");
    bteProject.SetText("");
    txtRef1.SetText("");
    txtRef2.SetText("");
    txtRef3.SetText("");
   

    cbbmoneda.SetEnabled(false);
    txttipocambio.SetEnabled(false);
    txtanular.SetEnabled(false);
    txtBaseRef.SetEnabled(false);

    txtTransId.SetEnabled(false);
    txtShortname.SetEnabled(false);
    txtAcctName.SetEnabled(false);
    txtAccount.SetEnabled(false);
    txtRefmodo1.SetEnabled(false);
    txtRefmodo2.SetEnabled(false);
    txtRefmodo3.SetEnabled(false);
    txtcuentacontra.SetEnabled(false);
    txtdebitome.SetEnabled(false);
    txtcreditome.SetEnabled(false);
    txtdebito.SetEnabled(false);

    txtcredito.SetEnabled(false);
    txtdebitoms.SetEnabled(false);
    txtcreditoms.SetEnabled(false);
    txtRefDatemodo.SetEnabled(false);
    txtProjectmodo.SetEnabled(false);

    txtDueDatemodo.SetEnabled(false);
    txtTaxDatemodo.SetEnabled(false);
    txtlinememomodo.SetEnabled(false);
    //Projectd.SetEnabled(false);


    txtShortname.SetText("");
    txtAcctName.SetText("");
    txtAccount.SetText("");
    txtRefmodo1.SetText("");
    txtRefmodo2.SetText("");
    txtRefmodo3.SetText("");
    txtcuentacontra.SetText("");
    txtdebitome.SetText("");
    txtcreditome.SetText("");
    txtdebito.SetText("");

    txtcredito.SetText("");
    txtdebitoms.SetText("");
    txtcreditoms.SetText("");
    txtRefDatemodo.SetText("");
    txtProjectmodo.SetText("");

    txtDueDatemodo.SetText("");
    txtTaxDatemodo.SetText("");
    txtlinememomodo.SetText("");

    cbbestadodoc.SetText("");
    txtlibroelec.SetText("");
    txtdocdes.SetText("");
  

 
    //------------------------------------
  
   
}
function Save() {
    clbOperation.PerformCallback("SaveAsiento");
    ClearControl();
}
function Modificar() {
    clbOperation.PerformCallback("UpdtAsiento");
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save" && e.item.GetText() === "Crear") {
        Save();
    }
        // NUEVO
    else if (e.item.name === "New") {
        ClearControl();
    }
        // BUSCAR
    else if (e.item.name === "Search") {
        dteDateIn.SetDate(new Date());
        dteDateFi.SetDate(new Date());
        txtNumAtCards.SetText("");
        showsearchasiento();
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
        Modificar();
    }
}
function showsearchasiento() {
    ppcAsientoSearch.Show();
}

function ProcessKeyPress(s, e) {
    var charCode = (e.htmlEvent.which) ? e.htmlEvent.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        _aspxPreventEvent(e.htmlEvent);
}

function Com_Operation(s, e) {
    ldpProcess.Hide();
    var _spd = "";
    if (e.result.indexOf("OKBP") !== -1) {
        _spd = e.result.split("#");
        txtidllamada.SetText(_spd[1]);
        alert("¡Asiento creado con éxito!");
    }
    else if (e.result.indexOf("IKCC") !== -1) {
        //_spd = e.result.split("#");
        //txtidllamada.SetText(_spd[1]);
        alert("¡Asiento Modificado con éxito!");
    }
    else {
        alert(e.result);
    }
}
function CancelClientCr() {
    ppcClientCr.Hide();
}
function ClearControlsClient() {
    
}

function fincallback(s, e) {
    alert(e.result);
}
function pestañascrearclie() {

    $(".amenucrearclie:first").css("background-color", "#44619E");
    $(".amenucrearclie:first").css("color", "white");
    $("section.sectablas").hide();
    $("section.sectablas:first").show();

    $(".amenucrearclie").click(function () {
        $(".amenucrearclie").css("background-color", "white");
        $(".amenucrearclie").css("color", "#44619E");
        $(this).css("background-color", "#44619E");
        $(this).css("color", "white");
        $("section.sectablas").hide();

        var activartabla = $(this).attr("href");
        $(activartabla).show();
        return false;
    });
}
