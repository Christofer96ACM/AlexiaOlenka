﻿var _vld = [8];
var DIRECCIONES = "";
$(document).ready(function () {
    pestañascrearclie();
    try {
        
        //_vld[4] = hdfTemp.Get("_emid");
        //_vld[6] = hdfTemp.Get("_soci");
        //Get_DEPARTAMENTOS_JS();
        //GET_PROVINCIAS_JS2('');
        //GET_DISTRITOS_JS2('');
        //Init_ClientCr();
        Set_VisibleOption();
        //gdvCrearUrbanizacion.PerformCallback("INIT");
        //Get_InitialData();
        //InitControls();

    } catch (e) {
        alert(e.Message);
    }
});
function Set_VisibleOption() {
    mnuOper.GetItemByName("Cancel").SetVisible(false);
    mnuOper.GetItemByName("Duplicate").SetVisible(false);
    mnuOper.GetItemByName("Export").SetVisible(false);
    mnuOper.GetItemByName("PaymentIn").SetVisible(false);
    mnuOper.GetItemByName("Print").SetVisible(false);
    mnuOper.GetItemByName("CopyFrom").SetVisible(false);
    mnuOper.GetItemByName("CopyTo").SetVisible(false);
    mnuOper.GetItemByName("Recursos").SetVisible(false);
    mnuOper.GetItemByName("Save").SetVisible(false);
    mnuOper.GetItemByName("New").SetVisible(false);
    mnuOper.GetItemByName("Search").SetVisible(false);

    mnuOper.GetItemByName("Export").SetEnabled(false);
    mnuOper.GetItemByName("PaymentIn").SetEnabled(false);
    mnuOper.GetItemByName("Print").SetEnabled(false);
    mnuOper.GetItemByName("CopyFrom").SetEnabled(false);
    mnuOper.GetItemByName("CopyTo").SetEnabled(false);
}
function InitControls() {
    ClearControlsClient();
    txtcoddep.SetText("");
    btedepartamento.SetText("");
    txtcodprov.SetText("");
    bteprovincia.SetText("");
    txtcoddit.SetText("");
    btedistrito.SetText("");
    txturbacrear.SetText("");
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
function Get_InitialData() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Masters/Client.aspx/Get_InitialData",
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
    dteCrU_PN_FecNac.SetDate(new Date());
    //ActiveDirec.SetValue("Activo");
    //txtQuantityKit.SetVisible(false);
    //tetU_BF_HCFI.SetEnabled(false);

    /*txtConsigDni.SetEnabled(false);
    txtU_BIZ_SOLI.SetEnabled(false);
    txtConsigCity.SetEnabled(false);
    
    bteU_BIZ_MEDI.SetEnabled(false);
    txtU_BIZ_COLE.SetEnabled(false);
    txtU_BIZ_ESPE.SetEnabled(false);
    txtU_BIZ_DIRE_MED.SetEnabled(false);
    txtU_BF_CREDBM.SetText("0");*/

    /*if (hdfTemp.Get("_perm") !== "001") {
        chkPromotion.SetChecked(false);
        chkPromotion.SetEnabled(false);
    }*/

    //var _rs = result.d.where(function (item) { return (item.Ident === "IGV"); });
    //_rs.forEach(function (item) {
    //    var mgc = roundNumber(parseFloat(item.Name), 2);
    //    _vld[0] = mgc;
    //});

    /*_rs = result.d.where(function (item) { return (item.Ident === "LE"); });
    cbbU_BIZ_LUEN.BeginUpdate();
    cbbU_BIZ_LUEN.ClearItems();
    _rs.forEach(function (item) {
        cbbU_BIZ_LUEN.AddItem(item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[1] = item.Code;
        }
    });    
    cbbU_BIZ_LUEN.EndUpdate();
    cbbU_BIZ_LUEN.SetValue(_vld[1]);*/

    //_rs = result.d.where(function (item) { return (item.Ident === "HE"); });
    //cbbU_BF_HOEN.BeginUpdate();
    //cbbU_BF_HOEN.ClearItems();
    //_rs.forEach(function (item) {
    //    cbbU_BF_HOEN.AddItem(item.Name, item.Code);
    //    if (item.Dfault === 1) {
    //        _vld[2] = item.Code;
    //    }
    //});
    //cbbU_BF_HOEN.EndUpdate();
    //cbbU_BF_HOEN.SetValue(_vld[2]);

    _rs = result.d.where(function (item) { return (item.Ident === "CP"); });
    GroupNum.BeginUpdate();
    GroupNum.ClearItems();
    _rs.forEach(function (item) {
        GroupNum.AddItem(item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[3] = item.Code;
        }
    });
    GroupNum.EndUpdate();
    GroupNum.SetValue(_vld[3]);

    _rs = result.d.where(function (item) { return (item.Ident === "MN"); });
    cbbCurrency.BeginUpdate();
    cbbCurrency.ClearItems();
    _rs.forEach(function (item) {
        cbbCurrency.AddItem(item.Name, item.Code);
        if (item.Dfault === 1) {
            _vld[3] = item.Code;
        }
    });
    cbbCurrency.EndUpdate();
    cbbCurrency.SetValue(_vld[3]);

    //_rs = result.d.where(function (item) { return (item.Ident === "VR"); });
    //cbeSalesPerson.BeginUpdate();
    //cbeOwnerCode.BeginUpdate();
    //cbeSalesPerson.ClearItems();
    //cbeOwnerCode.ClearItems();
    //_rs.forEach(function (item) {
    //    cbeSalesPerson.AddItem(item.Name, item.Code);
    //    cbeOwnerCode.AddItem(item.Name, item.empID);
    //    if (item.Dfault === 1) {
    //        _vld[4] = item.Code;
    //    }
    //});
    //cbeSalesPerson.EndUpdate();
    //cbeOwnerCode.EndUpdate();
    //cbeSalesPerson.SetValue(_vld[4]);
    //cbeOwnerCode.SetValue(_vld[5]);

    _rs = result.d.where(function (item) { return (item.Ident === "LP"); });
    ListNum.BeginUpdate();
    ListNum.ClearItems();
    _rs.forEach(function (item) {
        ListNum.AddItem(item.Name, item.Code);
        if (item.Dfault === 2) {
            _vld[7] = item.Code;
        }
    });
    ListNum.EndUpdate();
    ListNum.SetValue(_vld[7]);

    //Set_ConfigDateTime();
}
function Key_CrCardName(s, e) {
    s.SetText(s.GetText().toUpperCase());
}
function Get_CrDocumentType() {
    cbbCrDocumentType.ClearItems();
    if (cbbCrPersonType.GetSelectedIndex() === 0) {
        cbbCrDocumentType.AddItem("RUC", 6);
        cbbCrDocumentType.SetSelectedIndex(0);
    }
    else {
        cbbCrDocumentType.AddItem("DNI", 1);
        cbbCrDocumentType.AddItem("RUC", 6);
        cbbCrDocumentType.SetSelectedIndex(0);
    }
}
function ProcessKeyPress(s, e) {
    var charCode = (e.htmlEvent.which) ? e.htmlEvent.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        _aspxPreventEvent(e.htmlEvent);
}
function Key_CrLicTradNum(s, e) {
    var _crd = "C" + s.GetText();
    txtCrCardCode.SetText(_crd);
}
function GET_PROVINCIAS_JS() {
    var socied = hdfTemp.Get("_soci");
    var departamento = cbbState.GetValue();
    $.ajax(
        {
            type: "POST",
            url: "../Masters/Client.aspx/GET_PROVINCIAS_CS",
            data: '{"socied":"' + socied + '", "depa":"' + departamento + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                cbbU_DXP_BIZ_COPR.ClearItems();
                cbbU_DXP_BIZ_COPR.BeginUpdate();
                $.each(result.d, function (index, item) {
                    cbbU_DXP_BIZ_COPR.AddItem(item.U_DXP_BIZ_NOPRO, item.Code);
                });

            },
            error: function (result) {
                alert(result);
            }
        });
    cbbU_DXP_BIZ_COPR.EndUpdate();
}
function GET_PROVINCIAS_JS2(valor) {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
        {
            type: "POST",
            url: "../Masters/Client.aspx/GET_PROVINCIAS_CS",
            data: '{"socied":"' + socied + '", "depa":"' + valor + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                cbbU_DXP_BIZ_COPR.ClearItems();
                cbbU_DXP_BIZ_COPR.BeginUpdate();
                $.each(result.d, function (index, item) {
                    cbbU_DXP_BIZ_COPR.AddItem(item.U_DXP_BIZ_NOPRO, item.Code);
                });

            },
            error: function (result) {
                alert(result);
            }
        });
    cbbU_DXP_BIZ_COPR.EndUpdate();
}
function GET_DISTRITOS_JS() {
    var socied = hdfTemp.Get("_soci");
    var provincia = cbbU_DXP_BIZ_COPR.GetValue();
    $.ajax(
        {
            type: "POST",
            url: "../Masters/Client.aspx/GET_DISTRITOS_CS",
            data: '{"socied":"' + socied + '", "prov":"' + provincia + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                cbbU_DXP_BIZ_CODI.ClearItems();
                cbbU_DXP_BIZ_CODI.BeginUpdate();
                $.each(result.d, function (index, item) {
                    cbbU_DXP_BIZ_CODI.AddItem(item.U_DXP_BIZ_NODI, item.Code);
                });

            },
            error: function (result) {
                alert(result);
            }
        });
    //cbbU_DXP_BIZ_CODI.SetValue(3);
    //alert("" + cbbU_DXP_BIZ_COPR.GetValue()+ "--" +cbbU_DXP_BIZ_COPR.GetText());
    cbbU_DXP_BIZ_CODI.EndUpdate();
}
function GET_DISTRITOS_JS2(valor) {
    var socied = hdfTemp.Get("_soci");
    //var provincia = cbbU_DXP_BIZ_COPR.GetValue();
    $.ajax(
        {
            type: "POST",
            url: "../Masters/Client.aspx/GET_DISTRITOS_CS",
            data: '{"socied":"' + socied + '", "prov":"' + valor + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                cbbU_DXP_BIZ_CODI.ClearItems();
                cbbU_DXP_BIZ_CODI.BeginUpdate();
                $.each(result.d, function (index, item) {
                    cbbU_DXP_BIZ_CODI.AddItem(item.U_DXP_BIZ_NODI, item.Code);
                });

            },
            error: function (result) {
                alert(result);
            }
        });
    //cbbU_DXP_BIZ_CODI.SetValue(3);
    //alert("" + cbbU_DXP_BIZ_COPR.GetValue()+ "--" +cbbU_DXP_BIZ_COPR.GetText());
    cbbU_DXP_BIZ_CODI.EndUpdate();
}
function Get_DEPARTAMENTOS_JS() {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
    {
        type: "POST",
        url: "../Sales/ARInvoice.aspx/GET_DEPARTAMENTOS_CS",
        data: '{"socied":"' + socied + '"}',
        contentType: "application/json; charset=uft-8",
        dataType: "json",
        success: function (result) {
            cbbState.ClearItems();
            cbbState.BeginUpdate();
            $.each(result.d, function (index, item) {
                //cbbState.InsertItem(index, item.Code + " - " + item.Name);
                cbbState.AddItem(item.Name, item.Code);
            }) //item.Code+" - "+
        },
        error: function (result) {
            alert(result);
        }
    });
    cbbState.EndUpdate();
}
var i = 0;
var direccion = "";
function Agregar_direc() {
    //direccion = [textAddress.GetText(), txtStreet.GetText()];
    //listdirecciones.BeginUpdate();
    //listdirecciones.InsertItem(i, direccion);
    //listdirecciones.EndUpdate();
    
    //listdirecciones.PerformCallback("ADDITEM");


    var x = listdirecciones.GetItemCount();
    direccion = [textAddress.GetText(), txtStreet.GetText(), "PE", String(cbbState.GetValue()),
             String(cbbU_DXP_BIZ_COPR.GetValue()), cbbU_DXP_BIZ_COPR.GetText(), String(cbbU_DXP_BIZ_CODI.GetValue()),
             cbbU_DXP_BIZ_CODI.GetText(), String(rdbtntipofact.GetSelectedItem().value)];
    listdirecciones.InsertItem(i, direccion);
    Nueva_direc();i = i + 1;
}
function Quitar_direc() {
    listdirecciones.BeginUpdate();
    var items = listdirecciones.GetSelectedItems();
    for (var i = items.length - 1; i >= 0; i = i - 1) {
        listdirecciones.RemoveItem(items[i].index);
    }
    listdirecciones.EndUpdate();
}
function Show_ClientCreate() {
    if (cbbCrDocumentType.GetValue() === null) {
        cbbCrDocumentType.SetSelectedIndex(0);
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
            //GET_CLIENTES_GENERALcargarDirecciones();
            //listdirecciones.PerformCallback("ADDITEM:" + DIRECCIONES);
            ldpProcess.SetText("Creando, espere por favor...");
            ldpProcess.Show();
            clbOperation.PerformCallback("CrClient");
            //ppcClientCr.Hide();
        }
    }
}
function Modify() {
    //if (_vld[6] !== "BT") {
    var _sw = true;
    var IsValid = ASPxClientEdit.ValidateGroup("ValEditors");
    if (IsValid) {
        //var rdr1 = gvcontacto.GetVisibleRowsOnPage();
        //if (rdr1 === 0) {
        //    _sw = false;
        //    alert("ingresar al menos un Contacto.");
        //}else 
        if (gvcontacto.IsEditing()) {
            _sw = false;
            alert("Actualizar o cancelar la fila en edición.");
        }
    }
    if (_sw) {
        var result = confirm("Desea modificar el Cliente?");
        if (result) {
            //cargarDirecciones();
            ldpProcess.SetText("Modificando, espere por favor...");
            ldpProcess.Show();
            clbOperation.PerformCallback("Modify");
        }
    }
}
function cargarDirecciones() {
    DIRECCIONES = "";
    for (var i = 1 ; i <= listdirecciones.GetItemCount() ; i++){
        DIRECCIONES += listdirecciones.GetItem(i - 1).text;
        if (i <= listdirecciones.GetItemCount() - 1) {
            DIRECCIONES += "="
        }
    }
    //alert("" + DIRECCIONES);
}
function llenar_direcciones() {

}
function Init_ClientCr() {
    cbbCrDocumentType.ClearItems();
    cbbCrDocumentType.AddItem("RUC", 6);
}
function Com_Operation(s, e) {
    ldpProcess.Hide();
    var _spd = "";
    if (e.result.indexOf("OKBP") !== -1) {
        //txtCardCode.SetText(txtCrCardCode.GetText());
        //bteCardName.SetText(txtCrCardName.GetText());
        //bteLicTradNum.SetText(txtCrLicTradNum.GetText());
        //ClearControlsClient();
        alert("Cliente creado con éxito!");
        ClearControl();
    }
    else if (e.result.indexOf("OKUPDBP") !== -1) {
        alert("Cliente modificado con éxito!");
        ClearControl();
    }
    else {
        alert(e.result);
    }
}
function CancelClientCr() {
    //ppcClientCr.Hide();
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
function isNullOrWhiteSpace(str) {
    return str === null || str.match(/^ *$/) !== null;
}
function Show_DepartamentoSearch() {
    var dep = txtDepaSearch.GetText();
    gdvDepartamento.PerformCallback("SRCH:" + dep);
    ppcDepaSearch.Show();
}
function Show_DepartamentoSearch2() {
    var dep = btedepartamento.GetText();
    gdvDepartamento2.PerformCallback("SRCH:" + dep);
    ppcDepaSearch2.Show();
}
function Get_Depa(s, e) {
    var dep = txtDepaSearch.GetText();
    gdvDepartamento.PerformCallback("SRCH:" + dep);
    if (e.htmlEvent.keyCode === 13) {
        gdvDepartamento.SetFocusedRowIndex(0);
        OkDepa();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Get_Depa1() {
    var dep = txtDepaSearch.GetText();
    gdvDepartamento.PerformCallback("SRCH:" + dep);
}
function Get_Depa2(s, e) {
    var dep = txtDepaSearch.GetText();
    gdvDepartamento2.PerformCallback("SRCH:" + dep);
    if (e.htmlEvent.keyCode === 13) {
        gdvDepartamento2.SetFocusedRowIndex(0);
        OkDepa();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Get_Depa22() {
    var dep = txtDepaSearch2.GetText();
    gdvDepartamento2.PerformCallback("SRCH:" + dep);
}
function Show_ProvinciaSearch() {
    if (!isNullOrWhiteSpace(txtcoddep.GetText())) {
        var prov = txtProvincia.GetText();
        gdvProvincia.PerformCallback("SRCH:" + txtcoddep.GetText() + ":" + prov);
        ppcProvinciaSearch.Show();
    } else {
        alert("Primero debe Insertar Un Departamento");
    } 
}
function Show_ProvinciaSearch2() {
    if (!isNullOrWhiteSpace(txtcoddep.GetText())) {
        var prov = bteprovincia.GetText();
        gdvProvincia2.PerformCallback("SRCH:" + txtcoddep.GetText() + ":" + prov);
        ppcProvinciaSearch2.Show();
    } else {
        alert("Primero debe Insertar Un Departamento");
    }
}
function Get_Prov(s, e) {
    var prov = txtProvincia.GetText();
    gdvProvincia.PerformCallback("SRCH:" + txtcoddep.GetText() + ":" + prov);
    if (e.htmlEvent.keyCode === 13) {
        gdvProvincia.SetFocusedRowIndex(0);
        OkProvincia();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Get_Prov1() {
    var prov = txtProvincia.GetText();
    gdvProvincia.PerformCallback("SRCH:" + txtcoddep.GetText() + ":" + prov);
}
function Get_Prov2(s, e) {
    var prov = txtProvincia.GetText();
    gdvProvincia2.PerformCallback("SRCH:" + txtcoddep.GetText() + ":" + prov);
    if (e.htmlEvent.keyCode === 13) {
        gdvProvincia2.SetFocusedRowIndex(0);
        OkProvincia2();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Get_Prov22() {
    var prov = txtProvincia.GetText();
    gdvProvincia2.PerformCallback("SRCH:" + txtcoddep.GetText() + ":" + prov);
}








function Show_DistritoSearch() {
    if (!isNullOrWhiteSpace(txtcodprov.GetText())) {
        var dist = txtDistrito.GetText();
        gdvDistrito.PerformCallback("SRCH:" + txtcodprov.GetText() + ":" + dist);
        ppcDistritoSearch.Show();
    } else {
        alert("Primero debe Insertar Un Provincia");
    }
}
function Show_DistritoSearch2() {
    if (!isNullOrWhiteSpace(txtcodprov.GetText())) {
        var dist = btedistrito.GetText();
        gdvDistrito2.PerformCallback("SRCH:" + txtcodprov.GetText() + ":" + dist);
        ppcDistritoSearch2.Show();
    } else {
        alert("Primero debe Insertar Un Provincia");
    }
}
function Get_Dist(s, e) {
    var dist = txtDistrito.GetText();
    gdvDistrito.PerformCallback("SRCH:" + txtcodprov.GetText() + ":" + dist);
    if (e.htmlEvent.keyCode === 13) {
        gdvDistrito.SetFocusedRowIndex(0);
        OkDistrito();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Get_Dist1() {
    var dist = txtDistrito.GetText();
    gdvDistrito.PerformCallback("SRCH:" + txtcodprov.GetText() + ":" + dist);
}
function Get_Dist2(s, e) {
    var dist = txtDistrito.GetText();
    gdvDistrito2.PerformCallback("SRCH:" + txtcodprov.GetText() + ":" + dist);
    if (e.htmlEvent.keyCode === 13) {
        gdvDistrito2.SetFocusedRowIndex(0);
        OkDistrito2();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
}
function Get_Dist22() {
    var dist = txtDistrito.GetText();
    gdvDistrito2.PerformCallback("SRCH:" + txtcodprov.GetText() + ":" + dist);
}




function Show_Urbanizacion() {
    if (!isNullOrWhiteSpace(U_DXP_BIZ_COPR.GetText())) {
        gdvUrbanizacion.PerformCallback("SRCH:" + U_DXP_BIZ_CODI.GetText());
        ppcUrbanizacionSearch.Show();
    } else {
        alert("Primero debe Insertar Un Distrito");
    }
}

function Show_Gabinete() {
    gdvurbanizaciontotal.PerformCallback();
    ppcbuscarurbanizaciontotal.Show();
}
function Show_UrbTotal() {
    gdvurbanizaciontotal.PerformCallback();
    ppcbuscarurbanizaciontotal.Show();
}
function Get_Gabinete() {
   
    gdvurbanizaciontotal.PerformCallback();
    //gdvurbanizaciontotal.SetFocusedRowIndex(-1);
    //if (e.htmlEvent.keyCode === 13) {
    //    gdvurbanizaciontotal.SetFocusedRowIndex(0);
    //    OkClient();
    //    ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    //}
}
function Get_urbtotal() {
    //gdvProductSearch.SetFocusedRowIndex(-1);
    gdvCrearUrbanizacion.PerformCallback("INIT");
}
function Okurbtotal() {
    var rowc = gdvurbanizaciontotal.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvurbanizaciontotal.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvurbanizaciontotal.GetRowValues(gdvurbanizaciontotal.GetFocusedRowIndex(), "Code;U_DXP_NOMBRE_URBA;U_DXP_CODIGO_DIST;U_DXP_NOMBRE_DIST;U_DXP_COD_PROV;U_DXP_PROVINCIA;U_DXP_COD_DEP;U_DXP_DEPARTAMENTO", OnGetRowValuesUrb);
    }
}
function OnGetRowValuesUrb(values) {
    //Code.SetText(values[0]);
    //U_DXP_NOMBRE_URBA.SetText(values[1]);
    //U_DXP_CODIGO_DIST.SetText(values[2]);
    //U_DXP_NOMBRE_DIST.SetText(values[3]);
    //U_DXP_COD_PROV.SetText(values[4]);
    //U_DXP_PROVINCIA.SetText(values[5]);
    //U_DXP_COD_DEP.SetText(values[6]);
    //U_DXP_DEPARTAMENTO.SetText(values[7]);
    
    gdvCrearUrbanizacion.PerformCallback("UPDT:" + values);
    mnuOper.GetItemByName("Save").SetText("Modificar");

    //Code.SetEnabled(false);
    //U_DXP_NOMBRE_URBA.SetEnabled(true);
    //U_DXP_DEPARTAMENTO.SetEnabled(false);
    //U_DXP_COD_DEP.SetEnabled(false);
    //U_DXP_PROVINCIA.SetEnabled(false);
    //U_DXP_COD_PROV.SetEnabled(false);
    //U_DXP_CODIGO_DIST.SetEnabled(false);
    //U_DXP_NOMBRE_DIST.SetEnabled(false);

    gdvurbanizaciontotal.SetFocusedRowIndex(-1);
    ppcbuscarurbanizaciontotal.Hide();

    Code.SetEnabled(false);
  
}
function EndUrbTotalteSearch() {
    gdvurbanizaciontotal.SetFocusedRowIndex(0);
}
function CancelUrbTotal() {
    ppcbuscarurbanizaciontotal.Hide();
}






function OkGabinete() {
    var rowc = gdvurbanizaciontotal.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvurbanizaciontotal.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvurbanizaciontotal.GetRowValues(gdvurbanizaciontotal.GetFocusedRowIndex(), "Code;U_DXP_NOMBRE_URBA;U_DXP_CODIGO_DIST;U_DXP_NOMBRE_DIST;U_DXP_COD_PROV;U_DXP_PROVINCIA;U_DXP_COD_DEP;U_DXP_DEPARTAMENTO", OnGetRowValuesgabi);
    }
}

function OnGetRowValuesgabi(values) {
    Code.SetText[0];
    U_DXP_NOMBRE_URBA.SetText[1];
    U_DXP_CODIGO_DIST.SetText[2];
    U_DXP_NOMBRE_DIST.SetText[3];
    U_DXP_COD_PROV.SetText[4];
    U_DXP_PROVINCIA.SetText[5];
    U_DXP_COD_DEP.SetText[6];
    U_DXP_DEPARTAMENTO.SetText[7];

    gdvurbanizaciontotal.SetFocusedRowIndex(-1);
    ppcbuscarurbanizaciontotal.Hide();
}
function EndGabineteSearch() {
    gdvurbanizaciontotal.SetFocusedRowIndex(0);
}
function CancelGabinete() {
    ppcbuscarurbanizaciontotal.Hide();
}
function OkUrbanizacion() {
    var rowc = gdvUrbanizacion.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvUrbanizacion.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvUrbanizacion.GetRowValues(gdvUrbanizacion.GetFocusedRowIndex(), "Code;Name", OnGetRowValuesurba);
    }
}

function OnGetRowValuesurba(values) {
    GlblLocNum.SetText(values[0]);
    Building.SetText(values[1]);
    gdvUrbanizacion.SetFocusedRowIndex(-1);
    ppcUrbanizacionSearch.Hide();
}
function EndUrbanizacionSearch() {
    gdvUrbanizacion.SetFocusedRowIndex(0);
}
function CancelUrbanizacion() {
    ppcUrbanizacionSearch.Hide();
}
function OkDepa() {
    var rowc = gdvDepartamento.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvDepartamento.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvDepartamento.GetRowValues(gdvDepartamento.GetFocusedRowIndex(), "Code;Name", OnGetRowValuesDepa);
    }
}

function OnGetRowValuesDepa(values) {
    txtcoddep.SetText(values[0]);
    btedepartamento.SetText(values[1]);
    //U_DXP_COD_DEP.SetText(values[0]);
    //U_DXP_DEPARTAMENTO.SetText(values[1]);
    gdvDepartamento.SetFocusedRowIndex(-1);
    ppcDepaSearch.Hide();
}
function EndDepaSearch() {
    gdvDepartamento.SetFocusedRowIndex(0);
}
function CancelDepa() {
    ppcDepaSearch.Hide();
}

function OkDepa2() {
    var rowc = gdvDepartamento2.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvDepartamento2.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvDepartamento2.GetRowValues(gdvDepartamento2.GetFocusedRowIndex(), "Code;Name", OnGetRowValuesDepa2);
    }
}

function OnGetRowValuesDepa2(values) {
    //txtcoddep.SetText(values[0]);
    //btedepartamento.SetText(values[1]);
    U_DXP_COD_DEP.SetText(values[0]);
    U_DXP_DEPARTAMENTO.SetText(values[1]);
    gdvDepartamento2.SetFocusedRowIndex(-1);
    ppcDepaSearch2.Hide();
}
function EndDepaSearch2() {
    gdvDepartamento2.SetFocusedRowIndex(0);
}
function CancelDepa2() {
    ppcDepaSearch2.Hide();
}





function OkProvincia() {
    var rowc = gdvProvincia.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvProvincia.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvProvincia.GetRowValues(gdvProvincia.GetFocusedRowIndex(), "Code;Name", OnGetRowValuesProvincia);
    }
}

function OnGetRowValuesProvincia(values) {
    txtcodprov.SetText(values[0]);
    bteprovincia.SetText(values[1]);
    //U_DXP_COD_PROV.SetText(values[0]);
    //U_DXP_PROVINCIA.SetText(values[1]);
    gdvProvincia.SetFocusedRowIndex(-1);
    ppcProvinciaSearch.Hide();
}
function EndProvinciaSearch() {
    gdvProvincia.SetFocusedRowIndex(0);
}
function CancelProvincia() {
    ppcProvinciaSearch.Hide();
}

function OkProvincia2() {
    var rowc = gdvProvincia2.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvProvincia2.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvProvincia2.GetRowValues(gdvProvincia2.GetFocusedRowIndex(), "Code;Name", OnGetRowValuesProvincia2);
    }
}

function OnGetRowValuesProvincia2(values) {
    //txtcodprov.SetText(values[0]);
    //bteprovincia.SetText(values[1]);
    U_DXP_COD_PROV.SetText(values[0]);
    U_DXP_PROVINCIA.SetText(values[1]);
    gdvProvincia2.SetFocusedRowIndex(-1);
    ppcProvinciaSearch2.Hide();
}
function EndProvinciaSearch2() {
    gdvProvincia2.SetFocusedRowIndex(0);
}
function CancelProvincia2() {
    ppcProvinciaSearch2.Hide();
}





function OkDistrito() {
    var rowc = gdvDistrito.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvDistrito.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvDistrito.GetRowValues(gdvDistrito.GetFocusedRowIndex(), "Code;Name", OnGetRowValuesDistrito);
    }
}

function OnGetRowValuesDistrito(values) {
    txtcoddit.SetText(values[0]);
    btedistrito.SetText(values[1]);
    //U_DXP_CODIGO_DIST.SetText(values[0]);
    //U_DXP_NOMBRE_DIST.SetText(values[1]);
    gdvDistrito.SetFocusedRowIndex(-1);
    ppcDistritoSearch.Hide();
}
function EndDistritoSearch() {
    gdvDistrito.SetFocusedRowIndex(0);
}
function CancelDistrito() {
    ppcDistritoSearch.Hide();
}
function OkDistrito2() {
    var rowc = gdvDistrito2.GetVisibleRowsOnPage();
    if (rowc === 0) {
        alert("No existen registros para realizar esta operación.")
    }
    else if (gdvDistrito2.GetFocusedRowIndex() === -1) {
        alert("Seleccione un registro para realizar esta operación.")
    }
    else {
        gdvDistrito2.GetRowValues(gdvDistrito2.GetFocusedRowIndex(), "Code;Name", OnGetRowValuesDistrito2);
    }
}

function OnGetRowValuesDistrito2(values) {
    //txtcoddit.SetText(values[0]);
    //btedistrito.SetText(values[1]);
    U_DXP_CODIGO_DIST.SetText(values[0]);
    U_DXP_NOMBRE_DIST.SetText(values[1]);
    gdvDistrito2.SetFocusedRowIndex(-1);
    ppcDistritoSearch2.Hide();
}
function EndDistritoSearch2() {
    gdvDistrito2.SetFocusedRowIndex(0);
}
function CancelDistrito2() {
    ppcDistritoSearch2.Hide();
}

function ShowClientSearch() {
    
    ppcClientSearch.Show();
}

function Get_Client(s, e) {
    gdvClientSearch.SetFocusedRowIndex(-1);
    gdvClientSearch.PerformCallback("SRCH");
    if (e.htmlEvent.keyCode === 13) {
        gdvClientSearch.SetFocusedRowIndex(0);
        OkClient();
        ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
    }
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
        gdvClientSearch.GetRowValues(gdvClientSearch.GetFocusedRowIndex(), "CardCode;CardName;LicTradNum;ListNum", OnGetRowValuesClient);
    }
}

function OnGetRowValuesClient(values) {
    /*txtCrCardCode.SetText(values[0]);
    txtCrCardName.SetText(values[1]);
    txtCrLicTradNum.SetText(values[2]);
    if (values[3] === 3 || values[3] === 13) {
        cbbListNum.SetValue(values[3]);
    } else {
        cbbListNum.SetSelectedIndex(ult);
    }*/
    GET_CLIENTES_GENERAL(values[0], 1);
    gvcontacto.PerformCallback("GET:"+values[0]);
    gvDirecciones.PerformCallback("GET:"+values[0]);
    //GET_CLIENTES_DIRECCIONES(values[0], 3);
    mnuOper.GetItemByName("Save").SetText("Modificar");
    gdvClientSearch.SetFocusedRowIndex(-1);
    ppcClientSearch.Hide();
}
function Set_Operation(s, e) {
    // GUARDAR
    if (e.item.name === "Save" && e.item.GetText() === "Crear") {
        Save();
        InitControls();
    }
    else if (e.item.name === "Search") {
        buscar();
    }
        // NUEVO
    else if (e.item.name === "New") {
        limpiar();
        mnuOper.GetItemByName("Save").SetText("Crear");
    }
    else if (e.item.name === "Save" && e.item.GetText() === "Modificar") {
        Modificar();
    }
    else if (e.item.name == "Export") {
        clbOperation.PerformCallback("EXPORT");
    }
}

function Save() {
    gdvCrearUrbanizacion.PerformCallback("SaveUrb");
    txtcoddep.SetText("");
    btedepartamento.SetText("");
    txtcodprov.SetText("");
    bteprovincia.SetText("");
    txtcoddit.SetText("");
    btedistrito.SetText("");
    txturbacrear.SetText("");
    InitControls();

}
function Crear() {
    var x = txtcoddit.GetText();
    var y = btedistrito.GetText();
    var z = txturbacrear.GetText();
    var depcod = txtcoddep.GetText();
    var depname = btedepartamento.GetText();
    var provcod = txtcodprov.GetText();
    var provname = bteprovincia.GetText();

    gdvCrearUrbanizacion.PerformCallback("SaveUrb" + ';' + x + ';' + y + ';' + z+';'+depcod+';'+depname+';'+provcod+';'+provname);
    InitControls();

}
function Buscar() {
    var x = txtcoddit.GetText();
    gdvCrearUrbanizacion.PerformCallback("BUSCAR"+';'+x);
    //InitControls();

}
function limpiar() {
    gdvCrearUrbanizacion.PerformCallback("CLR");
    InitControls();

}
function Modificar() {
   

    clbOperation.PerformCallback("Modify");

}

function GET_CLIENTES_GENERAL(codigo, accion) {
    var socied = hdfTemp.Get("_soci");
    $.ajax(
        {
            type: "POST",
            url: "../Masters/Client.aspx/GET_CLIENTES_GENERAL_CS",
            data: '{"socied":"' + socied + '", "cardcode":"' + codigo + '", "accion":"' + accion + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                $.each(result.d, function (index, item) {
                    txtCrCardCode.SetText(item.CardCode);
                    txtCrCardName.SetText(item.CardName);
                    txtCrLicTradNum.SetText(item.LicTradNum);
                    txtCrPhone1.SetText(item.Phone1);
                    txtCrCellular.SetText(item.Cellular);
                    txtCrE_Mail.SetText(item.E_Mail);
                    //dteCrU_PN_FecNac.SetValue(item.CreateDate)
                    GroupNum.SetValue(parseInt(item.GroupNum));
                    ListNum.SetValue(parseInt(item.ListNum));
                    cbbCurrency.SetValue(item.Currency);
                    if (item.LicTradNum.length <= 8) {
                        cbbCrPersonType.SetValue("TPN");
                        cbbCrDocumentType.SetText("DNI");
                    } else {
                        cbbCrPersonType.SetValue("TPJ");
                        cbbCrDocumentType.SetText("RUC");
                    }
                    if (item.Active == "Y") {
                        rbtnestado.SetSelectedIndex(0);
                    } else if (item.Active == "N") {
                        rbtnestado.SetSelectedIndex(1);
                    }
                    var x = new Date(item.CreateDate);
                    dteCrU_PN_FecNac.SetDate(x);
                });

            },
            error: function (result) {
                alert(result);
            }
        });
    //cbbU_DXP_BIZ_CODI.SetValue(3);
    //cbbU_DXP_BIZ_CODI.EndUpdate();
    if (cbbCurrency.value === "##") {
        cbbCurrency.SetEnable(false);
    }
}
function GET_CLIENTES_DIRECCIONES(codigo, accion) {
    var socied = hdfTemp.Get("_soci");
    var direccion = "";
    listdirecciones.ClearItems();
    $.ajax(
        {
            type: "POST",
            url: "../Masters/Client.aspx/GET_CLIENTES_DIRECCIONES_CS",
            data: '{"socied":"' + socied + '", "cardcode":"' + codigo + '", "accion":"' + accion + '"}',
            contentType: "application/json; charset=uft-8",
            dataType: "json",
            success: function (result) {
                $.each(result.d, function (index, item) {
                    //alert("" + item.Linea);
                    direccion = [item.Address, item.Street, item.Country, item.U_DXP_COD_DEP, item.U_DXP_BIZ_COPR, item.U_DXP_BIZ_PROV, item.U_DXP_BIZ_CODI, item.U_DXP_BIZ_DIST, item.AdresType];
                    listdirecciones.BeginUpdate();
                    listdirecciones.InsertItem(item.LineNum, direccion);
                    
                });

            },
            error: function (result) {
                alert(result);
            }
        }); listdirecciones.EndUpdate();
}
var direccion2 = "";
var items = "";
function cambiardirec() {

    //Nueva_direc();
    var linea = listdirecciones.GetSelectedItems();
    items = linea[0].text.split(";");

    //alert("" + items[0] + "--" + items[1] + "--" + items[2] + "--" + items[3] + "--" + items[4] + "--" + items[5] + "--" + items[6] + "--" + rdbtntipofact.GetSelectedIndex() + "--" + rdbtntipofact.GetSelectedItem().text + "--" + rdbtntipofact.GetSelectedItem().value);

    textAddress.SetText(items[0].trim());
    txtStreet.SetText(items[1].trim());
    cbbState.SetValue(items[3].trim());
    cbbU_DXP_BIZ_COPR.SetValue(items[4].trim());
    cbbU_DXP_BIZ_CODI.SetValue(items[6].trim());

    if (items[8].trim() == "B"){
        rdbtntipofact.SetSelectedIndex(0);
    } else if (items[8].trim() == "S") {
        rdbtntipofact.SetSelectedIndex(1);
    }
    //alert("" + listdirecciones.GetSelectedItems()[0].value);
    //var x = listdirecciones.GetSelectedValues();
    //var socied = hdfTemp.Get("_soci");

    //$.ajax(
    //    {
    //        type: "POST",
    //        url: "../Masters/Client.aspx/GET_DIRECCION",
    //        data: '{"address":"' + x + '"}',
    //        contentType: "application/json; charset=uft-8",
    //        dataType: "json",
    //        success: function (result) {
    //            direccion2 = result.d.split(",");
    //        },
    //        error: function (result) {
    //            alert(result);
    //        }
    //    });

    //textAddress.SetText(direccion2[0]);
    //txtStreet.SetText(direccion2[1]);
    //cbbState.SetValue(direccion2[2]);
    //cbbU_DXP_BIZ_COPR.SetValue(direccion2[3]);
    //cbbU_DXP_BIZ_CODI.SetValue(direccion2[4]);
}
function Nueva_direc() {
    textAddress.SetText("");
    txtStreet.SetText("");
    Get_DEPARTAMENTOS_JS();
    GET_PROVINCIAS_JS2('');
    GET_DISTRITOS_JS2('');
    

}
function Modificar_direc() {

    listdirecciones.RemoveItem(listdirecciones.GetSelectedIndex());
    var x = [textAddress.GetText(), txtStreet.GetText(), "PE", String(cbbState.GetValue()),
             String(cbbU_DXP_BIZ_COPR.GetValue()), cbbU_DXP_BIZ_COPR.GetText(), String(cbbU_DXP_BIZ_CODI.GetValue()), cbbU_DXP_BIZ_CODI.GetText(), String(rdbtntipofact.GetSelectedItem().value)];
    listdirecciones.InsertItem(textAddress.GetText(), x);
    //listdirecciones.PerformCallback("UPDT:" + items[0]);
    Nueva_direc();

}
function CancelClient() {
    ppcClientSearch.Hide();
}
function fincallback(s, e) {
    alert(e.result);
}
function EndClientSearch() {
    gdvClientSearch.SetFocusedRowIndex(0);
    //ppcClientSearch.UpdatePosition();
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
