var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    //pestañascrearclie();
    try {
        Set_VisibleOption();
        Get_InitialData();
        $("#tab2").hide();
    } catch (e) {
        alert(e.Message);
    }
});
//------------------------------------------------------
function Get_CreditTarject() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
        {
            type: "POST",
            url: "../Sales/ARInvoice.aspx/Get_CreditTarject",
            data: '{"socied":"' + socied + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                cbbCreditCard1.BeginUpdate();
                $.each(result.d, function (index, item) {
                    cbbCreditCard1.InsertItem(index, item.CardName, item.CreditCard);
                    if (item.Dfault === 1) {
                        _vld[5] = item.CreditCard;
                    }
                });
                cbbCreditCard1.EndUpdate();
            },
            error: function (result) {
                alert(result);
            }
        });
}
function Get_OutBalance() {
    var total = "";
    if (rbtnType.GetValue() == "Y") {
        if (checkPagoCuenta.GetValue() == "Y") {
            total = txtDocTotalCP.GetText();
        }
        else {
            total = txtSaldoP.GetText();
        }
    } else {
        total = txtSaldoP.GetText();
    }
    return (total.toString());
}
function Med_Payment2() {
    if (Get_OutBalance() !== 0) {
        cbbCuentaTrans.PerformCallback();
        //-----------------------------
        if (rbtnType.GetValue() == "Y") {
            cbbCurPagoEfe.SetText("SOL");
            cbbCurPagoTar.SetText("SOL");
            cbbCurPagoTrans.SetText("SOL");
        } else {
            cbbCurPagoEfe.SetValue(cbbDocCur.GetValue());
            cbbCurPagoTar.SetValue(cbbDocCur.GetValue());
            cbbCurPagoTrans.SetValue(cbbDocCur.GetValue());
        }
        //-----------------------------
        

        txtSalEfe1.SetText(Get_OutBalance());
        txtSalEfe2.SetText("0");
        txtSalTar1.SetText(Get_OutBalance());
        txtSalTar2.SetText("0");
        txtSalTrans1.SetText(Get_OutBalance());
        txtSalTrans2.SetText("0");
        dteDocDateTrans.SetDate(new Date());
        dteDocDateTarj.SetDate(new Date());
        dteDocDateEfect.SetDate(new Date());

        //cbbCreditCard.SetValue(_vld[5]);
        //txtCardNum.SetText("");



        ppcPagos.Show();
    }
    {
        //alert("El documento está cerrado.");
    }
}
function cambio_moneda_pago() {
    var x = cbbCurPagoEfe.GetValue();
    var total = parseFloat(gdvFacturas.cpSubTotal);
    if (x == "SOL") {
        txtSalEfe1.SetText(total);
    }
    else if (x == "USD") {
        txtSalEfe1.SetText(total / hdfTemp.Get("rateusd"));
    }
    else if (x == "EUR") {
        txtSalEfe1.SetText(total / hdfTemp.Get("rateeur"));
    }
}
function cambio_moneda_pago2() {
    var x = cbbCurPagoTar.GetValue();
    var total = parseFloat(gdvFacturas.cpSubTotal);
    if (x == "SOL") {
        txtSalTar1.SetText(total);
    }
    else if (x == "USD") {
        txtSalTar1.SetText(total / hdfTemp.Get("rateusd"));
    }
    else if (x == "EUR") {
        txtSalTar1.SetText(total / hdfTemp.Get("rateeur"));
    }
}
function cambio_moneda_pago3() {
    var x = cbbCurPagoTrans.GetValue();
    var total = parseFloat(gdvFacturas.cpSubTotal);
    if (x == "SOL") {
        txtSalTrans1.SetText(total);
    }
    else if (x == "USD") {
        txtSalTrans1.SetText(total / hdfTemp.Get("rateusd"));
    }
    else if (x == "EUR") {
        txtSalTrans1.SetText(total / hdfTemp.Get("rateeur"));
    }
}
function Sel_CreditCard1() {
    txtNumTarjeta.Focus();
    txtNumTarjeta.SelectAll();
    window.setTimeout("txtNumTarjeta.Focus()", 100);
    window.setTimeout("txtNumTarjeta.SelectAll()", 100);
}
function Set_Pago2() {
    if (checkpagoefe.GetValue == "Y") {
        if (parseFloat(txtSalEfe2.GetValue()) <= 0 && parseFloat(txtSalEfe2.GetValue()) > Get_OutBalance()) {
            alert("Ingrese monto mayor a cero y\nmenor o igual al saldo pendiente.");
            return;
        }
    }
    if (checkpagotar.GetValue == "Y") {
        if (parseFloat(txtSalTar2.GetValue()) <= 0 && parseFloat(txtSalTar2.GetValue()) > Get_OutBalance()) {
            alert("Ingrese monto mayor a cero y\nmenor o igual al saldo pendiente.");
            return;
        }
        else if (isNullOrWhiteSpace(txtNumTarjeta.GetText()) || txtNumTarjeta.GetText().trim().length !== 4) {
            alert("Ingrese los últimos 4 dígitos de la tarjeta.");
            return;
        }
    }
    if (checkpagotrans.GetValue == "Y") {
        if (parseFloat(txtSalTrans2.GetValue()) <= 0 && parseFloat(txtSalTrans2.GetValue()) > Get_OutBalance()) {
            alert("Ingrese monto mayor a cero y\nmenor o igual al saldo pendiente.");
            return;
        }
    }


    ldpProcess.SetText("Pagando, espere por favor...");
    ldpProcess.Show();
    clbOperation.PerformCallback("Payment");
    ppcPagos.Hide();
}
function CancelPago() {
    ppcPagos.Hide();
}
//------------------------------------------------------
function checkcuentaPago() {
    if (checkPagoCuenta.GetValue() == "Y" && confirm("El Pago a Cuenta no se Asignará a Ninguna Factura.")) {
        txtDocTotalCP.SetEnabled(true);
        txtDocTotalCP.focus();
    }
    else {
        txtDocTotalCP.SetEnabled(false);
    }
}
function cambio_tipo() {
    if (rbtnType.GetValue() == "Y") {
        $("#tab2").hide();
        $("#tab1").show();
    }
    else {
        $("#tab2").show();
        $("#tab1").hide();
    }
}
function set_dscto() {
    var dsct = parseFloat(Descto.GetText());
    var pg = parseFloat(SaldoVenc.GetText());
    var subtotal = pg - (pg * dsct / 100);
    PagoTotal.SetText(subtotal);
}
function End_CallbackLines(s, e) {
    Set_SubTotal();
}
function Set_SubTotal() {
    var _sbt = parseFloat(gdvFacturas.cpSubTotal);
    var totalito = gdvFacturas.cpTotalito;
    //alert("" + _sbt);
    txtSaldoP.SetText(_sbt.toFixed(2));
    txtimportetotal.SetText(totalito);
}

