var _dcs = [];
var _vld = [7];
$(document).ready(function () {
    _vld[4] = hdfTemp.Get("_emid");
    _vld[6] = hdfTemp.Get("_soci");
    Get_DocumentType();
    Get_InitialData();
    InitControls();
    Set_VisibleOption();
});
function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
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

// LISTA LOS TIPOS DE DOCUMENTOS DE VENTA
function Get_DocumentType() {
    var project = hdfTemp.Get("_proj");
    var socied = hdfTemp.Get("_soci");
    $.ajax(
           {
               type: "POST",
               url: "../Sales/APInvoice.aspx/Get_DocumentType",
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
    cbeSalesPerson.ClearItems();
    cbeOwnerCode.ClearItems();
    cbeSalesPerson.BeginUpdate();
    cbeOwnerCode.BeginUpdate();
    $.each(_rs, function (index, item) {
        cbeSalesPerson.InsertItem(index, item.Name, item.Code);
        cbeOwnerCode.InsertItem(index, item.Name, item.empID);
        if (item.Dfault === 1) {
            _vld[2] = item.Code;
        }
    });
    cbeSalesPerson.EndUpdate();
    cbeOwnerCode.EndUpdate();
    cbeSalesPerson.SetValue(_vld[2]);
    cbeOwnerCode.SetValue(_vld[4]);

    _rs = result.d.where(function (item) { return (item.Ident === "CP"); });
    cbbGroupNum.ClearItems();
    cbbGroupNum.BeginUpdate();
    $.each(_rs, function (index, item) {
        if (_vld[6] === "BT") {
            if (item.Code === "10" || item.Code === "12" || item.Code === "19" || item.Code === "18") {
                cbbGroupNum.InsertItem(index, item.Name, item.Code);
                if (item.Dfault === 1) {
                    _vld[3] = item.Code;
                }
            }
        }
        else {
            if (item.Code === "37" || item.Code === "18") {
                cbbGroupNum.InsertItem(index, item.Name, item.Code);
                if (item.Dfault === 1) {
                    _vld[3] = item.Code;
                }
            }
        }
    });
    cbbGroupNum.SetValue(_vld[3]);
    cbbGroupNum.EndUpdate();
    Get_CreditTarject();
}

// LISTA LAS TARJETAS DE CREDITO
function Get_CreditTarject() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
        {
            type: "POST",
            url: "../Sales/APInvoice.aspx/Get_CreditTarject",
            data: '{"socied":"' + socied + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                cbbCreditCard.BeginUpdate();
                $.each(result.d, function (index, item) {
                    cbbCreditCard.InsertItem(index, item.CardName, item.CreditCard);
                    if (item.Dfault === 1) {
                        _vld[5] = item.CreditCard;
                    }
                });
                cbbCreditCard.EndUpdate();
                cbbCreditCard.SetValue(_vld[5]);
            },
            error: function (result) {
                alert(result);
            }
        });
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
    txtU_BF_PED_ORIG.SetText("");
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
    ClearControlsClient();
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
    var _nls = ((_tdc === "01") ? "FT/" : (_tdc === "03") ? "BV/" : "TK/") + _ser + "-" + txtU_BPP_MDCD.GetText();
    txtNumAtCard.SetText(_nls);
}

// CLIENTES
function ShowClientSearch() {
    ppcClientSearch.Show();
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
        gdvClientSearch.GetRowValues(gdvClientSearch.GetFocusedRowIndex(), "CardCode;CardName;LicTradNum", OnGetRowValuesClient);
    }
}

function OnGetRowValuesClient(values) {
    txtCardCode.SetText(values[0]);
    bteCardName.SetText(values[1]);
    bteLicTradNum.SetText(values[2]);
    gdvClientSearch.SetFocusedRowIndex(-1);
    ppcClientSearch.Hide();
}

function CancelClient() {
    ppcClientSearch.Hide();
}

