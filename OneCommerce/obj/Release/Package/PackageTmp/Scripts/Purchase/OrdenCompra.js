var _vld = [8];
var codigo_cliente;
var checkcbbdoccur = false;
$(document).ready(function () {
    _vld[5] = hdfTemp.Get("_emid");
    _vld[6] = hdfTemp.Get("_soci");
    Get_InitialData();
    Set_MaintenanceStatus(true);
    
    //Get_InitialLugar();
    //gdvrdr1.SetClientVisible(false);
});
function CancelPrecio() {
    ppcPrecio.Hide();
}
function Show_PpcPrecio() {
    AddPrecio.SetText("0");
    ppcPrecio.Show();
}
function OkPrecio(s, e) {
    if(rbtnPrecio.GetValue() == "N"){
        var _pb = parseFloat(AddPrecio.GetValue());
    }
    else {
        var _pb = parseFloat(AddPrecio.GetValue()*0.82);
    }
    var _dc = parseFloat(txtDiscPrcnt.GetValue());
    var _pr = _pb - ((_pb * _dc) / 100.00);
    txtPriceBefDi.SetText(_pb);
    txtPrice.SetText(_pr);
    txtLineTotal.SetText(_pr * txtQuantity.GetValue());
    var _gt = ((_pr * txtQuantity.GetValue()) * ((parseFloat(18) * 0.01) + 1));
    txtGTotal.SetText(_gt);
    if (e.htmlEvent.keyCode === 13) {
        //alert("PRESIONASTE ENTER" + txtIssueMthd.GetText());
        gdvrdr1.PerformCallback("UPDTPRICE:" + _pb + ":" + _pr + ":" + (_pr * txtQuantity.GetValue()) + ":" + _gt + ":" + bteItemCode.GetText() + ":" + txtQuantity.GetValue());
        ppcPrecio.Hide();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }

}

function search_warehouse() {
    gdvProductSearch.PerformCallback("BUSCAR");
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
function fincallback(s, e) {
    alert(e.result);
}
function EndClientSearch() {
    gdvWhsCodeSearch.SetFocusedRowIndex(0);
    //gdvWhsCodeSearch.UpdatePosition();
}
function Cal_PriceUpdate(s, e) {
    var _pb = parseFloat(txtPriceBefDi.GetValue());
    var _dc = parseFloat(txtDiscPrcnt.GetValue());
    var _pr = _pb - ((_pb * _dc) / 100.00);
    txtPrice.SetText(_pr);
    txtLineTotal.SetText(_pr * txtQuantity.GetValue());
    var _gt = ((_pr * txtQuantity.GetValue()) * ((parseFloat(18) * 0.01) + 1));
    txtGTotal.SetText(_gt);
    if (e.htmlEvent.keyCode === 13) {
        //alert("PRESIONASTE ENTER" + txtIssueMthd.GetText());
        gdvrdr1.PerformCallback("UPDTPRICE:" + _pb + ":" + _pr + ":" + (_pr * txtQuantity.GetValue()) + ":" + _gt + ":" + bteItemCode.GetText() + ":" + txtQuantity.GetValue());
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function cambio_moneda() {

    hdfTemp.Set("Currency", cbbDocCur.GetValue());
    checkcbbdoccur = true;
    //cbbDocCur.SetValue("SOL");
    cbbDocCur.SetEnabled(true);
    //cbbGroupNum.SetValue("");
    //cbeSalesPerson.SetText("");
    //cbeOwnerCode.SetValue(_vld[5]);
    //cbbListNum.SetValue(_vld[7]);
    //txtCardCode.SetText("");
    //bteCardName.SetText("");
    txtDocEntry.SetText("");
    txtDocNum.SetText("");
    txtNumAtCard.SetText("");
    txtDocStatus.SetText("Abierto");
    //txtShipToCode.SetText("");
    //bteShipToCode.SetText("");
    dteDocDate.SetDate(new Date());
    //txtBillToCode.SetText("");
    //bteBillToCode.SetText("");

    txtLineSum.SetText("0");
    txtDiscPrcntTotal.SetText("0");
    txtDiscSum.SetText("0");
    mmoComment.SetText("");
    txtVatSum.SetText("0");
    txtDocTotal.SetText("0");
    hdfTemp.Set("_ubig", "");
    hdfTemp.Set("_movi", "0");
    hdfTemp.Set("_dtbel", "0");
    hdfTemp.Set("_client", "");
    Set_ConfigDateTime();
    mnuOper.GetItemByName("Save").SetText("Crear");
    gdvrdr1.PerformCallback("CLR");
    gdvProductSearch.PerformCallback("CLEAR");
    EnabledControl(true);
    Set_MaintenanceStatus(true);
    //alert("cambio" + cbbDocCur.GetValue());
    //hdfTemp.PerformCallback(cbbDocCur.GetValue());
    //txtDocCUR.SetText(cbbDocCur.GetValue().toString());




    //alert("cambio");
    //cbbDocCur.PerformCallback();
    //gdvrdr1.GetColumnById("txtQuantity");
    //if (cbbDocCur.GetValue() === "SOL") {
    //    //alert("SOL");
    //    txtLineSum.format("S/.{0}");
    //}
    //else if (cbbDocCur.GetValue() === "USD") {
    //    //alert("USD");
    //    txtLineSum.format("USD{0}");
    //}
}
Date.prototype.addDays = function (days) {
    this.setDate(this.getDate() + days);
    return this;
};
function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
function roundNumber(number, digits) {
    var multiple = Math.pow(10, digits);
    var rndedNum = Math.round(number * multiple) / multiple;
    return rndedNum;
}
function Key_direcdoc(s, e) {
    var _crd = "";
    if (rbttipovilla.GetValue() === 'NF') {
        _crd = "No Figura Dirección";
        txtnombredirec.SetText(_crd);
    }
    else {
        _crd = rbttipovilla.GetValue() + ' ' + txtnombredirec.GetText().toUpperCase() + ' ' + cbodistrito.GetText() + '-' + cbodepartamento.GetText();
    }
    txtU_BIZ_DIRE_MED.SetText(_crd);
}
function Get_InitialLugar() {
    var jose;
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Sales/Oferta.aspx/Get_Dat_prov",
        data: '{"socied":"' + socied + '"}',
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            Set_Lugar(result);
            _dcs = [];
            $.each(result.d, function (i, item) {
                var obj = new Array(item.U_BIZ_CODE, item.U_BIZ_NODE, item.Code, item.Dfault);
                _dcs.push(obj);
                if (item.Dfault === 1) {
                    jose = item.U_BIZ_CODE;
                }
            });
            Set_Lugar_Prov();
        },
        error: function (result) {
            alert(result);
        }
    });
}
function Set_Lugar(result) {
    //Lista de Lugar
    //var jose;
    //var _rs = result.d.where(function (item) { return (item.Code === "dep"); });
    //cbodepartamento.ClearItems();
    //cbodepartamento.BeginUpdate();
    //$.each(_rs, function (index, item) {
    //    cbodepartamento.InsertItem(index, item.U_BIZ_NODE, item.U_BIZ_CODE);
    //    if (item.Dfault === 1) {
    //        jose = item.U_BIZ_CODE;
    //    }
    //});
    //cbodepartamento.EndUpdate();
    //cbodepartamento.SetValue(jose);
}
function Set_Lugar_Prov() {
    //var _tdc = cbodepartamento.GetValue();
    //var _ser = $.grep(_dcs, function (item, i) {
    //    return (item[2] === _tdc);
    //});
    //cboprovincia.BeginUpdate();
    //cboprovincia.ClearItems();
    //$.each(_ser, function (index, item) {
    //    cboprovincia.InsertItem(index, item[1], item[0]);
    //});
    //cboprovincia.EndUpdate();
    //cboprovincia.SetSelectedIndex(0);
    //Set_Lugar_Disti();
}
function Set_Lugar_Disti() {

    var socied = hdfTemp.Get("_soci");
    var provs = cboprovincia.GetValue();
    $.ajax(
    {
        type: "POST",
        url: "../Sales/Oferta.aspx/Get_InitialDistri",
        data: '{"socied":"' + socied + '", "prov":"' + provs + '"}',
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            insert_distrito(result);
        },
        error: function (result) {
            alert(result);
        }
    });
}
function insert_distrito(result) {
    var _rs = result.d.where(function (item) { return (item.tots === "tot"); });
    cbodistrito.ClearItems();
    cbodistrito.BeginUpdate();
    $.each(_rs, function (index, item) {
        cbodistrito.InsertItem(index, item.U_BIZ_NODE, item.U_BIZ_CODE); 
    });
    cbodistrito.EndUpdate();
    cbodistrito.SetSelectedIndex(0);
}
function Set_MaintenanceStatus(enb) {

    cbbDocCur.SetEnabled(true);
    mnuOper.GetItemByName("Quote").SetVisible(true);
    mnuOper.GetItemByName("OrderFrom").SetVisible(false);
    mnuOper.GetItemByName("DeliveryFrom").SetVisible(false);


    mnuOper.GetItemByName("PaymentIn").SetVisible(false);
    mnuOper.GetItemByName("CopyFrom").SetVisible(true);
    mnuOper.GetItemByName("CopyTo").SetEnabled(false);
    mnuOper.GetItemByName("OrderFrom").SetVisible(false);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetVisible(false);
    mnuOper.GetItemByName("Print").SetVisible(true);
    mnuOper.GetItemByName("Cancel").SetEnabled(false);
    mnuOper.GetItemByName("Recursos").SetVisible(false);
    //mnuOper.GetItemByName("Ticket").SetVisible(false);
    //mnuOper.GetItemByName("TicketBill").SetVisible(false);

    mnuOper.GetItemByName("Save").SetEnabled(enb);
    //if (_vld[6] === "DX") {
        mnuOper.GetItemByName("CopyFrom").SetEnabled(enb);
    //}
    //else {
        mnuOper.GetItemByName("CopyFrom").SetVisible(false);
//        bteU_BF_NumOV.SetEnabled(false);
    //}
    if (txtDocStatus.GetText() === "Abierto" && txtDocEntry.GetText() !== "") {
        mnuOper.GetItemByName("Cancel").SetEnabled(true);
    }
    if (!isNullOrWhiteSpace(txtDocEntry.GetText())) {
        mnuOper.GetItemByName("Print").SetEnabled(true);
    }
}

