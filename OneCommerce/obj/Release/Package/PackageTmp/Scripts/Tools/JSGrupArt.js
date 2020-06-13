var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
var general = "";
$(document).ready(function () {
    pestañascrearclie();
    try {
        Set_VisibleOption();
        Get_InitialData();
        //Set_InitialData();
        //InitControls();
    } catch (e) {
        alert(e.Message);
    }
});

//function Set_Operation(s, e) {
//    // GUARDAR
//    if (e.item.name === "Save" && e.item.GetText() === "Crear") {
//        Save();
//        $("section.sectablas").hide();
//        $(".amenucrearclie").css("background-color", "#4F93E3");
//        $(".amenucrearclie").css("color", "White");

//        $("section.sectablas:first").show();
//        $(".amenucrearclie:first").css("background-color", "#BCD4F6");
//        $(".amenucrearclie:first").css("color", "Black");
//    }
//        // NUEVO
//    else if (e.item.name === "New") {
//        ClearControl();
//        $("section.sectablas").hide();
//        $(".amenucrearclie").css("background-color", "#4F93E3");
//        $(".amenucrearclie").css("color", "White");

//        $("section.sectablas:first").show();
//        $(".amenucrearclie:first").css("background-color", "#BCD4F6");
//        $(".amenucrearclie:first").css("color", "Black");
//    }
//        // BUSCAR
//    else if (e.item.name === "Search") {
//        InitControls();
//        ppcbuscargrupo.Show();
//    }
//    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {

//        Modify();
//        $("section.sectablas").hide();
//        $(".amenucrearclie").css("background-color", "#4F93E3");
//        $(".amenucrearclie").css("color", "White");

//        $("section.sectablas:first").show();
//        $(".amenucrearclie:first").css("background-color", "#BCD4F6");
//        $(".amenucrearclie:first").css("color", "Black");
//    }
//}






function val_general() {
    alert("vamos bien");
    general = this.ID;
    alert("" + general);

   
    
    if (bteBalInvntAc.click) {
        general = "3";
    }
    if (bteSaleCostAc.click) {
        general = "4";
    }
    if (bteTransferAc.click) {
        general = "5";
    }
    if (bteVarianceAc.click) {
        general = "6";
    }
    if (btePriceDifAc.click) {
        general = "7";
    }
    if (bteNegStckAct.click) {
        general = "8";
    }
    if (bteDecreasAc.click) {
        general = "9";
    }
    if (bteIncreasAc.click) {
        general = "10";
    }
    
    if (bteReturnAc.click) {
        general = "11";
    }
    if (betFrRevenuAc.click) {
        general = "12";
    }


    if (bteFrExpensAc.click) {
        general = "13";
    }
    if (bteExchangeAc.click) {
        general = "14";
    }

    if (bteBalanceAcc.click) {
        general = "15";
    }
    if (bteDecresGlAc.click) {
        general = "16";
    }
    if (bteIncresGlAc.click) {
        general = "17";
    }


    if (bteWipAcct.click) {
        general = "18";
    }
    if (bteWipVarAcct.click) {
        general = "19";
    }
    if (bteStokRvlAct.click) {
        general = "20";
    }


    if (bteStkOffsAct.click) {
        general = "21";
    }
    if (bteExpClrAct.click) {
        general = "22";
    }

    if (bteStkInTnAct.click) {
        general = "23";
    }
    if (bteARCMAct.click) {
        general = "24";
    }
    if (bteAPCMAct.click) {
        general = "25";
    }
    if (bteARCMFrnAct.click) {
        general = "26";
    }
    if (bteAPCMFrnAct.click) {
        general = "27";
    }
}
function Get_Cuenta1() {
    gdvAccountsrch.PerformCallback();

}

function Get_GrupoArt() {
    gdvGrupoArt.PerformCallback("SRCH");

}


function Show_RevenuesAc() {
    gdvRevenuesAc.Show();
}
function Show_CuentaSearch2() {
    gdvAccountsrch2.Show();
}

