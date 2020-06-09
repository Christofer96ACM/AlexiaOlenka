var _dcs = [];
var _vld = [7];
$(document).ready(function () {
    try {
        _vld[4] = hdfTemp.Get("_emid");
        _vld[6] = hdfTemp.Get("_soci");
        //        Get_DocumentType();
        //        Get_InitialData();
        //        InitControls();
        Set_VisibleOption();
        Get_InitialLugar();
        Get_InitialData();
        Get_InitialDataTipoCliente();
        //       
    } catch (e) {
        alert(e.Message);
    }
});
function Get_InitialLugar() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Sales/RegisterConsult1.aspx/Get_Dat_prov",
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
                    _vld[1] = item.U_BIZ_CODE;
                }
            });
            Set_Lugar_Prov();
        },
        error: function (result) {
            alert(result);
        }
    });
}
//DATOS INICIALES
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Sales/RegisterConsult1.aspx/Get_InitialData",
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
//DATOS INICIALES TIPO CLIENTE
function Get_InitialDataTipoCliente() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Sales/RegisterConsult1.aspx/Get_InitialTipClie",
        data: '{"socied":"' + socied + '"}',
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            Set_InitialDataTipoCliente(result);
        },
        error: function (result) {
            alert(result);
        }
    });
}
function Set_InitialDataTipoCliente(result) {
    //Tipo de Cliente
    var _rs = result.d.where(function (item) { return (item.Ident === "VR"); });
    cbbCrPersonType.ClearItems();
    cbbCrPersonType.BeginUpdate();
    $.each(_rs, function (index, item) {
        cbbCrPersonType.InsertItem(index, item.Name, item.empID);
        if (item.Dfault === 1) {
            _vld[10] = item.empID;
        }
    });
    cbbCrPersonType.EndUpdate();
    cbbCrPersonType.SetValue(_vld[10]);
    Get_CrDocumentType();
    
}
function Set_InitialData(result) {
    //Responsable de Venta
    var _rs = result.d.where(function (item) { return (item.Ident === "VR"); });
    cboresponsableventa.ClearItems();
    cboresponsableventa.BeginUpdate();
    $.each(_rs, function (index, item) {
        cboresponsableventa.InsertItem(index, item.Name, item.empID);
        if (item.Dfault === 1) {
            _vld[2] = item.Code;
        }
    });
    cboresponsableventa.EndUpdate();
    cboresponsableventa.SetValue(_vld[4]);

    //Linea de negocio
    _rs = result.d.where(function (item) { return (item.Ident === "BS"); });
    cbonegocio.ClearItems();
    cbonegocio.BeginUpdate();
    $.each(_rs, function (index, item) {
        cbonegocio.InsertItem(index, item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[0] = item.Code;
        }
    });
    cbonegocio.EndUpdate();
    cbonegocio.SetValue(_vld[0]);
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save") {
        Set_ClientCr()
    }
    // NUEVO
    else if (e.item.name === "New") {
        ClearControlsClient();
    }
    // BUSCAR

}
function Get_CrDocumentType() {
    cbbCrDocumentType.ClearItems();
    if (cbbCrPersonType.GetValue() === 'TPJ') {
        cbbCrDocumentType.AddItem("RUC", 6);
        cbbCrDocumentType.SetSelectedIndex(0);
    }
    else {
        cbbCrDocumentType.AddItem("DNI", 1);
        cbbCrDocumentType.AddItem("RUC", 6);
        cbbCrDocumentType.SetSelectedIndex(0);
    }
    Val_Tip_Clie();
}
function Set_Lugar(result) {
    //Lista de Lugar
    var _rs = result.d.where(function (item) { return (item.Code === "dep"); });
    cbodepartamento.ClearItems();
    cbodepartamento.BeginUpdate();
    $.each(_rs, function (index, item) {
        cbodepartamento.InsertItem(index, item.U_BIZ_NODE, item.U_BIZ_CODE);
        if (item.Dfault === 1) {
            _vld[0] = item.U_BIZ_CODE;
        }
    });
    cbodepartamento.EndUpdate();
    cbodepartamento.SetValue(_vld[0]);
}
function Set_Lugar_Prov() {
    var _tdc = cbodepartamento.GetValue();
    var _ser = $.grep(_dcs, function (item, i) {
        return (item[2] === _tdc);
    });
    cboprovincia.BeginUpdate();
    cboprovincia.ClearItems();
    $.each(_ser, function (index, item) {
        cboprovincia.InsertItem(index, item[1], item[0]);
    });
    cboprovincia.EndUpdate();
    cboprovincia.SetSelectedIndex(0);
    Set_Lugar_Disti();
}

function Set_Lugar_Disti() {

    var socied = hdfTemp.Get("_soci");
    var provs = cboprovincia.GetValue();
    $.ajax(
    {
        type: "POST",
        url: "../Sales/RegisterConsult1.aspx/Get_InitialDistri",
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
//        if (item.Dfault === 1) {
//            _vld[0] = item.U_BIZ_CODE;
//        }
    });
    cbodistrito.EndUpdate();
    //    cbodistrito.SetValue(_vld[0]);
    cbodistrito.SetSelectedIndex(0);
}

function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
//ELEMENT DISTINCT
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