function EndClientSearch() {
    gdvClientSearch.SetFocusedRowIndex(0);
    ppcClientSearch.UpdatePosition();
}

//PRODUCTOS 
function ShowProductSearch() {
    ppcProductSearch.Show();
}

function Key_Product(s, e) {
    if (e.htmlEvent.keyCode === 13) {
        Add_Product();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}

function Add_Product() {
    var cardcode = txtCardCode.GetText();
    var pricelist = cbbListNum.GetValue();
    var itemcode = bteItemCode.GetText();

    if (itemcode.toUpperCase().indexOf("K") !== -1) {
        chkKit.SetChecked(false);
        ppcQKit.Show();
        txtQKit.SetText("1");
        txtQKit.Focus();
        txtQKit.SelectAll();
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
            $.ajax(
            {
                type: "POST",
                url: "../Sales/APInvoice.aspx/Get_OneProduct",
                data: '{"socied":"' + socied + '","project":"' + project + '","whscode":"' + whscode + '", "cardcode":"' + cardcode + '", "pricelist":"' + pricelist + '", "itemcode":"' + itemcode + '" }',
                contentType: "application/json; charset=uft-8",
                dataType: "json",
                success: function (result) {
                    Set_LineProduct(result);
                },
                error: function (result) {
                    alert(result);
                }
            });
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
    txtOItemCode.SetText("");
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
        txtOItemCode.SetText(item.ItemCode);
        txtQuantity.Focus();
        txtQuantity.SelectAll();
    });
}

function Cal_LineTotals() {
    var _qt = parseInt(txtQuantity.GetValue());
    var _pr = parseFloat(txtPrice.GetValue());
    var _lt = (_qt * _pr);
    txtLineTotal.SetText(_lt);
    var _gt = (_lt * 1.18);
    txtGTotal.SetText(_gt);
}

function Cal_LineDescTotals() {
    var _pb = parseFloat(txtPriceBefDi.GetValue());
    var _dc = parseFloat(txtDiscPrcnt.GetValue());
    var _pr = _pb - ((_pb * _dc) / 100.00);
    txtPrice.SetText(_pr);
    Cal_LineTotals();
}

function Get_Product() {
    gdvProductSearch.SetFocusedRowIndex(-1);
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
        gdvProductSearch.GetRowValues(gdvProductSearch.GetFocusedRowIndex(), "ItemCode;ItemName;OnHand;PriceBefDi;DiscPrcnt;Price;PriceVat;BatchNum;U_BF_CodKit;NumInSale", OnGetRowValuesProduct);
    }
}

function OnGetRowValuesProduct(values) {
    if (isNullOrWhiteSpace(values[8])) {
        bteItemCode.SetText(values[0]);
        bteItemName.SetText(values[1]);
        txtPriceBefDi.SetText(values[3]);
        txtQuantity.SetText("1");
        txtDiscPrcnt.SetText(values[4].toString());
        txtPrice.SetText(values[5]);
        txtLineTotal.SetText(values[5]);
        txtGTotal.SetText(values[6]);
        txtBatchNum.SetText(values[7]);
        txtU_BF_CodKit.SetText(values[8]);
        txtNumInSale.SetText(values[9]);
        txtOItemCode.SetText(values[0]);
        txtQuantity.Focus();
        txtQuantity.SelectAll();
        gdvProductSearch.SetFocusedRowIndex(-1);
        ppcProductSearch.Hide();
    }
    else {
        if (!chkKit.GetChecked()) {
            alert("El registro seleccionado es un kit.\nActivar el check de kit e ingresar la catidad.");
        }
        else {
            var _qtk = parseInt(txtQuantityKit.GetValue());
            if (_qtk === 0) {
                alert("Ingrese cantidad mayor a 0.");
                txtQuantityKit.Focus();
                txtQuantityKit.SelectAll();
            }
            else {
                gdvinv1.PerformCallback("QK:" + values[8]);
                gdvProductSearch.SetFocusedRowIndex(-1);
                ppcProductSearch.Hide();
            }
        }
    }
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
    txtU_BF_PED_ORIG.SetEnabled(enb);
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
    cbbCreditCard.SetValue(_vld[5]);
    Get_DocumentType();
    gdvinv1.PerformCallback("CLR");
}