function OkCuenta() {
    var rowc = gdvAccountsrch.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    }
    else if (gdvAccountsrch.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    }
    else {
        gdvAccountsrch.GetRowValues(gdvAccountsrch.GetFocusedRowIndex(), "AcctCode;AcctName;CurrTotal;FormatCode;Project", OnGetRowValuesCuenta);
    }
}
function OnGetRowValuesCuenta(values) {

    if (general == "1") {
        betxtExpensesAc.SetText(values[0]);
        txtExpensesAc.SetText(values[1]);
       
    }
    else if (general == "2") {
        beRevenuesAc.SetText(values[0]);
        txtRevenuesAc.SetText(values[1]);
       
    }
    else if (general == "3") {
        bteBalInvntAc.SetText(values[0]);
        txtBalInvntAc.SetText(values[1]);
        
    }
    else if (general == "4") {
        bteSaleCostAc.SetText(values[0]);
        txtSaleCostAc.SetText(values[1]);
      
    }
    else if (general == "5") {
        bteTransferAc.SetText(values[0]);
        txtTransferAc.SetText(values[1]);
       
    }
    else if (general == "6") {
        bteVarianceAc.SetText(values[0]);
        txtbteVarianceAc.SetText(values[1]);
        
    }
    else if (general == "7") {
        btePriceDifAc.SetText(values[0]);
        txtPriceDifAc.SetText(values[1]);
        
    }

    else if (general == "8") {
        bteNegStckAct.SetText(values[0]);
        txtNegStckAct.SetText(values[1]);
       
    }

    else if (general == "9") {
        bteDecreasAc.SetText(values[0]);
        txtDecreasAc.SetText(values[1]);
       
    }
    else if (general == "10") {
        bteIncreasAc.SetText(values[0]);
        txtIncreasAc.SetText(values[1]);
       
    }
    else if (general == "11") {
        bteReturnAc.SetText(values[0]);
        txtReturnAc.SetText(values[1]);
        
    }
    else if (general == "12") {
        betFrRevenuAc.SetText(values[0]);
        txtFrRevenuAc.SetText(values[1]);
        
    }
    else if (general == "13") {
        bteFrExpensAc.SetText(values[0]);
        txtFrExpensAc.SetText(values[1]);
        
    }
    else if (general == "14") {
        bteExchangeAc.SetText(values[0]);
        txtExchangeAc.SetText(values[1]);
        
    }
    else if (general == "15") {
        bteBalanceAcc.SetText(values[0]);
        txtBalanceAcc.SetText(values[1]);
       
    }
    else if (general == "16") {
        bteDecresGlAc.SetText(values[0]);
        txtDecresGlAc.SetText(values[1]);
       
    }
    else if (general == "17") {
        bteIncresGlAc.SetText(values[0]);
        txtIncresGlAc.SetText(values[1]);
       
    }
    else if (general == "18") {
        bteWipAcct.SetText(values[0]);
        txtWipAcct.SetText(values[1]);
       
    }
    else if (general == "19") {
        bteWipVarAcct.SetText(values[0]);
        txtWipVarAcct.SetText(values[1]);
        
    }
    else if (general == "20") {
        bteStokRvlAct.SetText(values[0]);
        txtStokRvlAct.SetText(values[1]);
        
    }
    else if (general == "21") {
        bteStkOffsAct.SetText(values[0]);
        txtStkOffsAct.SetText(values[1]);
       
    }
    else if (general == "22") {
        bteExpClrAct.SetText(values[0]);
        txtExpClrAct.SetText(values[1]);
       
    }
    else if (general == "23") {
        bteStkInTnAct.SetText(values[0]);
        txtStkInTnAct.SetText(values[1]);
       
    }
    else if (general == "24") {
        bteARCMAct.SetText(values[0]);
        txtARCMAct.SetText(values[1]);
        
    }
    else if (general == "25") {
        bteAPCMAct.SetText(values[0]);
        txtAPCMAct.SetText(values[1]);
       
    }
    else if (general == "26") {
        bteARCMFrnAct.SetText(values[0]);
        txtARCMFrnAct.SetText(values[1]);
        
    }
    else if (general == "27") {
        bteAPCMFrnAct.SetText(values[0]);
        txtAPCMFrnAct.SetText(values[1]);
        
    }



    gdvAccountsrch.SetFocusedRowIndex(-1);
    ppcAccountSearch.Hide();
   
}