function endlines_plancuentas(s, e) {
    Set_Importe();
}
function Set_Importe() {
    var _sbt = parseFloat(gdvCuentas.cpSubTotalPlanCuenta);
    //alert("" + _sbt);
    txtimportetotal2.SetText(_sbt.toFixed(2));
}
function Get_PR() {
    gdvPR.PerformCallback("GET");
}

function okPR() {
    var rowc = gdvPR.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvPR.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvPR.GetRowValues(gdvPR.GetFocusedRowIndex(), "DocEntry;CardCode;CardName;DocDate;BillStreet;DocTotal;PayToCode;ShipToCode;ShipStreet;Address2;Reserve;TaxDate;DocDueDate;BaseDocEntry;SerieGuia", OnGetRowValuesServicio);
    }
}
function OnGetRowValuesServicio(values) {

    if (values[10] == "C") rbtnType.SetValue("Y");
    else if (values[10] == "A") rbtnType.SetValue("N");
    //rbtnType.SetValue(values[10]);

    if (rbtnType.GetValue() == "Y") {
        $("#tab2").hide();
        $("#tab1").show();
    }
    else {
        $("#tab2").show();
        $("#tab1").hide();
    }
    bteCustomer.SetText(values[1]);
    txtCustomerName.SetText(values[2]);
    txtDocNum.SetText(values[0]);
    txtDocNum2.SetText(values[0]);
    txtNroOperacion.SetText(values[13]);
    txtNroOperacion2.SetText(values[13]);
    txtimportetotal.SetText(values[5]);
    txtimportetotal2.SetText(values[5]);
    cbbMedioPago2.SetValue(values[14]);
    cbbMedioPago.SetValue(values[14]);
    txtcreateDate1.SetDate(values[3]);
    txtcloseDate1.SetDate(values[12]);
    txtdocDate1.SetDate(values[12]);
    txtcreateDate2.SetDate(values[3]);
    txtcloseDate2.SetDate(values[12]);
    txtdocDate2.SetDate(values[12]);
    cbbAddress.SetText(values[6]);
    txtDepartamento1.SetText(values[7]);
    txtProvincia1.SetText(values[8]);
    txtDistrito1.SetText(values[9]);
    txtStreets1.SetText(values[4]);

    ppcPRSearch.Hide();
}
function CancelPR() {
    ppcPRSearch.Hide();
}
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../GestionBancos/PagosRecibidos.aspx/DXP_VALORES_GESTIONBANCOS",
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
    Get_CreditTarject();
    dteFecha.SetDate(new Date());
    txtcreateDate1.SetDate(new Date());
    txtcloseDate1.SetDate(new Date());
    txtdocDate1.SetDate(new Date());
    txtcreateDate2.SetDate(new Date());
    txtcloseDate2.SetDate(new Date());
    txtdocDate2.SetDate(new Date());
    txtDocTotalCP.SetEnabled(false);

    var _rs1 = result.d.where(function (item) { return (item.CLAVE === "MP"); });
    cbbMedioPago.BeginUpdate();
    cbbMedioPago.ClearItems();
    cbbMedioPago2.BeginUpdate();
    cbbMedioPago2.ClearItems();
    _rs1.forEach(function (item) {
        cbbMedioPago.AddItem(item.VALOR, item.INDEX);
        cbbMedioPago2.AddItem(item.VALOR, item.INDEX);
    });
    cbbMedioPago.EndUpdate();
    cbbMedioPago.SetValue("000");
    cbbMedioPago2.EndUpdate();
    cbbMedioPago2.SetValue("000");

    var _rs2 = result.d.where(function (item) { return (item.CLAVE === "PR"); });
    cbbProyecto2.BeginUpdate();
    cbbProyecto2.ClearItems();
    cbbProyecto.BeginUpdate();
    cbbProyecto.ClearItems();
    _rs2.forEach(function (item) {
        cbbProyecto2.AddItem(item.VALOR, item.INDEX);
        cbbProyecto.AddItem(item.VALOR, item.INDEX);
    });
    cbbProyecto2.EndUpdate();
    cbbProyecto2.SetValue("00");
    cbbProyecto.EndUpdate();
    cbbProyecto.SetValue("00");
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
    mnuOper.GetItemByName("Recursos").SetVisible(false);
    mnuOper.GetItemByName("Cancel").SetVisible(true);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetVisible(false);
    mnuOper.GetItemByName("PaymentIn").SetVisible(true);
    mnuOper.GetItemByName("Print").SetVisible(false);
    mnuOper.GetItemByName("CopyFrom").SetVisible(false);
    mnuOper.GetItemByName("CopyTo").SetVisible(false);
    mnuOper.GetItemByName("Save").SetEnabled(false);

    mnuOper.GetItemByName("Export").SetEnabled(false);
    mnuOper.GetItemByName("PaymentIn").SetEnabled(true);
    mnuOper.GetItemByName("Print").SetEnabled(false);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
    mnuOper.GetItemByName("CopyTo").SetEnabled(false);
}
function Get_Cuenta1(s, e) {
    gdvCuentassrch.PerformCallback("GET");
    if (e.htmlEvent.keyCode === 13) {
        gdvCuentassrch.SetFocusedRowIndex(0);
        OkCuenta();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Get_Cuenta() {
    //gdvProductSearch.SetFocusedRowIndex(-1);
    gdvCuentassrch.PerformCallback("GET");
}

function OkCuenta() {
    var rowc = gdvCuentassrch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvCuentassrch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvCuentassrch.GetRowValues(gdvCuentassrch.GetFocusedRowIndex(), "AcctCode;AcctName;CurrTotal;ActCurr", OnGetRowValuesCards);
    }
}

function OnGetRowValuesCards(values) {
    
    AcctCode.SetText(values[0]);
    ActCurr.SetText(values[3]);
    ppcCuentasSearch.Hide();
}

function CancelCuenta() {
    ppcCuentasSearch.Hide();
}
function Show_CuentaSearch() {
    gdvCuentassrch.PerformCallback("GET");
    ppcCuentasSearch.Show();
}
function ShowClientSearch() {
    ppcClientSearch.Show();
}
function Get_Client1(s, e) {
    //gdvClientSearch.SetFocusedRowIndex(-1);
    gdvClientSearch.PerformCallback();
    if (e.htmlEvent.keyCode === 13) {
        gdvClientSearch.SetFocusedRowIndex(0);
        OkClient();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Get_Client() {
    gdvClientSearch.SetFocusedRowIndex(-1);
    gdvClientSearch.PerformCallback();
}

function OkClient() {
    var rowc = gdvClientSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvClientSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvClientSearch.GetRowValues(gdvClientSearch.GetFocusedRowIndex(), "CardCode;CardName;LicTradNum;Cellular", OnGetRowValuesClient);
    }
}

function OnGetRowValuesClient(values) {
    bteCustomer.SetText(values[0]);
    txtCustomerName.SetText(values[1]);
    txttelf.SetText(values[3]);
    txtcontctCode1.PerformCallback("INICIAR:" + values[0]);
    cbbAddress.PerformCallback("GET:" + values[0]);
    gdvFacturas.PerformCallback("GET:" + values[0]);
    gdvClientSearch.SetFocusedRowIndex(-1);
    ppcClientSearch.Hide();
}

function CancelClient() {
    ppcClientSearch.Hide();
}

function EndClientSearch() {
    gdvClientSearch.SetFocusedRowIndex(0);
    //ppcClientSearch.UpdatePosition();
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
    
}

function InitControls() {

    //------------------------------------
    bteCustomer.SetText("");
    txtCustomerName.SetText("");
    hdfTemp.Set("adrtype", "");
    //txtcntrctDate
    //txtItemGroup.SetText("");

    cbbAddress.SetText("");
    gdvFacturas.PerformCallback("CLR");
    //mnuOper.GetItemByName("Save").SetText("Crear");
}

function Cancel() {
    clbOperation.PerformCallback("Cancel");
}
function Modificar() {
    clbOperation.PerformCallback("UpdtServicio");
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Cancel") {
        Cancel();
    }
        // NUEVO
    else if (e.item.name === "New") {
        ClearControl();
    }
        // BUSCAR
    else if (e.item.name === "Search") {
        showsearchserv();
    }
    else if (e.item.name === "PaymentIn") {
        Med_Payment2();
    }
}
function showsearchserv() {
    ppcPRSearch.Show();
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
        txtDocNum.SetText(_spd[1]);
        txtNroOperacion.SetText(_spd[2]);
        txtDocNum2.SetText(_spd[1]);
        txtNroOperacion2.SetText(_spd[2]);
        alert("¡Pago Recibido creado con éxito!");
    }
    else if (e.result.indexOf("CANC") !== -1) {
        //_spd = e.result.split("#");
        //txtidllamada.SetText(_spd[1]);
        alert("¡Pago Recibido cancelado con éxito!");
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
    //alert(e.result);
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