//DATOS INICIALES
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Purchase/CompraOrdenVenta.aspx/Get_InitialData",
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
//MOVILIDAD BELMAY
function Get_Movi() {
    var DocNumBel = bteU_BF_NumOV.GetText();
    if (isNullOrWhiteSpace(DocNumBel)) {
        alert("Ingrese nro. de orden .");
        bteU_BF_NumOV.Focus();
    }
    else {
        var socied = hdfTemp.Get("_soci");
        $.ajax(
        {
            type: "POST",
            url: "../Sales/Oferta.aspx/Get_Movi",
            data: '{"socied":"' + socied + '", "DocNumBel":"' + DocNumBel + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                var resd = result.d.split(";");
                hdfTemp.Set("_dtbel", resd[1]);
                if (resd[0] === "S") {
                    hdfTemp.Set("_dtbel", "0");
                    //chkAutExpens.SetChecked(false);
                    //txtTotalExpns.SetText("0");
                    Set_SubTotal();
                }
                gdvrdr1.UpdateEdit();               
            },
            error: function (result) {
                alert(result);
            }
        });
    }
}
// INICIALIZA DATOS BASICOS PARA LA ORDEN DE VENTA
function Set_InitialData(result) {
    cbeOwnerCode.SetEnabled(false);
    //txtQuantityKit.SetVisible(false);
    //tetU_BF_HCFI.SetEnabled(false);

    /*txtConsigDni.SetEnabled(false);
    txtU_BIZ_SOLI.SetEnabled(false);
    txtConsigCity.SetEnabled(false);
    
    bteU_BIZ_MEDI.SetEnabled(false);
    txtU_BIZ_COLE.SetEnabled(false);
    txtU_BIZ_ESPE.SetEnabled(false);
    txtU_BIZ_DIRE_MED.SetEnabled(false);
    txtU_BF_CREDBM.SetText("0");*/
    gdvrdr1.PerformCallback("CLR");

    /*if (hdfTemp.Get("_perm") !== "001") {
        chkPromotion.SetChecked(false);
        chkPromotion.SetEnabled(false);
    }*/

    var _rs = result.d.where(function (item) { return (item.Ident === "IGV"); });
    _rs.forEach(function (item) {
        var mgc = roundNumber(parseFloat(item.Name), 2);
        _vld[0] = mgc;
    });

    /*_rs = result.d.where(function (item) { return (item.Ident === "LE"); });
    cbbU_BIZ_LUEN.BeginUpdate();
    cbbU_BIZ_LUEN.ClearItems();
    _rs.forEach(function (item) {
        cbbU_BIZ_LUEN.AddItem(item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[1] = item.Code;
        }
    });    
    cbbU_BIZ_LUEN.EndUpdate();
    cbbU_BIZ_LUEN.SetValue(_vld[1]);*/

    //_rs = result.d.where(function (item) { return (item.Ident === "HE"); });
    //cbbU_BF_HOEN.BeginUpdate();
    //cbbU_BF_HOEN.ClearItems();
    //_rs.forEach(function (item) {
    //    cbbU_BF_HOEN.AddItem(item.Name, item.Code);
    //    if (item.Dfault === 1) {
    //        _vld[2] = item.Code;
    //    }
    //});
    //cbbU_BF_HOEN.EndUpdate();
    //cbbU_BF_HOEN.SetValue(_vld[2]);
    
    _rs = result.d.where(function (item) { return (item.Ident === "CP"); });
    cbbGroupNum.BeginUpdate();
    cbbGroupNum.ClearItems();
    _rs.forEach(function (item) {
        cbbGroupNum.AddItem(item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[3] = item.Code;
        }
    });


    cbbGroupNum.EndUpdate();
    cbbGroupNum.SetValue(_vld[3]);

    _rs = result.d.where(function (item) { return (item.Ident === "VR"); });
    //cbeSalesPerson.ClearItems();
    cbeOwnerCode.ClearItems();
    //cbeSalesPerson.BeginUpdate();
    cbeOwnerCode.BeginUpdate();
    $.each(_rs, function (index, item) {
        // cbeSalesPerson.InsertItem(index, item.Name, item.Code);
        cbeOwnerCode.InsertItem(index, item.Name, item.empID);
        if (item.Dfault === 1) {
            _vld[5] = item.Code;
        }
    });

    //cbeSalesPerson.EndUpdate();
    cbeOwnerCode.EndUpdate();
    //cbeSalesPerson.SetValue(_vld[2]);
    cbeOwnerCode.SetValue(_vld[5]);

    //OLE
    _rs = result.d.where(function (item) { return (item.Ident === "RE"); });
    cbeSalesPerson.ClearItems();
    cbeSalesPerson.BeginUpdate();

    $.each(_rs, function (index, item) {
        cbeSalesPerson.InsertItem(index, item.Name, item.Code);

        if (item.Dfault === 1) {
            _vld[4] = item.Code;
        }
    });

    cbeSalesPerson.EndUpdate();
    cbeSalesPerson.SetValue(_vld[4]);

    cbbListNum.BeginUpdate();
    cbbListNum.ClearItems();
    cbbListNum.AddItem("Ultimo Precio Compra", 1);
    cbbListNum.SetValue(1);
    cbbListNum.EndUpdate();

    var _rs2 = result.d.where(function (item) { return (item.Ident === "WH"); });
    cbbWareHouse.BeginUpdate();
    cbbWareHouse.ClearItems();
    _rs2.forEach(function (item) {
        cbbWareHouse.AddItem(item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[3] = item.Code;
        }
    });
    cbbWareHouse.EndUpdate();

    //txtDocCUR.SetText("SOL");
    Set_ConfigDateTime();
    cbbWareHouse.SetSelectedIndex(0);
}
// ASIGNA FECHA Y HORA DE ENTREGA
function Set_ConfigDateTime() {
    dteDocDate.SetDate(new Date());
    dteDocDueDate.SetDate(new Date());
    var currDate = new Date();
    var ha = parseInt(currDate.getHours().toString() + currDate.getMinutes().toString());
    //if (_vld[6] === "DX") {
        //dteDocDueDate.SetDate(currDate.addDays(1));
        //var he = (ha <= 1300) ? "02" : "01";
        //cbbU_BF_HOEN.SetValue(he);
    //}
    /*else {        
        var he = (ha <= 1300) ? "01" : "02";
        cbbU_BF_HOEN.SetValue(he);
        if (ha > 1300) {
            dteDocDueDate.SetDate(currDate.addDays(1));
        }
    }*/
}
// BUSCAR CLIENTE
function ShowClientSearch() {
    ppcClientSearch.Show();
}
function Get_Client(s, e) {
    gdvClientSearch.SetFocusedRowIndex(-1);
    gdvClientSearch.PerformCallback();
    if (e.htmlEvent.keyCode === 13) {
        gdvClientSearch.SetFocusedRowIndex(0);
        OkClient();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
    //gdvClientSearch.Focus();
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
        gdvClientSearch.GetRowValues(gdvClientSearch.GetFocusedRowIndex(), "CardCode;CardName;LicTradNum;ShipToDef;ShipStreet;BillToDef;BillStreet;Doctor;Credit;SlpCode;empID;U_DXP_BIZ_MOV;U_DXP_BIZ_CODI;GenDoc;GroupNum;ListNum", OnGetRowValuesClient);
    }
}
function OnGetRowValuesClient(values) {
    txtCardCode.SetText(values[0]);
    if (values[13] === "01") {
        bteCardName.SetText(values[1]);
    } else {
        bteCardName.SetText(values[1]);
    }  
    txtShipToCode.SetText(values[3]);
    bteShipToCode.SetText(values[4]);
    txtBillToCode.SetText(values[5]);
    bteBillToCode.SetText(values[6]);
    /*if (_vld[6] === "BT") {
        var medi = values[7].split("!");
        if (medi.length > 0) {
            var _med = medi[0].split("?");
            bteU_BIZ_MEDI.SetText(_med[0]);
            txtU_BIZ_COLE.SetText(_med[1]);
            txtU_BIZ_ESPE.SetText(_med[2]);
            txtU_BIZ_DIRE_MED.SetText(_med[3]);
        }
        txtU_BF_CREDBM.SetText(values[8]);
    }
    else {
        txtU_BF_CREDBM.SetText("0");
    }*/
    if (values[9] != -1){
    cbeSalesPerson.SetValue(values[9]);}
    //cbeOwnerCode.SetValue(values[10]);
    hdfTemp.Set("_ubig", values[12]);
    hdfTemp.Set("_movi", values[11]);
    hdfTemp.Set("_dtbel", "0");
    hdfTemp.Set("_client", values[1]);
    //cbbU_BIZ_DOCG.SetValue(values[13]);
    cbbGroupNum.SetValue(values[14]);
    //cbbListNum.SetValue(values[15]);
    bteShipToCode.GetButton(0).style.display = "none";
    bteBillToCode.GetButton(0).style.display = "none";
    //bteU_BIZ_MEDI.GetButton(0).style.display = "none";
    codigo_cliente = values[0];
    gdvAddress.PerformCallback("INICIAR:" + values[0]);
    cbbPersonContact.PerformCallback("INICIAR:" + values[0]);
    /*if (_vld[6] === "BT") {
        gdvDoctor.PerformCallback(values[7]);
    }*/
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
// DIRECCIONES DEL CLIENTE SELECIONADO
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
function Ena_Consig() {
    txtConsigDni.SetText("");
    txtU_BIZ_SOLI.SetText("");
    txtConsigCity.SetText("");

//    if (cbbU_BIZ_LUEN.GetText() === "Provincia") {
//        txtConsigDni.SetEnabled(true);
//        txtU_BIZ_SOLI.SetEnabled(true);
//        txtConsigCity.SetEnabled(true);
//    }
//    else {
//        txtConsigDni.SetEnabled(false);
//        txtU_BIZ_SOLI.SetEnabled(false);
//        txtConsigCity.SetEnabled(false);
//    }
    gdvrdr1.UpdateEdit();
}
// HORA CITA FIJA
//function Ena_DeliveryHour() {
//    if (cbbU_BF_HOEN.GetValue() === "03") {
//        tetU_BF_HCFI.SetEnabled(true);
//        tetU_BF_HCFI.Focus();
//        tetU_BF_HCFI.SelectAll();
//    }
//    else {
//        tetU_BF_HCFI.SetEnabled(false);
//    }
//}
// MEDICOS
function Show_Doctor() {
    ppcDoctor.Show();
}
function End_DocCallback() {
    bteU_BIZ_MEDI.GetButton(0).style.display = "";
}
function OnGetRowValuesDoctor(values) {
    txtU_BIZ_COLE.SetText(values[0]);
    bteU_BIZ_MEDI.SetText(values[1]);
    txtU_BIZ_ESPE.SetText(values[2]);
    txtU_BIZ_DIRE_MED.SetText(values[3]);
}
function OkDoctor() {
    var rowc = gdvDoctor.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvDoctor.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvDoctor.GetRowValues(gdvDoctor.GetFocusedRowIndex(), "U_BIZ_COLE;U_BIZ_MEDI;U_BIZ_ESPE;U_BIZ_DIRE_MED", OnGetRowValuesDoctor);
        ppcDoctor.Hide();
    }
}
function CancelDoctor() {
    ppcDoctor.Hide();
}
// BUSCAR PRODUCTOS 
function Show_ProductSearch() {
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
        //chkKit.SetChecked(false);
        //ppcQKit.Show();
        //txtQKit.SetText("1");
        //txtQKit.Focus();
        //txtQKit.SelectAll();
    }
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
            var project = hdfTemp.Get("_proj");

            gdvrdr1.PerformCallback("ADDPRODUCT:" + itemcode + ":" + pricelist);

            //$.ajax(
            //{
            //    type: "POST",
            //    url: "../Sales/Oferta.aspx/Get_OneProduct",
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
function Exi_Product(itemcode) {
    var _ext = false;
    for (var i = 0; i < gdvrdr1.GetVisibleRowsOnPage(); i++) {
        var _eit = gdvrdr1.GetRow(i).cells[2].innerText;
        var _kit = gdvrdr1.GetRow(i).cells[19].innerText;
        if (_eit === itemcode && isNullOrWhiteSpace(_kit)) {
            _ext = true;
            break;
        }
    }
    return (_ext);
}
function ClearControlsLine() {
    bteItemName.SetText("");
    txtQuantity.SetText("0");
    txtPriceBefDi.SetText("0");
    txtDiscPrcnt.SetText("0");
    txtPrice.SetText("0");
    txtLineTotal.SetText("0");
    txtGTotal.SetText("0");
    //txtU_StoDiBE.SetText("0");
    //txtU_BF_StoDiYo.SetText("0");
    //txtBL050.SetText("0");
    //txtBL010.SetText("0");
    //txtU_U_BF_CompTot.SetText("0");
    //txtU_BIZ_DREC.SetText("");
    //txtU_BIZ_CANT.SetText("");
    //txtU_BIZ_FFAR.SetText("");
    //txtU_BF_FECH_EXPE.SetText("");
    //txtU_BF_FECH_VENC.SetText("");
    //txtU_BF_CodKit.SetText("");
    //txtOItemCode.SetText("");
    //txtOnDscOrg.SetText("0");
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
        //txtU_StoDiBE.SetText(item.U_StoDiBE);
        //txtU_BF_StoDiYo.SetText(item.U_BF_StoDiYo);
        //txtBL050.SetText(item.BL050);
        //txtBL010.SetText(item.BL010);
        //txtU_U_BF_CompTot.SetText(item.U_U_BF_CompTot);
        //txtU_BIZ_DREC.SetText(item.ItemName);
        //txtU_BF_CodKit.SetText(item.U_BF_CodKit);
        //txtU_BIZ_CANT.SetText(item.U_BIZ_CAPC);
        //txtU_BIZ_FFAR.SetText(item.U_BIZ_FOFA);
        //txtOItemCode.SetText(item.ItemCode);
        //txtOnDscOrg.SetText(item.DiscPrcnt.toString());
        txtQuantity.Focus();
        txtQuantity.SelectAll();
    });
}
function Cal_LineTotals(s, e) {
    var _qt = parseInt(txtQuantity.GetValue());
    var _pr = parseFloat(alphanumeric(txtPrice.GetValue()));
    var _cd = bteItemCode.GetText();
    var _lt = (_qt * _pr);
    txtLineTotal.SetText(_lt);
    var _gt = (_lt * ((parseFloat(_vld[0]) * 0.01) + 1));
    txtGTotal.SetText(_gt);
    if (e.htmlEvent.keyCode === 13) {
        //alert("PRESIONASTE ENTER" + txtIssueMthd.GetText());
        gdvrdr1.PerformCallback("QTY:" + _qt + ":" + _cd);
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Cal_LineDescTotals() {
    //txtOnDscOrg.SetText(txtDiscPrcnt.GetText());
    var _pb = parseFloat(txtPriceBefDi.GetValue());
    var _dc = parseFloat(txtDiscPrcnt.GetValue());
    var _pr = _pb - ((_pb * _dc) / 100.00);
    txtPrice.SetText(_pr);
    Cal_LineTotals();
}
function Get_Product(s, e) {
    //gdvProductSearch.SetFocusedRowIndex(-1);
    if (hdfTemp.Get("Rate") === 0) {
        alert("Ingresar Tipo de Cambio, No podrá Buscar Productos");
    }
    else {
        gdvProductSearch.PerformCallback("BUSCAR");
        if (e.htmlEvent.keyCode === 13) {
            gdvProductSearch.SetFocusedRowIndex(0);
            OkProduct();
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
        }
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
        gdvProductSearch.GetRowValues(gdvProductSearch.GetFocusedRowIndex(), "ItemCode;ItemName;OnHand;PriceBefDi;DiscPrcnt;Price;PriceVat;NumInBuy;IssueMthd;ActivoC;ActivoS;LastPurCur", OnGetRowValuesProduct);
    }
}
function OnGetRowValuesProduct(values) {
    //if (isNullOrWhiteSpace(values[7])) {
    //    bteItemCode.SetText(values[0]);
    //    bteItemName.SetText(values[1]);
    //    txtPriceBefDi.SetText(values[3]);
    //    txtQuantity.SetText("1");
    //    txtDiscPrcnt.SetText(values[4].toString());
    //    txtPrice.SetText(values[5]);
    //    txtLineTotal.SetText(values[5]);
    //    txtGTotal.SetText(values[6]);
    //    txtIssueMthd.SetText(values[8]);
        //txtU_StoDiBE.SetText(values[10]);
        //txtU_BF_StoDiYo.SetText(values[11]);
        //txtBL050.SetText(values[12]);
        //txtBL010.SetText(values[13]);
        //txtU_U_BF_CompTot.SetText(values[14]);
        //txtU_BIZ_DREC.SetText(values[1]);
        //txtU_BF_CodKit.SetText(values[7]);
        //txtU_BIZ_CANT.SetText(values[8]);
        //txtU_BIZ_FFAR.SetText(values[9]);
        //txtOItemCode.SetText(values[0]);
        //txtOnDscOrg.SetText(values[4].toString());

        /**/

        txtQuantity.Focus();
        txtQuantity.SelectAll();
        //gdvProductSearch.SetFocusedRowIndex(-1);
        var pricelist = cbbListNum.GetValue();
        gdvrdr1.PerformCallback("LM:" + values + ":" + pricelist);
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
    //            gdvrdr1.PerformCallback("QK:" + values[7]);
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
    //gdvProductSearch.SetFocusedRowIndex(0);
    //ppcProductSearch.UpdatePosition();
}
function Set_Kit(s) {
    txtQuantityKit.SetVisible(s.GetChecked());
    txtQuantityKit.SetText("1");
    txtQuantityKit.Focus();
    txtQuantityKit.SelectAll();
}
function alphanumeric(inputtxt) {
    var lgnt = inputtxt.length;
    var rslt = ""
    for (var i = 0; i < lgnt; i++) {
        if ((inputtxt.charAt(i).match(/^[0-9]+$/) || inputtxt.charAt(i) == ".") && (cbbDocCur.GetValue().toString() === "USD" || cbbDocCur.GetValue().toString() === "SOL")) {
            rslt += inputtxt.charAt(i);
        }
        else if ((inputtxt.charAt(i).match(/^[0-9]+$/) || inputtxt.charAt(i) == ",") && cbbDocCur.GetValue().toString() === "EUR") {
            if (inputtxt.charAt(i) == ",") {
                rslt += ".";
            }
            else rslt += inputtxt.charAt(i);
        }
    }
    return rslt;
}
function End_CallbackLines(s, e) {
    Set_SubTotal();
    
}
function Set_SubTotal() {
    var _sbt = parseFloat(gdvrdr1.cpSubTotal);
    if (cbbDocCur.GetValue().toString() === "USD") {
        txtLineSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_sbt));
    }
    else if (cbbDocCur.GetValue().toString() === "EUR") {
        txtLineSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_sbt));
    }
    else {
        txtLineSum.SetText(_sbt);
    }
    Get_Totals();
}
function Get_Totals() {
    var _sbt = alphanumeric(txtLineSum.GetText());
    if (cbbDocCur.GetValue().toString() == "USD") {
        var _dst = parseFloat(alphanumeric(txtDiscSum.GetText()));
    }
    else {
        var _dst = parseFloat(alphanumeric(txtDiscSum.GetValue()));
    }
    //alert(_dst);
    var _sid = (_sbt - _dst);
    var _sdt = _sid;
    var _imp = ((_sdt * parseFloat(18)) / 100);
    var _tot = (_sdt + parseFloat(_imp));

    //alert(txtLineSum.GetValue()+":"+_sbt + ":" + _dst + ":" + _sid + ":" + _imp + ":" + _tot + ":" + txtDiscSum.GetValue());

    if (cbbDocCur.GetValue().toString() == "USD") {
        txtVatSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_imp));
        txtDocTotal.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_tot));
        txtDiscSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_dst));
    }
    else if (cbbDocCur.GetValue().toString() == "EUR") {
        txtVatSum.SetText(new Intl.NumberFormat("de-DE", {style: "currency", currency: "EUR"}).format(_imp));
        txtDocTotal.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_tot));
        txtDiscSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_dst));
    }
    else {
        txtVatSum.SetText(_imp.toString());
        txtDocTotal.SetText(_tot.toString());
    }
}
function Set_Discount(s, e) {
    var _sbt = parseFloat(alphanumeric(txtLineSum.GetText()));
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
    Get_Totals();
}
function Set_TotalExpns(s, e) {
    var _sbt = parseFloat(alphanumeric(txtLineSum.GetText()));
    var _dst = parseFloat(alphanumeric(txtDiscSum.GetText()));
    var _sid = (_sbt - _dst);
    var _sdt = _sid;
    var _imp = ((_sdt * parseFloat(_vld[0])) / 100);
    var _tot = (_sdt + parseFloat(_imp));
    if (cbbDocCur.GetValue().toString() == "USD") {
        txtVatSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_imp));
        txtDocTotal.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_tot));
        txtDiscSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(_dst));
    }
    else if (cbbDocCur.GetValue().toString() == "EUR") {
        txtVatSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_imp));
        txtDocTotal.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_tot));
        txtDiscSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(_dst));
    }
    else {
        txtVatSum.SetText(_imp);
        txtDocTotal.SetText(_tot);
    }
}