function Save() {
    var rowc = gdvinv1.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("Ingresar al menos un producto a la lista.");
    }
    else if (gdvinv1.IsEditing()) {
        alert("Actualizar o cancelar la fila en edición.");
    }
    else if (cbeOwnerCode.GetValue() === null) {
        alert("Seleccionar responsable de venta.");
    }
    else {
        var result = confirm("Este documento no puede modificarse tras la creación.\n¿Desea continuar?");
        if (result) {
            ldpProcess.SetText("Guardando, espere por favor...");
            ldpProcess.Show();
            clbOperation.PerformCallback("Save");
        }
    }
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save") {
        if (txtU_BF_PED_ORIG.GetText() === "")
            alert("Ingrese el Número de Pedido de Origen");
        else
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
        ppcOinvSearch.Show();
    }
    //MEDIOS DE PAGO
    else if (e.item.name === "PayEfe" || e.item.name === "PayTar") {
        Med_Payment(e.item.name);
    }
    //COPIAR A NOTA DE CREDITO
    else if (e.item.name === "CreditNote") {
        ldpProcess.SetText("Procesando, espere por favor...");
        ldpProcess.Show();
        clbOperation.PerformCallback("CrNote");
    }
    //COPIAR A NOTA DE CREDITO
    else if (e.item.name === "DeliveryNote") {
        ldpProcess.SetText("Procesando, espere por favor...");
        ldpProcess.Show();
        clbOperation.PerformCallback("DlNote");
    }
    //IMPRESION TICKET BOLETA
    else if (e.item.name === "Ticket") {
        PrintTicket("TB");
    }
    //IMPRESION TICKET FACTURA
    else if (e.item.name === "TicketBill") {
        PrintTicket("TF");
    }
}

function Com_Operation(s, e) {
    ldpProcess.Hide();
    var _spd = "";
    if (e.result.indexOf("OKS") !== -1) {
        _spd = e.result.split("#");
        txtDocEntry.SetText(_spd[1]);
        txtDocNum.SetText(_spd[2]);
        EnabledControl(false);
        Set_MaintenanceStatus(false);
        gdvinv1.UpdateEdit();
        alert("Operación concretada con exito...!!");
    }
    else if (e.result.indexOf("OKP") !== -1) {
        _spd = e.result.split("#");
        txtPaidToDate.SetText(_spd[1]);
        txtPendingBal.SetText(_spd[2]);
        if (parseFloat(_spd[2]) === 0) {
            txtDocStatus.SetText("Pagado");
            Set_MaintenanceStatus(false);
        }
        alert("Operación concretada con exito...!!");
    }
    else if (e.result.indexOf("OKCN") !== -1) {
        $(location).attr("href", "../Sales/CreditNote.aspx");
    }
    else if (e.result.indexOf("OKDN") !== -1) {
        $(location).attr("href", "../Sales/DeliveryNote.aspx");
    }
    else if (e.result.indexOf("OKBP") !== -1) {
        txtCardCode.SetText(txtCrCardCode.GetText());
        bteCardName.SetText(txtCrCardName.GetText());
        bteLicTradNum.SetText(txtCrLicTradNum.GetText());
        ClearControlsClient();
        alert("Cliente creado con exito...!!");
    }
    else {
        alert(e.result);
    }
}

function Exi_Product(itemcode) {
    var _ext = false;
    for (var i = 0; i < gdvinv1.GetVisibleRowsOnPage(); i++) {
        var _eit = gdvinv1.GetRow(i).cells[2].innerText;
        var _kit = gdvinv1.GetRow(i).cells[11].innerText;
        if (_eit === itemcode && isNullOrWhiteSpace(_kit)) {
            _ext = true;
            break;
        }
    }
    return (_ext);
}

