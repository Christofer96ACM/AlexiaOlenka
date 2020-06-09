var _vld = [8];
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
        InitControls();
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
        url: "../Mikrotik/Planes.aspx/Get_InitialData",
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

    var _rs1 = result.d.where(function (item) { return (item.Ident === "MK"); });
    cbbssede.BeginUpdate();
    cbbssede.ClearItems();
    _rs1.forEach(function (item) {
        cbbssede.AddItem(item.PrjName, item.DIRECCIONIP + "$" + item.USUARIOMKT + "$" + item.PASSWORDMKT);
    });
    cbbssede.EndUpdate();
    cbbssede.SetText(hdfTemp.Get("SEDE"))


}
function cambio_sede() {
    grdvPlanes.PerformCallback("CHANGE");
}

function ShowConsumo() {
    var fecha = new Date();
    var fecha2 = new Date();
    
    fecha.setDate(fecha.getDate() - 7);
    fecha2.setDate(fecha2.getDate() - 1);

    dteDateIn.SetDate(fecha);
    dteDateFi.SetDate(fecha2);

    showgrafico2();
    ppcConsumo.Show();
    
}
function requestDatta2() {
    var socied = hdfTemp.Get("Sociedad");
    var sede = cbbssede.GetValue().split('$');
    var ip = sede[0];
    var abon = U_DXP_COD_ABONADO.GetText();
    var datei = dteDateIn.GetText();
    var datef = dteDateFi.GetText();


    $.ajax({
        type: "POST",
        url: "../Mikrotik/Planes.aspx/GET_VALORES_ABONADO2",
        data: '{"SOCIEDAD":"' + socied + '", "ABONADO":"' + abon + '", "fechai":"' + datei + '", "fechaf":"' + datef + '", "IP":"' + ip + '"}',
        contentType: "application/json; charset=uft-8",
        success: function (data) {
            $.each(data.d, function (i, item) {
               // alert("" + item.Tx2 + ":" + item.Rx2);
                if (data != null) {
                    var TX = parseInt(item.Tx2);
                    var RX = parseInt(item.Rx2);
                    
                    var x = item.FECHA;
                   
                    shift = 15 > 19;
                    chart.series[0].addPoint([x, TX], true, shift);
                    chart.series[1].addPoint([x, RX], true, shift);
                   
                } else {
                   
                }
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.error("Status: " + textStatus + " request: " + XMLHttpRequest); console.error("Error: " + errorThrown);
        }
    });
}
function showgrafico2() {
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });


    chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container1',
            animation: Highcharts.svg,
            type: 'column',
            events: {
                load: function () {
                    //if (grdvPlanes.IsEditing() && ppcConsumo.GetVisible())
                   // setInterval(function () {
                        requestDatta2();
                   // }, 2000);
                }
            }
        },
        title: {
            text: 'Consumo de Abonado'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            minPadding: 0.2,
            maxPadding: 0.2,
            title: {
                text: 'Trafico',
                margin: 80
            }
        },

        series: [{
            name: 'TX',
            data: []
        }, {
            name: 'RX',
            data: []
        }]
    });
}
function fila() {
    
    showgrafico();
}
function requestDatta() {
    //var ip = hdfTemp.Get("IP");
    //var username = hdfTemp.Get("UNMK");
    //var password = hdfTemp.Get("PSWMK");
    var sede = cbbssede.GetValue().split('$');
    var ip = sede[0];
    var username = sede[1];
    var password = sede[2];
    var abon = U_DXP_COD_ABONADO.GetText();

    $.ajax({
        type: "POST",
        url: "../Mikrotik/Planes.aspx/GET_VALORES_ABONADO",
        data: '{"IP":"' + ip + '", "USERNAME":"' + username + '", "PASSWORD":"' + password + '", "ABONADO":"' + abon + '"}',
        contentType: "application/json; charset=uft-8",
        success: function (data) {
            $.each(data.d, function (i, item) {
                if (data != null) {
                    var TX = parseInt(item.Tx);
                    var RX = parseInt(item.Rx);
                    if ((TX != 0 || TX != 'NaN') && (RX != 0 ||  RX != 'NaN')) {
                        Status.SetText("ONLINE");
                    }
                    else {
                        Status.SetText("OFFLINE");
                    }
                    var x = (new Date()).getTime();
                    //alert("" + item.Tx + ":" + item.Rx);
                    shift = 15 > 19;
                    chart.series[0].addPoint([x, TX], true, shift);
                    chart.series[1].addPoint([x, RX], true, shift);
                    document.getElementById("trafico").innerHTML = TX + " / " + RX;
                } else {
                    document.getElementById("trafico").innerHTML = "- / -";
                }
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.error("Status: " + textStatus + " request: " + XMLHttpRequest); console.error("Error: " + errorThrown);
        }
    });
}
function showgrafico() {
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });


    chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            animation: Highcharts.svg,
            type: 'spline',
            events: {
                load: function () {
                    var bucle = setInterval(function () {
                        if (grdvPlanes.IsEditing() && ppcStatus.GetVisible())
                            requestDatta();
                        else
                            clearInterval(bucle);
                    }, 2000);
                }
            }
        },
        title: {
            text: 'Consumo de Abonado'
        },
        xAxis: {
            type: 'datetime',
            tickPixelInterval: 150,
            maxZoom: 20 * 1000
        },
        yAxis: {
            minPadding: 0.2,
            maxPadding: 0.2,
            title: {
                text: 'Trafico',
                margin: 80
            }
        },
        series: [{
            name: 'TX',
            data: []
        }, {
            name: 'RX',
            data: []
        }]
    });
}
function Show_Status() {
    //gdvStatus.PerformCallback("INIT");
    showgrafico();
    ppcStatus.Show();

}

function Clear_RangeDate() {
    if (chkRangeDate.GetChecked()) {
        dterdDateIn.SetDate(new Date());
        dterdDateFi.SetDate(new Date());
    }
    else {
        dterdDateIn.SetText("");
        dterdDateFi.SetText("");
    }
}

function Get_Plan() {

    grdvPlanes.PerformCallback("INIT");
}

function Get_Plan_Tecla() {

    grdvPlanes.PerformCallback("CHANGE");
}

//para consumos 
function Get_Consumos() {

    grdvConsumos.PerformCallback("INIT")
}

function Get_Pendientes() {

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
    dterdDateIn.SetDate(new Date());
    dterdDateFi.SetDate(new Date());

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

