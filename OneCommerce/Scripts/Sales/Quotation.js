var _dcs =[] ;
var _vld = [6];
$(document).ready(function () {
    Set_EnableControlSearch();
    
    Get_InitialData();
    Set_MaintenanceStatus(true);
    mnuOper.GetItemByName("CopyTo").SetText("Oferta");

    $(window).keydown(function (event) {
        if (event.keyCode == 13) {
            event.preventDefault();
            return false;
        }

    });

});

function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
function roundNumber(number, digits) {
    var multiple = Math.pow(10, digits);
    var rndedNum = Math.round(number * multiple) / multiple;
    return rndedNum;
}

function Set_MaintenanceStatus(enb) {
    mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
    mnuOper.GetItemByName("CreditNote").SetVisible(false);
    mnuOper.GetItemByName("Quote").SetVisible(false);
    mnuOper.GetItemByName("OrderTo").SetVisible(false);
    mnuOper.GetItemByName("DeliveryNote").SetVisible(false);
    mnuOper.GetItemByName("Print").SetEnabled(false);
    mnuOper.GetItemByName("Cancel").SetVisible(false);
    mnuOper.GetItemByName("Export").SetVisible(false);
    
    mnuOper.GetItemByName("Save").SetEnabled(enb);
    mnuOper.GetItemByName("Duplicate").SetEnabled(!enb);    
}

function Set_ParName(s,e) {
    if (e.column.fieldName === "CardCode") {
        $("#ClientParCaption").text("Código:");
        txtParClient.Focus();
    }
    else if (e.column.fieldName === "CardName") {
        $("#ClientParCaption").text("Razón Social:");
        txtParClient.Focus();
    }
    else if (e.column.fieldName === "ItemCode") {
        $("#MaterialParCaption").text("Código:");
        txtParMaterial.Focus();
    }
    else if (e.column.fieldName === "ItemName") {
        $("#MaterialParCaption").text("Descripción:");
        txtParMaterial.Focus();
    }
}

// DATOS INICIALES
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
           {
               type: "POST",
               url: "../Sales/Quotation.aspx/Get_InitialData",
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
    var _rs = result.d.where(function (item) { return (item.Ident === "FF"); });
    cbbU_BF_FOFA.BeginUpdate();
    cbbU_BF_FOFA.ClearItems();
    $.each(_rs, function (index, item) {
        cbbU_BF_FOFA.AddItem(item.Name, item.Code);
        _dcs.push(item.UnidMed);
        if (item.Dfault === 1) {
            _vld[0] = item.Code;
        }
        
    });
    cbbU_BF_FOFA.EndUpdate();
    cbbU_BF_FOFA.SetValue(_vld[0]);
    jose();
    _rs = result.d.where(function (item) { return (item.Ident === "CM"); });
    _rs.forEach(function (item) {
        var cmq = roundNumber(parseFloat(item.Name), 2);
        txtU_BIZ_COSM.SetText(cmq.toString());
    });

    _rs = result.d.where(function (item) { return (item.Ident === "MG"); });
    _rs.forEach(function (item) {
        var mgc = roundNumber(parseFloat(item.Name), 2);
        _vld[2] = mgc.toString();
        bteU_BIZ_PMAR.SetText(mgc.toString());
    });

    _rs = result.d.where(function (item) { return (item.Ident === "IGV"); });
    _rs.forEach(function (item) {
        var mgc = roundNumber(parseFloat(item.Name), 2);
        _vld[1] = mgc;
    });
   
    var mgg = parseFloat(bteU_BIZ_PMAR.GetText());
    Set_TotalPrices(mgg);
}

