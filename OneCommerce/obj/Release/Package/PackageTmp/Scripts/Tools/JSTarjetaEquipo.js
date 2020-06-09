var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    pestañascrearclie();
    try {
        Set_VisibleOption();

    } catch (e) {
        alert(e.Message);
    }
});
function Get_Tarjeta() {
    gdvTarjeta.PerformCallback("GET");
}
function Get_Tarjeta1() {

}
function Get_Tarjeta2(s, e) {

}
function okTarjeta() {
    var rowc = gdvTarjeta.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvTarjeta.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvTarjeta.GetRowValues(gdvTarjeta.GetFocusedRowIndex(), "ItemCode;ItemName;CardCode;CardName;manufSN;internalSN;Status;instLction;directCsmr;drctCsmNam;deliveryNo;invoiceNum;contactCod;U_GOS_MARCA;U_GOS_MODELO;insID;street;distrito;county;state", OnGetRowValuesTarjeta);
    }
}
function OnGetRowValuesTarjeta(values) {
    
    bteCustomer.SetText(values[2]);
    cbbstatus.SetValue(values[6]);
    txtcustmrName.SetText(values[3]);
    //txtcontctCode1.PerformCallback("INICIAR:" + values[2]);
    bteitemCode.SetText(values[0]);
    txtitemName.SetText(values[1]);
    txtMarca.SetText(values[13]);
    txtModelo.SetText(values[14]);
    txtinsID.SetText(values[15]);
    txtmanufSN.SetText(values[4]);
    txtinternalSN.SetText(values[5]);
    cbbAddress.SetText(values[7]);
    txtdirectCsmr.SetText(values[8]);
    txtdrctCsmNam.SetText(values[9]);
    txtdeliveryNo.SetText(values[10]);
    txtInvoiceNum.SetText(values[11]);
    txtProvincia1.SetText(values[18]);
    txtDistrito1.SetText(values[17]);
    txtDepartamento1.SetText(values[19]);
    txtStreets1.SetText(values[16]);
    grdvLlamada.PerformCallback("GET:"+values[2]+":"+values[0]+":"+values[4]);

    mnuOper.GetItemByName("Save").SetText("Modificar");
    ppcTarjetaSearch.Hide();
}
function CancelTarjeta() {
    ppcTarjetaSearch.Hide();
}
function pestañascrearclie() {
    $(".amenucrearclie").css("background-color", "#4F93E3");
    $(".amenucrearclie").css("color", "White");
    $(".amenucrearclie:first").css("background-color", "#BCD4F6");
    $(".amenucrearclie:first").css("color", "Black");

    $("section.sectablas").hide();
    $("section.sectablas:first").show();

    $(".amenucrearclie").click(function () {
        $(".amenucrearclie").css("background-color", "#4F93E3");
        $(".amenucrearclie").css("color", "White");
        $(this).css("background-color", "#BCD4F6");
        $(this).css("color", "Black");
        $("section.sectablas").hide();

        var activartabla = $(this).attr("href");
        $(activartabla).show();
        return false;
    });
}
function ShowProductSearch() {
    ppcProductSearch.Show();
}
function Get_Product(s, e) {
    gdvProductSearch.SetFocusedRowIndex(-1);
    gdvProductSearch.PerformCallback("GENERAL");
    if (e.htmlEvent.keyCode === 13) {
        gdvProductSearch.SetFocusedRowIndex(0);
        OkProduct();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
    //gdvProductSearch.Focus();
}
function OkProduct() {
    var rowc = gdvProductSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvProductSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvProductSearch.GetRowValues(gdvProductSearch.GetFocusedRowIndex(), "ItemCode;ItemName;U_GOS_MARCA;U_GOS_MODELO", OnGetRowValuesProduct);
    }
}
function OnGetRowValuesProduct(values) {

    bteitemCode.SetText(values[0]);
    txtitemName.SetText(values[1]);
    txtMarca.SetText(values[2]);
    txtModelo.SetText(values[3]);

    ppcProductSearch.Hide();
    gdvProductSearch.PerformCallback("CLR");
    //txtItemcode.SetEnabled(false);
}
function CancelProduct() {
    ppcProductSearch.Hide();
}
function EndProductSearch() {
    gdvProductSearch.SetFocusedRowIndex(0);
    //ppcProductSearch.UpdatePosition();
}

function EnddirectCsmrSearch() {

}
function OkdirectCsmr() {

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
    txtcustmrName.SetText(values[1]);
    //txttelf.SetText(values[3]);
    txtcontctCode1.PerformCallback("INICIAR:" + values[0]);
    cbbAddress.PerformCallback("GET:" + values[0]);
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
function ShowdirectCsmrSearch() {
    ppcdirectCsmrSearch.Show();

}

function Get_directCsmr() {
    gdvdirectCsmr.SetFocusedRowIndex(-1);
    gdvdirectCsmr.PerformCallback();
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
    bteCustomer.SetText("");
    cbbstatus.SetSelectedIndex(0);
    txtcustmrName.SetText("");
    //txtcontctCode1.PerformCallback("INICIAR:" + values[2]);
    bteitemCode.SetText("");
    txtitemName.SetText("");
    txtMarca.SetText("");
    txtModelo.SetText("");
    txtinsID.SetText("");
    txtmanufSN.SetText("");
    txtinternalSN.SetText("");
    cbbAddress.SetText("");
    txtdirectCsmr.SetText("");
    txtdrctCsmNam.SetText("");
    txtdeliveryNo.SetText("");
    txtInvoiceNum.SetText("");
    txtProvincia1.SetText("");
    txtDistrito1.SetText("");
    txtDepartamento1.SetText("");
    txtStreets1.SetText("");
    grdvLlamada.PerformCallback("CLR");
    mnuOper.GetItemByName("Save").SetText("Crear");
}
function Set_VisibleOption() {
    mnuOper.GetItemByName("Recursos").SetVisible(false);
    mnuOper.GetItemByName("Cancel").SetVisible(false);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetVisible(false);
    mnuOper.GetItemByName("PaymentIn").SetVisible(false);
    mnuOper.GetItemByName("Print").SetVisible(false);
    mnuOper.GetItemByName("CopyFrom").SetVisible(false);
    mnuOper.GetItemByName("CopyTo").SetVisible(false);

    mnuOper.GetItemByName("Export").SetEnabled(false);
    mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
    mnuOper.GetItemByName("Print").SetEnabled(false);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
    mnuOper.GetItemByName("CopyTo").SetEnabled(false);
}
function SaveTarjeta() {

    clbOperation.PerformCallback("SaveTarjeta");
}
function Save() {
    SaveTarjeta();
}
function Modificar() {
    clbOperation.PerformCallback("UpdtTarjeta");
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
        showTarjeta();
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
        Modificar();
    }
}
function showTarjeta() {
    ppcTarjetaSearch.Show();
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
        txtinsID.SetText(_spd[1]);
        alert("¡Tarjeta de Equipo creada con éxito!");
    }
    else if (e.result.indexOf("IKCC") !== -1) {
        //_spd = e.result.split("#");
        //txtidllamada.SetText(_spd[1]);
        alert("¡Tarjeta de Equipo Modificado con éxito!");
    }
    else {
        alert(e.result);
    }
}

function fincallback(s, e) {
    alert(e.result);
}

