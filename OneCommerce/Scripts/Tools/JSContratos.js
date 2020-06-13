var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    
    try {
        //_vld[4] = hdfTemp.Get("_emid");
        //_vld[6] = hdfTemp.Get("_soci");
        Get_InitialData();
        //txtDolar.SetText("0.00");
        //txtEuro.SetText("0.00");
        //Set_VisibleOption();
        //grdvContratos.PerformCallback("INIT");

    } catch (e) {
        alert(e.Message);
    }
});
function Clear_RangeDate() {
    if (chkRangeDate.GetChecked()) {
        dtebusqueda.SetDate(new Date());
        dtebusqueda2.SetDate(new Date());
    }
    else {
        dtebusqueda.SetText("");
        dtebusqueda2.SetText("");
    }
}
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Sales/ARInvoice.aspx/Get_InitialData",
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
    //OLE
    var _rs = result.d.where(function (item) { return (item.Ident === "RE"); });
    cbbVendedor.ClearItems();
    cbbVendedor.BeginUpdate();
    $.each(_rs, function (index, item) {
        cbbVendedor.InsertItem(index, item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[2] = item.Code;
        }
    });
    cbbVendedor.EndUpdate();
    cbbVendedor.SetValue("");
    dtebusqueda.SetDate(new Date());
    dtebusqueda2.SetDate(new Date());
}
function ShowServicio() {
    gdvServicio.PerformCallback("INIT:" + DocNum.GetText() + ":" + CardCode.GetText());
    ppcServicio.Show();
}
function Get_Contrato() {
    grdvContratos.PerformCallback("INIT");
}
function Get_Contrato_Tecla() {
    grdvContratos.PerformCallback("INIT");
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
    mnuOper.GetItemByName("Recursos").SetVisible(false);
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

