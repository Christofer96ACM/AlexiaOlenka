var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {

    try {
        //_vld[4] = hdfTemp.Get("_emid");
        //_vld[6] = hdfTemp.Get("_soci");

        //txtDolar.SetText("0.00");
        //txtEuro.SetText("0.00");
        Set_VisibleOption();
        //grdvContratos.PerformCallback("INIT");

    } catch (e) {
        alert(e.Message);
    }
});
function Get_Plan() {

    grdvPendientes.PerformCallback("INIT")
}
function OnGetRowValuesPlanes(values) {
    U_DXP_PLAN_INT.SetText(values[1]);
    //Name.SetText(values[1]);
    gdvTipoPlan.SetFocusedRowIndex(-1);
    ppcTipoPlanSearch.Hide();
}

//function Show_TipoPlan() {
//    Get_Plan();
//    //var dep = txtTipoPlanSearch.GetText();
//    //gdvTipoPlan.PerformCallback("SRCH:" + dep);
//    ppcTipoPlanSearch.Show();
//}

function EndTipoPlan() {
    gdvTipoPlan.SetFocusedRowIndex(0);
}

function CancelTipoPlan() {
    ppcTipoPlanSearch.Hide();
}

function Show_TipoPlanSearch() {
    Get_TipoPlan();
    ppcTipoPlanSearch.Show();
}


function OkTipoPlan() {
    var rowc = gdvTipoPlan.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvTipoPlan.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvTipoPlan.GetRowValues(gdvTipoPlan.GetFocusedRowIndex(), "Code;Name", OnGetRowValuesPlanes);
    }
}
function Get_TipoPlan() {
    var pl = txtTipoPlanSearch.GetText();
    gdvTipoPlan.PerformCallback("SRCH:" + pl);
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
    mnuOper.GetItemByName("New").SetVisible(false);
    mnuOper.GetItemByName("Search").SetVisible(false);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetVisible(false);
    mnuOper.GetItemByName("PaymentIn").SetVisible(false);
    mnuOper.GetItemByName("Print").SetVisible(false);
    mnuOper.GetItemByName("CopyFrom").SetVisible(false);
    mnuOper.GetItemByName("CopyTo").SetVisible(false);
    mnuOper.GetItemByName("Save").SetVisible(false);
    mnuOper.GetItemByName("New").SetVisible(false)
}
function SaveItems() {

    clbOperation.PerformCallback("UpdtContract");
}
function Save() {
    SaveItems();
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
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