function jose() {
    var lst = cbbU_BF_FOFA.GetValue();
    var unid =_dcs.toString();
    var ab = unid.split(",");  
    var desunid= ab[cbbU_BF_FOFA.GetSelectedIndex()];
    cbbU_BIZ_UNPR.SetText(desunid);
}

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
    txtU_BIZ_COSN.SetText(values[0]);
    bteCardName.SetText(values[1]);
    gdvClientSearch.SetFocusedRowIndex(-1);
    ppcClientSearch.Hide();
}
function CancelClient() {
    ppcClientSearch.Hide();
}
function EndClientSearch() {
    gdvClientSearch.SetFocusedRowIndex(0);
    ppcClientSearch.UpdatePosition();
    gdvClientSearch.Focus();
}
// BUSCAR MATERIA PRIMA y ENVASE
function Show_Material() {
    var ValCnt = parseFloat(bteU_BIZ_CNTP.GetValue());
    var pct = parseFloat(gdvQUT17.cpTotalPercent);
    if (ValCnt <= 0) {
        bteU_BIZ_CNTP.Validate();
        bteU_BIZ_CNTP.Focus();
        bteU_BIZ_CNTP.SelectAll();
    }
    else if (pct >= 100 && gdvQUT17.IsEditing() && gdvQUT17.IsNewRowEditing()) {
        gdvQUT17.CancelEdit();
        alert("Ya está completado el 100% de la materia prima.");      
    }
    else {
        gdvMaterialSearch.Refresh();
        gdvMaterialSearch.SetFocusedRowIndex(-1);
        ppcMaterialSearch.SetHeaderText("Buscar Materia Prima");
        hdfTemp.Set("_htmt", "Materia");
        ppcMaterialSearch.Show();
    }
}
function Show_Package() {
    gdvMaterialSearch.Refresh();
    gdvMaterialSearch.SetFocusedRowIndex(-1);
    ppcMaterialSearch.SetHeaderText("Buscar Envase");
    hdfTemp.Set("_htmt", "Envase");
    ppcMaterialSearch.Show();
    
}
function Get_Material() {
    gdvMaterialSearch.SetFocusedRowIndex(-1);
    gdvMaterialSearch.PerformCallback(hdfTemp.Get("_htmt"));
}
function OkMaterial() {
    var rowc = gdvMaterialSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvMaterialSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvMaterialSearch.GetRowValues(gdvMaterialSearch.GetFocusedRowIndex(), "ItemCode;ItemName;Cost", OnGetRowValuesMaterial);
        
    }
}
function OnGetRowValuesMaterial(values) {
    gdvMaterialSearch.SetFocusedRowIndex(-1);
    ppcMaterialSearch.Hide();
    if (ppcMaterialSearch.GetHeaderText() === "Buscar Materia Prima") {
        Set_MaterialLine(values);
    }
    else {
        Set_PackageLine(values);
    }
}
//Jose
function OkGrupo() {
    var rowc = gvgroup.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    } else if (gvgroup.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    } else {
        gvgroup.GetRowValues(gvgroup.GetFocusedRowIndex(), "COD_PHANTOM;U_BF_GRUPO", OnGetRowValuesGrupo);
    }
}
function OnGetRowValuesGrupo(values) {
    gvgroup.SetFocusedRowIndex(-1);
    ppcGrupoEnv.Hide();
    setGroupLine(values);
}


function EndGrupoSearch() {
    gvgroup.SetFocusedRowIndex(0);
    ppcGrupoEnv.UpdatePosition();
    gvgroup.Focus();
}

function EndMaterialSearch() {
    gdvMaterialSearch.SetFocusedRowIndex(0);
    ppcMaterialSearch.UpdatePosition();
    gdvMaterialSearch.Focus();
}
function setGroupLine(values) {
    gdvQUT18.PerformCallback("APH:" + values[0] + ":" + values[1]);
}

//------------------------------------

