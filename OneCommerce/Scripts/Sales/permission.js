var _vld = [];
$(document).ready(function () {

    getdatos();
});
function getdatos() { 
    $.ajax(
    {
        type:"POST",
        url: "../Account/WebForm1.aspx/getdatos",
        // data: '{"socied":"' + socied + '"}',
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            setdatos(result);
        },
        error: function (result) {
            alert(result);
        }
    
    });
}
function setdatos(result) {
    var ext = result.d;
    cbouser.BeginUpdate();
    cbouser.ClearItems();
    $.each(ext, function (index, item) {
        cbouser.AddItem(item.Name, item.Name);
//        if (item.Dfault === 1) {
//            _vld[0] = item.Code;

//        }
    });
    cbouser.EndUpdate();
    cbouser.SetValue('aandrade');
   // jose();
}
function Get_Permisos() {
    dgPermisos.SetFocusedRowIndex(-1);
    dgPermisos.PerformCallback();
}