function okGrupoArt() {
    var rowc = gdvGrupoArt.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    }
    else if (gdvGrupoArt.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    }
    else {
        gdvGrupoArt.GetRowValues(gdvGrupoArt.GetFocusedRowIndex(), "ItmsGrpCod;ItmsGrpNam;PlaningSys;PrcrmntMtd;OrdrIntrvl;OrdrMulti;MinOrdrQty;LeadTime;ToleranDay;InvntSys;ExpensesAc;ExpensesAcName;RevenuesAc;RevenuesAcName;BalInvntAc;BalInvntAcName;SaleCostAc;SaleCostAcName;TransferAc;TransferAcName;VarianceAc;VarianceAcName;PriceDifAc;PriceDifAcName;NegStckAct;NegStckActName;DecreasAc;DecreasAcName;IncreasAc;IncreasAcName;ReturnAc;ReturnAcName;FrRevenuAc;FrRevenuAcName;FrExpensAc;FrExpensAcName;ExchangeAc;ExchangeAcName;BalanceAcc;BalanceAccName;DecresGlAc;DecresGlAcName;IncresGlAc;IncresGlAcName;WipAcct;WipAcctName;WipVarAcct;WipVarAcctName;StokRvlAct;StokRvlActName;StkOffsAct;StkOffsActName;ExpClrAct;ExpClrActName;StkInTnAct;StkInTnActName;ARCMAct;ARCMActName;APCMAct;APCMActName;ARCMFrnAct;ARCMFrnActName;APCMFrnAct;APCMFrnActName", OnGetRowValuesGrupoArt);

    }
}

function OnGetRowValuesGrupoArt(values) {
    txtCode.SetText(values[0]);
    txtItmsGrpNam.SetText(values[1]);
    cbbPlaningSys.SetValue(values[2]);
    cbbPrcrmntMtd.SetValue(values[3]);
    cbbOrdrIntrvl.SetValue(values[4]);
    txtOrdrMulti.SetText(values[5]);
    txtMinOrdrQty.SetText(values[6]);
    txtLeadTime.SetText(values[7]);
    txtToleranDay.SetText(values[8]);

    betxtExpensesAc.SetText(values[10]);
    txtExpensesAc.SetText(values[11]);
 
    beRevenuesAc.SetText(values[12]);
    txtRevenuesAc.SetText(values[13]);
 
    bteBalInvntAc.SetText(values[14]);
    txtBalInvntAc.SetText(values[15]);
     
    bteSaleCostAc.SetText(values[16]);
    txtSaleCostAc.SetText(values[17]);
    
    bteTransferAc.SetText(values[18]);
    txtTransferAc.SetText(values[19]);
     
    bteVarianceAc.SetText(values[20]);
    txtbteVarianceAc.SetText(values[21]);
   
    btePriceDifAc.SetText(values[22]);
    txtPriceDifAc.SetText(values[23]);
   
    bteNegStckAct.SetText(values[24]);
    txtNegStckAct.SetText(values[25]);
    
    bteDecreasAc.SetText(values[26]);
    txtDecreasAc.SetText(values[27]);
    
    bteIncreasAc.SetText(values[28]);
    txtIncreasAc.SetText(values[29]);
   
    bteReturnAc.SetText(values[30]);
    txtReturnAc.SetText(values[31]);
     
    betFrRevenuAc.SetText(values[32]);
    txtFrRevenuAc.SetText(values[33]);
    
   
    bteFrExpensAc.SetText(values[34]);
    txtFrExpensAc.SetText(values[35]);
    
    
    bteExchangeAc.SetText(values[36]);
    txtExchangeAc.SetText(values[37]);
    
    
    bteBalanceAcc.SetText(values[38]);
    txtBalanceAcc.SetText(values[39]);
     
    
     bteDecresGlAc.SetText(values[40]);
     txtDecresGlAc.SetText(values[41]);
    
     bteIncresGlAc.SetText(values[42]);
     txtIncresGlAc.SetText(values[43]);
     
     bteWipAcct.SetText(values[44]);
     txtWipAcct.SetText(values[45]);
    
     bteWipVarAcct.SetText(values[46]);
     txtWipVarAcct.SetText(values[47]);
    
     bteStokRvlAct.SetText(values[48]);
     txtStokRvlAct.SetText(values[49]);
        
   
     bteStkOffsAct.SetText(values[50]);
     txtStkOffsAct.SetText(values[51]);
     
     bteExpClrAct.SetText(values[52]);
     txtExpClrAct.SetText(values[53]);
      
    
      bteStkInTnAct.SetText(values[54]);
      txtStkInTnAct.SetText(values[55]);
      
     bteARCMAct.SetText(values[56]);
     txtARCMAct.SetText(values[57]);
      
  
     bteAPCMAct.SetText(values[58]);
     txtAPCMAct.SetText(values[59]);
      
     bteARCMFrnAct.SetText(values[60]);
     txtARCMFrnAct.SetText(values[61]);
     
    
     bteAPCMFrnAct.SetText(values[62]);
     txtAPCMFrnAct.SetText(values[63]);
     


    mnuOper.GetItemByName("Save").SetText("Modificar");
    gdvGrupoArt.SetFocusedRowIndex(-1);
    ppcbuscargrupo.Hide();
}
//function SaveItems() {
//    clbOperation.PerformCallback("SaveItem");
//}
//function Save() {
//    SaveItems();
//    ClearControl();
//}

