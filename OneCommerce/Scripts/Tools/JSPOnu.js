﻿var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
var TX = [];
var RX = [];
var FECHA = [];
$(document).ready(function () {
    
    try {
        Get_InitialData();
        Get_Plan();
        Set_VisibleOption();
    } catch (e) {
        alert(e.Message);
    }
});

//DATOS INICIALES
function Get_InitialData() {
    var socied = hdfTemp.Get("Sociedad");
    $.ajax(
    {
        type: "POST",
        url: "../RegistroOnus/Onus.aspx/Get_InitialData",
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

    var _rs1 = result.d.where(function (item) { return (item.Ident === "ON"); });
    cbbssede.BeginUpdate();
    cbbssede.ClearItems();
    _rs1.forEach(function (item) {
        cbbssede.AddItem(item.PrjName, item.IPONU + "$" + item.USUARIONU + "$" + item.PASSWORDONU);
    });
    cbbssede.EndUpdate();
    cbbssede.SetText(hdfTemp.Get("SEDE"));


}
function cambio_sede() {
    grdvRegistroOnus.PerformCallback("CHANGE");
}

function get_mensaje(s, e) {
    
    if(grdvRegistroOnus.GetVisibleRowsOnPage() == 0)
        mensaje();
}
function mensaje() {
    hdfTemp.PerformCallback("MensajeSalida");
    setTimeout(function () { alert("" + hdfTemp.Get("MensajeSalida")); }, 2000);
}



//function ShowConsumo() {
//    var fecha = new Date();
//    var fecha2 = new Date();
    
//    fecha.setDate(fecha.getDate() - 7);
//    fecha2.setDate(fecha2.getDate() - 1);

//    dteDateIn.SetDate(fecha);
//    dteDateFi.SetDate(fecha2);

//    showgrafico2();
//    ppcConsumo.Show();
    
//}


function Get_Plan() {

    grdvRegistroOnus.PerformCallback("INIT");
}
function Get_Plan2() {

    grdvRegistroOnus.PerformCallback("CHANGE");
}
function Get_Plan_Tecla() {

    grdvRegistroOnus.PerformCallback("INIT")
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

