var _vld = [5];
$(document).ready(function () {
    //pestañascrearclie();
    try {
        _vld[4] = hdfTemp.Get("_emid");
        Set_VisibleOption();
        Get_InitialData();
    } catch (e) {
        alert(e.Message);
    }
});
function get_TS() {
    gdvtranSearch.PerformCallback();
}
function OkTS() {
    var rowc = gdvtranSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvtranSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvtranSearch.GetRowValues(gdvtranSearch.GetFocusedRowIndex(), "DocNum;DocEntry;CardCode;CardName;DocDate;Address;AlmacenO;AlmacenD;SlpCode;CntctCode", OnGetRowValuestrans);
    }
}
function OnGetRowValuestrans(values) {

    bteCustomer.SetText(values[2]);
    txtCustomerName.SetText(values[3]);
    txtDocNum.SetText(values[0]);
    txtDocEntry.SetText(values[1]);
    txtcreateDate1.SetDate(values[4]);
    if(values[8] != -1)
        cbeOwnerCode.SetValue(values[8]);
    cbbalmacenorigen.SetValue(values[6]);
    cbbalmacendestino.SetValue(values[7]);
    txtAddress.SetText(values[5]);
    gdvArticulos.PerformCallback("GET:"+values[1]);
    mnuOper.GetItemByName("Save").SetEnabled(false);
    ppcTSSearch.Hide();
}

function CancelTS() {
    ppcTSSearch.Hide();
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
        gdvProductSearch.GetRowValues(gdvProductSearch.GetFocusedRowIndex(), "ItemCode;ItemName;IssueMthd", OnGetRowValuesProduct);
    }
}
function OnGetRowValuesProduct(values) {
    gdvArticulos.PerformCallback("ADD:" + values[0]+":"+values[1]+":"+values[2]);
    
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

function ShowPoput() {
    var itemcode = bteItemCode.GetText();
    var tt = txtIssueMthd.GetText().substring(0, 1);
    //alert(itemcode+"+"+tt);
    if (!isNullOrWhiteSpace(itemcode)) {
        if (tt == "M") {
            Get_SerialNumber_JS();
            ppcSerialNumber.Show();
        }
        else if (tt == "L") {
            gdvLotes.PerformCallback("GETLOTE:" + itemcode);
            ppcLotesNumber.Show();
        }
        else {
            alert("ESTE PRODUCTO NO NECESITA SERIE O LOTE.");
        }
    } else {
        alert("Primero debe Insertar Un Producto");
    }
}
var sum_cant_lotes = 0;
var lotes_total = "";
function OK_Lotes() {
    sum_cant_lotes = 0;
    lotes_total = "";
    for (var i = 0; i < gdvLotes.GetVisibleRowsOnPage() ; i++) {
        gdvLotes.GetRowValues(i, "Lote;SysNumber;Cantidad", FilaLote);
    }
    setTimeout(function () {
        if (sum_cant_lotes != txtQuantity.GetText()) {
            alert("La Suma de las Cantidades de los Lotes NO suma la Cantidad Total del Producto a Solicitar!");
            //alert("" + sum_cant_lotes);
        } else {
            alert("OK" + sum_cant_lotes);
            bteSerialNumber.SetText(lotes_total.substring(0, lotes_total.length - 1));
            ppcLotesNumber.Hide();
        }
    }, 1500);


}
function FilaLote(values) {
    if (values[2] != 0) {
        var lote = values[0] + "-" + values[2] + ";";
        sum_cant_lotes += values[2];
        lotes_total += lote;
        //alert("Lote: " + lote + "; " + "Cantidad: " + values[2] + "Cantidad TOTAL: " + sum_cant_lotes);
    }
}
function Timeout() {
    setTimeout(FilaLote, 3000);
}
function CancelLotes() {
    ppcLotesNumber.Hide();
}
function Get_SerialNumber_JS() {

    var socied = hdfTemp.Get("_soci");
    var itemcode = bteItemCode.GetText();
    var i = 0;
    $.ajax(
    {
        type: "POST",
        url: "../Sales/DeliveryNote.aspx/Get_SerialNumber_OneProduct",
        data: '{"socied":"' + socied + '", "itemcode":"' + itemcode + '"}',
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            ListSeries.BeginUpdate();
            $.each(result.d, function (index, item) {
                var series = item.Serie + '-' + item.SysNumber;
                //var series = [item.ItemCode.toString(), item.Serie.toString(), item.SysNumber.toString()];
                ListSeries.InsertItem(index, series);
                i = i + 1;
                series = "";
            })


        },
        error: function (result) {
            alert(result);
        }
    }); ListSeries.EndUpdate();
}
function OK_Series() {
    var items = ListSeries.GetSelectedItems();
    var sysn = "";
    var cadena = "";
    bteSerialNumber.SetText("");

    if (items.length == txtQuantity.GetText()) {
        for (var i = 0; i <= items.length - 1; i = i + 1) {
            sysn = items[i].value.split("-");
            //cadena += sysn[1];
            cadena += items[i].value;
            if (i <= items.length - 2) cadena += ";";
            bteSerialNumber.SetText(cadena);
        }
        ppcSerialNumber.Hide();
        ListSeries.ClearItems();
    } else {
        alert("Seleccionar Series Segun Cantidad a Necesitar: " + items.length + "  " + txtQuantity.GetText());
    }
}
function CancelSeries() {
    ppcSerialNumber.Hide();
    ListSeries.ClearItems();
}
function Show_AlmacenSearch() {
    gdvWhsCodeSearch.PerformCallback("ALMCN:" + bteItemCode.GetText());
    ppcAlmacenSearch.Show();
}
function CancelAlmacen() {

    ppcAlmacenSearch.Hide();
}
function Get_Almacen() {
    gdvWhsCodeSearch.SetFocusedRowIndex(-1);
    gdvWhsCodeSearch.PerformCallback("ALMCN:");
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
        gdvWhsCodeSearch.GetRowValues(gdvWhsCodeSearch.GetFocusedRowIndex(), "WhsCode;WhsName", OnGetRowValuesWHS);
    }
}