function Com_Operation(s, e) {
    ldpProcess.Hide();
    var _spd = "";
    if (e.result.indexOf("OKBP") !== -1) {
        
        alert("Grupo de Articulos creado con éxito!");
        ClearControl();
    }
    else if (e.result.indexOf("OKUPDBP") !== -1) {
        alert("Grupo de Articulos modificado con éxito!");
        ClearControl();
    }
    else {
        alert(e.result);
    }
}



function showsearchaGrupoArt() {
    ppcbuscargrupo.Show();
}






function OkCuenta2() {
    var rowc = gdvAccountsrch2.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.");
    }
    else if (gdvAccountsrch2.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.");
    }
    else {
        gdvAccountsrch2.GetRowValues(gdvAccountsrch2.GetFocusedRowIndex(), "AcctCode;AcctName;CurrTotal;FormatCode;Project", OnGetRowValuesCuenta2);
    }
}

function OnGetRowValuesCuenta2(values) {
    if (!isNullOrWhiteSpace(values[0])) {
        txtShortname.SetText(values[0]);
        txtAcctName.SetText(values[1]);
        txtAccount.SetText(values[3]);
        txtProjectmodo.SetText(values[4]);

    }

    gdvAccountsrch2.SetFocusedRowIndex(-1);
    ppcAccountSearch2.Hide();
   
}


