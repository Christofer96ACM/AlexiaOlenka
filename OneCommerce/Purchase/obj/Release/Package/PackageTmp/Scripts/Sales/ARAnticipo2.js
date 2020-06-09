var _vld = [8];
var det = [];
$(document).ready(function () {
    _vld[5] = hdfTemp.Get("_emid");
    _vld[6] = hdfTemp.Get("_soci");
});
function ValidaSoloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode;
    return (key >= 48 && key <= 57);
}
function Operacion() {
    if (txtnropedido.GetText() == "" || txtnropedido.GetText() == "_________" ) {
        alert('Ingrese Número de Pedido');
        //txtnropedido.Focus();
    }
    else
        Get_Pedido(); 
}
function Get_Pedido() {
    var socied = hdfTemp.Get("_soci");
    var numped = txtnropedido.GetText();
    $.ajax(
    {
        type: "POST",
        url: "../Sales/FacturaAnticipo.aspx/Get_Pedido",
        data: '{"socied":"' + socied + '", "numped":"' + numped + '"}',
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            if (result.d.length == 0)
            alert('Número Incorreto');
            else
            Set_numped(result);
            
        },
        error: function (result) {
            alert(result);
        }
    });
}
function checklength(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}
function Hour() {
    var now = new Date();
    var hours = checklength(now.getHours());
    var minutes = checklength(now.getMinutes());
    var seconds = checklength(now.getSeconds());
    var format = 1;
    var time;

    if (format == 1) {
        if (hours >= 12) {
            if (hours == 12) {
                hours = 12;
            } else {
                hours = hours - 12;
            }
            time = hours + ':' + minutes + ':' + ' PM';
        } else if (hours < 12) {
            if (hours == 0) {
                hours = 12;
            }
            time = hours + ':' + minutes + ':' + ' AM';
        }
    }

    return (time);
}
function Set_numped(result) {
    
    var socied = hdfTemp.Get("_soci");
    $.each(result, function (index, value) {
       

        // DETAIL
        $.ajax(
            {
                type: "POST",
                url: "../Sales/FacturaAnticipo.aspx/Get_DetaPedido",
                data: '{"socied":"' + socied + '", "DocEntrys":"' + value[0].DocEntry + '"}',
                contentType: "application/json; charset=uft-8",
                dataType: "json",
                success: function (result) {
                    var html = '<html><head><style>table{font-family: Futura, Arial, sans-serif;font-size: 8px;color: black;}</style></head><body><table>';
                    //HEADER
                    html = html + '<tr><td style="text-align:center;">NOTA DE PEDIDO</td></tr>';
                    if (_vld[6] === "BM") {
                        html = html + '<tr><td style="text-align:center;">BELMAY S.A.C.</td></tr>';
                    }
                    else {
                        html = html + '<tr><td style="text-align:center;">BOTICA FRANCESA S.A.C.</td></tr>';
                    }
                    html = html + "<tr><td></td></tr>";
                    html = html + "<tr><td>NRO. PEDIDO: " + value[0].DocNum + "</td></tr>";
                    html = html + "<tr><td>FECHA: " + value[0].DocDate2 + " " + Hour() + "</td></tr>";
                    html = html + "<tr><td>CLIENTE: " + value[0].CardName + "</td></tr>";
                    html = html + "<tr><td>" + (new Array(60)).join("_") + "</td></tr>";
                    //DETALLE
                    $.each(result.d, function (i, item) {

                        var pr = item.Price
                        var _pricediscount = (" S/. " + parseFloat(pr).toFixed(2));
                        var plg = _pricediscount.length;
                        var val = "- " + item.ItemCode + " " + item.Quantity + " " + item.ItemName;
                        var ilg = (55 - plg);
                        var ncad = val.insert(ilg, _pricediscount + "<br>");
                        html = html + "<tr><td>" + ncad + "</td></tr>";
                    });
                    html = html + "<tr><td>" + (new Array(60)).join("_") + "</td></tr>";

                    //FOOTER
                    var val = (new Array(24)).join(" ") + "S/. " + value[0].DocTotal;
                    val = Right(val, 24);
                    html = html + "<tr><td>TOTAL VENTA:" + val + "</td></tr>";
                    html = html + "<tr><td></td></tr>";
                    html = html + '<tr><td style="text-align:center;">GRACIAS POR SU COMPRA...!!' + "</td></tr>";

                    html += "</table></body></html>";

                    var printWin = window.open('your_url', 'popup_name', 'height=' + screen.height + ',width=' + screen.width + ',resizable=yes,scrollbars=yes,toolbar=yes,menubar=yes,location=yes')
                    printWin.moveTo(0, 0)
                    printWin.resizeTo(screen.availWidth, screen.availHeight)
                    printWin.document.write(html);
                    printWin.document.close();
                    printWin.focus();
                    printWin.print();
                    printWin.close();
                   
                },
                error: function (result) {
                    alert(result);
                }
            });
       
    });
}
