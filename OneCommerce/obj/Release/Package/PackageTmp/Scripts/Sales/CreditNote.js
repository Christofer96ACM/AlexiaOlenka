var _dcs = [];
var _vld = [7];
$(document).ready(function () {
    _vld[4] = hdfTemp.Get("_emid");
    _vld[6] = hdfTemp.Get("_soci");
    InitControls();
    Get_DocumentType();
    Get_InitialData();
    Get_CreditNote();
});
function Clear_RangeDate() {
    if (chkRangeDate.GetChecked()) {
        dteDateIn.SetDate(new Date());
        dteDateFi.SetDate(new Date());
    }
    else {
        dteDateIn.SetText("");
        dteDateFi.SetText("");
    }
}
function Show_AddreListDestino() {
    gdvAddress.PerformCallback("DirecDestino:" + codigo_cliente);
    ppcClientAddress.Show();
}
function Show_AddreListFactura() {
    gdvAddress.PerformCallback("DirecFactura:" + codigo_cliente);
    ppcClientAddress.Show();
}
function OkClientAddress() {
    var rowc = gdvAddress.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvAddress.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvAddress.GetSelectedFieldValues("Address;Street;AdresType;U_BIZ_CODI;U_BIZ_MOV", OnGetSelectedFieldValues);
    }
}
function OnGetSelectedFieldValues(selectedValues) {
    if (selectedValues.length == 0) {
        alert("Seleccione al menos un registro\npara realizar esta operación.");
    }
    else {
        var csc = 0;
        var cbc = 0;
        for (i = 0; i < selectedValues.length; i++) {
            if (selectedValues[i][2] === "S") {
                csc += 1;
            }
            else {
                cbc += 1;
            }
        }
        if (csc === 1/* && cbc === 1*/) {
            for (i = 0; i < selectedValues.length; i++) {
                if (selectedValues[i][2] === "S") {
                    txtShipToCode.SetText(selectedValues[i][0]);
                    bteShipToCode.SetText(selectedValues[i][1]);
                    hdfTemp.Set("_ubig", selectedValues[i][3]);
                    hdfTemp.Set("_movi", selectedValues[i][4]);
                }
                else {
                    txtBillToCode.SetText(selectedValues[i][0]);
                    bteBillToCode.SetText(selectedValues[i][1]);
                }
            }
            ppcClientAddress.Hide();
        }
        else {
            alert("No se permite seleccionar mas\nde un tipo de dirección.");
        }
    }
}
function CancelClientAddress() {
    ppcClientAddress.Hide();
}
function End_AddrCallback() {
    bteShipToCode.GetButton(0).style.display = "";
    bteBillToCode.GetButton(0).style.display = "";
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
        gdvrin1.PerformCallback("UPDTPRICE:" + _pb + ":" + _pr + ":" + (_pr * txtQuantity.GetValue()) + ":" + _gt + ":" + bteItemCode.GetText() + ":" + txtQuantity.GetValue());
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
function cambio_moneda() {

    hdfTemp.Set("Currency", cbbDocCur.GetValue());
    //checkcbbdoccur = true;
    //cbbDocCur.SetValue("SOL");
    cbbDocCur.SetEnabled(true);
    //cbbGroupNum.SetValue("");
    //cbeSalesPerson.SetText("");
    cbeOwnerCode.SetValue(_vld[5]);
    //cbbListNum.SetValue(_vld[7]);
    //txtCardCode.SetText("");
    //bteCardName.SetText("");
    txtDocEntry.SetText("");
    txtDocNum.SetText("");
    txtNumAtCard.SetText("");
    txtDocStatus.SetText("Abierto");
    dteDocDate.SetDate(new Date());
    txtVatSum.SetText("0");
    txtDocTotal.SetText("0");
    //Set_ConfigDateTime();
    mnuOper.GetItemByName("Save").SetText("Crear");

    EnabledControl(true);
    gdvrin1.PerformCallback("CLR");
}

//ELEMENT DISTINCT
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
function ShowSerialNumber() {
    var itemcode = bteItemCode.GetText();
    if (!isNullOrWhiteSpace(itemcode)) {
        Get_SerialNumber_JS();
        ppcSerialNumber.Show();
    } else {
        alert("Primero debe Insertar Un Producto");
    }
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
                var series = item.ItemCode + '-' + item.Serie + '-' + item.SysNumber;
                //var series = [item.ItemCode.toString(), item.Serie.toString(), item.SysNumber.toString()];
                ListSeries.InsertItem(index, series);
                i = i + 1;
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
            //if (items[i].value != null){
            sysn = items[i].value.split("-");
            cadena += sysn[2];
            if (i <= items.length - 2) cadena += ",";
            bteSerialNumber.SetText(cadena);
            //}
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
// LISTA LOS TIPOS DE DOCUMENTOS DE VENTA
function Get_DocumentType() {
    var project = hdfTemp.Get("_proj");
    var socied = hdfTemp.Get("_soci");
    $.ajax(
           {
               type: "POST",
               url: "../Sales/CreditNote.aspx/Get_DocumentType",
               data: '{"project":"' + project + '", "socied":"' + socied + '"}',
               contentType: "application/json; charset=uft-8",
               dataType: "json",
               success: function (result) {
                   _dcs = [];
                   $.each(result.d, function (i, item) {
                       var obj = new Array(item.U_BPP_NDTD, item.U_BPP_TDDD, item.U_BPP_NDSD, item.U_BPP_NDCD);
                       _dcs.push(obj);
                       if (item.Dfault === 1) {
                           _vld[1] = item.U_BPP_NDTD;
                       }
                   });
                   var _dst = [];
                   _dcs.forEach(function (item) {
                       var obj = new Array(item[0], item[1]);
                       _dst.push(obj);
                   });
                   _dst = uniqueBy(_dst, function (x) { return x; });
                   cbbU_BPP_MDTD.ClearItems();
                   cbbU_BPP_MDTD.BeginUpdate();
                   $.each(_dst, function (index, item) {
                       cbbU_BPP_MDTD.InsertItem(index, item[1], item[0]);
                   });
                   cbbU_BPP_MDTD.EndUpdate();
                   cbbU_BPP_MDTD.SetValue(_vld[1]);
                   Get_DocumentSerie();
               },
               error: function (result) {
                   alert(result);
               }
           });
}

//DATOS INICIALES
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
    txtTotalExpns.SetEnabled(false);
    if (hdfTemp.Get("Reserve") != "") {
        //gdvdln1.PerformCallback("CLR");
    } else gdvrin1.PerformCallback("CLR");

    var _rs1 = result.d.where(function (item) { return (item.Ident === "NG"); });
    cbbMotivoG.BeginUpdate();
    cbbMotivoG.ClearItems();
    _rs1.forEach(function (item) {
        cbbMotivoG.AddItem(item.Name, item.Code);
    });
    cbbMotivoG.EndUpdate();
    cbbMotivoG.SetSelectedIndex(0);

    var _rs = result.d.where(function (item) { return (item.Ident === "LP"); });
    cbbListNum.ClearItems();
    cbbListNum.BeginUpdate();
    $.each(_rs, function (index, item) {
        cbbListNum.InsertItem(index, item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[0] = item.Code;
        }
    });
    cbbListNum.EndUpdate();
    cbbListNum.SetValue(_vld[0]);

    _rs = result.d.where(function (item) { return (item.Ident === "VR"); });
    //cbeSalesPerson.ClearItems();
    cbeOwnerCode.ClearItems();
    //cbeSalesPerson.BeginUpdate();
    cbeOwnerCode.BeginUpdate();
    $.each(_rs, function (index, item) {
        // cbeSalesPerson.InsertItem(index, item.Name, item.Code);
        cbeOwnerCode.InsertItem(index, item.Name, item.empID);
        if (item.Dfault === 1) {
            _vld[4] = item.Code;
        }
    });

    //cbeSalesPerson.EndUpdate();
    cbeOwnerCode.EndUpdate();
    //cbeSalesPerson.SetValue(_vld[2]);
    cbeOwnerCode.SetValue(_vld[4]);

    //OLE
    _rs = result.d.where(function (item) { return (item.Ident === "RE"); });
    cbeSalesPerson.ClearItems();
    cbeSalesPerson.BeginUpdate();

    $.each(_rs, function (index, item) {
        cbeSalesPerson.InsertItem(index, item.Name, item.Code);

        if (item.Dfault === 1) {
            _vld[2] = item.Code;
        }
    });

    cbeSalesPerson.EndUpdate();
    cbeSalesPerson.SetValue(_vld[2]);
    //OLE

    _rs = result.d.where(function (item) { return (item.Ident === "CP"); });
    cbbGroupNum.ClearItems();
    cbbGroupNum.BeginUpdate();
    $.each(_rs, function (index, item) {
        //if (_vld[6] === "BT") {
            //if (item.Code === "10" || item.Code === "12" || item.Code === "19" || item.Code === "18") {
                cbbGroupNum.InsertItem(index, item.Name, item.Code);
                if (item.Dfault === 1) {
                    _vld[3] = item.Code;
                }
            //}
        //}
        //else {
        //    if (item.Code === "37" || item.Code === "18") {
        //        cbbGroupNum.InsertItem(index, item.Name, item.Code);
        //        if (item.Dfault === 1) {
        //            _vld[3] = item.Code;
        //        }
        //    }
        //}
    });
    cbbGroupNum.SetValue(_vld[3]);
    cbbGroupNum.EndUpdate();
}

// ENLAZA EL DOCUMENTO BASE
function Get_CreditNote() {
    $.ajax(
    {
        type: "POST",
        url: "../Sales/CreditNote.aspx/Get_CreditNote",
        data: "{}",
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            Set_CreditNote(result);
        },
        error: function (result) {
            alert(result);
        }
    });
}
function Set_CreditNote(result) {
    if (result.d === null) {
        return;
    }
    else if (result.d.DocEntry === 0) {
        return;
    }
    else {
        txtCardCode.SetText(result.d.CardCode);
        bteCardName.SetText(result.d.CardName);
        bteLicTradNum.SetText(result.d.LicTradNum);
        mmoComments.SetText(result.d.Comments);
        TipoDoc.SetText(result.d.U_BPP_MDTO);
        SerieDoc.SetText(result.d.U_BPP_MDSO);
        CorrelativoDoc.SetText(result.d.U_BPP_MDCO);
        if (result.d.OwnerCode != "0") cbeOwnerCode.SetValue(result.d.OwnerCode);
        else cbeOwnerCode.SetText("");

        if (result.d.SlpCode != "-1") cbeSalesPerson.SetValue(result.d.SlpCode);
        else cbeSalesPerson.SetText("");

        txtShipToCode.SetText(result.d.ShipToCode);//ENTREGA
        bteShipToCode.SetText(result.d.Address2);//ENTREGA
        txtBillToCode.SetText(result.d.PayToCode);//FACTURA
        bteBillToCode.SetText(result.d.Address);//FACTURA
        //cbeSalesPerson.SetValue(result.d.SlpCode);
        //cbeOwnerCode.SetValue(result.d.OwnerCode);

        cbbGroupNum.SetValue(result.d.GroupNum);
        cbbDocCur.SetValue(result.d.Currency);
        var _tsum = 0;
        result.d.Lines.forEach(function (_item) {
            _tsum += parseFloat(_item.LineTotal);
        });
        if (hdfTemp.Get("Currency") == "SOL") {
            txtLineSum.SetText(_tsum.toFixed(2));
            txtDiscPrcntTotal.SetText(result.d.DiscPrcntTotal.toFixed(2));
            var _dsum = (_tsum * parseFloat(result.d.DiscPrcntTotal)) / 100;
            txtDiscSum.SetText(_dsum.toFixed(2));
            txtTotalExpns.SetText(result.d.TotalExpns.toFixed(2));
            txtPaidToDate.SetText(result.d.PaidToDate.toFixed(2));
            txtPendingBal.SetText(result.d.PendingBal.toFixed(2));
        }
        else if (hdfTemp.Get("Currency") == "USD") {
            txtLineSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_tsum.toFixed(2)));
            txtDiscPrcntTotal.SetText(result.d.DiscPrcntTotal.toFixed(2));
            var _dsum = (_tsum * parseFloat(result.d.DiscPrcntTotal)) / 100;
            txtDiscSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_dsum.toFixed(2)));
            txtTotalExpns.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(result.d.TotalExpns.toFixed(2)));
            txtPaidToDate.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(result.d.PaidToDate.toFixed(2)));
            txtPendingBal.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(result.d.PendingBal.toFixed(2)));
        }
        else if (hdfTemp.Get("Currency") == "EUR") {
            txtLineSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_tsum.toFixed(2)));
            txtDiscPrcntTotal.SetText(result.d.DiscPrcntTotal.toFixed(2));
            var _dsum = (_tsum * parseFloat(result.d.DiscPrcntTotal)) / 100;
            txtDiscSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_dsum.toFixed(2)));
            txtTotalExpns.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(result.d.TotalExpns.toFixed(2)));
            txtPaidToDate.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(result.d.PaidToDate.toFixed(2)));
            txtPendingBal.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(result.d.PendingBal.toFixed(2)));
        }
        //txtLineSum.SetText(_tsum.toFixed(2));
        //txtDiscPrcntTotal.SetText(result.d.DiscPrcntTotal.toFixed(2));
        //var _dsum = (_tsum * parseFloat(result.d.DiscPrcntTotal)) / 100;
        //txtDiscSum.SetText(_dsum.toFixed(2));
        //txtTotalExpns.SetText(result.d.TotalExpns.toFixed(2));
        Get_Totals();
    }
}