function Show_AccountSearch() {
    general = "1";
    ppcAccountSearch.Show();
  
}
function Show_AccountSearch2() {

    general = "2";
    ppcAccountSearch.Show();
}
function Show_AccountSearch3() {

    general = "3";
    ppcAccountSearch.Show();
}
function Show_AccountSearch4() {

    general = "4";
    ppcAccountSearch.Show();
}
function Show_AccountSearch5() {

    general = "5";
    ppcAccountSearch.Show();
}
function Show_AccountSearch6() {

    general = "6";
    ppcAccountSearch.Show();
}
function Show_AccountSearch7() {

    general = "7";
    ppcAccountSearch.Show();
}
function Show_AccountSearch8() {

    general = "8";
    ppcAccountSearch.Show();
} 
function Show_AccountSearch9() {

    general = "9";
    ppcAccountSearch.Show();
}
function Show_AccountSearch10() {

    general = "10";
    ppcAccountSearch.Show();
}
function Show_AccountSearch11() {

    general = "11";
    ppcAccountSearch.Show();
}
function Show_AccountSearch12() {

    general = "12";
    ppcAccountSearch.Show();
}
function Show_AccountSearch13() {

    general = "13";
    ppcAccountSearch.Show();
}
function Show_AccountSearch14() {

    general = "14";
    ppcAccountSearch.Show();
}
function Show_AccountSearch15() {

    general = "15";
    ppcAccountSearch.Show();
}
function Show_AccountSearch16() {

    general = "16";
    ppcAccountSearch.Show();
}
function Show_AccountSearch17() {

    general = "17";
    ppcAccountSearch.Show();
}
function Show_AccountSearch18() {

    general = "18";
    ppcAccountSearch.Show();
}
function Show_AccountSearch19() {

    general = "19";
    ppcAccountSearch.Show();
}
function Show_AccountSearch20() {

    general = "20";
    ppcAccountSearch.Show();
}
function Show_AccountSearch21() {

    general = "21";
    ppcAccountSearch.Show();
}
function Show_AccountSearch22() {

    general = "22";
    ppcAccountSearch.Show();
}
function Show_AccountSearch23() {

    general = "23";
    ppcAccountSearch.Show();
}
function Show_AccountSearch24() {

    general = "24";
    ppcAccountSearch.Show();
}
function Show_AccountSearch25() {

    general = "25";
    ppcAccountSearch.Show();
}
function Show_AccountSearch26() {

    general = "26";
    ppcAccountSearch.Show();
}
function Show_AccountSearch27() {

    general = "27";
    ppcAccountSearch.Show();
}



function CancelCuenta() {
    gdvAccountsrch.Hide;
}

function calcelgrupoart() {
    gdvGrupoArt.Hide;
}
function CancelCuenta2() {
    gdvAccountsrch2.Hide;
}
function Show_CuentaSearch() {
    
    gdvAccountsrch.Show();
}
function Show_CuentaSearch2() {
    gdvAccountsrch2.Show();
}

