var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    //pestañascrearclie();
    try {
        Set_VisibleOption();
        Get_InitialData();
    } catch (e) {
        alert(e.Message);
    }
});
function Get_Tecnico1(s, e) {
    gdvTecnicosrch.PerformCallback();
    if (e.htmlEvent.keyCode === 13) {
        gdvTecnicosrch.SetFocusedRowIndex(0);
        OkTecnico();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
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

function Get_Tecnico() {
    gdvTecnicosrch.PerformCallback();
}
function OkTecnico() {
    var rowc = gdvTecnicosrch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    }
    else if (gdvTecnicos.GetVisibleRowsOnPage() == 6) {
        alert("Solo se permiten  6 técnicos Auxiliares.")
    }
    else if (gdvTecnicosrch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    }
    else {
        gdvTecnicosrch.GetRowValues(gdvTecnicosrch.GetFocusedRowIndex(), "ID;Tecnico", OnGetRowValuesTecnico);
    }
}
function OnGetRowValuesTecnico(values) {

    gdvTecnicos.PerformCallback("ADD:" + values[0] + ":" + values[1]);

    ppcTecnicoSearch.Hide();
}
function CancelTecnico() {
    ppcTecnicoSearch.Hide();
}
function Show_TecnicoSearch() {
    ppcTecnicoSearch.Show();
}
function Get_Service() {
    gdvServicio.PerformCallback("GET");
}
function Get_Service1() {

}
function Get_Service2(s, e) {

}
function okServicio() {
    var rowc = gdvServicio.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvServicio.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvServicio.GetRowValues(gdvServicio.GetFocusedRowIndex(), "CallId;ItemCode;ItemName;CardCode;CardName;SerieFab;SerieInt;ItmsGrpCod;IdDireccion;Street;State;U_DXP_BIZ_PROV;U_DXP_BIZ_DIST;NumDoc;Asunto;Estado;Prioridad;Creacion;Cerrado;NroContrato;Origen;TipoProblema;Tecnico;DetalleServicio;Comentario;Resolucion;Cellular;ContactPerson;AddressType;U_GOS_TECN1;U_GOS_TECN2;U_GOS_TECN3;U_GOS_TECN4;U_GOS_TECN5;U_GOS_TECN6", OnGetRowValuesServicio);
    }
}
function OnGetRowValuesServicio(values) {
    txtcontctCode1.PerformCallback("INICIAR:" + values[3]);
    //cbbAddress.PerformCallback("GET:" + values[3]);
    bteCustomer.SetText(values[3]);
    txtCustomerName.SetText(values[4]);
    hdfTemp.Set("adrtype", values[28]);
    cbStatus.SetValue(values[15])
    txttelf.SetText(values[26]);
    cbbPriority.SetValue(values[16]);
    txtcontctCode1.SetText(values[27]);
    txtidllamada.SetText(values[0]);
    
    txtDepartamento1.SetText(values[10]);
    txtProvincia1.SetText(values[11]);
    txtDistrito1.SetText(values[12]);
    txtguia.SetText(values[13]);
    if (txtguia == "") {

    }
    else {
        gdvdln1.PerformCallback("GET:" + values[13]);
    }
    
    txtStreets1.SetText(values[9]);
    txtmanufSN1.SetText(values[5]);
    txtinternalSN.SetText(values[6]);
    txtcreateDate1.SetText(values[17]);
    txtcloseDate1.SetText(values[18]);
    txtitemCode.SetText(values[1]);
    txtItemName.SetText(values[2]);
    txtnumContrato.SetText("");
    //txtcntrctDate
    //txtItemGroup.SetText(values[7]);
    txtSubject.SetText(values[14]);
    cbbOrigin.SetValue(values[20]);
    cbbProblemTyp.SetValue(values[21]);
    cbbCallType.SetValue(values[23]);
    cbbTecnico.SetValue(values[22]);
    mmoResolution.SetText(values[25]);
    mmoComments.SetText(values[24]);
    cbbAddress.SetText(values[8]);
   
    gdvTecnicos.PerformCallback("GET:" + values[29] + ":" + values[30] + ":" + values[31] + ":" + values[32] + ":" + values[33] + ":" + values[34]);
    mnuOper.GetItemByName("Save").SetText("Modificar");
    ppcServicioSearch.Hide();
}
function CancelServicio() {
    ppcServicioSearch.Hide();
}
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Servicio/LlamadaServicio.aspx/GET_VALORES_SERVICIO",
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
function Set_InitialData(result) {
    dteFecha.SetDate(new Date());
    dteFecha2.SetDate(new Date());
    txtcreateDate1.SetDate(new Date());
    txtcloseDate1.SetDate(new Date());
    txtnumContrato.SetText("-");
    //bteCustomer.SetEnabled(false);
    //txtCustomerName.SetEnabled(false);
    //txttelf.SetEnabled(false);
    //txtidllamada.SetEnabled(false);

    //txtDepartamento1.SetEnabled(false);
    //txtProvincia1.SetEnabled(false);
    //txtDistrito1.SetEnabled(false);
    //txtStreets1.SetEnabled(false);
    //txtmanufSN1.SetEnabled(false);
    //txtinternalSN.SetEnabled(false);
    //txtcreateDate1.SetEnabled(false);
    //txtcloseDate1.SetEnabled(false);
    //txtitemCode.SetEnabled(false);
    //txtItemName.SetEnabled(false);
    //txtnumContrato.SetEnabled(false);
    var _rs1 = result.d.where(function (item) { return (item.CLAVE === "OS"); });
    cbbOrigin.BeginUpdate();
    cbbOrigin.ClearItems();
    _rs1.forEach(function (item) {
        cbbOrigin.AddItem(item.VALOR, item.INDEX);
    });
    cbbOrigin.EndUpdate();
    cbbOrigin.SetValue(-1);

    var _rs = result.d.where(function (item) { return (item.CLAVE === "CT"); });
    cbbCallType.BeginUpdate();
    cbbCallType.ClearItems();
    _rs.forEach(function (item) {
        cbbCallType.AddItem(item.VALOR, item.INDEX);
    });
    cbbCallType.EndUpdate();
    cbbCallType.SetSelectedIndex(0);

    var _rs2 = result.d.where(function (item) { return (item.CLAVE === "TE"); });
    cbbProblemTyp.BeginUpdate();
    cbbProblemTyp.ClearItems();
    _rs2.forEach(function (item) {
        cbbProblemTyp.AddItem(item.VALOR, item.INDEX);
    });
    cbbProblemTyp.EndUpdate();
    cbbProblemTyp.SetSelectedIndex(0);

    var _rs3 = result.d.where(function (item) { return (item.CLAVE === "UM"); });
    cbbTecnico.BeginUpdate();
    cbbTecnico.ClearItems();
    _rs3.forEach(function (item) {
        cbbTecnico.AddItem(item.VALOR, item.INDEX);
    });
    cbbTecnico.EndUpdate();
    cbbTecnico.SetSelectedIndex(0);


    var _rs4 = result.d.where(function (item) { return (item.CLAVE === "SC"); });
    cbStatus.BeginUpdate();
    cbStatus.ClearItems();
    _rs4.forEach(function (item) {
        cbStatus.AddItem(item.VALOR, item.INDEX);
    });
    cbStatus.EndUpdate();
    cbStatus.SetValue(-3);
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
function Get_Product() {
    //gdvProductSearch.SetFocusedRowIndex(-1);
    gdvCards.PerformCallback("GET");
}

function OkCards() {
    var rowc = gdvCards.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvCards.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvCards.GetRowValues(gdvCards.GetFocusedRowIndex(), "ItemCode;ItemName;Seriefabricante;SerieInterna;ItmsGrpCod;instLction", OnGetRowValuesCards);
    }
}

