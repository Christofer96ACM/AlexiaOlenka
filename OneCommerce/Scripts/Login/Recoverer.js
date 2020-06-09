$(document).ready(function () {
    //txtruc.SetFocus();
});

function Init_Session() {
    //alert("HOLA");
    ldpLoading.Show();
    clbSession.PerformCallback();
}

function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
function CallbackComplete(s, e) {
    //alert("SIU");
    if (!isNullOrWhiteSpace(e.result) && e.result.indexOf("PERM") === -1) {
        //alert("SIU");
        ldpLoading.Hide();
        
    }
   
    var _spd = e.result.split("#");
    alert(_spd[1]);
    if (_spd[0] === "PERM") {
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