function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Gestion/GrupoArt.aspx/GET_VALORES_GRUPO_ART",
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
    txtCode.SetEnabled(false);
    txtMinOrdrQty.SetText("0.0");
    txtOrdrMulti.SetText("0.0");
    beRevenuesAc.SetText("701211");
    txtRevenuesAc.SetText("Terceros");
    bteBalInvntAc.SetText("201111");
    txtBalInvntAc.SetText("Mercadería - costo");
    bteSaleCostAc.SetText("691211");
    txtSaleCostAc.SetText("Terceros");
    bteTransferAc.SetText("421101");
    txtTransferAc.SetText("No emitidas");
    btePriceDifAc.SetText("659301");
    txtPriceDifAc.SetText("Otros gastos de gestión");
    bteReturnAc.SetText("701211");
    txtReturnAc.SetText("Terceros");
    betFrRevenuAc.SetText("701111");
    txtFrRevenuAc.SetText("Terceros");
    bteExchangeAc.SetText("676101");
    txtExchangeAc.SetText("Diferencia de cambio");
    bteWipAcct.SetText("231111");
    txtWipAcct.SetText("Productos en proceso - costo")
    bteStkInTnAct.SetText("281101");
    txtStkInTnAct.SetText("Mercaderías");
    bteARCMAct.SetText("701211");
    txtARCMAct.SetText("Terceros");
    bteARCMFrnAct.SetText("701111");
    txtARCMFrnAct.SetText("Terceros");
    
   
    var _rs1 = result.d.where(function (item) { return (item.CLAVE === "IN"); });
    cbbOrdrIntrvl.BeginUpdate();
    cbbOrdrIntrvl.ClearItems();
    _rs1.forEach(function (item) {
        cbbOrdrIntrvl.AddItem(item.VALOR, item.INDEX);
    });
    cbbOrdrIntrvl.EndUpdate();
    cbbOrdrIntrvl.SetValue(0);

    

}
function Set_VisibleOption() {
    mnuOper.GetItemByName("Cancel").SetVisible(false);
    mnuOper.GetItemByName("Duplicate").SetVisible(true);
    mnuOper.GetItemByName("Export").SetVisible(false);
    mnuOper.GetItemByName("PaymentIn").SetVisible(false);
    mnuOper.GetItemByName("Print").SetVisible(false);
    mnuOper.GetItemByName("CopyFrom").SetVisible(false);
    mnuOper.GetItemByName("CopyTo").SetVisible(false);
    mnuOper.GetItemByName("Recursos").SetVisible(false);

    mnuOper.GetItemByName("Export").SetEnabled(false);
    mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
    mnuOper.GetItemByName("Print").SetEnabled(false);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
    mnuOper.GetItemByName("CopyTo").SetEnabled(false);
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

    txtItmsGrpNam.SetText("");
    cbbPlaningSys.SetValue("N");
    cbbPrcrmntMtd.SetValue("M");
    cbbOrdrIntrvl.SetText("");
    txtOrdrMulti.SetText("");
    txtMinOrdrQty.SetText("");
    txtLeadTime.SetText("");
    txtToleranDay.SetText("");

    betxtExpensesAc.SetText("");
    betxtExpensesAc.SetValue("");
    txtExpensesAc.SetText("");

    bteVarianceAc.SetText("");
    bteVarianceAc.SetValue("");
    txtbteVarianceAc.SetText("");

    bteNegStckAct.SetText("");
    bteNegStckAct.SetValue("");
    txtNegStckAct.SetText("");

    bteDecreasAc.SetText("");
    bteDecreasAc.SetValue("");
    txtDecreasAc.SetText("");

    bteIncreasAc.SetText("");
    bteIncreasAc.SetValue("");
    txtIncreasAc.SetText("");

    bteFrExpensAc.SetText("");
    bteFrExpensAc.SetValue("");
    txtFrExpensAc.SetText("");

    bteBalanceAcc.SetText("");
    bteBalanceAcc.SetValue("");
    txtBalanceAcc.SetText("");

    bteDecresGlAc.SetText("");
    bteDecresGlAc.SetValue("");
    txtDecresGlAc.SetText("");

    bteIncresGlAc.SetText("");
    bteIncresGlAc.SetValue("");
    txtIncresGlAc.SetText("");

    bteWipVarAcct.SetText("");
    txtWipVarAcct.SetText("");
    bteWipVarAcct.SetValue("");

    bteStokRvlAct.SetText("");
    bteStokRvlAct.SetValue("");
    txtStokRvlAct.SetText("");


    bteStkOffsAct.SetText("");
    txtStkOffsAct.SetText("");
    bteStkOffsAct.SetValue("");

    bteExpClrAct.SetText("");
    bteExpClrAct.SetValue("");
    txtExpClrAct.SetText("");


    bteAPCMAct.SetText("");
    bteAPCMAct.SetValue("");
    txtAPCMAct.SetText("");


    bteAPCMFrnAct.SetText("");
    bteAPCMFrnAct.SetValue("");
    txtAPCMFrnAct.SetText("");









    mnuOper.GetItemByName("Save").SetText("Crear");
    gdvGrupoArt.PerformCallback("CLR");
    
}