// INICIALIZANDO CONTROLES
function InitControls() {
    txtCardCode.SetText("");
    bteCardName.SetText("");
    txtDocEntry.SetText("");
    txtDocNum.SetText("");
    bteLicTradNum.SetText("");
    txtDocStatus.SetText("Abierto");
    dteDocDate.SetDate(new Date());
    //txtU_BF_PED_ORIG.SetText("");
    mmoComments.SetText("");
    txtLineSum.SetText("0");
    txtDiscPrcntTotal.SetText("0");
    txtDiscSum.SetText("0");
    txtTotalExpns.SetText("0");
    txtVatSum.SetText("0");
    txtDocTotal.SetText("0");
    txtPaidToDate.SetText("0");
    txtPendingBal.SetText("0");
    txtQuantityKit.SetVisible(false);
    EnabledControl(true);
    Set_MaintenanceStatus(true);
}

function Get_DocumentSerie() {
    var _tdc = cbbU_BPP_MDTD.GetValue();
    var _ser = $.grep(_dcs, function (item, i) {
        return (item[0] === _tdc);
    });
    cbbU_BPP_MDSD.BeginUpdate();
    cbbU_BPP_MDSD.ClearItems();
    $.each(_ser, function (index, item) {
        cbbU_BPP_MDSD.InsertItem(index, item[2], item[2]);
    });
    cbbU_BPP_MDSD.EndUpdate();
    cbbU_BPP_MDSD.SetSelectedIndex(0);
    Get_DocumentCorrelative();
}