function End_CallbackLines() {
    Set_SubTotal(); 
}

function Set_SubTotal() {
    var _sbt = parseFloat(gdvinv1.cpSubTotal);
    txtLineSum.SetText(_sbt.toFixed(2));
    Get_Totals();
}

function Get_Totals() {
    var _sbt = parseFloat(txtLineSum.GetValue());
    var _dst = parseFloat(txtDiscSum.GetValue());
    var _sid = (_sbt - _dst);
    var _tep = parseFloat(txtTotalExpns.GetValue());
    var _sdt = (_sid + _tep);
    var _imp = ((_sdt * 18) / 100);
    var _tot = (_sdt + parseFloat(_imp.toFixed(2)));
    var _ima = parseFloat(txtPaidToDate.GetValue());
    var _spe = (parseFloat(_tot.toFixed(2)) - parseFloat(_ima.toFixed(2)));
    txtVatSum.SetText(_imp.toFixed(2));
    txtDocTotal.SetText(_tot.toFixed(2));
    txtPendingBal.SetText(_spe.toFixed(2));
}

function Set_Discount(s,e) {
    var _sbt = parseFloat(txtLineSum.GetValue());
    var _dsp = parseFloat(s.GetValue());
    var _dst = (_sbt * _dsp) / 100;
    txtDiscSum.SetText(_dst);
    Get_Totals();
}

function Set_TotalExpns(s,e) {
    var _sbt = parseFloat(txtLineSum.GetValue());
    var _dst = parseFloat(txtDiscSum.GetValue());
    var _sid = (_sbt - _dst);
    var _tep = parseFloat(s.GetValue());
    var _sdt = (_sid + _tep);
    var _imp = ((_sdt * 18) / 100);
    var _tot = (_sdt + parseFloat(_imp.toFixed(2)));
    var _ima = parseFloat(txtPaidToDate.GetValue());
    var _spe = (parseFloat(_tot.toFixed(2)) - parseFloat(_ima.toFixed(2)));
    txtVatSum.SetText(_imp.toFixed(2));
    txtDocTotal.SetText(_tot.toFixed(2));
    txtPendingBal.SetText(_spe.toFixed(2));
}

function Add_Kits() {
    var _qtk = parseInt(txtQKit.GetValue());
    if (_qtk === 0) {
        alert("Ingrese cantidad mayor a 0.");
    }
    else {
        var itemcode = bteItemCode.GetText();
        gdvinv1.PerformCallback("QK:" + itemcode);
        ppcQKit.Hide();
    }
}

function Set_MaintenanceStatus(enb) {
    mnuOper.GetItemByName("Save").SetEnabled(enb);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetEnabled(false);
    mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
    mnuOper.GetItemByName("Print").SetEnabled(!enb);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
    mnuOper.GetItemByName("CopyTo").SetEnabled(!enb);

    var _dst = txtDocStatus.GetText();
    if (_dst === "Cerrado") {
//        mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
        mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
        mnuOper.GetItemByName("CopyTo").SetEnabled(false);
    }

    if (_dst === "Pagado") {
        mnuOper.GetItemByName("CopyTo").SetEnabled(true);
        mnuOper.GetItemByName("CreditNote").SetVisible(false);
    }

    if (_dst === "Abierto") {
        mnuOper.GetItemByName("CreditNote").SetVisible(true);        
    }
}

function Set_VisibleOption() {
    mnuOper.GetItemByName("Quote").SetVisible(false);
    mnuOper.GetItemByName("OrderTo").SetVisible(false);
    mnuOper.GetItemByName("Cancel").SetVisible(false);
}

// BUSCAR DOCUMENTOS DE VENTA
function Get_Oinv() {
    gdvOinvSearch.SetFocusedRowIndex(-1);
    gdvOinvSearch.PerformCallback();
}

