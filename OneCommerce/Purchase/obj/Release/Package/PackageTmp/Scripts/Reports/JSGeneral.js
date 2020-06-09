var _vld = [8];
var DIRECCIONES = "";
var _dcs = [];
var _vld = [8];
var ult = 0;
var _vld = [3];
$(document).ready(function () {
    //pestañascrearclie();
    try {
        //_vld[4] = hdfTemp.Get("_emid");
        //_vld[6] = hdfTemp.Get("_soci");

        //txtDolar.SetText("0.00");
        //txtEuro.SetText("0.00");


    } catch (e) {
        alert(e.Message);
    }
});


function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
function SearchCloseBox() {
    var isValid = ASPxClientEdit.ValidateGroup("ValEdit");
    if (!isValid || dteDateIn.GetDate() > dteDateFi.GetDate()) {
        alert("Rango de fechas incorrecto.");
    }
    else {
        gdvData.PerformCallback();
    }
}
function Set_DateChange(s, e) {
    dteDateFi.SetDate(s.GetDate());
}
function SearchInventory() {
    gdvData.PerformCallback();
}

// MEDIOS DE PAGO
function Get_CreditTarject() {
    $.ajax(
        {
            type: "POST",
            url: "../../Default.aspx/Get_CreditTarject",
            data: '{}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                cbbCreditCard.BeginUpdate();
                $.each(result.d, function (i, item) {
                    cbbCreditCard.AddItem(item.CardName, item.CreditCard);
                    if (item.SelVal === 1) {
                        _vld[0] = item.CreditCard;
                    }
                });
                cbbCreditCard.EndUpdate();
                cbbCreditCard.SetValue(_vld[0]);
            },
            error: function (result) {
                alert(result);
            }
        });
}
function Med_Payment(name, DocEntry, PendingBal) {
    if (PendingBal !== 0) {
        _vld[1] = DocEntry;
        _vld[2] = PendingBal;
        pgcPayment.GetTab(0).SetEnabled(true);
        pgcPayment.GetTab(1).SetEnabled(true);
        if (name === "efc") {
            txtSalEfe.SetText(PendingBal);
            pgcPayment.SetActiveTabIndex(0);
            pgcPayment.GetTab(1).SetEnabled(false);
        }
        else {
            cbbCreditCard.SetValue(_vld[0]);
            txtCardNum.SetText("");
            txtSalTacre.SetText(PendingBal);
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
        if (parseFloat(txtSalEfe.GetValue()) <= 0 && parseFloat(txtSalEfe.GetValue()) > parseFloat(_vld[2])) {
            alert("Ingrese monto mayor a cero y\nmenor o igual al saldo pendiente.");
            return;
        }
    }
    else {
        if (parseFloat(txtSalTacre.GetValue()) <= 0 && parseFloat(txtSalTacre.GetValue()) > parseFloat(_vld[2])) {
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
    gdvData.PerformCallback("pg:" + _vld[1]);
    ppcPayment.Hide();
}

function End_Payment(s, e) {
    if (typeof (s.cpError) !== "undefined") {
        ldpProcess.Hide();
        var errText = s.cpError;
        if (errText.indexOf("OKP") !== -1) {
            alert("Operación concretada con exito...!!");
        }
        else {
            alert(e.result);
        }
    }
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
    //ClearControlsClient();
}


function Set_VisibleOption() {
    mnuOper.GetItemByName("Quote").SetVisible(false);
    mnuOper.GetItemByName("OrderTo").SetVisible(false);
    mnuOper.GetItemByName("DeliveryNote").SetVisible(false);
    mnuOper.GetItemByName("Cancel").SetVisible(false);
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
    }
        // NUEVO
    else if (e.item.name === "New") {
        //ClearControl();
    }
        // BUSCAR
    else if (e.item.name === "Search") {
        
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {

        

    }
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