function Add_Kits() {
    var _qtk = parseInt(txtQKit.GetValue());
    if (_qtk === 0) {
        alert("Ingrese cantidad mayor a 0.");
    }
    else {
        var itemcode = bteItemCode.GetText();
        gdvrdr1.PerformCallback("QK:" + itemcode);
        ppcQKit.Hide();
    }
}
// SELECCIONA EL CONTENIDO DEL CONTROL
function Sel_txtObject(s,e) {
    s.SelectAll();
}
// AUTOMATIZACION DE MOVILIDAD
function Set_CheckedExpens(s,e) {
    if (!s.GetChecked()) {
        //txtTotalExpns.SetText("0");
        Get_Totals();
    }
}
// CALCULANDO MOVILIDAD
function Set_CalcMovility() {
    gdvrdr1.UpdateEdit();
}
// NUEVO
function ClearControl() {
    //cbbU_BIZ_LUEN.SetValue(_vld[1]);
    //cbbU_BF_HOEN.SetValue(_vld[2]);
    //cbbDocCur.SetValue("SOL");
    cbbDocCur.SetEnabled(true);
    cbbGroupNum.SetValue("");
    cbeSalesPerson.SetText("");
    //cbeOwnerCode.SetValue(_vld[5]);
    //cbbListNum.SetValue(_vld[7]);
    txtCardCode.SetText("");
    bteCardName.SetText("");
    txtDocEntry.SetText("");
    txtDocNum.SetText("");
    txtNumAtCard.SetText("");
    txtDocStatus.SetText("Abierto");
    txtShipToCode.SetText("");
    bteShipToCode.SetText("");
    dteDocDate.SetDate(new Date());
    txtBillToCode.SetText("");
    bteBillToCode.SetText("");
    cbbPersonContact.SetText("");
//    bteU_BF_NumOV.SetText("");
    //cbbU_BIZ_CONTA.SetSelectedIndex(1);
    //tetU_BF_HCFI.SetText("12:00 a.m.");
    //cbbU_BIZ_TPDO.SetSelectedIndex(0);
    //txtU_BF_CREDBM.SetText("0");
    //cbbU_BIZ_DOCG.SetSelectedIndex(0);
    //txtU_BF_PickRmrk.SetText("");
    //txtDocTime.SetText("");
//    bteU_BIZ_MEDI.SetText("");
//    txtU_BIZ_ESPE.SetText("");
//    txtU_BIZ_COLE.SetText("");
//    txtU_BIZ_DIRE_MED.SetText("");
    txtLineSum.SetText("0");
    txtDiscPrcntTotal.SetText("0");
    txtDiscSum.SetText("0");
    mmoComment.SetText("");
//    txtConsigDni.SetText("");
//    txtU_BIZ_SOLI.SetText("");
//    txtConsigCity.SetText("");
    //chkAutExpens.SetChecked(true);
//    chkPromotion.SetChecked(true);
//    chkPromotion.SetEnabled(true);
    //txtTotalExpns.SetText("0");
    txtVatSum.SetText("0");
    txtDocTotal.SetText("0");
    hdfTemp.Set("_ubig", "");
    hdfTemp.Set("_movi", "0");
    hdfTemp.Set("_dtbel", "0");
    hdfTemp.Set("_client", "");
    Set_ConfigDateTime();
    mnuOper.GetItemByName("Save").SetText("Crear");
    gdvrdr1.PerformCallback("CLR");
    EnabledControl(true);
    Set_MaintenanceStatus(true);
}
// HABILITAR LOS CONTROLES
function EnabledControl(enb) {
    //cbbU_BIZ_LUEN.SetEnabled(enb);
    //cbbU_BF_HOEN.SetEnabled(enb);
    cbbGroupNum.SetEnabled(enb);
    cbeSalesPerson.SetEnabled(enb);
    //cbeOwnerCode.SetEnabled(enb);
    cbbListNum.SetEnabled(enb);
    bteCardName.SetEnabled(enb);
    txtDocEntry.SetEnabled(enb);
    txtDocNum.SetEnabled(enb);
    txtNumAtCard.SetEnabled(enb);
    txtShipToCode.SetEnabled(enb);
    bteShipToCode.SetEnabled(enb);
    dteDocDate.SetEnabled(enb);
    dteDocDueDate.SetEnabled(enb);
    txtBillToCode.SetEnabled(enb);
    bteBillToCode.SetEnabled(enb);
    //tetU_BF_HCFI.SetEnabled(false);
    //if (_vld[6] === "DX") {
//        bteU_BF_NumOV.SetEnabled(false);
    /*}
    else {
        bteU_BF_NumOV.SetEnabled(enb);
    }*/
    //cbbU_BIZ_CONTA.SetEnabled(enb);
    //cbbU_BIZ_TPDO.SetEnabled(enb);
    //cbbU_BIZ_DOCG.SetEnabled(enb);
    mmoComment.SetEnabled(enb);
    //chkAutExpens.SetEnabled(enb);
    txtDiscSum.SetEnabled(enb);
    //txtTotalExpns.SetEnabled(enb);
    //bteU_BIZ_MEDI.SetEnabled(enb);
    //txtU_BIZ_ESPE.SetEnabled(enb);
    //txtU_BIZ_COLE.SetEnabled(enb);
    //txtU_BIZ_DIRE_MED.SetEnabled(enb);
    txtDiscPrcntTotal.SetEnabled(enb);

    //txtConsigDni.SetEnabled(false);
    //txtU_BIZ_SOLI.SetEnabled(false);
    //txtConsigCity.SetEnabled(false);

    //rbttipovilla.SetEnabled(enb);
    //txtnombredirec.SetEnabled(enb);
    //cbodepartamento.SetEnabled(enb);
    //cboprovincia.SetEnabled(enb);
    //cbodistrito.SetEnabled(enb);

    ASPxClientUtils.SetCookie("theme", hdfTemp.Get("theme"));
}
// OPERACIONES
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save" && e.item.GetText() === "Crear") {
        var cont = cbbGroupNum.GetText();
        var porcion = cont.substring(0, 7);
        if (cbeSalesPerson.GetText() == "") {
            alert("¡Ingresar Encargado de Compras!");
        }
        else if (txtDocTotal.GetText() == "0") {
            alert("¡Total de Documento no puede ser Cero!");
        }
        else if (porcion != "Contado") {
                if (confirm('Es correcto la Condición de pago ' + cont.toUpperCase())) {
                    Save();
                }
        } else {
            Save();
        }
    }
    // MODIFICAR
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
                var cont = cbbGroupNum.GetText();
                var porcion = cont.substring(0, 7);
                if (cbeSalesPerson.GetText() == "") {
                    alert("¡Ingresar Encargado de Compras!");
                }
                else if (txtDocTotal.GetText() == "0") {
                    alert("¡Total de Documento no puede ser Cero!");
                }
                else if (porcion != "Contado") {
                    if (confirm('Es correcto la Condición de pago ' + cont.toUpperCase())) {
                        Modify();
                    }
                } else {
                    Modify();
                }
    }
    // NUEVO
    else if (e.item.name === "New") {
        ClearControl();
    }
    // BUSCAR
    else if (e.item.name === "Search") {
        ShowOrderSearch();
    }
    // OFERTA DE VENTA
    else if (e.item.name === "Quote") {
        ShowOqutSearch();
    }
    // CANCELAR
    else if (e.item.name === "Cancel") {
        Cancel();
    }
    // IMPRIMIR
    else if (e.item.name === "Print") {
        ldpProcess.SetText("Procesando, espere por favor...");
        ldpProcess.Show();
        clbOperation.PerformCallback("Print");
    }
    
    // EXPORTAR
    else if (e.item.name === "Export") {
        var rdr1 = gdvrdr1.GetVisibleRowsOnPage();
        if (rdr1 === 0) {
            _sw = false;
            alert("ingresar al menos un artículo.");
        }
        else if (gdvrdr1.IsEditing()) {
            _sw = false;
            alert("Actualizar o cancelar la fila en edición.");
        }
        else {
            ExToExcel();
        }
    }
}
function recorrer_grilla() {
    var valida = "";
    var name = "";
    var rp = "";
    for (var i = 0; i < gdvrdr1.GetVisibleRowsOnPage(); i++) {
        name = gdvrdr1.GetRow(i).cells[2].innerText;
        if (name === '60100000') { 
            rp = '60100000'
        }
    }
    if (rp === '60100000') {
        if (txtU_BIZ_DIRE_MED.GetText() === "") {
            valida = "1";
        }
    }
    return valida;
}

