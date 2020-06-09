var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    //pestañascrearclie();
    try {
        _vld[4] = hdfTemp.Get("_emid");
        _vld[6] = hdfTemp.Get("_soci");

        //txtDolar.SetText("0.00");
        //txtEuro.SetText("0.00");


    } catch (e) {
        alert(e.Message);
    }
});
function ShowClientSearch() {
    ppcClientSearch.Show();
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
        gdvClientSearch.GetRowValues(gdvClientSearch.GetFocusedRowIndex(), "CardCode;CardName;LicTradNum;ListNum;SlpCode;GroupNum;ShipToDef;ShipStreet;BillToDef;BillStreet", OnGetRowValuesClient);
    }
}

function OnGetRowValuesClient(values) {
    txtCardCode.SetText(values[0]);
    bteCardName.SetText(values[1]);
    bteLicTradNum.SetText(values[2]);
    cbbListNum.SetValue(values[3]);
    //if (values[3] === 3 || values[3] === 13) {
    //    cbbListNum.SetValue(values[3]);
    //} else {
    //    cbbListNum.SetSelectedIndex(ult);
    //}
    if (values[4] != -1) {
        cbeSalesPerson.SetValue(values[4]);
    }
    cbbGroupNum.SetValue(values[5]);

    txtShipToCode.SetText(values[6]);
    bteShipToCode.SetText(values[7]);
    txtBillToCode.SetText(values[8]);
    bteBillToCode.SetText(values[9]);
    codigo_cliente = values[0];
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
    //ClearControlsClient();
}


function Set_VisibleOption() {
    mnuOper.GetItemByName("Quote").SetVisible(false);
    mnuOper.GetItemByName("OrderTo").SetVisible(false);
    mnuOper.GetItemByName("DeliveryNote").SetVisible(false);
    mnuOper.GetItemByName("Cancel").SetVisible(false);
}
function SaveItems() {
    
    clbOperation.PerformCallback("SaveItem");
}
function Save() {
    SaveItems();
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save" && e.item.GetText() === "Crear") {
        Save();
    }
        // NUEVO
    else if (e.item.name === "New") {
        //ClearControl();
    }
        // BUSCAR
    else if (e.item.name === "Search") {
        
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {

        

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
        ClearControlsClient();
        alert("Cliente creado con exito...!!");
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