function OkOinv() {
    var rowc = gdvOinvSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvOinvSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvOinvSearch.GetRowValues(gdvOinvSearch.GetFocusedRowIndex(), "NumAtCard;DocDate;DocStatus;CardCode;CardName;DocTotal;DocEntry;DocNum;LicTradNum;U_BPP_MDTD;U_BPP_MDSD;U_BPP_MDCD;SlpCode;OwnerCode;GroupNum;Comments;U_BF_PED_ORIG;DiscPrcntTotal;DiscSum;TotalExpns;PaidToDate", OnGetRowValuesOinv);
    }
}

function OnGetRowValuesOinv(values) {
    txtCardCode.SetText(values[3]);
    bteCardName.SetText(values[4]);
    txtDocEntry.SetText(values[6]);
    txtDocNum.SetText(values[7]);
    bteLicTradNum.SetText(values[8]);
    txtDocStatus.SetText(values[2]);
    dteDocDate.SetDate(new Date(values[1]));
    cbbListNum.SetValue(_vld[0]);
    cbeSalesPerson.SetValue(values[12]);
    cbeOwnerCode.SetValue(values[13]);
    cbbGroupNum.SetValue(values[14]);
    cbbU_BPP_MDTD.SetValue(values[9]);
    cbbU_BPP_MDSD.SetValue(values[10]);
    txtU_BPP_MDCD.SetText(values[11]);
    txtU_BF_PED_ORIG.SetText(values[16]);
    txtNumAtCard.SetText(values[0]);
    mmoComments.SetText(values[15]);
    txtDiscPrcntTotal.SetText(values[17].toString());
    txtDiscSum.SetText(values[18].toString());
    txtDocTotal.SetText(values[5].toString());
    txtTotalExpns.SetText(values[19].toString());
    txtPaidToDate.SetText(values[20].toString());
    gdvinv1.PerformCallback("SRCH");    

    EnabledControl(false);
    Set_MaintenanceStatus(false);    

    gdvOinvSearch.SetFocusedRowIndex(-1);
    ppcOinvSearch.Hide();
}

function CancelOinv() {
    ppcOinvSearch.Hide();
}

function EndOinvSearch() {
    gdvOinvSearch.SetFocusedRowIndex(0);
    ppcOinvSearch.UpdatePosition();
}

// MEDIOS DE PAGO
function Get_OutBalance() {
    var _tot = parseFloat(txtDocTotal.GetValue());
    var _iap = parseFloat(txtPaidToDate.GetValue());
    var _ipe = (_tot - _iap);
    return (_ipe.toString());
}
function Med_Payment(name) {
    if (Get_OutBalance() !== 0) {
        pgcPayment.GetTab(0).SetEnabled(true);
        pgcPayment.GetTab(1).SetEnabled(true);
        if (name === "PayEfe") {
            txtSalEfe.SetText(Get_OutBalance());
            pgcPayment.SetActiveTabIndex(0);
            pgcPayment.GetTab(1).SetEnabled(false);
        }
        else {
            cbbCreditCard.SetValue(_vld[5]);
            txtCardNum.SetText("");
            txtSalTacre.SetText(Get_OutBalance());
            pgcPayment.SetActiveTabIndex(1);
            pgcPayment.GetTab(0).SetEnabled(false);
        }
        ppcPayment.Show();
    }
    else {
        alert("El documento está cerrado.");
    }
}

function Sel_CreditCard() {
    txtCardNum.Focus();
    txtCardNum.SelectAll();
    window.setTimeout("txtCardNum.Focus()", 100);
    window.setTimeout("txtCardNum.SelectAll()", 100);
}

function CancelPayment() {
    ppcPayment.Hide();
}