// EXPORTAR A EXCEL
function ExToExcel() {
    var html = "<table border='1' rules='rows' cellspacing='0'>";
    html = html + "<tr>";
    html = html + "<th>Linea</th><th>Codigo</th><th>Descripcion</th><th>Cantidad</th><th>Precio Unitario</th><th>Descuento</th><th>KIT</th>";
    html = html + "</tr>";
    for (var i = 0; i < gdvrdr1.GetVisibleRowsOnPage(); i++) {
        html = html + "<tr>";
        var vals = gdvrdr1.GetRow(i).cells[1].innerText;
        html = html + "<td>" + vals + "</td>";
        vals = gdvrdr1.GetRow(i).cells[2].innerText;
        html = html + "<td>" + vals + "</td>";
        vals = gdvrdr1.GetRow(i).cells[3].innerText;
        html = html + "<td>" + vals + "</td>";
        vals = gdvrdr1.GetRow(i).cells[4].innerText;
        html = html + "<td>" + vals + "</td>";
        vals = gdvrdr1.GetRow(i).cells[5].innerText;
            html = html + "<td>" + vals + "</td>";
        vals = gdvrdr1.GetRow(i).cells[6].innerText;
        html = html + "<td>" + vals + "</td>";
        vals = gdvrdr1.GetRow(i).cells[19].innerText;
        if (isNullOrWhiteSpace(vals)) {
            vals = ""
        }
        html = html + "<td>" + vals + "</td>";
        html = html + "</tr>";
    }
    html = html + "</table>";

    var navigator = hdfTemp.Get("_brows");
    if (navigator === "internetexplorer") {
        window.clipboardData.setData("Text", html);
        var objExcel = new ActiveXObject("Excel.Application");
       objExcel.visible = true;
//        var ExcelSheet = new ActiveXObject("Excel.Sheet");
//       ExcelSheet.Application.Visible = true;
       var objWorkbook = objExcel.Workbooks.Add;
       var objWorksheet = objWorkbook.Worksheets(1);
       objWorksheet.Paste;
    }
    else {
        window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
        }
}

