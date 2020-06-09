var _vld = [8];
var _dcs = [];
var _vld = [8];
var ult = 0;
$(document).ready(function () {
    try {
       
        InitControls();

    } catch (e) {
        alert(e.Message);
    }
});
function cambio_usuario() {
    gdvPermisos.PerformCallback("GET");
}
function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}

function InitControls() {
    //cbbUsuario.PerformCallback("GET");
}

function ProcessKeyPress(s, e) {
    var charCode = (e.htmlEvent.which) ? e.htmlEvent.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        _aspxPreventEvent(e.htmlEvent);
}