function Get_DocumentCorrelative() {
    var _tdc = cbbU_BPP_MDTD.GetValue();
    var _ser = cbbU_BPP_MDSD.GetValue();
    var _cor = $.grep(_dcs, function (item, i) {
        return (item[0] === _tdc && item[2] === _ser);
    });
    txtU_BPP_MDCD.SetText(_cor[0][3]);
    var _nls = ((_tdc === "01") ? "FT/" : (_tdc === "03") ? "BV/" : "NC/") + _ser + "-" + txtU_BPP_MDCD.GetText();
    txtNumAtCard.SetText(_nls);
}

// CLIENTES
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
    //gdvClientSearch.SetFocusedRowIndex(-1);
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
    if (values[4] != -1) {
        cbeSalesPerson.SetValue(values[4]);
    }
    cbbGroupNum.SetValue(values[5]);
    txtShipToCode.SetText(values[6]);
    bteShipToCode.SetText(values[7]);
    txtBillToCode.SetText(values[8]);
    //cbbPersonContact.PerformCallback("INICIAR:" + values[0]);
    bteBillToCode.SetText(values[9]);
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

//PRODUCTOS 
function ShowProductSearch() {
    ppcProductSearch.Show();
}
function Key_Product(s, e) {
    if (e.htmlEvent.keyCode === 13) {
        var itemcode2 = bteItemCode.GetText();
        // alert(itemcode.toUpperCase().indexOf("K"));
        Add_Product();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Add_Product() {
    var cardcode = txtCardCode.GetText();
    var pricelist = cbbListNum.GetValue();
    var itemcode = bteItemCode.GetText();

    if (hdfTemp.Get("Rate") === 0) {
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

            gdvrin1.PerformCallback("ADDPRODUCT:" + itemcode + ":" + pricelist);

            //$.ajax(
            //{
            //    type: "POST",
            //    url: "../Sales/CreditNote.aspx/Get_OneProduct",
            //    data: '{"socied":"' + socied + '", "whscode":"' + whscode + '", "cardcode":"' + cardcode + '", "pricelist":"' + pricelist + '", "itemcode":"' + itemcode + '" }',
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

function ClearControlsLine() {
    bteItemName.SetText("");
    txtQuantity.SetText("0");
    txtPriceBefDi.SetText("0");
    txtDiscPrcnt.SetText("0");
    txtPrice.SetText("0");
    txtLineTotal.SetText("0");
    txtGTotal.SetText("0");
    txtBatchNum.SetText("");
    txtU_BF_CodKit.SetText("");
    txtNumInSale.SetText("0");
}

function Set_LineProduct(result) {
    ClearControlsLine();
    result.d.forEach(function (item) {
        bteItemName.SetText(item.ItemName);
        txtQuantity.SetText("1");
        txtPriceBefDi.SetText(item.PriceBefDi);
        txtDiscPrcnt.SetText(item.DiscPrcnt.toString());
        txtPrice.SetText(item.Price);
        txtLineTotal.SetText(item.Price);
        txtGTotal.SetText(item.PriceVat);
        txtBatchNum.SetText(item.BatchNum);
        txtU_BF_CodKit.SetText(item.U_BF_CodKit);
        txtNumInSale.SetText(item.NumInSale);
        txtQuantity.Focus();
        txtQuantity.SelectAll();
    });
}

function Cal_LineTotals(s, e) {
    var _qt = parseFloat(txtQuantity.GetValue());
    var _pr = parseFloat(txtPrice.GetValue());
    var _cd = bteItemCode.GetText();
    var _lt = (_qt * _pr);
    txtLineTotal.SetText(_lt);
    var _gt = (_lt * 1.18);
    txtGTotal.SetText(_gt);
    if (e.htmlEvent.keyCode === 13) {
        gdvrin1.PerformCallback("QTY:" + _qt + ":" + _cd);
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
function Get_Product(s, e) {
    if (hdfTemp.Get("Rate") === 0) {
        alert("Ingresar Tipo de Cambio, No podrá Buscar Productos");
    }
    else {
        //gdvProductSearch.SetFocusedRowIndex(-1);
        gdvProductSearch.PerformCallback();
        if (e.htmlEvent.keyCode === 13) {
            gdvProductSearch.SetFocusedRowIndex(0);
            OkProduct();
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
        }
    }
}
function Get_Product1() {
    //gdvProductSearch.SetFocusedRowIndex(-1);
    gdvProductSearch.PerformCallback();
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
        gdvProductSearch.GetRowValues(gdvProductSearch.GetFocusedRowIndex(), "ItemCode;ItemName;OnHand;PriceBefDi;DiscPrcnt;Price;PriceVat;IssueMthd;NumInSale;ActivoC;ActivoS;InvntItem", OnGetRowValuesProduct);
    }
}

function OnGetRowValuesProduct(values) {
    //if (!isNullOrWhiteSpace(values[0])) {
        //bteItemCode.SetText(values[0]);
        //bteItemName.SetText(values[1]);
        //txtPriceBefDi.SetText(values[3]);
        //txtQuantity.SetText("1");
        //txtDiscPrcnt.SetText(values[4].toString());
        //txtPrice.SetText(values[5]);
        //txtLineTotal.SetText(values[5]);
        //txtGTotal.SetText(values[6]);
        //txtIssueMthd.SetText(values[7]);
        //txtBatchNum.SetText(values[7]);
        //txtU_BF_CodKit.SetText(values[8]);
        //txtNumInSale.SetText(values[9])
        txtQuantity.Focus();
        txtQuantity.SelectAll();

        var pricelist = cbbListNum.GetValue();
        gdvrin1.PerformCallback("LM:" + values + ":" + pricelist);

        gdvProductSearch.SetFocusedRowIndex(-1);
        ppcProductSearch.Hide();
    //}
    //else {
    //    if (!chkKit.GetChecked()) {
    //        alert("El registro seleccionado es un kit.\nActivar el check de kit e ingresar la catidad.");
    //    }
    //    else {
    //        var _qtk = parseInt(txtQuantityKit.GetValue());
    //        if (_qtk === 0) {
    //            alert("Ingrese cantidad mayor a 0.");
    //            txtQuantityKit.Focus();
    //            txtQuantityKit.SelectAll();
    //        }
    //        else {
    //            gdvrin1.PerformCallback("QK:" + values[8]);
    //            gdvProductSearch.SetFocusedRowIndex(-1);
    //            ppcProductSearch.Hide();
    //        }
    //    }
    //}
}

function CancelProduct() {
    ppcProductSearch.Hide();
}

function EndProductSearch() {
    gdvProductSearch.SetFocusedRowIndex(0);
    ppcProductSearch.UpdatePosition();
}

function Set_Kit(s) {
    txtQuantityKit.SetVisible(s.GetChecked());
    txtQuantityKit.SetText("1");
    txtQuantityKit.Focus();
    txtQuantityKit.SelectAll();
}

function SetParName(s,e) {
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

function EnabledControl(enb) {
    bteCardName.SetEnabled(enb);
    dteDocDate.SetEnabled(enb);
    bteLicTradNum.SetEnabled(enb);
    cbbListNum.SetEnabled(enb);
    cbeSalesPerson.SetEnabled(enb);
    cbeOwnerCode.SetEnabled(enb);
    cbbGroupNum.SetEnabled(enb);
    cbbU_BPP_MDTD.SetEnabled(enb);
    cbbU_BPP_MDSD.SetEnabled(enb);
    //txtU_BF_PED_ORIG.SetEnabled(enb);
    mmoComments.SetEnabled(enb);
    txtDiscPrcntTotal.SetEnabled(enb);
    txtTotalExpns.SetEnabled(enb);
    ASPxClientUtils.SetCookie("theme", hdfTemp.Get("theme"));
}

function ClearControl() {
    InitControls();
    cbbListNum.SetValue(_vld[0]);
    cbeSalesPerson.SetValue(_vld[2]);
    cbeOwnerCode.SetValue(_vld[4]);
    cbbGroupNum.SetValue(_vld[3]);
    cbbU_BPP_MDTD.SetValue(_vld[1]);
    txtShipToCode.SetText("");
    bteShipToCode.SetText("");
    dteDocDate.SetDate(new Date());
    dteDocumentoDate.SetDate(new Date());
    txtBillToCode.SetText("");
    bteBillToCode.SetText("");
    Get_DocumentType();
    gdvrin1.PerformCallback("CLR");
}

function Save() {
    var rowc = gdvrin1.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("Ingresar al menos un producto a la lista.");
    }
    else if (gdvrin1.IsEditing()) {
        alert("Actualizar o cancelar la fila en edición.");
    }
    else if (cbeOwnerCode.GetValue() === null) {
        alert("Seleccionar responsable de venta.");
    }
    else if (isNullOrWhiteSpace(mmoComments.GetText())) {
        alert("Ingrese el motivo en el campo comentario.");
    }
    else {
        var result = confirm("Este documento no puede modificarse tras la creación. ¿Desea continuar?");
        if (result) {
            ldpProcess.SetText("Guardando, espere por favor...");
            ldpProcess.Show();
            clbOperation.PerformCallback("Save");
        }
    }
}
function Set_Operation(s,e) {
    // GUARDAR
    if (e.item.name === "Save") {
        Save();
    }
    // NUEVO
    else if (e.item.name === "New") {
        ClearControl();
    }
    // BUSCAR
    else if (e.item.name === "Search") {
        dteDateIn.SetDate(new Date());
        dteDateFi.SetDate(new Date());
        txtNumAtCards.SetText("");
        ppcOrinSearch.Show();
    }
    else if (e.item.name === "Print") {
        ldpProcess.SetText("Procesando, espere por favor...");
        ldpProcess.Show();
        clbOperation.PerformCallback("Print");
    }
    //MEDIOS DE PAGO
    else if (e.item.name === "PayEfe" || e.item.name === "PayTar") {
        Med_Payment(e.item.name);
    }
}

function Com_Operation(s, e) {
    ldpProcess.Hide();
    var _spd = "";
    if (e.result.indexOf("OKS") !== -1) {
        _spd = e.result.split("#");
        txtDocEntry.SetText(_spd[1]);
        txtDocNum.SetText(_spd[2]);
        txtDocStatus.SetText("Cerrado");
        var _dtl = parseFloat(txtDocTotal.GetValue());
        //txtPaidToDate.SetValue(_dtl.toFixed(2));
        txtPendingBal.SetValue("0");
        EnabledControl(false);
        Set_MaintenanceStatus(false);
        gdvrin1.UpdateEdit();
        alert("Operación concretada con exito...!!");
    }
    else if (e.result.indexOf("OKP") !== -1) {
        _spd = e.result.split("#");
        txtPaidToDate.SetText(_spd[1]);
        txtPendingBal.SetText(_spd[2]);
        if (parseFloat(_spd[2]) === 0) {
            txtDocStatus.SetText("Cerrado");
            Set_MaintenanceStatus(false);
        }
        alert("Operación concretada con exito...!!");
    }
    else if (e.result.indexOf("OKAPRINT") !== -1) {
        $(location).attr("href", "../Impresiones/getReport.aspx");
    }
    else {
        alert(e.result);
    }
}

function Exi_Product(itemcode) {
    var _ext = false;
    for (var i = 0; i < gdvrin1.GetVisibleRowsOnPage(); i++) {
        var _eit = gdvrin1.GetRow(i).cells[2].innerText;
        var _kit = gdvrin1.GetRow(i).cells[11].innerText;
        if (_eit === itemcode && isNullOrWhiteSpace(_kit)) {
            _ext = true;
            break;
        }
    }
    return (_ext);
}

var _cmd;
function Beg_CallbackLines(s,e) {
    _cmd = e.command;
}

function End_CallbackLines() {
    Set_SubTotal();
    if (_cmd === "STARTEDIT") {
        txtQuantity.Focus();
        txtQuantity.SelectAll();
    }
    _cmd = "";
}
function alphanumeric(inputtxt) {
    var lgnt = inputtxt.length;
    var rslt = ""
    for (var i = 0; i < lgnt; i++) {
        if (inputtxt.charAt(i).match(/^[0-9]+$/) || inputtxt.charAt(i) == "." || inputtxt.charAt(i) == ",") {
            if (inputtxt.charAt(i) == "." || inputtxt.charAt(i) == ",") {
                rslt += ".";
            } else
                rslt += inputtxt.charAt(i);
        }
    }
    return rslt;
}
function Set_SubTotal() {
    if (!gdvrin1.IsEditing()) {
        var _sbt = parseFloat(gdvrin1.cpSubTotal);
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

function Set_Discount(s, e) {
    var _sbt = parseFloat(alphanumeric(txtLineSum.GetValue()));
    var _dsp = parseFloat(s.GetValue());
    var _dst = (_sbt * _dsp) / 100;
    if (cbbDocCur.GetValue().toString() === "USD") {
        txtDiscSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_dst));
    }
    else if (cbbDocCur.GetValue().toString() === "EUR") {
        txtDiscSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_dst));
    }
    else {
        txtDiscSum.SetText(_dst);
    }
    //txtDiscSum.SetText(_dst);
    Get_Totals();
}

function Set_TotalExpns(s, e) {
    var _sbt = parseFloat(alphanumeric(txtLineSum.GetValue()));
    var _dst = parseFloat(alphanumeric(txtDiscSum.GetValue()));
    var _sid = (_sbt - _dst);
    var _tep = parseFloat(s.GetValue());
    var _sdt = (_sid + _tep);
    var _imp = ((_sdt * 18) / 100);
    var _tot = (_sdt + parseFloat(_imp.toFixed(2)));
    var _ima = parseFloat(alphanumeric(txtPaidToDate.GetValue()));
    var _spe = (parseFloat(_tot.toFixed(2)) - parseFloat(_ima.toFixed(2)));
    if (cbbDocCur.GetValue().toString() == "USD") {
        txtVatSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_imp.toFixed(2)));
        txtDocTotal.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_tot.toFixed(2)));
        txtPendingBal.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_spe.toFixed(2)));
        txtTotalExpns.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_tep.toFixed(2)));
    }
    else if (cbbDocCur.GetValue().toString() == "EUR") {
        txtVatSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_imp.toFixed(2)));
        txtDocTotal.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_tot.toFixed(2)));
        txtPendingBal.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_spe.toFixed(2)));
        txtTotalExpns.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_tep.toFixed(2)));
    }
    else {
        txtVatSum.SetText(_imp);
        txtDocTotal.SetText(_tot);
        txtPendingBal.SetText(_spe);
        txtTotalExpns.SetText(_tep.toFixed(2));
    }
    //txtVatSum.SetText(_imp.toFixed(2));
    //txtDocTotal.SetText(_tot.toFixed(2));
    //txtPendingBal.SetText(_spe.toFixed(2));
}
//function Set_SubTotal() {
//    if (!gdvrin1.IsEditing()) {
//        var _sbt = parseFloat(gdvrin1.cpSubTotal);
//        txtLineSum.SetText(_sbt.toFixed(2));
//        Get_Totals();
//    }
//}