// GUARDAR
function Save() {
    var _sw = true;
    var IsValid = ASPxClientEdit.ValidateGroup("ValEditors");
    if (IsValid) {
        var rdr1 = gdvrdr1.GetVisibleRowsOnPage();
        if (rdr1 === 0) {
            _sw = false;
            alert("ingresar al menos un artículo.");
        }
        else if (gdvrdr1.IsEditing()) {
            _sw = false;
            alert("Actualizar o cancelar la fila en edición.");
        }
        /*else if (_vld[6] === "BT") {
            if (isNullOrWhiteSpace(bteU_BIZ_MEDI.GetText())) {
                _sw = false;
                alert("Ingresar médico a la orden de venta.");
            }
            else if (isNullOrWhiteSpace(txtU_BIZ_ESPE.GetText())) {
                _sw = false;
                alert("Ingresar especialidad del médico.");
            }
            else if (isNullOrWhiteSpace(txtU_BIZ_COLE.GetText())) {
                _sw = false;
                alert("Ingresar nro. de colegiatura del médico.");
            }
            else if (isNullOrWhiteSpace(txtU_BIZ_DIRE_MED.GetText())) {
                _sw = false;
                alert("Ingresar dirección del médico.");
            }
            else if (cbbU_BIZ_LUEN.GetText() === "Provincia") {
                if (isNullOrWhiteSpace(txtConsigDni.GetText())) {
                    _sw = false;
                    alert("Ingresar dni del consignatario.");
                }
                else if (isNullOrWhiteSpace(txtU_BIZ_SOLI.GetText())) {
                    _sw = false;
                    alert("Ingresar nombre del consignatario.");
                }
                else if (isNullOrWhiteSpace(txtConsigCity.GetText())) {
                    _sw = false;
                    alert("Ingresar ciudad del consignatario.");
                }
            }
        }*/
    }
    else {
        _sw = false;
    }

    if (_sw) {
        //var result = confirm("Desea crear El Cliente?");
        //if (result) {
            ldpProcess.SetText("Guardando, espere por favor...");
            ldpProcess.Show();
            clbOperation.PerformCallback("Save");
        //}
    }
}
// MODIFICAR
function Modify() {
    //if (_vld[6] !== "BT") {
        var _sw = true;
        var IsValid = ASPxClientEdit.ValidateGroup("ValEditors");
        if (IsValid) {
            var rdr1 = gdvrdr1.GetVisibleRowsOnPage();
            if (rdr1 === 0) {
                _sw = false;
                alert("ingresar al menos un artículo.");
            }
            else if (gdvrdr1.IsEditing()) {
                _sw = false;
                alert("Actualizar o cancelar la fila en edición.");
            }
        }
        //else {
        //    _sw = false;
        //}

        if (_sw) {
            var result = confirm("Desea modificar La Orden?");
            if (result) {
                ldpProcess.SetText("Modificando, espere por favor...");
                ldpProcess.Show();
                clbOperation.PerformCallback("Modify");
            }
        }
}
// CANCELAR
function Cancel() {
    var result = confirm("¿Desea cancelar la Orden de Compra?");
    if (result) {
        ldpProcess.SetText("Cancelando, espere por favor...");
        ldpProcess.Show();
        clbOperation.PerformCallback("Cancel");
    }
}
// OPERACIóN COMPLETADA
function Com_Operation(s, e) {
    ldpProcess.Hide();
    var _spd = "";
    if (e.result.indexOf("OKOS") !== -1) {
        _spd = e.result.split("#");
        txtDocEntry.SetText(_spd[1]);
        txtDocNum.SetText(_spd[2]);
        Set_EnAfterSave();
        alert("¡Operación concretada con exito!");
        //ClearControl();
        /*if (_vld[6] == "BT") {
            chkPromotion.SetChecked(false);
            chkPromotion.SetEnabled(false);
            chkAutExpens.SetChecked(false);
            chkAutExpens.SetEnabled(false);
        }*/
    }
    else if (e.result.indexOf("OKOM") !== -1) {
        alert("¡Operación concretada con exito!");
        //ClearControl();
    }
    else if (e.result.indexOf("OKAPRINT") !== -1) {
        $(location).attr("href", "../Impresiones/getReport.aspx");
    }
    else if (e.result.indexOf("OKOC") !== -1) {
        txtDocStatus.SetText("Cerrado");
//        chkPromotion.SetChecked(false);
//        chkPromotion.SetEnabled(false);
        //chkAutExpens.SetChecked(false);
        //chkAutExpens.SetEnabled(false);
        EnabledControl(false);
        mnuOper.GetItemByName("Save").SetEnabled(false);
        mnuOper.GetItemByName("Cancel").SetEnabled(false);
        gdvrdr1.UpdateEdit();
        alert("Operación concretada con exito!");
        //ClearControl();
    }
    else {
        alert(e.result);
    }
}
function Set_EnAfterSave() {
    bteCardName.SetEnabled(false);
    //if (_vld[6] !== "BT") {
        mnuOper.GetItemByName("Save").SetText("Modificar");
    /*}
    else {*/
        EnabledControl(false);
        mnuOper.GetItemByName("Save").SetEnabled(true);
        gdvrdr1.UpdateEdit();
    //}
}
// BUSCAR ORDEN DE VENTA
function ShowOrderSearch() {
    dteDateIn.SetDate(new Date());
    dteDateFi.SetDate(new Date());
    txtDocNums.SetText("");
    ppcOrdrSearch.Show();
}
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
function Get_Ordr() {
    gdvOrdrSearch.SetFocusedRowIndex(-1);
    gdvOrdrSearch.PerformCallback();
}
function OkOrdr() {
    var rowc = gdvOrdrSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvOrdrSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvOrdrSearch.GetRowValues(gdvOrdrSearch.GetFocusedRowIndex(), "DocEntry;DocNum;DocStatus;DocDate;DocDueDate;CardCode;CardName;NumAtCard;ShipToCode;ShipStreet;PayToCode;BillStreet;SlpCode;OwnerCode;GroupNum;Comments;DiscPrcntTotal;DiscSum;TotalExpns;DocTotal;DocCur;ListNumSrch", OnGetRowValuesOrdr);
    }
}
function OnGetRowValuesOrdr(values) {
            hdfTemp.Set("Currency", values[20].toString());
            txtDocEntry.SetText(values[0]);
            txtDocNum.SetText(values[1]);
            txtDocStatus.SetText(values[2]);
            cbbDocCur.SetValue(values[20]);
            //cbbListNum.SetValue(values[21]);
            dteDocDate.SetDate(new Date(values[3]));
            dteDocDueDate.SetDate(new Date(values[4]));
            txtCardCode.SetText(values[5]);
            bteCardName.SetText(values[6]);
    
            txtNumAtCard.SetText(values[7])
            txtShipToCode.SetText(values[8]);
            bteShipToCode.SetText(values[9]);
            txtBillToCode.SetText(values[10]);
            bteBillToCode.SetText(values[11]);

            
            if (values[13].toString() != "0") cbeOwnerCode.SetValue(values[13]);
            else cbeOwnerCode.SetText("");
            
            if (values[12].toString() != "-1") cbeSalesPerson.SetValue(values[12]);
            else cbeSalesPerson.SetText("");

            gdvAddress.PerformCallback("INICIAR:" + values[5]);

            
            cbbGroupNum.SetValue(values[14]);
            mmoComment.SetText(values[15]);



            if (hdfTemp.Get("Currency") == "SOL") {
                txtDiscPrcntTotal.SetText(values[16]);
                txtDiscSum.SetText(values[17]);
            }
            else if (hdfTemp.Get("Currency") == "USD") {
                txtDiscPrcntTotal.SetText(values[16]);
                txtDiscSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(values[17]));
            }
            else if (hdfTemp.Get("Currency") == "EUR") {
                txtDiscPrcntTotal.SetText(values[16]);
                txtDiscSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(values[17]));
            }


            Set_MaintenanceStatus(true);

            if (values[2].toString() == "Abierto") {
               mnuOper.GetItemByName("Save").SetText("Modificar");
                mnuOper.GetItemByName("Cancel").SetEnabled(true);
                mnuOper.GetItemByName("Save").SetEnabled(true);
                
            }
            else {
                
                mnuOper.GetItemByName("Save").SetEnabled(false);
                mnuOper.GetItemByName("Cancel").SetEnabled(false);
            }

            //hdfTemp.Set("_ubig", values[34]);
            //hdfTemp.Set("_movi", values[35]);
            hdfTemp.Set("_dtbel", "0");

            bteShipToCode.GetButton(0).style.display = "none";
            bteBillToCode.GetButton(0).style.display = "none";
            //bteU_BIZ_MEDI.GetButton(0).style.display = "none";
            
            gdvrdr1.PerformCallback("SRCH");
            //if (_vld[6] === "BT") {
                //gdvDoctor.PerformCallback(values[33]);
            //}
            //hdfTemp.Set("Currency", cbbDocCur.GetValue());
            EnabledControl(true);
            
    
            /*if (_vld[6] === "BM") {
                if (values[2] === "Abierto") {
                    EnabledControl(true);
                    Set_MaintenanceStatus(true);*/
                    
                /*}

                tetU_BF_HCFI.SetEnabled(false);
                if (values[15] === "03" && values[2] === "Abierto") {
                    tetU_BF_HCFI.SetEnabled(true);
                }
            }*/
            
            cbbDocCur.SetEnabled(false);
            gdvOrdrSearch.SetFocusedRowIndex(-1);
            ppcOrdrSearch.Hide();
}
function CancelOrdr() {
    ppcOrdrSearch.Hide();
}
function EndOrdrSearch() {
    gdvOrdrSearch.SetFocusedRowIndex(0);
    ppcOrdrSearch.UpdatePosition();
}
// BUSCAR OFERTA DE VENTA
function ShowOqutSearch() {
    if (isNullOrWhiteSpace(txtCardCode.GetText())) {
        alert("Seleccionar un cliente para realizar esta operación.");
    }
    else if (!isNullOrWhiteSpace(txtDocEntry.GetText())) {
        alert("Crear nueva orden de Compra.");
    }
    else {
        dtequDateIn.SetDate(new Date());
        dtequDateFi.SetDate(new Date());
        txtquDocNum.SetText("");
        ppcOqutSearch.Show();
    }
}
function Get_Oqut() {
    gdvOqutSearch.SetFocusedRowIndex(-1);
    gdvOqutSearch.PerformCallback();
}
function OkOqut() {
    var rowc = gdvOqutSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvOqutSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvOqutSearch.GetRowValues(gdvOqutSearch.GetFocusedRowIndex(), "DocEntry;DocNum;DocTotalSrch;ListNumSrch;DocCur;SlpCode;OwnerCode;ShipToCode;PayToCode;Address;Address2;GroupNum;DiscPrcntTotal;DiscSum", OnGetRowValuesOqut);
    }
}
function OnGetRowValuesOqut(values) {
    hdfTemp.Set("Currency", values[4].toString());
    cbbDocCur.SetValue(values[4]);
    if (values[6].toString() != "0") cbeOwnerCode.SetValue(values[6]);
    else cbeOwnerCode.SetText("");

    if (values[5].toString() != "-1") cbeSalesPerson.SetValue(values[5]);
    else cbeSalesPerson.SetText("");
    txtShipToCode.SetText(values[7]);
    txtBillToCode.SetText(values[8]);
    bteShipToCode.SetText(values[9]);
    bteBillToCode.SetText(values[10]);
    cbbGroupNum.SetValue(values[11]);
    //alert(values[12]);
    if (hdfTemp.Get("Currency") == "SOL") {
        txtDiscPrcntTotal.SetText(values[12]);
        txtDiscSum.SetText(values[13]);
    }
    else if (hdfTemp.Get("Currency") == "USD") {
        txtDiscPrcntTotal.SetText(values[12]);
        txtDiscSum.SetText(new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(values[13]));
    }
    else if (hdfTemp.Get("Currency") == "EUR") {
        txtDiscPrcntTotal.SetText(values[12]);
        txtDiscSum.SetText(new Intl.NumberFormat("de-DE", { style: "currency", currency: "EUR" }).format(values[13]));
    }
    cbbDocCur.SetEnabled(false);

    gdvrdr1.PerformCallback("OQUT;" + values[0]);
    gdvOqutSearch.SetFocusedRowIndex(-1);
    ppcOqutSearch.Hide();
}
function CancelOqut() {
    ppcOqutSearch.Hide();
}
function EndOqutSearch() {
    gdvOqutSearch.SetFocusedRowIndex(0);
    ppcOqutSearch.UpdatePosition();
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
function PrintTicket() {
    try {
        var fso = new ActiveXObject("Scripting.FileSystemObject");
        var contxt = "C:\\ClientSide\\PrintContent.txt";
        var a = fso.CreateTextFile(contxt, true);

        //HEADER
        a.WriteLine("           " + "NOTA DE PEDIDO");
        //if (_vld[6] === "BM") {
        //    a.WriteLine("            " + "BELMAY S.A.C.");
        //}
        //else {
            a.WriteLine("       " + "BOTICA FRANCESA S.A.C.");
        //}
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
        a.WriteLine("NRO. PEDIDO: " + txtDocNum.GetText());
        a.WriteLine("FECHA: " + dteDocDate.GetText() + " " + Hour());
        a.WriteLine("CLIENTE: " + hdfTemp.Get("_client"));

        a.WriteLine((new Array(37)).join("-"));
        //DETAIL
        for (var i = 0; i < gdvrdr1.GetVisibleRowsOnPage(); i++) {
            var _pricediscount = (" S/. " + parseFloat(gdvrdr1.GetRow(i).cells[7].innerText.replace("S/. ", "").replace(",", "")));
            var plg = _pricediscount.length;
            var val = "- " + gdvrdr1.GetRow(i).cells[2].innerText + " " + gdvrdr1.GetRow(i).cells[4].innerText + " " + gdvrdr1.GetRow(i).cells[3].innerText;
            var ilg = (36 - plg);
            var ncad = val.insert(ilg, _pricediscount + "\n");
            a.WriteLine(ncad);
        }
        a.WriteLine((new Array(37)).join("-"));

        //FOOTER
        var val = (new Array(24)).join(" ") + "S/. " + txtDocTotal.GetText();
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
function Print() {
    var html = '<html><head><style>table{font-family: Futura, Arial, sans-serif;font-size: 8px;color: black;}</style></head><body><table>';
    //HEADER
    html = html + '<tr><td style="text-align:center;">NOTA DE PEDIDO</td></tr>';
    //if (_vld[6] === "BM") {
    //    html = html + '<tr><td style="text-align:center;">BELMAY S.A.C.</td></tr>';
    //}
    //else {
        //html = html + '<tr><td style="text-align:center;">BOTICA FRANCESA S.A.C.</td></tr>';
    //}
    html = html + "<tr><td></td></tr>";
    html = html + "<tr><td>NRO. PEDIDO: " + txtDocNum.GetText() + "</td></tr>";
    html = html + "<tr><td>FECHA: " + dteDocDate.GetText() + " " + Hour() + "</td></tr>";
    html = html + "<tr><td>CLIENTE: " + hdfTemp.Get("_client") + "</td></tr>";
    html = html + "<tr><td>" + (new Array(60)).join("_") + "</td></tr>";

    //DETAIL
    for (var i = 0; i < gdvrdr1.GetVisibleRowsOnPage(); i++) {
        var _pricediscount = (" S/. " + parseFloat(gdvrdr1.GetRow(i).cells[7].innerText.replace("S/. ", "").replace(",", "")));
        var plg = _pricediscount.length;
        var val = "- " + gdvrdr1.GetRow(i).cells[2].innerText + " " + gdvrdr1.GetRow(i).cells[4].innerText + " " + gdvrdr1.GetRow(i).cells[3].innerText;
        var ilg = (55 - plg);
        var ncad = val.insert(ilg, _pricediscount + "<br>");
        html = html + "<tr><td>" + ncad + "</td></tr>";
    }
    html = html + "<tr><td>" + (new Array(60)).join("_") + "</td></tr>";
    
    //FOOTER
    var val = (new Array(24)).join(" ") + "S/. " + txtDocTotal.GetText();
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
}