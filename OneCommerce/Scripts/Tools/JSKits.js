var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    try {
        Get_InitialData();
        Set_VisibleOption();

    } catch (e) {
        alert(e.Message);
    }
});
function Show_ProductSearch() {
    ppcProductSearch.Show();
}
function Show_AlmacenSearch() {

    ppcAlmacenSearch.Show();
}
function CancelAlmacen() {
    gdvWhsCodeSearch.Hide();
}
function Get_Almacen() {
    gdvWhsCodeSearch.SetFocusedRowIndex(-1);
    gdvWhsCodeSearch.PerformCallback("ALMCN");
}

function OkAlmacen() {
    var rowc = gdvWhsCodeSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvWhsCodeSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvWhsCodeSearch.GetRowValues(gdvWhsCodeSearch.GetFocusedRowIndex(), "WhsCode;WhsName", OnGetRowValuesAlmacen);
    }
}

function OnGetRowValuesAlmacen(values) {

    bteWhsCode.SetText(values[0]);
    txtWhsName.SetText(values[1]);
    //txtRevenuesAc.SetText(values[2]);
    //txtExpensesAc.SetText(values[3]);

    gdvWhsCodeSearch.SetFocusedRowIndex(-1);
    ppcAlmacenSearch.Hide();
}

function EndAlmacenSearch() {
    gdvWhsCodeSearch.SetFocusedRowIndex(0);
    //gdvWhsCodeSearch.UpdatePosition();
}
function Key_Product(s, e) {
    if (e.htmlEvent.keyCode === 13) {
        Add_Product();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
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
function ClearControl() {
    InitControls();
    bteItemcode.SetText("");
    txtItemName.SetText("");
    bteItemcode.SetEnabled(true);
    txtItemName.SetEnabled(true);
    gdvHijos.PerformCallback("CLR");
    mnuOper.GetItemByName("Save").SetText("Crear");
    gdvProductSearch.PerformCallback("CLR");
}

function InitControls() {
    //ClearControlsClient();
}
function Set_VisibleOption() {
    checkHideComp.SetEnabled(false);
    cbbTreeType.SetEnabled(false);
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
    clbOperation.PerformCallback("SaveKits");
}
function Modificar() {
    clbOperation.PerformCallback("UpdateKits");
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
function CancelClientCr() {
    ppcClientCr.Hide();
}
function ClearControlsClient() {
    
}
function Get_Product() {
    gdvProductSearch.SetFocusedRowIndex(-1);
    gdvProductSearch.PerformCallback("GENERAL");
    //gdvProductSearch.Focus();
}
function Get_Product1(s, e) {
    gdvProductSearch.SetFocusedRowIndex(-1);
    gdvProductSearch.PerformCallback("GENERAL");
    if (e.htmlEvent.keyCode === 13) {
        gdvProductSearch.SetFocusedRowIndex(0);
        OkProduct();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
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
        //gdvHijos.PerformCallback("CLR");
        gdvProductSearch.GetRowValues(gdvProductSearch.GetFocusedRowIndex(), "ItemCode;ItemName;TreeType;HideComp", OnGetRowValuesProduct);
    }
}
function OnGetRowValuesProduct(values) {
    
    bteItemcode.SetText(values[0]);
    txtItemName.SetText(values[1]);
    checkHideComp.SetValue(values[3]);
    bteItemcode.SetEnabled(false);
    txtItemName.SetEnabled(false);
    gdvHijos.PerformCallback("GET:" + values[0]);
    gdvProductSearch.PerformCallback("CLR");
    mnuOper.GetItemByName("Save").SetText("Modificar");
    ppcProductSearch.Hide();
}
function CancelProduct() {
    ppcProductSearch.Hide();
}
function EndProductSearch() {
    gdvProductSearch.SetFocusedRowIndex(0);
    //ppcProductSearch.UpdatePosition();
}
function fincallback(s, e) {
    alert(e.result);
}

function Get_Product2() {
    gdvProductSearch2.SetFocusedRowIndex(-1);
    gdvProductSearch2.PerformCallback("GENERAL");
    //gdvProductSearch2.Focus();
}
function Get_Product22(s, e) {
    gdvProductSearch2.SetFocusedRowIndex(-1);
    gdvProductSearch2.PerformCallback("GENERAL");
    if (e.htmlEvent.keyCode === 13) {
        gdvProductSearch2.SetFocusedRowIndex(0);
        OkProduct2();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function OkProduct2() {
    var rowc = gdvProductSearch2.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvProductSearch2.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        //gdvHijos.PerformCallback("CLR");
        gdvProductSearch2.GetRowValues(gdvProductSearch2.GetFocusedRowIndex(), "ItemCode;ItemName;Quantity2;WhsCode;InvntryUom", OnGetRowValuesProduct2);
    }
}
function OnGetRowValuesProduct2(values) {

    gdvHijos.PerformCallback("ADDPRODUCT:" + values);
    //gdvProductSearch.PerformCallback("CLR");
    //mnuOper.GetItemByName("Save").SetText("Modificar");
    ppcProductSearch2.Hide();
}
function CancelProduct2() {
    ppcProductSearch2.Hide();
}
function EndProductSearch2() {
    gdvProductSearch2.SetFocusedRowIndex(0);
    //ppcProductSearch.UpdatePosition();
}
function Show_ProductSearch2() {
    ppcProductSearch2.Show();
}

function Get_Product3() {
    gdvProductSearch3.SetFocusedRowIndex(-1);
    gdvProductSearch3.PerformCallback("GENERAL");
    //gdvProductSearch3.Focus();
}
function Get_Product33(s, e) {
    gdvProductSearch3.SetFocusedRowIndex(-1);
    gdvProductSearch3.PerformCallback("GENERAL");
    if (e.htmlEvent.keyCode === 13) {
        gdvProductSearch3.SetFocusedRowIndex(0);
        OkProduct3();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function OkProduct3() {
    var rowc = gdvProductSearch3.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvProductSearch3.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        //gdvHijos.PerformCallback("CLR");
        gdvProductSearch3.GetRowValues(gdvProductSearch3.GetFocusedRowIndex(), "ItemCode;ItemName;Quantity2;WhsCode;InvntryUom", OnGetRowValuesProduct3);
    }
}
function OnGetRowValuesProduct3(values) {

    bteItemcode.SetText(values[0]);
    txtItemName.SetText(values[1]);
    ppcProductSearch3.Hide();
}
function CancelProduct3() {
    ppcProductSearch3.Hide();
}
function EndProductSearch3() {
    gdvProductSearch3.SetFocusedRowIndex(0);
    //ppcProductSearch.UpdatePosition();
}
function Show_ProductSearch3() {
    ppcProductSearch3.Show();
}