//function Get_Totals() {
//    var _sbt = parseFloat(txtLineSum.GetValue());
//    var _dst = parseFloat(txtDiscSum.GetValue());
//    var _sid = (_sbt - _dst);
//    var _tep = parseFloat(txtTotalExpns.GetValue());
//    var _sdt = (_sid + _tep);
//    var _imp = ((_sdt * 18) / 100);
//    var _tot = (_sdt + parseFloat(_imp.toFixed(2)));
//    var _ima = parseFloat(txtPaidToDate.GetValue());
//    var _spe = (parseFloat(_tot.toFixed(2)) - parseFloat(_ima.toFixed(2)));
//    txtVatSum.SetText(_imp.toFixed(2));
//    txtDocTotal.SetText(_tot.toFixed(2));
//    txtPendingBal.SetText(_spe.toFixed(2));
//}

//function Set_Discount(s,e) {
//    var _sbt = parseFloat(txtLineSum.GetValue());
//    var _dsp = parseFloat(s.GetValue());
//    var _dst = (_sbt * _dsp) / 100;
//    txtDiscSum.SetText(_dst);
//    Get_Totals();
//}

//function Set_TotalExpns(s,e) {
//    var _sbt = parseFloat(txtLineSum.GetValue());
//    var _dst = parseFloat(txtDiscSum.GetValue());
//    var _sid = (_sbt - _dst);
//    var _tep = parseFloat(s.GetValue());
//    var _sdt = (_sid + _tep);
//    var _imp = ((_sdt * 18) / 100);
//    var _tot = (_sdt + parseFloat(_imp.toFixed(2)));
//    var _ima = parseFloat(txtPaidToDate.GetValue());
//    var _spe = (parseFloat(_tot.toFixed(2)) - parseFloat(_ima.toFixed(2)));
//    txtVatSum.SetText(_imp.toFixed(2));
//    txtDocTotal.SetText(_tot.toFixed(2));
//    txtPendingBal.SetText(_spe.toFixed(2));
//}

