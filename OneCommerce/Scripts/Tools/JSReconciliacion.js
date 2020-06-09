$(document).ready(function () {
    try {
        //Get_InitialData();
        Set_VisibleOption();

    } catch (e) {
        alert(e.Message);
    }
});
function End_CallbackLines(s, e) {
    Set_SubTotal();
}
function Set_SubTotal() {
    var _sbt = parseFloat(gdvFacturas.cpDebit);
    var _sbt2 = parseFloat(gdvFacturas.cpCredit);
    //alert("" + _sbt);
    txtDeb.SetText(_sbt.toFixed(2));
    txtCred.SetText(_sbt2.toFixed(2));
}
function Get_InitialData() {

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
function InitControls() {
    //ClearControlsClient();
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
function Save() {
    clbOperation.PerformCallback("Save");
}
function Modificar() {
    clbOperation.PerformCallback("Update");
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save" && e.item.GetText() === "Crear") {
        Save();
        ClearControl();
    }
        // NUEVO
    else if (e.item.name === "New") {
        ClearControl();
    }
        // BUSCAR
    else if (e.item.name === "Search") {
        ppcProductSearch.Show();
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
        Modificar();
        ClearControl();
    }
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
        //ClearControlsClient();
        alert("¡Operación Concretada con Éxito!");
    }
    else {
        alert(e.result);
    }
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