function OnGetRowValuesCards(values) {
    //alert("" + values);
    txtitemCode.SetText(values[0]);
    txtItemName.SetText(values[1]);
    txtmanufSN1.SetText(values[2]);
    txtinternalSN.SetText(values[3]);
    //txtItemGroup.SetText(values[4]);
    cbbAddress.SetText(values[5]);
    var dire = cbbAddress.GetValue();
    if (dire != 0) {
        var spl = dire.split("$");
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
    
    ppcCardsSearch.Hide();
}
function Get_Prod1(s, e) {
    
        //gdvProductSearch.SetFocusedRowIndex(-1);
    gdvProductSearch.PerformCallback();
        //if (e.htmlEvent.keyCode === 13) {
            gdvProductSearch.SetFocusedRowIndex(0);
            OkProd();
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
        
    
}


function Get_Prod() {
    //gdvProductSearch.SetFocusedRowIndex(-1);
    gdvProductSearch.PerformCallback();
}

function OkProd() {
    var rowc = gdvProductSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvProductSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvProductSearch.GetRowValues(gdvProductSearch.GetFocusedRowIndex(), "ItemCode;ItemName;U_GOS_MARCA;OnHand;IssueMthd;NumInSale;ActivoC;ActivoS;InvntItem;TreeType;DetalleServicio", OnGetRowValuesProd);
    }
}
function Key_Product(s, e) {
    if (e.htmlEvent.keyCode === 13) {
        Add_Product();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Beg_CallbackLines(s, e) {
    _cmd = e.command;
}
function Add_Product() {
    var cardcode = txtCardCode.GetText();
    var pricelist = cbbListNum.GetValue();
    var itemcode = bteItemCode.GetText();

    if (itemcode.toUpperCase().indexOf("K") !== -1) {
        //chkKit.SetChecked(false);
        //ppcQKit.Show();
        //txtQKit.SetText("1");
        //txtQKit.Focus();
        //txtQKit.SelectAll();
    }
    else if (hdfTemp.Get("Rate") === 0) {
        alert("Ingresar Tipo de Cambio, No podrá Buscar Productos");
    }
    else {
        if (isNullOrWhiteSpace(itemcode)) {
            alert("Ingrese código de producto.");
            bteItemCode.Focus();
        }
        else {
            var socied = hdfTemp.Get("_soci");
            var whscode = hdfTemp.Get("_whsc");
            var project = hdfTemp.Get("_proj");

            gdvdln1.PerformCallback("ADDPRODUCT:" + itemcode + ":" + pricelist);

            //$.ajax(
            //{
            //    type: "POST",
            //    url: "../Sales/SalesOrder.aspx/Get_OneProduct",
            //    data: '{"socied":"' + socied + '","project":"' + project + '", "whscode":"' + whscode + '", "cardcode":"' + cardcode + '", "pricelist":"' + pricelist + '", "itemcode":"' + itemcode + '" }',
            //    contentType: "application/json; charset=uft-8",
            //    dataType: "json",
            //    success: function (result) {
            //        Set_LineProduct(result);
            //    },
            //    error: function (result) {
            //        alert(result);
            //    }
            //});
        }
    }
}
function End_CallbackLines() {
   // Set_SubTotal();
    if (_cmd === "STARTEDIT") {
        txtQuantity.Focus();
        txtQuantity.SelectAll();
    }
    _cmd = "";
}
function ShowProductSearch() {
    ppcProductSearch.Show();
}
function Cal_LineTotals(s, e) {
    var _qt = parseInt(txtQuantity.GetValue());
    var _pr = parseFloat(txtPrice.GetValue());
    var _cd = bteItemCode.GetText();
    var _lt = (_qt * _pr);
    txtLineTotal.SetText(_lt);
    var _gt = (_lt * 1.18);
    txtGTotal.SetText(_gt);

    if (e.htmlEvent.keyCode === 13) {
        //alert("PRESIONASTE ENTER" + txtIssueMthd.GetText());
        gdvdln1.PerformCallback("QTY:" + _qt + ":" + _cd);
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Cal_PriceUpdate(s, e) {
    var _pb = parseFloat(alphanumeric(txtPriceBefDi.GetValue()));
    var _dc = parseFloat(alphanumeric(txtDiscPrcnt.GetValue()));
    var _pr = _pb - ((_pb * _dc) / 100.00);
    txtPrice.SetText(_pr);
    txtLineTotal.SetText(_pr * txtQuantity.GetValue());
    var _gt = ((_pr * txtQuantity.GetValue()) * ((parseFloat(18) * 0.01) + 1));
    txtGTotal.SetText(_gt);
    if (e.htmlEvent.keyCode === 13) {
        //alert("PRESIONASTE ENTER" + txtIssueMthd.GetText());
        gdvdln1.PerformCallback("UPDTPRICE:" + _pb + ":" + _pr + ":" + (_pr * txtQuantity.GetValue()) + ":" + _gt + ":" + bteItemCode.GetText() + ":" + txtQuantity.GetValue());
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Cal_LineDescTotals() {
    var _pb = parseFloat(txtPriceBefDi.GetValue());
    var _dc = parseFloat(txtDiscPrcnt.GetValue());
    var _pr = _pb - ((_pb * _dc) / 100.00);
    txtPrice.SetText(_pr);
    Cal_LineTotals();
}
function Set_SubTotal() {
    if (!gdvdln1.IsEditing()) {
        var _sbt = parseFloat(gdvdln1.cpSubTotal);
        if (cbbDocCur.GetValue().toString() === "USD") {
            txtLineSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_sbt.toFixed(2)));
        }
        else if (cbbDocCur.GetValue().toString() === "EUR") {
            txtLineSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_sbt.toFixed(2)));
        }
        else {
            txtLineSum.SetText(_sbt);
        }
        //txtLineSum.SetText(_sbt.toFixed(2));
        Get_Totals();
    }
}

function Get_Totals() {
    var _sbt = parseFloat(alphanumeric(txtLineSum.GetValue()));
    var _dst = parseFloat(alphanumeric(txtDiscSum.GetValue()));
    var _sid = (_sbt - _dst);
    var _tep = parseFloat(alphanumeric(txtTotalExpns.GetValue()));
    var _sdt = (_sid + _tep);
    var _imp = ((_sdt * 18) / 100);
    var _tot = (_sdt + parseFloat(_imp.toFixed(2)));
    var _ima = parseFloat(alphanumeric(txtPaidToDate.GetValue()));
    var _spe = (parseFloat(_tot.toFixed(2)) - parseFloat(_ima.toFixed(2)));
    if (cbbDocCur.GetValue().toString() == "USD") {
        txtVatSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_imp.toFixed(2)));
        txtDocTotal.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_tot.toFixed(2)));
        txtPendingBal.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_spe.toFixed(2)));
        txtDiscSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_dst.toFixed(2)));
        txtTotalExpns.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_tep.toFixed(2)));
        txtPaidToDate.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_ima.toFixed(2)));
    }
    else if (cbbDocCur.GetValue().toString() == "EUR") {
        txtVatSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_imp.toFixed(2)));
        txtDocTotal.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_tot.toFixed(2)));
        txtPendingBal.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_spe.toFixed(2)));
        txtDiscSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_dst.toFixed(2)));
        txtTotalExpns.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_tep.toFixed(2)));
        txtPaidToDate.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_ima.toFixed(2)));
    }
    else {
        txtVatSum.SetText(_imp);
        txtDocTotal.SetText(_tot);
        txtPendingBal.SetText(_spe);
        txtDiscSum.SetText(_dst);
        txtTotalExpns.SetText(_tep);
        txtPaidToDate.SetText(_ima);
    }
    //txtVatSum.SetText(_imp.toFixed(2));
    //txtDocTotal.SetText(_tot.toFixed(2));
    //txtPendingBal.SetText(_spe.toFixed(2));
}
function SetParName(s, e) {
    if (e.column.fieldName === "CardCode") {
        $("#ClientParCaption").text("Código:");
        txtParClient.Focus();
    }
    else if (e.column.fieldName === "CardName") {
        $("#ClientParCaption").text("Razón Social:");
        txtParClient.Focus();
    }
    else if (e.column.fieldName === "ItemCode") {
        $("#ProductParCaption").text("Código:");
        txtParProduct.Focus();
    }
    else if (e.column.fieldName === "ItemName") {
        $("#ProductParCaption").text("Descripción");
        txtParProduct.Focus();
    }
}