function OnGetRowValuesWHS(values) {

    WhsCode.SetText(values[0]);

    gdvWhsCodeSearch.SetFocusedRowIndex(0);
    ppcAlmacenSearch.Hide();
}
function Show_AlmacenSearch1() {
    gdvWhsCodeSearch1.PerformCallback("ALMCN:" + bteItemCode.GetText());
    ppcAlmacenSearch1.Show();
}
function CancelAlmacen1() {

    ppcAlmacenSearch1.Hide();
}
function Get_Almacen1() {
    gdvWhsCodeSearch1.SetFocusedRowIndex(-1);
    gdvWhsCodeSearch1.PerformCallback("ALMCN:");
}

function OkAlmacen1() {
    var rowc = gdvWhsCodeSearch1.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvWhsCodeSearch1.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvWhsCodeSearch1.GetRowValues(gdvWhsCodeSearch1.GetFocusedRowIndex(), "WhsCode;WhsName", OnGetRowValuesWHS1);
    }
}

function OnGetRowValuesWHS1(values) {

    WareHouse.SetText(values[0]);

    gdvWhsCodeSearch1.SetFocusedRowIndex(0);
    ppcAlmacenSearch1.Hide();
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

    txtcreateDate1.SetDate(new Date());
    
    var _rs1 = result.d.where(function (item) { return (item.Ident === "VR"); });
    cbeOwnerCode.ClearItems();
    cbeOwnerCode.BeginUpdate();
    $.each(_rs1, function (index, item) {
        cbeOwnerCode.InsertItem(index, item.Name, item.empID);
        if (item.Dfault === 1) {
            _vld[4] = item.Code;
        }
    });
    cbeOwnerCode.EndUpdate();
    cbeOwnerCode.SetValue(_vld[4]);

    var _rs2 = result.d.where(function (item) { return (item.Ident === "WH"); });
    cbbalmacenorigen.BeginUpdate();
    cbbalmacenorigen.ClearItems();
    cbbalmacendestino.BeginUpdate();
    cbbalmacendestino.ClearItems();
    _rs2.forEach(function (item) {
        cbbalmacenorigen.AddItem(item.Name, item.Code);
        cbbalmacendestino.AddItem(item.Name, item.Code);
    });
    cbbalmacenorigen.EndUpdate();
    cbbalmacenorigen.SetSelectedIndex(0);
    cbbalmacendestino.EndUpdate();
    cbbalmacendestino.SetSelectedIndex(0);
    
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
function Get_Product1(s, e) {
    gdvCards.PerformCallback("GET");
    if (e.htmlEvent.keyCode === 13) {
        gdvCards.SetFocusedRowIndex(0);
        OkCards();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
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
    txttelf.SetText(values[3]);
    txtcontctCode1.PerformCallback("INICIAR:" + values[0]);
    //cbbAddress.PerformCallback("GET:" + values[0]);
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
    
    bteCustomer.SetText("");
    txtCustomerName.SetText("");
    txtDocNum.SetText("");
    txtDocEntry.SetText("");
    txtcreateDate1.SetDate(new Date());
    //if (values[8] != -1)
        //cbeOwnerCode.SetValue(v);
    cbbalmacenorigen.SetSelectedIndex(0);
    cbbalmacendestino.SetSelectedIndex(0);
    txtAddress.SetText("");
    gdvArticulos.PerformCallback("CLR");
    mnuOper.GetItemByName("Save").SetEnabled(true);
}

function SaveTS() {
    
    clbOperation.PerformCallback("SaveTS");
}
function Save() {
    SaveTS();
}
function Modificar() {
    clbOperation.PerformCallback("UpdtServicio");
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
        showsearchTS();
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
        Modificar();
    }
}
function showsearchTS() {
    ppcTSSearch.Show();
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
        txtDocEntry.SetText(_spd[1]);
        txtDocNum.SetText(_spd[2]);
        alert("¡Tranferencia de Stock creada con éxito!");
    }
    else if (e.result.indexOf("IKCC") !== -1) {
        //_spd = e.result.split("#");
        //txtidllamada.SetText(_spd[1]);
        alert("¡Transferencia de Stock Modificada con éxito!");
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
