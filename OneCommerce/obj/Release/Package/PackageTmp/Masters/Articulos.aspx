<%@ Page Title="Datos Maestros de Articulos" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Articulos.aspx.cs" Inherits="OneCommerce.Masters.Articulos" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSArticulos.js"></script>
<%--<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>--%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Datos Maestros de Artículos"  GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <nav>
                                    <a href="#tab1" class="amenucrearclie"><i class="fas fa-home"></i> General</a>
                                    <a href="#tab2" class="amenucrearclie"><i class="fas fa-money-check-alt"></i> Datos de Compra</a>
                                    <a href="#tab3" class="amenucrearclie"><i class="fas fa-shopping-cart"></i> Datos de Ventas</a>
                                    <a href="#tab4" class="amenucrearclie"><i class="fas fa-warehouse"></i> Datos de Inventario</a>
                                    <a href="#tab5" class="amenucrearclie"><i class="fas fa-list-alt"></i> Lista de Precios</a>
                                </nav>
                                <table id="tablaprincdecrearclie" style="width:700px; height:350px" class="tablespace">
                                    <tr>
                                        <td colspan="3" style="width:400px" class="tablespace">
                                            <section class="sectablas" id="tab1">
                                                <table id="tab1tabla1">
                                                    <tr>
                                                        <td style="width:140px">
                                                            Código de Artículo:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtItemcode" runat="server" 
                                                                ClientInstanceName="txtItemcode" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Descripción de Artículo:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtItemname" runat="server" Width="100%"
                                                                ClientInstanceName="txtItemname">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <%--Clase de Artículo:--%>Tipo Existencia:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbTipExist" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbTipExist" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                           <%--<dx:ASPxComboBox ID="cbbItemType" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbItemType" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Artículos" Value="I" />
                                                                    <dx:ListEditItem Text="Trabajo" Value="L" />
                                                                    <dx:ListEditItem Text="Viaje" Value="T" />
                                                                </Items>
                                                            </dx:ASPxComboBox>--%>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Grupo de Artículo:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbItmsGrpCod" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbItmsGrpCod" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Marca:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtMarca" runat="server" Width="100%"
                                                                ClientInstanceName="txtMarca">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Método de Gestión:--%>Modelo:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtModelo" runat="server" Width="100%"
                                                                ClientInstanceName="txtModelo">
                                                            </dx:ASPxTextBox>
                                                            <%--<dx:ASPxComboBox ID="cbbMngMethod" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbMngMethod" Width="100%" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Todas las Transacciones" Value="A" />
                                                                    <dx:ListEditItem Text="Solo en Release" Value="R" />
                                                                </Items>
                                                            </dx:ASPxComboBox>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Gestión de Artículo:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbIssueMthd" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbIssueMthd" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Ning." Value="N" />
                                                                    <dx:ListEditItem Text="Numero de Serie" Value="S" />
                                                                    <dx:ListEditItem Text="Lotes" Value="L" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Método de Gestión:--%>Cuentas de Mayor Según:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbGLMethod" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbGLMethod" Width="100%" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Grupo de Artículos" Value="C" />
                                                                    <dx:ListEditItem Text="Almacén" Value="W" />
                                                                    <dx:ListEditItem Text="Nivel de Artículo" Value="L" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                            <%--<dx:ASPxComboBox ID="cbbMngMethod" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbMngMethod" Width="100%" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Todas las Transacciones" Value="A" />
                                                                    <dx:ListEditItem Text="Solo en Release" Value="R" />
                                                                </Items>
                                                            </dx:ASPxComboBox>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                       <td style="width:140px">
                                                            Detalle Servicio:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbDetalleServicio" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbDetalleServicio" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                       
                                                       <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Método de Gestión:--%>Plan:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbPlan" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbPlan" Width="100%" SelectedIndex="0">
                                                                <Items>
                                                                    
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                           
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            </td>
                                                        <td style="width:240px">
                                                            
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            </td>
                                                        <td style="width:240px">
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <%--Precio de Compra:--%></td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtPrice" runat="server" Width="100%"
                                                                ClientInstanceName="txtPrice" DisplayFormatString="c2" Visible="false">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Precio de Compra:--%></td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtPrice2" runat="server" Width="100%"
                                                                ClientInstanceName="txtPrice" Visible="false">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Artículo de Invent.:</td>
                                                        <td style="width:240px; text-align:center">
                                                            <dx:ASPxCheckBox ID = "checkArticuloInventario" ClientInstanceName = "checkArticuloInventario" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="true" ValueType="System.String">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Activo para Contrato:</td>
                                                        <td style="width:240px; text-align:center">
                                                            <dx:ASPxCheckBox ID="checkContrato" ClientInstanceName="checkContrato" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Artículo de Venta:</td>
                                                        <td style="width:240px; text-align:center">
                                                            <dx:ASPxCheckBox ID="checkArticuloVenta" ClientInstanceName = "checkArticuloVenta" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="true" ValueType="System.String">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Activo para Servicio:</td>
                                                        <td style="width:240px; text-align:center">
                                                            <dx:ASPxCheckBox ID="checkServicio" ClientInstanceName = "checkServicio" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Artículo de Compra:</td>
                                                        <td style="width:240px; text-align:center">
                                                            <dx:ASPxCheckBox ID = "checkArticuloCompra" ClientInstanceName = "checkArticuloCompra" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="true" ValueType="System.String">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Estado:</td>
                                                        <td style="width:240px; text-align:center" rowspan="2">
                                                            <dx:ASPxRadioButtonList ID="rbtnestado" runat="server" Height="20px" 
                                                                        RepeatDirection="Vertical" Width="100%" SelectedIndex="0" 
                                                                        ClientInstanceName="rbtnestado">
                                                                <Items>
                                                                    <dx:ListEditItem Text="Activo" Value="Y" Selected="True" />
                                                                    <dx:ListEditItem Text="Inactivo" Value="N" />
                                                                </Items>
                                                            </dx:ASPxRadioButtonList>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Gestión de Stock por Almacén:</td>
                                                        <td style="width:240px; text-align:center">
                                                            <dx:ASPxCheckBox ID="checkByWh" ClientInstanceName = "checkByWh" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="true" ValueType="System.String">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            No Facturable:</td>
                                                        <td style="width:240px; text-align:center">
                                                            <dx:ASPxCheckBox ID = "checkFacturable" ClientInstanceName = "checkFacturable" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                        
                                                    </tr>
                                                </table>
                                            </section>
                                            <section class="sectablas" id="tab2">
                                                <table id="tab2tabla2">
                                                    <tr>
                                                        <td style="width:140px">
                                                            Unidad de Medidad de Compra:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbBuyUnitMsr" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbBuyUnitMsr" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Artículos por Unidad de Compra:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtNuminBuy" runat="server" 
                                                                ClientInstanceName="txtNuminBuy" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Unidad de Medidad de Embalaje:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbPurPackMsr" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbPurPackMsr" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Cantidad por Paquete:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtPurPackUn" runat="server" 
                                                                ClientInstanceName="txtPurPackUn" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Indicador Impuestos Acreedores:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbTaxCodeAP" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbTaxCodeAP" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </section>
                                            <section class="sectablas" id="tab3">
                                                <table id="tab3tabla3">
                                                    <tr>
                                                        <td style="width:140px">
                                                            Unidad de Medidad de Venta:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbSalUnitMsr" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbSalUnitMsr" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Artículos por Unidad de Venta:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtNuminSale" runat="server" 
                                                                ClientInstanceName="txtNuminSale" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Unidad de Medidad de Embalaje:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbSalPackMsr" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbSalPackMsr" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Cantidad por Paquete:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtSalPackUn" runat="server" 
                                                                ClientInstanceName="txtSalPackUn" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Indicador Impuestos Acreedores:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbTaxCodeAR" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbTaxCodeAR" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </section>
                                            <section class="sectablas" id="tab4">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            Unidad de Medida de Almacén: 
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbbInvntryUOM" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbInvntryUOM" Width="100%" SelectedIndex="0">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <dx:ASPxGridView ID="grdvAlmacenes" runat="server" AutoGenerateColumns="False" Width="700px"
                                                    ClientInstanceName="grdvAlmacenes" KeyFieldName="WhsName" OnCommandButtonInitialize="grdvAlmacenes_CommandButtonInitialize"
                                                    OnCustomCallback="grdvAlmacenes_CustomCallback" OnRowUpdating="grdvAlmacenes_RowUpdating" 
                                                    OnRowInserting="grdvAlmacenes_RowInserting" OnCellEditorInitialize="grdvAlmacenes_CellEditorInitialize">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <NewButton Visible="True">
                                                            </NewButton>
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Codigo de Almacén" FieldName="WhsCode"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="300px">
                                                            <PropertiesButtonEdit ClientInstanceName="bteWhsCode">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Almacén">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_AlmacenSearch" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre Almacén" PropertiesTextEdit-ClientInstanceName="txtWhsName"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" 
                                                            FieldName="WhsName">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataCheckColumn VisibleIndex="3" UnboundType="String" Caption="Bloqueado" FieldName="Locked">
                                                            <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String"
                                                                ClientInstanceName="checkLocked">
                                                            </PropertiesCheckEdit>
                                                        </dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataTextColumn Caption="En Stock" PropertiesTextEdit-ClientInstanceName="txtOnHand"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" 
                                                            FieldName="OnHand">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Comprometido" PropertiesTextEdit-ClientInstanceName="txtIsCommited"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="90px" 
                                                            FieldName="IsCommited">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Pedido" PropertiesTextEdit-ClientInstanceName="txtOnOrder"
                                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="90px" 
                                                            FieldName="OnOrder">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Disponible" PropertiesTextEdit-ClientInstanceName="txtDisponible"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="90px" 
                                                            FieldName="Disponible">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Cuenta de Ingresos" PropertiesTextEdit-ClientInstanceName="txtRevenuesAc"
                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="0px" Visible="false"
                                                            FieldName="RevenuesAc">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Cuenta de Gastos" PropertiesTextEdit-ClientInstanceName="txtExpensesAc"
                                                            ShowInCustomizationForm="True" VisibleIndex="9" Width="0px" Visible="false"
                                                            FieldName="ExpensesAc">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Tiempo" PropertiesTextEdit-ClientInstanceName="Tiempo"
                                                            ShowInCustomizationForm="True" VisibleIndex="10" Width="90px" Visible="false"
                                                            FieldName="Tiempo">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </section>
                                            <section class="sectablas" id="tab5">
                                                <dx:ASPxGridView ID="grdvPrecios" runat="server" AutoGenerateColumns="False" Width="700px" OnDataBinding="grdvPrecios_DataBinding"
                                                    ClientInstanceName="grdvPrecios" KeyFieldName="ListNum" OnCommandButtonInitialize="grdvPrecios_CommandButtonInitialize"
                                                    OnCustomCallback="grdvPrecios_CustomCallback" OnRowUpdating="grdvPrecios_RowUpdating" OnCellEditorInitialize="grdvPrecios_CellEditorInitialize">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Lista de Precios" PropertiesTextEdit-ClientInstanceName="txtPriceList"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" 
                                                            FieldName="ListNum">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre de Lista" PropertiesTextEdit-ClientInstanceName="txtListName"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" 
                                                            FieldName="ListName">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Precio" PropertiesTextEdit-ClientInstanceName="txtPrice"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="90px" 
                                                            FieldName="Price">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </section>
                                        </td>
                                    </tr>
                                </table>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItemHelpTexts Position="Bottom"></SettingsItemHelpTexts>
            </dx:LayoutGroup> 
        </Items>
    </dx:ASPxFormLayout>
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
    <dx:ASPxPopupControl ID="ppcAlmacenSearch" runat="server" 
        ClientInstanceName="ppcAlmacenSearch" FooterText=" " HeaderText="Buscar Almacén" 
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
                                        <dx:ASPxTextBox ID="txtParAlmacen" runat="server" Width="100%" 
                                            ClientInstanceName="txtParAlmacen">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteAlmacenSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteAlmacenSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Almacen" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvWhsCodeSearch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvWhsCodeSearch" 
                                KeyFieldName="WhsCode" OnCustomCallback="gdvWhsCodeSearch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvWhsCodeSearch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código Almacén" FieldName="WhsCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre Almacén" FieldName="WhsName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cuenta de Ingresos" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" Visible="false"
                                        FieldName="RevenuesAc">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cuenta de Gastos" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="90px" Visible="false"
                                        FieldName="ExpensesAc">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkAlmacen" EndCallback="EndClientSearch"/>
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
                                            <ClientSideEvents Click="OkAlmacen" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnClientCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelAlmacen" />
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
    <dx:ASPxPopupControl ID="ppcProductSearch" runat="server" 
        ClientInstanceName="ppcProductSearch" FooterText=" " HeaderText="Buscar Producto" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="400px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccProductSearch" runat="server" SupportsDisabledAttribute="True">
                <table border="0"  style="width:100%">
                    <tr>
                        <td>
                            <table class="tablespace" style="width:100%">
                                <tr>
                                    <td id="Product" style="width:105px">
                                        Código:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtParProduct" runat="server" Width="100%" 
                                            ClientInstanceName="txtParProduct">
                                            <ClientSideEvents KeyUp="Get_Product"/>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProductSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnProductSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Product" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:50px">
                                        <dx:ASPxCheckBox ID="chkKit" runat="server" CheckState="Unchecked" 
                                            ClientInstanceName="chkKit" Text="Kit:" TextAlign="Left" Visible="false">
                                            <ClientSideEvents CheckedChanged="Set_Kit" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td style="width:200px">
                                        <dx:ASPxTextBox ID="txtQuantityKit" runat="server" Width="100%" Visible="false"
                                            ClientInstanceName="txtQuantityKit" DisplayFormatString="f0">
                                            <MaskSettings Mask="&lt;0..99999999&gt;" />
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
                                    <td id="Prd" style="width:105px">
                                        Descripción:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtdescrip" runat="server" Width="300px" 
                                            ClientInstanceName="txtdescrip">
                                            <ClientSideEvents KeyUp="Get_Product"/>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="Pr" style="width:105px">
                                        Marca/Modelo:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtmarc" runat="server" Width="300px" 
                                            ClientInstanceName="txtmarc">
                                            <ClientSideEvents KeyUp="Get_Product"/>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvProductSearch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvProductSearch" 
                                KeyFieldName="ItemCode" OnCustomCallback="gdvProductSearch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvProductSearch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="ItemCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="60px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="340px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ItmsGrpCod" FieldName="ItmsGrpCod" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PrchseItem" FieldName="PrchseItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SellItem" FieldName="SellItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="InvntItem" FieldName="InvntItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BuyUnitMsr" FieldName="BuyUnitMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="6" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NumInBuy" FieldName="NumInBuy" 
                                        ShowInCustomizationForm="True" VisibleIndex="7" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalUnitMsr" FieldName="SalUnitMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="8" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NumInSale" FieldName="NumInSale" 
                                        ShowInCustomizationForm="True" VisibleIndex="9" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TreeType" FieldName="TreeType" 
                                        ShowInCustomizationForm="True" VisibleIndex="10" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PurPackMsr" FieldName="PurPackMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="11" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PurPackUn" FieldName="PurPackUn" 
                                        ShowInCustomizationForm="True" VisibleIndex="12" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalPackMsr" FieldName="SalPackMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="13" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalPackUn" FieldName="SalPackUn" 
                                        ShowInCustomizationForm="True" VisibleIndex="14" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="GLMethod" FieldName="GLMethod" 
                                        ShowInCustomizationForm="True" VisibleIndex="15" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="IssueMthd" FieldName="IssueMthd" 
                                        ShowInCustomizationForm="True" VisibleIndex="16" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ByWh" FieldName="ByWh" 
                                        ShowInCustomizationForm="True" VisibleIndex="17" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="MngMethod" FieldName="MngMethod" 
                                        ShowInCustomizationForm="True" VisibleIndex="18" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TaxCodeAP" FieldName="TaxCodeAP" 
                                        ShowInCustomizationForm="True" VisibleIndex="19" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TaxCodeAR" FieldName="TaxCodeAR" 
                                        ShowInCustomizationForm="True" VisibleIndex="20" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BPP_TIPEXIST" FieldName="U_BPP_TIPEXIST" 
                                        ShowInCustomizationForm="True" VisibleIndex="21" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ItemType" FieldName="ItemType" 
                                        ShowInCustomizationForm="True" VisibleIndex="22" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Active" FieldName="Active" 
                                        ShowInCustomizationForm="True" VisibleIndex="23" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ManBtchNum" FieldName="ManBtchNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="24" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ManSerNum" FieldName="ManSerNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="25" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ActivoC" FieldName="ActivoC" 
                                        ShowInCustomizationForm="True" VisibleIndex="26" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ActivoS" FieldName="ActivoS" 
                                        ShowInCustomizationForm="True" VisibleIndex="27" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NoFacturable" FieldName="NoFacturable" 
                                        ShowInCustomizationForm="True" VisibleIndex="28" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="InvntryUom" FieldName="InvntryUom" 
                                        ShowInCustomizationForm="True" VisibleIndex="29" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Marca" FieldName="U_GOS_MARCA" 
                                        ShowInCustomizationForm="True" VisibleIndex="30" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Modelo" FieldName="U_GOS_MODELO" 
                                        ShowInCustomizationForm="True" VisibleIndex="31" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PLAN" FieldName="PLAN" 
                                        ShowInCustomizationForm="True" VisibleIndex="32" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DetalleServicio" FieldName="DetalleServicio" 
                                        ShowInCustomizationForm="True" VisibleIndex="33" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkProduct" EndCallback="EndProductSearch"/>
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
                                    <td style="width:650px">
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnProductOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProductOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkProduct" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProductCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProductCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProduct" />
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
    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
    </dx:ASPxHiddenField>
    <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