function Set_Payment() {
    var _act = pgcPayment.GetActiveTabIndex();
    if (_act === 0) {
        if (parseFloat(txtSalEfe.GetValue()) <= 0 && parseFloat(txtSalEfe.GetValue()) > Get_OutBalance()) {
            alert("Ingrese monto mayor a cero y\nmenor o igual al saldo pendiente.");
            return;
        }
    }
    else {
        if (parseFloat(txtSalTacre.GetValue()) <= 0 && parseFloat(txtSalTacre.GetValue()) > Get_OutBalance()) {
            alert("Ingrese monto mayor a cero y\nmenor o igual al saldo pendiente.");
            return;
        }
        else if (isNullOrWhiteSpace(txtCardNum.GetText()) || txtCardNum.GetText().trim().length !== 4) {
            alert("Ingrese los últimos 4 dígitos de la tarjeta.");
            return;
        }
    }

    ldpProcess.SetText("Pagando, espere por favor...");
    ldpProcess.Show();
    clbOperation.PerformCallback("Payment");
    ppcPayment.Hide();
}

//CREAR CLIENTE
function Show_ClientCreate() {
    if (cbbCrDocumentType.GetValue() === null) {
        cbbCrDocumentType.SetSelectedIndex(0);
    }
    ppcClientCr.Show();
}
function Set_ClientCr() {
    var _val = ASPxClientEdit.ValidateGroup("ValCrClient");
    if (_val) {
        var _doc = txtCrLicTradNum.GetText();
        var _tp = cbbCrPersonType.GetValue();
        var _ixdt = cbbCrDocumentType.GetSelectedIndex();
        if (_tp === "TPJ") {
            _val = ValRuc(_doc);
        }
        else {
            if (_ixdt === 0) {
                _val = (_doc.length === 8);
            }
            else {
                _val = ValRuc(_doc);
            }
        }

        if (!_val) {
            alert("Nro. Documento incorrecto.");
        }
        else {
            ldpProcess.SetText("Creando, espere por favor...");
            ldpProcess.Show();
            clbOperation.PerformCallback("CrClient");
            ppcClientCr.Hide();
        }
    }
}
function CancelClientCr() {
    ppcClientCr.Hide();
}
function Key_CrLicTradNum(s, e) {
    var _crd = "C" + s.GetText();
    txtCrCardCode.SetText(_crd);
}
function Key_CrCardName(s, e) {
    s.SetText(s.GetText().toUpperCase());
}
function Init_ClientCr() {
    cbbCrDocumentType.ClearItems();
    cbbCrDocumentType.AddItem("RUC", 6);
}
function Get_CrDocumentType() {
    cbbCrDocumentType.ClearItems();
    if (cbbCrPersonType.GetSelectedIndex() === 0) {
        cbbCrDocumentType.AddItem("RUC", 6);
        cbbCrDocumentType.SetSelectedIndex(0);
    }
    else {
        cbbCrDocumentType.AddItem("DNI", 1);
        cbbCrDocumentType.AddItem("RUC", 6);
        cbbCrDocumentType.SetSelectedIndex(0);
    }
}
function ClearControlsClient() {
    txtCrCardCode.SetText("");
    txtCrCardName.SetText("");
    cbbCrDocumentType.SetSelectedIndex(0);
    cbbCrDocumentType.SetSelectedIndex(0);
    txtCrLicTradNum.SetText("");
    txtCrCellular.SetText("");
    txtCrE_Mail.SetText("");
    txtCrPhone1.SetText("");
    dteCrU_PN_FecNac.SetDate(null);
}
function ProcessKeyPress(s, e) {
    var charCode = (e.htmlEvent.which) ? e.htmlEvent.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        _aspxPreventEvent(e.htmlEvent);

}
// IMPRESION DE TICKET
function repl(s, n) {
    var r = '';
    while (n) {
        if (n & 1) { r += s; }
        s += s;
        n >>= 1;
    }
    return r;
}
String.prototype.insert = function (index, string) {
    if (index > 0)
        return this.substring(0, index) + string + this.substring(index, this.length);
    else
        return string + this;
};
function Right(str, n) {
    if (n <= 0)
        return "";
    else if (n > String(str).length)
        return str;
    else {
        var iLen = String(str).length;
        return String(str).substring(iLen, iLen - n);
    }
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
function PrintTicket(tdoc) {
    try {
        var fso = new ActiveXObject("Scripting.FileSystemObject");
        var contxt = "C:\\ClientSide\\PrintContent.txt";
        var a = fso.CreateTextFile(contxt, true);

        //HEADER
        if (_vld[6] === "BM") {
            a.WriteLine("            " + "BELMAY S.A.C.");
            a.WriteLine("             " + "20100139333");
        }
        else {
            a.WriteLine("       " + "BOTICA FRANCESA S.A.C.");
            a.WriteLine("            " + "20109950514");
        }
        var str = hdfTemp.Get("_cpnadd");
        var chunks = [];
        var chunkSize = 36;

        while (str) {
            if (str.length < chunkSize) {
                chunks.push(str);
                break;
            }
            else {
                chunks.push(str.substr(0, chunkSize));
                str = str.substr(chunkSize);
            }
        }
        for (var i = 0; i < chunks.length; i++) {
            var lin = chunks[i].length;
            if (lin === 36) {
                a.WriteLine(chunks[i]);
            }
            else {
                var res = ((36 - lin) / 2);
                a.WriteLine(repl(" ", res) + chunks[i]);
            }
        }
        a.WriteLine("           " + hdfTemp.Get("_phone"));
        a.WriteLine("        " + hdfTemp.Get("_SerieM"));
        a.WriteLine("NRO. DOC: " + txtNumAtCard.GetText());
        a.WriteLine("FECHA: " + dteDocDate.GetText() + " " + Hour());
        a.WriteLine("CLIENTE: " + bteCardName.GetText());
        if (tdoc === "TF") {
            a.WriteLine("RUC: " + bteLicTradNum.GetText());
        }

        a.WriteLine((new Array(37)).join("-"));
        //DETAIL
        for (var i = 0; i < gdvinv1.GetVisibleRowsOnPage(); i++) {
            var _pricediscount = (" S/. " + parseFloat(gdvinv1.GetRow(i).cells[7].innerText.replace("S/. ", "").replace(",", "")).toFixed(2));
            var plg = _pricediscount.length;
            var val = "- " + gdvinv1.GetRow(i).cells[2].innerText + " " + gdvinv1.GetRow(i).cells[4].innerText + " " + gdvinv1.GetRow(i).cells[3].innerText;
            var ilg = (36 - plg);
            var ncad = val.insert(ilg, _pricediscount + "\n");
            a.WriteLine(ncad);
        }
        a.WriteLine((new Array(37)).join("-"));

        //FOOTER
        var val = (new Array(24)).join(" ") + "S/. " + txtLineSum.GetText();
        val = Right(val, 24);
        a.WriteLine("VALOR VENTA:" + val);

        if (txtDiscSum.GetText() !== "0") {
            val = (new Array(26)).join(" ") + "S/. " + txtDiscSum.GetText();
            val = Right(val, 26);
            a.WriteLine("VALOR DSC:" + val);
        }

        val = (new Array(26)).join(" ") + "S/. " + txtVatSum.GetText();
        val = Right(val, 26);
        a.WriteLine("VALOR IGV:" + val);

        val = (new Array(24)).join(" ") + "S/. " + txtDocTotal.GetText();
        val = Right(val, 24);
        a.WriteLine("TOTAL VENTA:" + val);

        a.WriteLine("     GRACIAS POR SU COMPRA...!!");

        a.Close();

        var WshShell = new ActiveXObject("WScript.Shell");
        var conbat = "C:\\ClientSide\\PrintTicket.bat"
        WshShell.Run(conbat);

    } catch (e) {
        alert(e.Message);
    }
}