function CancelMaterial() {
    ppcMaterialSearch.Hide();
}
function Set_MaterialLine(values) {
    txtU_BIZ_CCOM.SetText(values[0]);
    txtU_BIZ_NCOM.SetText(values[1]);
    var _rpj = 100 - parseFloat(gdvQUT17.cpTotalPercent);
    txtU_BIZ_PCTO.SetText(_rpj.toString());
    txtU_BIZ_COST.SetText(values[2]);
    var cpt = parseFloat(bteU_BIZ_CNTP.GetValue());
    var resu = (((cpt / 100) * _rpj) * parseFloat(values[2]));
    resu = roundNumber(resu, 6);
    txtU_BIZ_RESU.SetText(resu.toString());
    txtU_BIZ_PCTO.Focus();
    txtU_BIZ_PCTO.SelectAll();
}
function Set_Percent(s, e) {
    var _cst = parseFloat(txtU_BIZ_COST.GetValue());
    var _pct = parseFloat(s.GetValue());
    var cpt = parseFloat(bteU_BIZ_CNTP.GetValue());
    if (cpt <= 0) {
        bteU_BIZ_CNTP.Validate();
        bteU_BIZ_CNTP.Focus();
        bteU_BIZ_CNTP.SelectAll();
    }
    else {
        var resu = (((cpt / 100) * _pct) * _cst);
        resu = roundNumber(resu, 6);
        txtU_BIZ_RESU.SetText(resu.toString());
    }
}
function Exi_Material(itemcode) {
    var _ext = false;
    for (var i = 0; i < gdvQUT17.GetVisibleRowsOnPage(); i++) {
        if (i !== gdvQUT17.cpEditingRowIndex) {
            var _eit = gdvQUT17.GetRow(i).cells[1].innerText;
            if (_eit === itemcode) {
                _ext = true;
                break;
            }
        }
    }
    return (_ext);
}
function Set_PackageLine(values) {
//    gdvQUT18.PerformCallback("APH:" + values[0]);
    gvgroup.PerformCallback("APH:" + values[0]);
    /*-------Agregado Por Jose---------------*/
    var numval;
    try{
    try {
    var ext = values[1].split("X");
    var ext2 = ext[1].split(" ")
    numval=ext2[1];
    }
    catch(err) {
        var ext = values[1].split("x");
        var ext2x = ext[1].split(" ")
       numval=ext2x[1];
    }
    var ent = parseInt(numval);
   if(ent != Math.round(bteU_BIZ_CNTP.GetText())){
       alert("Verifique: \n Presentación :" + Math.round(bteU_BIZ_CNTP.GetText()) + " \n Envase :"+values[1]);
    }
    
    }
    catch (err) {
    }
    gvgroup.Refresh();
    gvgroup.SetFocusedRowIndex(-1);
    ppcGrupoEnv.SetHeaderText("Buscar Envase");
    hdfTemp.Set("_htmt", "Envase");  
    ppcGrupoEnv.Show();

   /*------------------------------------*/
}
function Mat_EndCallback() {
    var mgg = parseFloat(bteU_BIZ_PMAR.GetText());
    Set_TotalPrices(mgg);
}
function Pac_EndCallback() {
    var mgg = parseFloat(bteU_BIZ_PMAR.GetText());
    Set_TotalPrices(mgg);
}
function Set_TotalPrices(mgg) {
    var tsv = parseFloat(gdvQUT17.cpTotalSummary) + parseFloat(gdvQUT18.cpTotalSummary);
    var cmq = parseFloat(txtU_BIZ_COSM.GetText());
    var ctl = roundNumber((cmq + tsv), 2);
    txtU_BIZ_TOTC.SetText(ctl.toString());    
    var pcv = ctl + ((ctl * mgg) / 100);
    pcv = roundNumber(parseFloat(pcv), 2);
    txtU_BIZ_PREV.SetText(pcv.toString());
    var igv = (pcv * parseFloat(_vld[1])) / 100;
    igv = roundNumber(parseFloat(igv), 3).toFixed(2);
    txtU_BIZ_MIGV.SetText(igv);
    var pvf = pcv + parseFloat(igv);
    pvf = roundNumber(parseFloat(pvf), 3).toFixed(2);    
    txtU_BIZ_PVMI.SetText(pvf);
}
function Key_ProfitMargin(s, e) {
    var mgg = parseFloat(s.GetText());
    Set_TotalPrices(mgg);
}
function Set_ReCalc(s, e) {
    var cpt = parseFloat(s.GetValue());
    gdvQUT17.PerformCallback("RCC:" + cpt);
    /**********Agregado por Jose**********/
    var des = txtU_BF_DEET.GetText() + " - " + cbbU_BF_FOFA.GetText() +" "+ Math.round(s.GetValue()) +" "+ cbbU_BIZ_UNPR.GetText();
    var cor = des.split("-");
    var des1 = cor[0] + "- " + cbbU_BF_FOFA.GetText() + " " + Math.round(s.GetValue()) + " " + cbbU_BIZ_UNPR.GetText();
    txtU_BF_DEET.SetValue(des1); 
   /*****************************************/
}
function Save() {
    var IsValid = ASPxClientEdit.ValidateGroup("ValEditors");
    if (IsValid) {
        var q17 = gdvQUT17.GetVisibleRowsOnPage();
        var q18 = gdvQUT18.GetVisibleRowsOnPage();
        if (q17 === 0) {
            alert("ingresar materia prima.");
        }
        else if (q18 === 0) {
            alert("ingresar envase.");
        }
        else if (gdvQUT17.IsEditing()) {
            alert("Actualizar o cancelar la fila en edición.");
        }
        else if (gdvQUT18.IsEditing()) {
            alert("Actualizar o cancelar la fila en edición.");
        }
        else {
            var result = confirm("La cotización no puede modificarse tras la creación.\n¿Desea continuar?");
            if (result) {
                ldpProcess.SetText("Guardando, espere por favor...");
                ldpProcess.Show();
                clbOperation.PerformCallback("Save");
            }
        }
    }
}



