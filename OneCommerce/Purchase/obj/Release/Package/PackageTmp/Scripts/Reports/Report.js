var _vld = [3];
$(document).ready(function () {
//    Get_CreditTarject();
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
function Set_DateChange(s,e) {
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
    if (typeof(s.cpError) !== "undefined"){
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