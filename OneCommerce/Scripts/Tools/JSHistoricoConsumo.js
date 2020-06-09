var _vld = [8];
var _dcs = [];
var _vld = [8];
var ult = 0;
function End_CallbackLines() {

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

function requestDatta() {
    var ip = "190.116.50.218";
    var username = "soporte";
    var password = "odex2020";
    var abon = "<pppoe-12642>";

    $.ajax({
        type: "POST",
        url: "../Grafico/HistoricoAbonado.aspx/GET_VALORES_ABONADO",
        data: '{"IP":"' + ip + '", "USERNAME":"' + username + '", "PASSWORD":"' + password + '"}',
        contentType: "application/json; charset=uft-8",
        success: function (data) {
            $.each(data.d, function (i, item) {
                if (data != null) {
                    var TX = parseInt(item.Tx);
                    var RX = parseInt(item.Rx);
                    var x = (new Date()).item.FECHA;
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

$(document).ready(function () {
    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });


    chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container1',
            animation: Highcharts.svg,
            type: 'spline',
            events: {
                load: function () {
                    setInterval(function () {
                        requestDatta();
                    }, 1000);
                }
            }
        },
        title: {
            text: 'Monitoring'
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
                text: 'Trafico1',
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
});



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