function CancelClient() {
    ppcClientSearch.Hide();
}

function Com_Operation(s, e) {
    ldpProcess.Hide();
    if (e.result.indexOf("OKBP") !== -1) {
        alert("Completado con exito...!!");
        bloquear(false);
        mnuOper.GetItemByName("Save").SetEnabled(false);

    }
    else {
        alert(e.result);
    }
}
function Set_VisibleOption() {
    mnuOper.GetItemByName("Quote").SetVisible(false);
    mnuOper.GetItemByName("OrderTo").SetVisible(false);
    mnuOper.GetItemByName("DeliveryNote").SetVisible(false);
    mnuOper.GetItemByName("Cancel").SetVisible(false);
    mnuOper.GetItemByName("PaymentIn").SetVisible(false);
    mnuOper.GetItemByName("CopyTo").SetVisible(false);
    mnuOper.GetItemByName("CopyFrom").SetVisible(false);
    mnuOper.GetItemByName("Print").SetVisible(false);
    mnuOper.GetItemByName("Export").SetVisible(false);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Search").SetVisible(false);
}
function Val_Tip_Clie() {
    if (cbbCrDocumentType.GetValue()== 6) {
        txtapepater.SetEnabled(false);
        txtapemater.SetEnabled(false);
        rbtnsexo.SetEnabled(false);
    } else {
        txtapepater.SetEnabled(true);
        txtapemater.SetEnabled(true);
        rbtnsexo.SetEnabled(true);
    }
}
function Set_ClientCr() {
    var _val = ASPxClientEdit.ValidateGroup("ValCrClient");
    if (_val) {
        var _doc = txtCrLicTradNum.GetText();
        var _tp = cbbCrPersonType.GetValue();
        var _ixdt = cbbCrDocumentType.GetSelectedIndex();
        if (_tp === "TPJ") {
            _val = ValRuc(_doc);
        }
        else {
            if (_ixdt === 0) {
                _val = (_doc.length === 8);
            }
            else {
                _val = ValRuc(_doc);
            }
        }

        if (!_val) {
            alert("Nro. Documento incorrecto.");
        }
        else {
            var conf = confirm("Esta seguro(a) de registrar una nueva consulta (los datos no se podran modificar).\n¿Desea continuar?");
            if (conf) {
                 ldpProcess.SetText("Creando, espere por favor...");
                ldpProcess.Show();
                clbOperation.PerformCallback("CrClient");
            }
           
            //ppcClientCr.Hide();
        }
    }
}
function CancelClientCr() {
    ppcClientCr.Hide();
}
function Key_CrLicTradNum(s, e) {
    var _crd = "N" + s.GetText();
    txtCrCardCode.SetText(_crd);
}
function Key_CrCardName(s, e) {
    s.SetText(s.GetText().toUpperCase());
}

function ProcessKeyPress(s, e) {
    var charCode = (e.htmlEvent.which) ? e.htmlEvent.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        _aspxPreventEvent(e.htmlEvent);
}
function Key_app(s, e) {
    s.SetText(s.GetText().toUpperCase());
}
function Key_apm(s, e) {
    s.SetText(s.GetText().toUpperCase());
}
function select_distrito() {
    hdfTemp.Set("_distri", cbodistrito.GetText())
}
function bloquear(enb) {
    txtCrCardCode.SetEnabled(enb);
    txtCrCardName.SetEnabled(enb);
    txtCrLicTradNum.SetEnabled(enb);
    txtCrCellular.SetEnabled(enb);
    txtCrE_Mail.SetEnabled(enb);
    txtCrPhone1.SetEnabled(enb);
    txtapepater.SetEnabled(enb);
    txtapemater.SetEnabled(enb);
    txtnombredirec.SetEnabled(enb);
    txtreferencia.SetEnabled(enb);
    memocoment.SetEnabled(enb);
    rbtnsexo.SetEnabled(enb);
    rbttipovilla.SetEnabled(enb);
    cbodepartamento.SetEnabled(enb);
    cboprovincia.SetEnabled(enb);
    cbodistrito.SetEnabled(enb);
    cboresponsableventa.SetEnabled(enb);
    cbonegocio.SetEnabled(enb);
    cbbCrDocumentType.SetEnabled(enb);
    cbbCrPersonType.SetEnabled(enb);
}
function ClearControlsClient() {
    txtCrCardCode.SetText("");
    txtCrCardName.SetText("");
    txtCrLicTradNum.SetText("");
    txtCrCellular.SetText("");
    txtCrE_Mail.SetText("");
    txtCrPhone1.SetText("");
    txtapepater.SetText("");
    txtapemater.SetText("");
    txtnombredirec.SetText("");
    txtreferencia.SetText("");
    memocoment.SetText("");
    rbtnsexo.SetSelectedIndex(0);
    rbttipovilla.SetSelectedIndex(0);
    cbodepartamento.SetSelectedIndex(14);
    Set_Lugar_Prov();
    Set_Lugar_Disti();
    cboresponsableventa.SetValue(_vld[4]);
    cbonegocio.SetSelectedIndex(1);
    bloquear(true);
    cbbCrPersonType.SetValue(_vld[10]);
    Get_CrDocumentType();
    mnuOper.GetItemByName("Save").SetEnabled(true);
}