function ClearControl() {
    cbbU_BF_FOFA.SetValue(_vld[0]);
    txtDocEntry.SetText("");
    bteCardName.SetText("");
    txtU_BIZ_COSN.SetText("");
    bteU_BIZ_CNTP.SetText("0");
    txtU_BF_DEET.SetText("");
    chkConvert.SetChecked(false);
    bteU_BIZ_PMAR.SetText(_vld[2]);
    gdvQUT17.PerformCallback("CLR");
    gdvQUT18.PerformCallback("CLR");
    EnabledControl(true);
    Set_MaintenanceStatus(true);
   ;
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save") {
       var sd2 = parseFloat(gdvQUT17.cpTotalPercent2);
       if (sd2 < 100)
           alert('Porcentaje debe de ser igual a 100');
       else if (sd2 = 100)  
            Save();   
    }
    // NUEVO
    else if (e.item.name === "New") {
        ClearControl();
    }
    // BUSCAR
    else if (e.item.name === "Search") {
        ShowQutSearch();
    }
    // DUPLICAR
    else if (e.item.name === "Duplicate") {
        Set_Duplicate();
    }
    // CREAR OFERTA
    else if (e.item.name === "CopyTo") {
        Show_QuoteList();
    }
}
function Com_Operation(s, e) {
    ldpProcess.Hide();
    var _spd = "";
    if (e.result.indexOf("OKSQ") !== -1) {
        _spd = e.result.split("#");
        txtDocEntry.SetText(_spd[1]);
        gdvQUT17.UpdateEdit();
        gdvQUT18.UpdateEdit();
        EnabledControl(false);
        Set_MaintenanceStatus(false);
        alert("Operación concretada con exito...!!");
    }
    else if (e.result.indexOf("OKOFV") !== -1) {
        gdvQuoteList.PerformCallback("CLR");
        _spd = e.result.split("#");
        alert("Operación concretada con exito...!!\nNro. Oferta: " + _spd[1]);
    }
    else {
        alert(e.result);
    }
}
function EnabledControl(enb) {
    bteCardName.SetEnabled(enb);
    bteU_BIZ_CNTP.SetEnabled(enb);
    chkConvert.SetEnabled(enb);
    cbbU_BF_FOFA.SetEnabled(enb);
    txtU_BF_DEET.SetEnabled(enb);
    cbbU_BIZ_UNPR.SetEnabled(enb);
    bteU_BIZ_PMAR.SetEnabled(enb);
    ASPxClientUtils.SetCookie("theme", hdfTemp.Get("theme"));
}
// BUSCAR COTIZACIONES
function ShowQutSearch() {
    ppcQutSearch.Show();
}
function Get_Qut() {
    gdvQutSearch.SetFocusedRowIndex(-1);
    gdvQutSearch.PerformCallback();
}
function OkQut() {
    var rowc = gdvQutSearch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvQutSearch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvQutSearch.GetRowValues(gdvQutSearch.GetFocusedRowIndex(), "U_BIZ_COSN;CardName;U_BIZ_CNTP;U_BF_FOFA;U_BF_DEET;U_BIZ_UNPR;U_BIZ_COSM;U_BIZ_TOTC;U_BIZ_PMAR;U_BIZ_PREV;U_BIZ_MIGV;U_BIZ_PVMI;DocEntry;U_BIZ_DOCE", OnGetRowValuesQut);
    }
}
function OnGetRowValuesQut(values) {
    txtDocEntry.SetText(values[12]);
    txtU_BIZ_COSN.SetText(values[0]);
    bteCardName.SetText(values[1]);
    bteU_BIZ_CNTP.SetText(values[2].toString());
    cbbU_BF_FOFA.SetValue(values[3])
    txtU_BF_DEET.SetValue(values[4])
    cbbU_BIZ_UNPR.SetText(values[5])
    chkConvert.SetChecked(false);
    txtU_BIZ_COSM.SetValue(values[6])
    txtU_BIZ_TOTC.SetText(values[7]);
    bteU_BIZ_PMAR.SetText(values[8].toString());
    txtU_BIZ_PREV.SetText(values[9]);
    txtU_BIZ_MIGV.SetText(values[10]);
    txtU_BIZ_PVMI.SetText(values[11]);
    clbQutSearch.PerformCallback(values[12]);

    EnabledControl(false);
    Set_MaintenanceStatus(false);
    gdvQutSearch.SetFocusedRowIndex(-1);
    ppcQutSearch.Hide();
}
function CancelQut() {
    ppcQutSearch.Hide();
}
function EndQutSearch() {
    gdvQutSearch.SetFocusedRowIndex(0);
    ppcQutSearch.UpdatePosition();
}
function Com_QutSearch() {
    gdvQUT17.PerformCallback("SMP");
    gdvQUT18.PerformCallback("SEV");
}
function OnCheckChange(s) {
    var name = s.GetInputElement().id.toString();    
    if (name.indexOf("chkqDocEntry") !== -1) {
        txtqDocEntry.SetEnabled(s.GetChecked());
        txtqDocEntry.Focus();
        txtqDocEntry.SetText("");
    }
    else if (name.indexOf("chkqCreateDate") !== -1) {
        dteqCreateDate.SetEnabled(s.GetChecked());
        dteqCreateDate.Focus();
        if (s.GetChecked()) {
            dteqCreateDate.SetDate(new Date());
        }
        else {
            dteqCreateDate.SetText("");
        }
    }
    else if (name.indexOf("chkqCardCode") !== -1) {
        txtqCardCode.SetEnabled(s.GetChecked());
        txtqCardCode.Focus();
        txtqCardCode.SetText("");
    }
    else if (name.indexOf("chkqCardName") !== -1) {
        txtqCardName.SetEnabled(s.GetChecked());
        txtqCardName.Focus();
        txtqCardName.SetText("");
    }
    else {
        txtqActives.SetEnabled(s.GetChecked());
        txtqActives.Focus();
        txtqActives.SetText("");
    }
}
function Set_EnableControlSearch() {
    dteqCreateDate.SetDate(new Date());
    txtqDocEntry.SetEnabled(false);
    txtqCardCode.SetEnabled(false);
    txtqCardName.SetEnabled(false);
    txtqActives.SetEnabled(false);
}
function Set_Duplicate() {
    txtDocEntry.SetText("");
    gdvQUT17.UpdateEdit();
    gdvQUT18.UpdateEdit();
    EnabledControl(true);
    Set_MaintenanceStatus(true);
}
// CREANDO OFERTA
function Show_QuoteList() {
    ppcQuoteList.Show();
    dteDateIn.SetDate(new Date());
    dteDateFi.SetDate(new Date());    
}
function Get_QuoteList() {
    gdvQuoteList.PerformCallback("");
}
function QuoteCreate() {
    var rowc = gdvQuoteList.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvQuoteList.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvQuoteList.GetSelectedFieldValues("DocEntry;U_BIZ_COSN", OnGetSelectedFieldValues);
    }
}
function OnGetSelectedFieldValues(selectedValues) {
    if (selectedValues.length == 0) {
        alert("Seleccione al menos un registro\npara realizar esta operación.");
    }
    else {
        var crps = "CreateOff;"
        var _sw = true;
        for (i = 0; i < selectedValues.length; i++) {
            if (i > 0) {
                if (selectedValues[i][1] !== selectedValues[i - 1][1]) {
                    _sw = false;
                    alert("Seleccione rps de un solo cliente.");
                    break;                
                }
            }
            crps = crps + selectedValues[i][0] + ";";
        }
        if (_sw) {
            ppcQuoteList.Hide();
            var result = confirm("La oferta de venta no puede modificarse tras la creación.\n¿Desea continuar?");
            if (result) {
                ldpProcess.SetText("Guardando, espere por favor...");
                ldpProcess.Show();
                crps = crps.substring(0, crps.length - 1);
                clbOperation.PerformCallback(crps);
            }
        }
    }
}
function QuoteCancel() {
    ppcQuoteList.Hide();
}
// ENTER KEY
$(document).keydown(function (evt) {
    var currIndex = gdvClientSearch.GetFocusedRowIndex();
    if (currIndex >= 0) {
        if (event.keyCode === 13) {
            OkClient();
        }
    }
    currIndex = gdvMaterialSearch.GetFocusedRowIndex();
    if (currIndex >= 0) {
        if (event.keyCode === 13) {
            OkMaterial();
        }
    }
});
function OnEnterClientSearch(s, e) {
    var key = ASPxClientUtils.GetKeyCode(e.htmlEvent);
    if (key === ASPxKey.Enter) {
        bteClientSearch.DoClick();
    }
}
function OnEnterMaterialSearch(s, e) {
    var key = ASPxClientUtils.GetKeyCode(e.htmlEvent);
    if (key === ASPxKey.Enter) {
        btnMaterialSearch.DoClick();
    }
}