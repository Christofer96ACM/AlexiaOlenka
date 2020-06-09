var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    pestañascrearclie();
    try {
        _vld[4] = hdfTemp.Get("_emid");
        _vld[6] = hdfTemp.Get("_soci");
        //Get_DEPARTAMENTOS_JS();
        //GET_PROVINCIAS_JS2('');
        //GET_DISTRITOS_JS2('');
        ////Init_ClientCr();
        Get_InitialData();
        Set_VisibleOption();
        //InitControls();
    } catch (e) {
        alert(e.Message);
    }
});
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
        gdvProductSearch.GetRowValues(gdvProductSearch.GetFocusedRowIndex(), "ItemCode;ItemName;ItmsGrpCod;PrchseItem;SellItem;InvntItem;BuyUnitMsr;NumInBuy;SalUnitMsr;NumInSale;TreeType;PurPackMsr;PurPackUn;SalPackMsr;SalPackUn;GLMethod;IssueMthd;ByWh;MngMethod;TaxCodeAP;TaxCodeAR;U_BPP_TIPEXIST;ItemType;Active;ManBtchNum;ManSerNum;ActivoC;ActivoS;NoFacturable;InvntryUom;U_GOS_MARCA;U_GOS_MODELO;PLAN;DetalleServicio", OnGetRowValuesProduct);
    }
}
function OnGetRowValuesProduct(values) {
    
    txtItemcode.SetText(values[0]);
    txtItemname.SetText(values[1]);
    txtMarca.SetText(values[30]);
    txtModelo.SetText(values[31]);
    cbbDetalleServicio.SetValue(values[33]);
    cbbItmsGrpCod.SetValue(values[2]);
    //cbbMngMethod.SetValue(values[18]);
    //cbbIssueMthd.SetValue(values[16]);
    //cbbItemType.SetValue(values[22]);
    cbbTipExist.SetValue(values[21]);
    cbbPlan.SetText(values[32]);

    if (values[16] == "M") {
        if (values[24] == "N" && values[25] == "Y") {
            cbbIssueMthd.SetValue("S");
        }
        else
            cbbIssueMthd.SetValue("L");
    }
    else
        cbbIssueMthd.SetValue("N");

    cbbGLMethod.SetValue(values[15]);
    
    if (values[23] == "Y") {
        rbtnestado.SetSelectedIndex(0);
    } else if (values[23] == "N") {
        rbtnestado.SetSelectedIndex(1);
    }
    checkArticuloVenta.SetValue(values[4]);
    checkArticuloInventario.SetValue(values[5]);
    checkArticuloCompra.SetValue(values[3]);
    checkByWh.SetValue(values[17]);
    checkContrato.SetValue(values[26]);
    checkServicio.SetValue(values[27]);
    checkFacturable.SetValue(values[28]);
    cbbInvntryUOM.SetValue(values[29]);

    cbbBuyUnitMsr.SetValue(values[6]);
    txtNuminBuy.SetText(values[7]);
    cbbPurPackMsr.SetValue(values[11]);
    txtPurPackUn.SetText(values[12]);
    cbbTaxCodeAP.SetValue(values[19]);

    cbbSalUnitMsr.SetValue(values[8]);
    txtNuminSale.SetText(values[9]);
    cbbSalPackMsr.SetValue(values[13]);
    txtSalPackUn.SetText(values[14]);
    cbbTaxCodeAR.SetValue(values[20]); 

    grdvAlmacenes.PerformCallback("SRCH:" + values[0]);
    grdvPrecios.PerformCallback("PRICEDF:" + values[0]);
    ppcProductSearch.Hide();
    gdvProductSearch.PerformCallback("CLR");
    mnuOper.GetItemByName("Save").SetText("Modificar");
    txtItemcode.SetEnabled(false);
}
function CancelProduct() {
    ppcProductSearch.Hide();
}
function EndProductSearch() {
    gdvProductSearch.SetFocusedRowIndex(0);
    //ppcProductSearch.UpdatePosition();
}
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Masters/Articulos.aspx/GET_VALORES_ARTICULOS",
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

    var _rs1 = result.d.where(function (item) { return (item.CLAVE === "TE"); });
    cbbTipExist.BeginUpdate();
    cbbTipExist.ClearItems();
    _rs1.forEach(function (item) {
        cbbTipExist.AddItem(item.DEFECTO, item.VALOR);
        if (item.VALOR === 01) {
            _vld[2] = item.VALOR;
        }
    });
    cbbTipExist.EndUpdate();
    cbbTipExist.SetValue(_vld[2]);

    var _rs = result.d.where(function (item) { return (item.CLAVE === "GA"); });
    cbbItmsGrpCod.BeginUpdate();
    cbbItmsGrpCod.ClearItems();
    _rs.forEach(function (item) {
        cbbItmsGrpCod.AddItem(item.VALOR, item.INDEX);
        if (item.INDEX === 100) {
            _vld[1] = item.INDEX;
        }
    });    
    cbbItmsGrpCod.EndUpdate();
    cbbItmsGrpCod.SetValue(_vld[1]);/**/

    var _RSP = result.d.where(function (item) { return (item.CLAVE === "PL"); });
    cbbPlan.BeginUpdate();
    cbbPlan.ClearItems();
    _RSP.forEach(function (item) {
        cbbPlan.AddItem(item.VALOR, item.INDEX);


    });

    cbbPlan.EndUpdate();
    //cbbPlan.SetSelectedIndex(0);

    var _rs2 = result.d.where(function (item) { return (item.CLAVE === "UM"); });
    cbbBuyUnitMsr.BeginUpdate();
    cbbPurPackMsr.BeginUpdate();
    cbbSalUnitMsr.BeginUpdate();
    cbbSalPackMsr.BeginUpdate();
    cbbBuyUnitMsr.ClearItems();
    cbbPurPackMsr.ClearItems();
    cbbSalUnitMsr.ClearItems();
    cbbSalPackMsr.ClearItems();
    cbbInvntryUOM.ClearItems();
    _rs2.forEach(function (item) {
        cbbBuyUnitMsr.AddItem(item.VALOR, item.INDEX);
        cbbPurPackMsr.AddItem(item.VALOR, item.INDEX);
        cbbSalUnitMsr.AddItem(item.VALOR, item.INDEX);
        cbbSalPackMsr.AddItem(item.VALOR, item.INDEX);
        cbbInvntryUOM.AddItem(item.VALOR, item.INDEX);
        if (item.INDEX === 1) {
            _vld[3] = item.INDEX;
        }
    });
    cbbBuyUnitMsr.EndUpdate();
    cbbPurPackMsr.EndUpdate();
    cbbSalUnitMsr.EndUpdate();
    cbbSalPackMsr.EndUpdate();
    cbbInvntryUOM.EndUpdate();
    cbbBuyUnitMsr.SetValue(_vld[3]);
    cbbPurPackMsr.SetValue(_vld[3]);
    cbbSalUnitMsr.SetValue(_vld[3]);
    cbbSalPackMsr.SetValue(_vld[3]);
    cbbInvntryUOM.SetValue(_vld[3]);

    var _rs3 = result.d.where(function (item) { return (item.CLAVE === "II"); });
    cbbTaxCodeAP.BeginUpdate();
    cbbTaxCodeAR.BeginUpdate();
    cbbTaxCodeAP.ClearItems();
    cbbTaxCodeAR.ClearItems();
    _rs3.forEach(function (item) {
        cbbTaxCodeAP.AddItem(item.VALOR, item.INDEX);
        cbbTaxCodeAR.AddItem(item.VALOR, item.INDEX);
        if (item.INDEX === 1) {
            _vld[7] = item.INDEX;
        }
    });
    cbbTaxCodeAP.EndUpdate();
    cbbTaxCodeAR.EndUpdate();
    cbbTaxCodeAP.SetValue(_vld[7]);
    cbbTaxCodeAR.SetValue(_vld[7]);

    var _rs4 = result.d.where(function (item) { return (item.CLAVE === "DS"); });
    cbbDetalleServicio.BeginUpdate();
    cbbDetalleServicio.ClearItems();
    _rs4.forEach(function (item) {
        cbbDetalleServicio.AddItem(item.VALOR, item.INDEX);
    });
    cbbDetalleServicio.EndUpdate();
    cbbDetalleServicio.SetSelectedIndex(0);

    grdvPrecios.PerformCallback("CMPLT");
    grdvAlmacenes.PerformCallback("INIT");
    //Get_Almacen();

    txtNuminBuy.SetText("1");
    txtPurPackUn.SetText("1");
    txtNuminSale.SetText("1");
    txtSalPackUn.SetText("1");
    //cbbMngMethod.SetEnabled(false);

    txtNuminBuy.SetEnabled(true);
    txtPurPackUn.SetEnabled(true);
    txtNuminSale.SetEnabled(true);
    txtSalPackUn.SetEnabled(true);

    cbbBuyUnitMsr.SetSelectedIndex(0);
    cbbPurPackMsr.SetSelectedIndex(0);
    cbbSalUnitMsr.SetSelectedIndex(0);
    cbbSalPackMsr.SetSelectedIndex(0);
    cbbTaxCodeAP.SetSelectedIndex(0);
    cbbTaxCodeAR.SetSelectedIndex(0);
    cbbInvntryUOM.SetSelectedIndex(0);

    cbbItmsGrpCod.SetSelectedIndex(0);
    cbbIssueMthd.SetSelectedIndex(0);
    //cbbItemType.SetSelectedIndex(0);
    cbbTipExist.SetSelectedIndex(0);
    cbbGLMethod.SetSelectedIndex(0);

    //cbbItemType.SetEnabled(false);
    //gdvProductSearch.PerformCallback("CLR");
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
    //InitControls();
    
    txtItemcode.SetText("");
    txtItemname.SetText("");
    txtMarca.SetText("");
    txtModelo.SetText("");
    cbbDetalleServicio.SetSelectedIndex(0);
    cbbItmsGrpCod.SetSelectedIndex(0);
    //cbbMngMethod.SetValue(values[18]);
    cbbIssueMthd.SetSelectedIndex(0);
    //cbbItemType.SetSelectedIndex(0);
    cbbTipExist.SetSelectedIndex(0);

    cbbGLMethod.SetSelectedIndex(0);
    rbtnestado.SetSelectedIndex(0);
    
    checkArticuloVenta.SetChecked(true);
    checkArticuloInventario.SetChecked(true);
    checkArticuloCompra.SetChecked(true);
    checkByWh.SetChecked(true);
    checkContrato.SetValue(false);
    checkServicio.SetValue(false);
    checkFacturable.SetValue(false);


    cbbBuyUnitMsr.SetSelectedIndex(0);
    cbbPurPackMsr.SetSelectedIndex(0);
    cbbSalUnitMsr.SetSelectedIndex(0);
    cbbSalPackMsr.SetSelectedIndex(0);
    cbbTaxCodeAP.SetSelectedIndex(0);
    cbbTaxCodeAR.SetSelectedIndex(0);

    txtNuminBuy.SetText("1");
    txtPurPackUn.SetText("1");
    txtNuminSale.SetText("1");
    txtSalPackUn.SetText("1");

    grdvAlmacenes.PerformCallback("INIT");
    grdvPrecios.PerformCallback("CMPLT");
    mnuOper.GetItemByName("Save").SetText("Crear");
    txtItemcode.SetEnabled(true);
    gdvProductSearch.PerformCallback("CLR");
    //$.scrollTo("#tab1");
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
function InitControls() {
    ClearControlsClient();
}
function Set_MaintenanceStatus(enb) {
    mnuOper.GetItemByName("Save").SetEnabled(enb);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetEnabled(false);
    mnuOper.GetItemByName("PaymentIn").SetEnabled(true);
    mnuOper.GetItemByName("Print").SetEnabled(!enb);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(enb);
    mnuOper.GetItemByName("CopyTo").SetEnabled(!enb);

    var _dst = txtDocStatus.GetText();
    if (_dst === "Cerrado") {
        //mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
        mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
        mnuOper.GetItemByName("CopyTo").SetEnabled(false);
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
function SaveItems() {
    clbOperation.PerformCallback("SaveItem");
}
function Save() {
    SaveItems();
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save" && e.item.GetText() === "Crear") {
        Save();
        $("section.sectablas").hide();
        $(".amenucrearclie").css("background-color", "#4F93E3");
        $(".amenucrearclie").css("color", "White");

        $("section.sectablas:first").show();
        $(".amenucrearclie:first").css("background-color", "#BCD4F6");
        $(".amenucrearclie:first").css("color", "Black");
    }
        // NUEVO
    else if (e.item.name === "New") {
        ClearControl();
        $("section.sectablas").hide();
        $(".amenucrearclie").css("background-color", "#4F93E3");
        $(".amenucrearclie").css("color", "White");

        $("section.sectablas:first").show();
        $(".amenucrearclie:first").css("background-color", "#BCD4F6");
        $(".amenucrearclie:first").css("color", "Black");
    }
        // BUSCAR
    else if (e.item.name === "Search") {
        ppcProductSearch.Show();
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {

        Modify();
        $("section.sectablas").hide();
        $(".amenucrearclie").css("background-color", "#4F93E3");
        $(".amenucrearclie").css("color", "White");

        $("section.sectablas:first").show();
        $(".amenucrearclie:first").css("background-color", "#BCD4F6");
        $(".amenucrearclie:first").css("color", "Black");
    }
}
function Modify() {
    
    clbOperation.PerformCallback("Modify");

}
function pestañascrearclie() {
    $(".amenucrearclie").css("background-color", "#4F93E3");
    $(".amenucrearclie").css("color", "White");
    $(".amenucrearclie:first").css("background-color", "#BCD4F6");
    $(".amenucrearclie:first").css("color", "Black");

    $("section.sectablas").hide();
    $("section.sectablas:first").show();

    $(".amenucrearclie").click(function () {
        $(".amenucrearclie").css("background-color", "#4F93E3");
        $(".amenucrearclie").css("color", "White");
        $(this).css("background-color", "#BCD4F6");
        $(this).css("color", "Black");
        $("section.sectablas").hide();

        var activartabla = $(this).attr("href");
        $(activartabla).show();
        return false;
    });
}

function Key_CrCardName(s, e) {
    s.SetText(s.GetText().toUpperCase());
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
        //ClearControlsClient();
        alert("Artículo creado con éxito!");
        ClearControl();
    }
    else if (e.result.indexOf("OKUPDBP") !== -1) {
        alert("Artículo modificado con éxito!");
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
    //txtCrCardCode.SetText("");
    //txtCrCardName.SetText("");
    //cbbCrDocumentType.SetSelectedIndex(0);
    //cbbCrDocumentType.SetSelectedIndex(0);
    //txtCrLicTradNum.SetText("");
    //txtCrCellular.SetText("");
    //txtCrE_Mail.SetText("");
    //txtCrPhone1.SetText("");
    //dteCrU_PN_FecNac.SetDate(null);
}

function Show_AlmacenSearch() {

    ppcAlmacenSearch.Show();
}
function CancelAlmacen() {
    ppcAlmacenSearch.Hide();
}
function Get_Almacen() {
    gdvWhsCodeSearch.SetFocusedRowIndex(-1);
    gdvWhsCodeSearch.PerformCallback("ALMCN");
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
        gdvWhsCodeSearch.GetRowValues(gdvWhsCodeSearch.GetFocusedRowIndex(), "WhsCode;WhsName;RevenuesAc;ExpensesAc", OnGetRowValuesClient);
    }
}

function OnGetRowValuesClient(values) {

    bteWhsCode.SetText(values[0]);
    txtWhsName.SetText(values[1]);
    checkLocked.SetChecked(false);
    txtOnHand.SetText("0");
    txtIsCommited.SetText("0");
    txtOnOrder.SetText("0");
    txtDisponible.SetText("0");
    //txtRevenuesAc.SetText(values[2]);
    //txtExpensesAc.SetText(values[3]);

    gdvWhsCodeSearch.SetFocusedRowIndex(-1);
    ppcAlmacenSearch.Hide();
}
function fincallback(s, e) {
    alert(e.result);
}
function EndClientSearch() {
    gdvWhsCodeSearch.SetFocusedRowIndex(0);
    //gdvWhsCodeSearch.UpdatePosition();
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
