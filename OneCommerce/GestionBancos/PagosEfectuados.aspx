<%@ Page Title="Pagos Efectuados" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="PagosEfectuados.aspx.cs" Inherits="OneCommerce.GestionBancos.PagosEfectuados" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/GestionBancos/JSPagosEfectuados.js"></script>
<%--<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>--%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity:"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin:"anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" Height="800px"
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Pagos Efectuados"  GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                 <%--<nav style="">
                                    <a href="#tab1" class="amenucrearclie"><i class="fas fa-home"></i> Principal</a>
                                    <a href="#tab2" class="amenucrearclie"><i class="fas fa-user-check"></i>Programación</a>
                                </nav>--%>
                                <%--<table id="tablaprincdecrearclie" style="width:700px; height:350px" class="tablespace">
                                    <tr>
                                        <td colspan="3" style="width:600px" class="tablespace">--%>
                                            <section class="sectablas" id="tab1">
                                                <table id="tab1tabla1">
                                                    <tr>
                                                        <td style="width:140px"></td>
                                                        <td style="width:140px">
                                                        </td>
                                                        <td style="width:40px">
                                                            <dx:ASPxRadioButtonList ID="rbtnType" runat="server" Height="10px"
                                                                        RepeatDirection="Horizontal" Width="120px"
                                                                        ClientInstanceName="rbtnType">
                                                                <ClientSideEvents SelectedIndexChanged="cambio_tipo"/>
                                                                <Items>
                                                                    <dx:ListEditItem Text="Proveedor" Value="Y" Selected="True" />
                                                                    <dx:ListEditItem Text="Cuenta" Value="N" />
                                                                </Items>
                                                            </dx:ASPxRadioButtonList>
                                                        </td>
                                                        <td style="width:140px"></td>
                                                        <td style="width:140px">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Código de Proveedor:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxButtonEdit ID="bteCustomer" runat="server" ReadOnly="true"
                                                                ClientInstanceName="bteCustomer" Width="140px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Proveedor">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="ShowClientSearch" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Nro. Documento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDocNum" runat="server" Visible="true" 
                                                                ClientInstanceName="txtDocNum" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <%--<td style="width:140px">
                                                            Nombre de Proveedor:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtCustomerName" runat="server" 
                                                                ClientInstanceName="txtCustomerName" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>--%>
                                                        <%--<td style="width:140px">
                                                            Estado de llamada:
                                                          </td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbStatus" SelectedIndex="0">
                                                        </dx:ASPxComboBox>
                                                        </td>--%>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Nombre de Proveedor:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtCustomerName" runat="server"  ReadOnly="true"
                                                                ClientInstanceName="txtCustomerName" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <%--<td style="width:140px">
                                                            Persona de Contacto:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" 
                                                                ClientInstanceName="txtcontctCode" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>--%>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Fecha Contabilización:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxDateEdit ID="txtcreateDate1" runat="server"  ReadOnly="false"
                                                                ClientInstanceName="txtcreateDate1" Width="100%">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Número de Telefono:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txttelf" runat="server"  ReadOnly="true"
                                                                ClientInstanceName="txttelf" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Fecha Vencimiento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxDateEdit ID="txtcloseDate1" runat="server" Width="100%" ReadOnly="false"
                                                                ClientInstanceName="txtcloseDate1" Visible="true">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Persona de Contacto:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="txtcontctCode1" runat="server" 
                                                                ClientInstanceName="txtcontctCode1" Width="100%" OnCallback="txtcontctCode1_Callback">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Fecha Documento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxDateEdit ID="txtdocDate1" runat="server" Width="100%" ReadOnly="false"
                                                                ClientInstanceName="txtdocDate1" Visible="true">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Proyecto:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbProyecto" runat="server" 
                                                                ClientInstanceName="cbbProyecto" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Nro. Operación</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtNroOperacion" runat="server" 
                                                                ClientInstanceName="txtNroOperacion" Width="140px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Medio de Pago:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbMedioPago" runat="server" 
                                                                ClientInstanceName="cbbMedioPago" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <%--<tr>
                                                        
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Calle:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxMemo ID="txtStreets1" runat="server" Width="140px" Height="40px"
                                                                ClientInstanceName="txtStreets1" Font-Bold="true">
                                                            </dx:ASPxMemo>
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td style="width:140px">
                                                            ID Dirección:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbAddress" runat="server" Width="140px"
                                                                ClientInstanceName="cbbAddress" OnCallback="cbbAddress_Callback">
                                                                <ClientSideEvents SelectedIndexChanged="cambio_direccion" />
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Departamento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDepartamento1" runat="server" Width="140px" ReadOnly="true"
                                                                ClientInstanceName="txtDepartamento1">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td style="width:140px">
                                                            Provincia:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtProvincia1" runat="server" Width="140px" ReadOnly="true"
                                                                ClientInstanceName="txtProvincia1">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Distrito:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDistrito1" runat="server" Width="140px" ReadOnly="true"
                                                                ClientInstanceName="txtDistrito1">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td style="width:140px">
                                                            Calle:</td>
                                                        <td style="width:140px" colspan="4">
                                                            <dx:ASPxMemo ID="txtStreets1" runat="server" Width="140px"  ReadOnly="true"
                                                                ClientInstanceName="txtStreets1">
                                                            </dx:ASPxMemo>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5" style="width:640px; text-align:center">
                                                            <dx:ASPxGridView ID="gdvFacturas" runat="server" AutoGenerateColumns="False" Width="640px"
                                                                ClientInstanceName="gdvFacturas" KeyFieldName="DDocEntry" OnCommandButtonInitialize="gdvFacturas_CommandButtonInitialize"
                                                                OnCustomCallback="gdvFacturas_CustomCallback" OnRowUpdating="gdvFacturas_RowUpdating" OnDataBinding="gdvFacturas_DataBinding"
                                                                OnRowInserting="gdvFacturas_RowInserting" OnCellEditorInitialize="gdvFacturas_CellEditorInitialize" OnRowDeleting="gdvFacturas_RowDeleting">
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="0" Width="70px">
                                                                        <EditButton Visible="true">
                                                                        </EditButton>
                                                                        <CellStyle Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Nro. Documento" PropertiesTextEdit-ClientInstanceName="DocNum"
                                                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="100px" 
                                                                        FieldName="DDocEntry">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DocDate2"
                                                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Total" PropertiesTextEdit-ClientInstanceName="DocTotal"
                                                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="150px" 
                                                                        FieldName="DocTotalSrch">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Saldo Vencido" PropertiesTextEdit-ClientInstanceName="SaldoVenc"
                                                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="100px" 
                                                                        FieldName="SaldoVenc">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="% Dscto. por Pronto Pago" PropertiesTextEdit-ClientInstanceName="Descto"
                                                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="100px" 
                                                                        FieldName="Descto" PropertiesTextEdit-ClientSideEvents-KeyUp="set_dscto">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Pago Total" PropertiesTextEdit-ClientInstanceName="PagoTotal"
                                                                        ShowInCustomizationForm="True" VisibleIndex="6" Width="100px" 
                                                                        FieldName="PagoTotal">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataCheckColumn VisibleIndex="7" UnboundType="String" Caption="Activo" FieldName="Active">
                                                                        <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String">
                                                                        </PropertiesCheckEdit>
                                                                    </dx:GridViewDataCheckColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Moneda Documento" PropertiesTextEdit-ClientInstanceName="DocCur"
                                                                        ShowInCustomizationForm="True" VisibleIndex="8" Width="100px" 
                                                                        FieldName="DocCur">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Reserve" PropertiesTextEdit-ClientInstanceName="Reserve"
                                                                        ShowInCustomizationForm="True" VisibleIndex="9" Width="100px" Visible="false" 
                                                                        FieldName="Reserve">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <ClientSideEvents EndCallback="End_CallbackLines"/>
                                                            </dx:ASPxGridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                            <dx:ASPxCheckBox ID = "checkPagoCuenta" ClientInstanceName = "checkPagoCuenta" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String"
                                                                ClientSideEvents-CheckedChanged="checkcuentaPago">
                                                            </dx:ASPxCheckBox> Pago a Cuenta:</td>
                                                        <td style="width:140px">
                                                           <dx:ASPxTextBox ID="txtDocTotalCP" runat="server" HorizontalAlign="Right" Text="0" 
                                                                ClientInstanceName="txtDocTotalCP" ReadOnly="false" Width="140px" 
                                                                DisplayFormatString="n2">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>

                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                           Importe Vencido:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtimportetotal" runat="server" Width="140px" ReadOnly="false" HorizontalAlign="Right"
                                                                ClientInstanceName="txtimportetotal" Text="0" DisplayFormatString="n2" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                            Saldo Pendiente:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxTextBox ID="txtSaldoP" runat="server" Width="140px" ReadOnly="false" HorizontalAlign="Right"
                                                                ClientInstanceName="txtSaldoP" Visible="true" Text="0"  DisplayFormatString="n2">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>

                                                        
                                                    </tr>
                                                    
                                                </table>
                                            </section>
                                            <section class="sectablas" id="tab2">
                                                <table id="tab2tabla2">
                                                    <tr>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Nro. Documento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDocNum2" runat="server" Visible="true" 
                                                                ClientInstanceName="txtDocNum2" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Fecha Contabilización:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxDateEdit ID="txtcreateDate2" runat="server"  ReadOnly="true"
                                                                ClientInstanceName="txtcreateDate2" Width="100%">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Medio de Pago:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbMedioPago2" runat="server" 
                                                                ClientInstanceName="cbbMedioPago2" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Fecha Vencimiento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxDateEdit ID="txtcloseDate2" runat="server" Width="100%" ReadOnly="true"
                                                                ClientInstanceName="txtcloseDate2" Visible="true">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Moneda Documento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbDocCur" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbDocCur" SelectedIndex="0" Visible="true" 
                                                                AutoPostBack="false">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                                    <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                                    <dx:ListEditItem Text="Euro" Value="EUR" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Fecha Documento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxDateEdit ID="txtdocDate2" runat="server" Width="100%" ReadOnly="true"
                                                                ClientInstanceName="txtdocDate2" Visible="true">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Proyecto:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbProyecto2" runat="server" 
                                                                ClientInstanceName="cbbProyecto2" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Nro. Operación</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtNroOperacion2" runat="server" 
                                                                ClientInstanceName="txtNroOperacion2" Width="140px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="5" style="width:640px; text-align:center">
                                                            <dx:ASPxGridView ID="gdvCuentas" runat="server" AutoGenerateColumns="False" Width="640px"
                                                                ClientInstanceName="gdvCuentas" KeyFieldName="LineNum" OnCommandButtonInitialize="gdvCuentas_CommandButtonInitialize"
                                                                OnCustomCallback="gdvCuentas_CustomCallback" OnRowUpdating="gdvCuentas_RowUpdating" OnDataBinding="gdvCuentas_DataBinding"
                                                                OnRowInserting="gdvCuentas_RowInserting" OnCellEditorInitialize="gdvCuentas_CellEditorInitialize" OnRowDeleting="gdvCuentas_RowDeleting">
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="0" Width="70px">
                                                                        <NewButton Visible="true">
                                                                        </NewButton>
                                                                        <EditButton Visible="true">
                                                                        </EditButton>
                                                                        <DeleteButton Visible="true">
                                                                        </DeleteButton>
                                                                        <CellStyle Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataButtonEditColumn Caption="Cuenta de Mayor" FieldName="AcctCode"
                                                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                                                        <PropertiesButtonEdit ClientInstanceName="AcctCode">
                                                                            <Buttons>
                                                                                <dx:EditButton ToolTip="Buscar Cuenta" Visible="true">
                                                                                </dx:EditButton>
                                                                            </Buttons>
                                                                            <Style Font-Size="8pt">
                                                                            </Style>
                                                                            <ClientSideEvents ButtonClick="Show_CuentaSearch"/>
                                                                        </PropertiesButtonEdit>
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataButtonEditColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Comentario" PropertiesTextEdit-ClientInstanceName="AcctName"
                                                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="100px" 
                                                                        FieldName="AcctName">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Importe" PropertiesTextEdit-ClientInstanceName="CurrTotal"
                                                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="100px" 
                                                                        FieldName="CurrTotal">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Moneda Cuenta" PropertiesTextEdit-ClientInstanceName="ActCurr"
                                                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="100px" 
                                                                        FieldName="ActCurr">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="LineNum" PropertiesTextEdit-ClientInstanceName="LineNum"
                                                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="100px" Visible="false"
                                                                        FieldName="LineNum">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <SettingsEditing Mode="Inline" />
                                                                <ClientSideEvents EndCallback="endlines_plancuentas" />
                                                            </dx:ASPxGridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <br /></td>
                                                        <td style="width:140px">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                            Importe:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxTextBox ID="txtImporte" runat="server" Width="140px" ReadOnly="false" HorizontalAlign="Right"
                                                                ClientInstanceName="txtImporte" Visible="true" Text="0"  DisplayFormatString="n2">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>

                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                           Importe Vencido:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtimportetotal2" runat="server" Width="140px" ReadOnly="false" HorizontalAlign="Right"
                                                                ClientInstanceName="txtimportetotal2" Text="0" DisplayFormatString="n2" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        
                                                    </tr>
                                                    
                                                    
                                                </table>
                                            </section>
                                        <%--</td>
                                        
                                    </tr>
                                </table>--%>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItemHelpTexts Position="Bottom"></SettingsItemHelpTexts>
            </dx:LayoutGroup> 
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxPopupControl ID="ppcPagos" runat="server" 
                ClientInstanceName="ppcPagos" FooterText=" " HeaderText="Pagos Efectuados" 
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
                RenderMode="Lightweight" ShowFooter="True" Width="1100px" Modal="true"
                AllowDragging="True" PopupAnimationType="Fade">
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl5" runat="server" SupportsDisabledAttribute="True">
                    <table style="width:1100px" class="tablespace">
                        <tr>
                            <td colspan="3" style="width:1100px">
                                <fieldset style="width:330px; height:220px; float:left">
                                    <legend>Pago Efectivo <dx:ASPxCheckBox ID = "checkpagoefe" ClientInstanceName = "checkpagoefe" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="true" ValueType="System.String">
                                                            </dx:ASPxCheckBox></legend>
                                    <table>
                                        <tr>
                                            <td>Moneda: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCurPagoEfe" runat="server" Width="200px" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCurPagoEfe" SelectedIndex="0" Visible="true" 
                                                    ClientSideEvents-SelectedIndexChanged="cambio_moneda_pago">
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                        <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                        <dx:ListEditItem Text="Euro" Value="EUR" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Fecha Transfe.</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxDateEdit ID="dteDocDateEfect" runat="server"
                                                    ClientInstanceName="dteDocDateEfect" Font-Bold="true">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cuenta: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtCuentaEfe" runat="server" ClientInstanceName="txtCuentaEfe" 
                                                    Width="100%" Text="Caja Principal" ReadOnly="true">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Saldo Pendiente:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalEfe1" runat="server" ClientInstanceName="txtSalEfe1" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2" ReadOnly="true">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Total:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalEfe2" runat="server" ClientInstanceName="txtSalEfe2" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                                <fieldset style="width:330px; height:220px; float:left">
                                    <legend>Pago Tarjeta <dx:ASPxCheckBox ID = "checkpagotar" ClientInstanceName = "checkpagotar" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String">
                                                            </dx:ASPxCheckBox></legend>
                                    <table>
                                        <tr>
                                            <td>Moneda: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCurPagoTar" runat="server" Width="200px" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCurPagoTar" SelectedIndex="0" Visible="true" 
                                                    ClientSideEvents-SelectedIndexChanged="cambio_moneda_pago1">
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                        <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                        <dx:ListEditItem Text="Euro" Value="EUR" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Fecha Transfe.</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxDateEdit ID="dteDocDateTarj" runat="server"
                                                    ClientInstanceName="dteDocDateTarj" Font-Bold="true">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tipo Tarjeta: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCreditCard1" runat="server" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCreditCard1" Width="100%">
                                                    <ClientSideEvents SelectedIndexChanged="Sel_CreditCard1" />
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Num. Tarjeta</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtNumTarjeta" runat="server" ClientInstanceName="txtNumTarjeta" 
                                                    Width="100%" DisplayFormatString="d">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Num. Operación</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtNumOperacion" runat="server" ClientInstanceName="txtNumOperacion" 
                                                    Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Saldo Pendiente:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalTar1" runat="server" ClientInstanceName="txtSalTar1" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2" ReadOnly="true">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Total:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalTar2" runat="server" ClientInstanceName="txtSalTar2" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                                <fieldset style="width:330px; height:220px; float:left">
                                    <legend>Transferencia <dx:ASPxCheckBox ID = "checkpagotrans" ClientInstanceName = "checkpagotrans" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String">
                                                            </dx:ASPxCheckBox></legend>
                                
                                <table>
                                        <tr>
                                            <td>Moneda: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCurPagoTrans" runat="server" Width="200px" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCurPagoTrans" SelectedIndex="0" Visible="true" 
                                                    ClientSideEvents-SelectedIndexChanged="cambio_moneda_pago2">
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                        <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                        <dx:ListEditItem Text="Euro" Value="EUR" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cuenta: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCuentaTrans" runat="server" ClientInstanceName="cbbCuentaTrans" 
                                                    Width="100%" ReadOnly="false" OnCallback="cbbCuentaTrans_Callback">
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Fecha Transfe.</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxDateEdit ID="dteDocDateTrans" runat="server"
                                                    ClientInstanceName="dteDocDateTrans" Font-Bold="true">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Num. Operación: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtNumOperacion2" runat="server" ClientInstanceName="txtNumOperacion2" 
                                                    Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Saldo Pendiente:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalTrans1" runat="server" ClientInstanceName="txtSalTrans1" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2" ReadOnly="true">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Total:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalTrans2" runat="server" ClientInstanceName="txtSalTrans2" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:1100px; float:left" colspan="3">
                                <table style="margin:5px 450px; text-align:center">
                                    <tr>
                                            <td style="width:70px">
                                                <dx:ASPxButton ID="btnPago" runat="server" AutoPostBack="False" 
                                                    ClientInstanceName="btnPago" Text="Pagar" Width="70px">
                                                    <ClientSideEvents Click="Set_Pago2" />
                                                </dx:ASPxButton>
                                            </td>
                                            <td>
                                                <dx:ASPxButton ID="btnCancelPago" runat="server" AutoPostBack="False" 
                                                    ClientInstanceName="btnCancelPago" Text="Cancelar" Width="70px">
                                                    <ClientSideEvents Click="CancelPago" />
                                                </dx:ASPxButton>
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ppcPRSearch" runat="server" 
        ClientInstanceName="ppcPRSearch" FooterText=" " HeaderText="Buscar Pago Efectuado" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="700px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td id="ClientParCaption2" style="width:50px">
                                        Proveedor:</td>
                                    <td style="width:100px">
                                        <dx:ASPxTextBox ID="txtCliente" runat="server" Width="100px" 
                                            ClientInstanceName="txtCliente">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td id="ClientParCaption3" style="width:50px">
                                        Nro. Documento:</td>
                                    <td style="width:100px">
                                        <dx:ASPxTextBox ID="txtnrodoc" runat="server" Width="100px" 
                                            ClientInstanceName="txtnrodoc">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td id="ClientParCaption4" style="width:50px">
                                        Fecha:</td>
                                    <td style="width:100px">
                                        <dx:ASPxDateEdit ID="dteFecha" runat="server" Width="100px" 
                                            ClientInstanceName="dteFecha">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteServicioSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteServicioSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_PR" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvPR" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvPR" 
                                KeyFieldName="DocEntry" OnCustomCallback="gdvPR_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvPR_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Nro. Operación" FieldName="BaseDocEntry" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="30px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nro. Documento" FieldName="DocEntry" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cod. Proveedor" FieldName="CardCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha Doc." FieldName="DocDate" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dirección" FieldName="BillStreet" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Total" FieldName="DocTotal" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Address" FieldName="PayToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="State" FieldName="ShipToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Prov" FieldName="ShipStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Distrito" FieldName="Address2" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TypeDoc" FieldName="Reserve" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TaxDate" FieldName="TaxDate" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="31">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DocDueDate" FieldName="DocDueDate" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="32">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BaseDocEntry" FieldName="BaseDocEntry" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="32">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SerieGuia" FieldName="SerieGuia" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="32">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="okPR"/>
                                <Styles>
                                    <Row Font-Size="7pt">
                                    </Row>
                                </Styles>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:340px">
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnServicioOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnServicioOk" AutoPostBack="False">
                                            <ClientSideEvents Click="okPR" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnServicioCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnServicioCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelPR" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ppcCuentasSearch" runat="server" 
        ClientInstanceName="ppcCuentasSearch" FooterText=" " HeaderText="Buscar Plan de Cuentas" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="500px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td id="ClientParCaption1" style="width:105px">
                                        Código:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtCuenta" runat="server" Width="100%" 
                                            ClientInstanceName="txtCuenta">
                                            <ClientSideEvents KeyUp="Get_Cuenta1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteCuentaSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteCuentaSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Cuenta" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvCuentassrch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvCuentassrch" 
                                KeyFieldName="AcctCode" OnCustomCallback="gdvCuentassrch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvCuentassrch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="AcctCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="AcctName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Saldo de Cuenta" FieldName="CurrTotal" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Moneda Cuenta" PropertiesTextEdit-ClientInstanceName="ActCurr"
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="100px" 
                                        FieldName="ActCurr">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkCuenta"/>
                                <Styles>
                                    <Row Font-Size="7pt">
                                    </Row>
                                </Styles>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:340px">
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnCardsOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnCardsOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkCuenta" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnCardsCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnCardsCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelCuenta" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ppcClientSearch" runat="server" 
        ClientInstanceName="ppcClientSearch" FooterText=" " HeaderText="Buscar Proveedor" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="500px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td id="ClientParCaption" style="width:105px">
                                        Código:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtParClient" runat="server" Width="100%" 
                                            ClientInstanceName="txtParClient">
                                            <ClientSideEvents KeyPress="Get_Client1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteClientSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Client" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvClientSearch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvClientSearch" 
                                KeyFieldName="CardCode" OnCustomCallback="gdvClientSearch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvClientSearch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="CardCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="RUC/DNI" FieldName="LicTradNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cellular" FieldName="Cellular" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>

                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkClient" EndCallback="EndClientSearch"/>
                                <Styles>
                                    <Row Font-Size="7pt">
                                    </Row>
                                </Styles>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:340px">
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnClientOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkClient" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnClientCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelClient" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <dx:ASPxFormLayout ID="frlMenu" runat="server">
        <Items>
            <dx:LayoutItem ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer ID="licMenu" runat="server" 
                        SupportsDisabledAttribute="True">
                            <div class="MenuFloat">
                                <dx:ASPxMenu ID="mnuOper" runat="server" RenderMode="Lightweight" Width="100%"
                                    DataSourceID="XmlDataSourceFooter" ClientInstanceName="mnuOper"
                                    FirstSubMenuDirection="LeftOrTop"> 
                                    <ItemStyle VerticalAlign="Top" />
                                    <Border BorderWidth="0px" />
                                    <BorderTop BorderWidth="1px" />
                                    <ClientSideEvents ItemClick="Set_Operation" />
                                </dx:ASPxMenu>
                            </div>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
    </dx:ASPxFormLayout>
    <asp:XmlDataSource ID="XmlDataSourceFooter" runat="server" DataFile="~/App_Data/BottomOper.xml"
        XPath="/items/*">
    </asp:XmlDataSource>
    <dx:ASPxLoadingPanel ID="ldpProcess" runat="server" ClientInstanceName="ldpProcess" Modal="true" >
    </dx:ASPxLoadingPanel>
    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
    </dx:ASPxHiddenField>
    <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