function OnGetRowValuesProd(values) {

    if (!isNullOrWhiteSpace(values[0])) {
        bteItemCode.SetText(values[0]);
        bteItemName.SetText(values[1]);
        txtIssueMthd.SetText(values[4]);
        TreeType.SetText(values[7]);
        txtmarca.SetText(values[2]);
        
    }


    txtQuantity.Focus();
    txtQuantity.SelectAll();

    
    gdvProductSearch.SetFocusedRowIndex(-1);
    ppcProductSearch.Hide();
   
}

function CancelProd() {
    ppcRecursos.Hide();
}

function EndProdSearch() {
    gdvProductSearch.SetFocusedRowIndex(0);
    ppcRecursos.UpdatePosition();
}





function CancelCards() {
    ppcCardsSearch.Hide();
}
function ShowCardSearch() {
    gdvCards.PerformCallback("GET");
    ppcCardsSearch.Show();
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
    cbbAddress.PerformCallback("GET:" + values[0]);
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
    gdvdln1.PerformCallback("CLR");
}

function InitControls() {
    //------------------------------------
    bteCustomer.SetEnabled(false);
    txtCustomerName.SetEnabled(false);
    txttelf.SetEnabled(false);
    txtidllamada.SetEnabled(false);

    txtDepartamento1.SetEnabled(false);
    txtProvincia1.SetEnabled(false);
    txtDistrito1.SetEnabled(false);
    txtStreets1.SetEnabled(false);
    txtguia.SetEnabled(false);
    txtmanufSN1.SetEnabled(false);
    txtinternalSN.SetEnabled(false);
    txtcreateDate1.SetEnabled(false);
    txtcloseDate1.SetEnabled(false);
    txtitemCode.SetEnabled(false);
    txtItemName.SetEnabled(false);
    txtnumContrato.SetEnabled(false);
    //------------------------------------
    bteCustomer.SetText("");
    txtCustomerName.SetText("");
    hdfTemp.Set("adrtype", "");
    cbStatus.SetText("Abierto");
    txttelf.SetText("");
    cbbPriority.SetSelectedIndex(0);
    txtcontctCode1.SetText("");
    txtidllamada.SetText("");

    txtDepartamento1.SetText("");
    txtProvincia1.SetText("");
    txtDistrito1.SetText("");
    txtStreets1.SetText("");
    txtmanufSN1.SetText("");
    txtinternalSN.SetText("");
    txtcreateDate1.SetText("");
    txtcloseDate1.SetText("");
    txtitemCode.SetText("");
    txtItemName.SetText("");
    txtnumContrato.SetText("-");
    //txtcntrctDate
    //txtItemGroup.SetText("");
    txtSubject.SetText("");
    cbbOrigin.SetSelectedIndex(0);
    cbbProblemTyp.SetSelectedIndex(0);
    cbbCallType.SetSelectedIndex(0);
    cbbTecnico.SetSelectedIndex(0);
    mmoResolution.SetText("");
    txtguia.SetText("");
    mmoComments.SetText("");
    cbbAddress.SetText("");
    gdvTecnicos.PerformCallback("CLR");
    gdvdln1.PerformCallback("CLR");
    mnuOper.GetItemByName("Save").SetText("Crear");
    mnuOper.GetItemByName("Recursos").SetText("Recursos");
}

function SaveServicio() {
    
    clbOperation.PerformCallback("SaveServicio");
}
function Save() {
    SaveServicio();
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
        showsearchserv();
    }
    else if (e.item.name === "Recursos") {
        showsearchprodllamada();
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
        Modificar();
    }
}
function showsearchserv() {
    ppcServicioSearch.Show();
}
function showsearchprodllamada() {
    ppcRecursos.Show();
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
        txtidllamada.SetText(_spd[1]);
        alert("¡Servicio creado con éxito!");
        alert("" + _spd[3]);
        
        ClearControl();
    }
    else if (e.result.indexOf("IKCC") !== -1) {
        _spd = e.result.split("#");
       
        alert("¡Servicio Modificado con éxito!");
        alert(""+_spd[1]);
           
        
        ClearControl();
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