function InitControls() {
    txtCode.SetEnabled(false);
    txtItmsGrpNam.SetText("");
    cbbPlaningSys.SetValue("N");
    cbbPrcrmntMtd.SetValue("M");
    cbbOrdrIntrvl.SetText("");
    txtOrdrMulti.SetText("");
    txtMinOrdrQty.SetText("");
    txtLeadTime.SetText("");
    txtToleranDay.SetText("");

    betxtExpensesAc.SetText("");
    betxtExpensesAc.SetValue("");
    txtExpensesAc.SetText("");

    bteVarianceAc.SetText("");
    bteVarianceAc.SetValue("");
    txtbteVarianceAc.SetText("");

    bteNegStckAct.SetText("");
    bteNegStckAct.SetValue("");
    txtNegStckAct.SetText("");

    bteDecreasAc.SetText("");
    bteDecreasAc.SetValue("");
    txtDecreasAc.SetText("");

    bteIncreasAc.SetText("");
    bteIncreasAc.SetValue("");
    txtIncreasAc.SetText("");

    bteFrExpensAc.SetText("");
    bteFrExpensAc.SetValue("");
    txtFrExpensAc.SetText("");

    bteBalanceAcc.SetText("");
    bteBalanceAcc.SetValue("");
    txtBalanceAcc.SetText("");

    bteDecresGlAc.SetText("");
    bteDecresGlAc.SetValue("");
    txtDecresGlAc.SetText("");

    bteIncresGlAc.SetText("");
    bteIncresGlAc.SetValue("");
    txtIncresGlAc.SetText("");

    bteWipVarAcct.SetText("");
    txtWipVarAcct.SetText("");
    bteWipVarAcct.SetValue("");

    bteStokRvlAct.SetText("");
    bteStokRvlAct.SetValue("");
    txtStokRvlAct.SetText("");


    bteStkOffsAct.SetText("");
    txtStkOffsAct.SetText("");
    bteStkOffsAct.SetValue("");

    bteExpClrAct.SetText("");
    bteExpClrAct.SetValue("");
    txtExpClrAct.SetText("");


    bteAPCMAct.SetText("");
    bteAPCMAct.SetValue("");
    txtAPCMAct.SetText("");


    bteAPCMFrnAct.SetText("");
    bteAPCMFrnAct.SetValue("");
    txtAPCMFrnAct.SetText("");


    txtMinOrdrQty.SetText("0.0");
    txtOrdrMulti.SetText("0.0");


    beRevenuesAc.SetText("701211");
    txtRevenuesAc.SetText("Terceros");
    bteBalInvntAc.SetText("201111");
    txtBalInvntAc.SetText("Mercadería - costo");
    bteSaleCostAc.SetText("691211");
    txtSaleCostAc.SetText("Terceros");
    bteTransferAc.SetText("421101");
    btePriceDifAc.SetText("659301");
    txtPriceDifAc.SetText("Otros gastos de gestión");
    bteReturnAc.SetText("701211");
    txtReturnAc.SetText("Terceros");
    betFrRevenuAc.SetText("701111");
    txtFrRevenuAc.SetText("Terceros");
    bteExchangeAc.SetText("676101");
    txtExchangeAc.SetText("Diferencia de cambio");
    bteWipAcct.SetText("231111");
    txtWipAcct.SetText("Productos en proceso - costo")
    bteStkInTnAct.SetText("281101");
    txtStkInTnAct.SetText("Mercaderías");
    bteARCMAct.SetText("701211");
    txtARCMAct.SetText("Terceros");
    bteARCMFrnAct.SetText("701111");
    txtARCMFrnAct.SetText("Terceros");


   
    cbbOrdrIntrvl.SetValue(0);



}
function Save() {
    clbOperation.PerformCallback("SaveItems");
    InitControls();
    
}
function Modificar() {
    clbOperation.PerformCallback("Modify");
    
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save" && e.item.GetText() === "Crear") {
        Save();
        InitControls();
    }
        // NUEVO
    else if (e.item.name === "New") {
        InitControls();
        mnuOper.GetItemByName("Save").SetText("Crear");
    }
        // BUSCAR
    else if (e.item.name === "Search") {
        //InitControls();
        //txtnombregrupo.SetText("");
        showsearchaGrupoArt();
    }
    else if (e.item.name === "Duplicate") {
        txtItmsGrpNam.SetText("");
        mnuOper.GetItemByName("Save").SetText("Crear");

    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
        Modificar();
    }
}


function ProcessKeyPress(s, e) {
    var charCode = (e.htmlEvent.which) ? e.htmlEvent.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        _aspxPreventEvent(e.htmlEvent);
}

//function Com_Operation(s, e) {
//    ldpProcess.Hide();
//    var _spd = "";
//    if (e.result.indexOf("OKBP") !== -1) {
//        _spd = e.result.split("#");
//        txtidllamada.SetText(_spd[1]);
//        alert("¡Asiento creado con éxito!");
//    }
//    else if (e.result.indexOf("IKCC") !== -1) {
//        //_spd = e.result.split("#");
//        //txtidllamada.SetText(_spd[1]);
//        alert("¡Asiento Modificado con éxito!");
//    }
//    else {
//        alert(e.result);
//    }
//}
function CancelClientCr() {
    ppcClientCr.Hide();
}
function ClearControlsClient() {
    
}

function fincallback(s, e) {
    alert(e.result);
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