function Add_Kits() {
    var _qtk = parseInt(txtQKit.GetValue());
    if (_qtk === 0) {
        alert("Ingrese cantidad mayor a 0.");
    }
    else {
        var itemcode = bteItemCode.GetText();
        gdvrin1.PerformCallback("QK:" + itemcode);
        ppcQKit.Hide();
    }
}

function Set_MaintenanceStatus(enb) {
    mnuOper.GetItemByName("Save").SetEnabled(enb);
    mnuOper.GetItemByName("Cancel").SetVisible(false);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetEnabled(false);
    mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
    mnuOper.GetItemByName("Print").SetEnabled(true);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
    mnuOper.GetItemByName("Recursos").SetVisible(false);
    mnuOper.GetItemByName("CopyTo").SetEnabled(false);
}

// BUSCAR DOCUMENTOS DE VENTA
function Get_Orin() {
    gdvOrinSearch.SetFocusedRowIndex(-1);
    gdvOrinSearch.PerformCallback();
}

function OkOrin() {
    var rowc = gdvOrinSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvOrinSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvOrinSearch.GetRowValues(gdvOrinSearch.GetFocusedRowIndex(), "NumAtCard;DocDate;DocStatus;CardCode;CardName;DocTotal;DocEntry;DocNum;LicTradNum;U_BPP_MDTD;U_BPP_MDSD;U_BPP_MDCD;SlpCode;OwnerCode;GroupNum;Comments;U_BF_PED_ORIG;DiscPrcntTotal;DiscSum;TotalExpns;PaidToDate;DocCur;ListNumSrch;U_DXP_FE_MOT_GEN;U_BPP_MDTO;U_BPP_MDSO;U_BPP_MDCO;ShipToCode;PayToCode;BillStreet;ShipStreet", OnGetRowValuesOrin);
    }
}

