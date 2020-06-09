$(document).ready(function () {
    txtruc.SetFocus();
});

function Sel_Local() {
    var _sc = txtruc.GetText();
    cbbProject.ClearItems();
    cbbProject.BeginUpdate();
    $.each(hdfLocal.Get("_lcl"), function (i, item) {
        var _spl = item.split(",");
        if (_spl[9] === _sc) {
            cbbProject.AddItem(_spl[1], _spl[0]);
        }
    });
    cbbProject.SetSelectedIndex(0);
    cbbProject.EndUpdate();
    
    window.setTimeout("tbUserName.Focus()", 100);
    window.setTimeout("tbUserName.SelectAll()", 100);
}

function Sel_Project() {
    window.setTimeout("tbUserName.Focus()", 100);
    window.setTimeout("tbUserName.SelectAll()", 100);
}

function Init_Session() {
    
    ldpLoading.Show();
    var par = cbbProject.GetValue().toString() + ";" + cbbProject.GetSelectedItem().text;
    //hdfLocal.Set("_proyc", cbbProject.GetText());
    
    hdfLocal.Set("_proyc", $('#cbbProject option:selected').text());
    clbSession.PerformCallback(par);
}

function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
function CallbackComplete(s, e) {

 
    if (e.result.indexOf("USI") !== -1) {
       
        ldpLoading.Hide();
        tbUserName.errorText = "Usuario Incorrecto";
        tbPassword.errorText = "Password Incorrecto";
        tbUserName.SetIsValid(false);
        tbPassword.SetIsValid(false);
    }
    else if (e.result.indexOf("Val") !== -1) {
        ldpLoading.Hide();
        
        tbUserName.errorText = "Usuario no tiene permiso para este local";
        //tbPassword.errorText = "Usuario no tiene permiso para este local";
        tbUserName.SetIsValid(false);
       // tbPassword.SetIsValid(false);
    }
    else if (!isNullOrWhiteSpace(e.result) && e.result.indexOf("PERM") === -1) {
       
        ldpLoading.Hide();
        alert(e.result);
    }
   
        var _spd = e.result.split("#");
        if (_spd[1] === "001") {
            $(location).attr('href', '../Account/Inicio.aspx');
        }
        else {
            //$(location).attr('href', '../Sales/ARInvoice.aspx');
        }       
}

function cargarLocales() {
     var ruc = txtruc.GetText().length;
     if (ruc == 11) {
         //alert("LENGTH DE RUC " + ruc);
         //Sel_Local();
         cbbProject.PerformCallback("Locales");
    }
    else {
        //alert("SON 11 DIGITOS " + ruc);
    }
}