function OnGetRowValuesOrin(values) {
    hdfTemp.Set("Currency", values[21]);
    cbbDocCur.SetValue(values[21]);
    txtCardCode.SetText(values[3]);
    bteCardName.SetText(values[4]);
    txtDocEntry.SetText(values[6]);
    txtDocNum.SetText(values[7]);
    bteLicTradNum.SetText(values[8]);
    txtDocStatus.SetText(values[2]);
    dteDocDate.SetDate(new Date(values[1]));
    cbbListNum.SetValue(values[22]);

    cbbMotivoG.SetValue(values[23]);
    TipoDoc.SetText(values[24]);
    SerieDoc.SetText(values[25]);
    CorrelativoDoc.SetText(values[26]);

    txtShipToCode.SetText(values[27]);//ENTREGA
    bteShipToCode.SetText(values[30]);//ENTREGA
    txtBillToCode.SetText(values[28]);//FACTURA
    bteBillToCode.SetText(values[29]);//FACTURA

    if (values[13] != "0") cbeOwnerCode.SetValue(values[13]);
    else cbeOwnerCode.SetText("");

    if (values[12] != "-1") cbeSalesPerson.SetValue(values[12]);
    else cbeSalesPerson.SetText("");

    cbbGroupNum.SetValue(values[14]);
    cbbU_BPP_MDTD.SetValue(values[9]);
    cbbU_BPP_MDSD.SetValue(values[10]);
    txtU_BPP_MDCD.SetText(values[11]);
    //txtU_BF_PED_ORIG.SetText(values[16]);
    txtNumAtCard.SetText(values[0]);
    mmoComments.SetText(values[15]);
    if (hdfTemp.Get("Currency") == "SOL") {
        txtDiscPrcntTotal.SetText(values[17]);
        txtDiscSum.SetText(values[18]);
        txtTotalExpns.SetText(values[19]);
        txtPaidToDate.SetText(values[20]);
    }
    else if (hdfTemp.Get("Currency") == "USD") {
        txtDiscPrcntTotal.SetText(values[17]);
        txtDiscSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(values[18]));
        txtTotalExpns.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(values[19]));
        txtPaidToDate.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(values[20]));
    }
    else if (hdfTemp.Get("Currency") == "EUR") {
        txtDiscPrcntTotal.SetText(values[17]);
        txtDiscSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(values[18]));
        txtTotalExpns.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(values[19]));
        txtPaidToDate.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(values[20]));
    }
    //txtDiscPrcntTotal.SetText(values[17].toString());
    //txtDiscSum.SetText(values[18].toString());
    //txtTotalExpns.SetText(values[19].toString());
    //txtPaidToDate.SetText(values[20].toString());
    gdvrin1.PerformCallback("SRCH");    

    EnabledControl(false);
    Set_MaintenanceStatus(false);    

    gdvOrinSearch.SetFocusedRowIndex(-1);
    ppcOrinSearch.Hide();
}

function CancelOrin() {
    ppcOrinSearch.Hide();
}

function EndOrinSearch() {
    gdvOrinSearch.SetFocusedRowIndex(0);
    ppcOrinSearch.UpdatePosition();
}