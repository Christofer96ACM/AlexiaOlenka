<%@ Page Title="Transferencia Stock" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="TransferenciaStock.aspx.cs" Inherits="OneCommerce.Servicio.TransferenciaStock" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSTransferenciaStock.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity:"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin:"anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Transferencia de Stock"  GroupBoxStyle-Caption-Font-Size="X-Large"
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
                                                        <td style="width:140px">
                                                            Código de Cliente:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxButtonEdit ID="bteCustomer" runat="server" ReadOnly="true"
                                                                ClientInstanceName="bteCustomer" Width="140px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cliente">
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
                                                            Nombre de Cliente:</td>
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
                                                            Nombre de Cliente:</td>
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
                                                            Nro. Interno: </td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDocEntry" runat="server"  ReadOnly="true"
                                                                ClientInstanceName="txtDocEntry" Width="100%">
                                                            </dx:ASPxTextBox>
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
                                                            Fecha Documento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxDateEdit ID="txtcreateDate1" runat="server"
                                                                ClientInstanceName="txtcreateDate1" Width="100%">
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
                                                            Responsable:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbeOwnerCode" runat="server"
                                                                ClientInstanceName="cbeOwnerCode" Width="100%">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Almacén Origen:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbalmacenorigen" runat="server" 
                                                                ClientInstanceName="cbbalmacenorigen" Width="100%" OnCallback="cbbalmacenorigen_Callback">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Almacén Destino:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbalmacendestino" runat="server"
                                                                ClientInstanceName="cbbalmacendestino" Width="100%" OnCallback="cbbalmacendestino_Callback">
                                                            </dx:ASPxComboBox>
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
                                                        <td colspan="5" style="width:600px">
                                                            <dx:ASPxGridView ID="gdvArticulos" runat="server" AutoGenerateColumns="False" Width="600px"
                                                                ClientInstanceName="gdvArticulos" KeyFieldName="LineNum"
                                                                OnRowDeleting="gdvArticulos_RowDeleting" 
                                                                OnCustomCallback="gdvArticulos_CustomCallback"
                                                                OnRowUpdating="gdvArticulos_RowUpdating"
                                                                OnDataBinding="gdvArticulos_DataBinding">
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="0" Width="50px">
                                                                        <EditButton Visible="True">
                                                                        </EditButton>
                                                                        <NewButton Visible="True">
                                                                        </NewButton>
                                                                        <DeleteButton Visible="True">
                                                                        </DeleteButton>
                                                                        <CellStyle Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Línea" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="1" Width="50px" FieldName="LineNum">
                                                                        <PropertiesTextEdit ClientInstanceName="txtLineNum">
                                                                            <Style HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                            </Style>
                                                                        </PropertiesTextEdit>
                                                                        <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <CellStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataButtonEditColumn Caption="Código" FieldName="ItemCode" 
                                                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                                                        <PropertiesButtonEdit ClientInstanceName="bteItemCode">
                                                                            <Buttons>
                                                                                <dx:EditButton ToolTip="Agregar Artículo" Visible="true">
                                                                                </dx:EditButton>
                                                                            </Buttons>
                                                                            <Style Font-Size="8pt">
                                                                            </Style>
                                                                            <ClientSideEvents ButtonClick="ShowProductSearch"/>
                                                                        </PropertiesButtonEdit>
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataButtonEditColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="120px">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="4" Width="70px" FieldName="Quantity">
                                                                        <PropertiesTextEdit ClientInstanceName="txtQuantity" DisplayFormatInEditMode="true">
                                                                        </PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataButtonEditColumn Caption="Almacén Origen" ShowInCustomizationForm="True" ReadOnly="true" 
                                                                        VisibleIndex="5" Width="80px" FieldName="WhsCode">
                                                                            <PropertiesButtonEdit ClientInstanceName="WhsCode">
                                                                            <Buttons>
                                                                                <dx:EditButton ToolTip="Agregar Almacén" Visible="false">
                                                                                </dx:EditButton>
                                                                            </Buttons>
                                                                            <Style Font-Size="8pt">
                                                                            </Style>
                                                                            <ClientSideEvents ButtonClick="Show_AlmacenSearch"/>
                                                                        </PropertiesButtonEdit>
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataButtonEditColumn>
                                                                    <dx:GridViewDataButtonEditColumn Caption="Almacén Destino" ShowInCustomizationForm="True" ReadOnly="true" 
                                                                        VisibleIndex="6" Width="80px" FieldName="WareHouse">
                                                                            <PropertiesButtonEdit ClientInstanceName="WareHouse">
                                                                            <Buttons>
                                                                                <dx:EditButton ToolTip="Agregar Almacén" Visible="false">
                                                                                </dx:EditButton>
                                                                            </Buttons>
                                                                            <Style Font-Size="8pt">
                                                                            </Style>
                                                                            <ClientSideEvents ButtonClick="Show_AlmacenSearch1"/>
                                                                        </PropertiesButtonEdit>
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataButtonEditColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Gestion de Articulo" FieldName="IssueMthd"
                                                                        ShowInCustomizationForm="True" VisibleIndex="7" Width="80px">
                                                                            <PropertiesTextEdit ClientInstanceName="txtIssueMthd"
                                                                                DisplayFormatInEditMode="true">
                                                                                <Style VerticalAlign="Middle" Font-Size="8pt">
                                                                                </Style>
                                                                            </PropertiesTextEdit>
                                                                            <EditCellStyle VerticalAlign="Middle" Font-Size="8pt">
                                                                            </EditCellStyle>
                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            <CellStyle ForeColor="Black"  VerticalAlign="Middle" Font-Size="8pt">
                                                                            </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataButtonEditColumn Caption="Serie a Seleccionar" FieldName="Serie" 
                                                                        ShowInCustomizationForm="True" VisibleIndex="8" Width="260px">
                                                                        <PropertiesButtonEdit ClientInstanceName="bteSerialNumber">
                                                                            <Buttons>
                                                                                <dx:EditButton ToolTip="Seleccionar Serie" Visible="true">
                                                                                </dx:EditButton>
                                                                            </Buttons>
                                                                            <Style Font-Size="8pt">
                                                                            </Style>
                                                                            <ClientSideEvents ButtonClick="ShowPoput"/>
                                                                        </PropertiesButtonEdit>
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataButtonEditColumn>
                                                                </Columns>
                                                                <SettingsBehavior AllowSort="False" ColumnResizeMode="Disabled"
                                                                    ConfirmDelete="True" />
                                                                <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                                </SettingsPager>
                                                                <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                                <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                                <SettingsText Title="ARTÍCULOS" />
                                                                <Styles>
                                                                    <Row Font-Size="7pt">
                                                                    </Row>
                                                                    <Footer Font-Size="1pt">
                                                                    </Footer>
                                                                    <TitlePanel Font-Bold="True" Font-Size="7pt" HorizontalAlign="Center">
                                                                    </TitlePanel>
                                                                </Styles>
                                                                <ClientSideEvents />
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
                                                        <td style="width:140px;">
                                                            Direeción:</td>
                                                        <td style="width:460px; text-align:center" colspan="4">
                                                            <dx:ASPxTextBox ID="txtAddress" runat="server" Width="100%" ReadOnly="true"
                                                                ClientInstanceName="txtAddress" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                    </tr>
                                                    <%--<tr>
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
                                                    --%>
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
    <dx:ASPxPopupControl ID="ASPxSerialNumber" runat="server" 
        ClientInstanceName="ppcSerialNumber" FooterText=" " HeaderText="Seleccionar Serie" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="220px" Modal="true" Height="200px"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td id="Td1" style="width:105px">
                                        </td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%" 
                                            ClientInstanceName="txtParClient" Visible="false">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <%--<dx:ASPxButton ID="ASPxButton1" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Client"/>
                                        </dx:ASPxButton>--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxListBox  ID="ListSeries" runat="server" KeyFieldName="SysNumber"
                                ValueType="System.String" ClientInstanceName="ListSeries" 
                                Height="320px" SelectionMode="CheckColumn">
                                <Columns>
                                    <%--<dx:ListBoxColumn Caption="Codigo" FieldName="ItemCode"/>--%>
                                    <dx:ListBoxColumn Caption="Serie" FieldName="Serie" />
                                    <%--<dx:ListBoxColumn Caption="SysNumber" FieldName="SysNumber" />--%>
                                </Columns>
                            </dx:ASPxListBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:340px">
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxAceptarSerie" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OK_Series" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxCancelarSerie" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelSeries" />
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
    <dx:ASPxPopupControl ID="ppcLotesNumber" runat="server" 
        ClientInstanceName="ppcLotesNumber" FooterText=" " HeaderText="Seleccionar Lotes" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="220px" Modal="true" Height="200px"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td id="Td10" style="width:105px">
                                        </td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="100%" 
                                            ClientInstanceName="txtParClient" Visible="false">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <%--<dx:ASPxButton ID="ASPxButton1" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Client"/>
                                        </dx:ASPxButton>--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvLotes" runat="server" Width="100%" 
                                    AutoGenerateColumns="False" ClientInstanceName="gdvLotes" 
                                    KeyFieldName="Lote" OnCustomCallback="gdvLotes_CustomCallback" 
                                    KeyboardSupport="True" OnDataBinding="gdvLotes_DataBinding" 
                                    OnCellEditorInitialize="gdvLotes_CellEditorInitialize" 
                                    OnCommandButtonInitialize="gdvLotes_CommandButtonInitialize"
                                    OnRowUpdating="gdvLotes_RowUpdating">
                                    <Columns>
                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                            VisibleIndex="0" Width="60px">
                                            <EditButton Visible="True">
                                            </EditButton>
                                            <CellStyle Font-Size="8pt">
                                            </CellStyle>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="Lote" FieldName="Lote" 
                                            ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                            VisibleIndex="0" Width="60px">
                                            <Settings AllowSort="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Numero Interno" FieldName="SysNumber" 
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="20px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Stock" FieldName="Stock" 
                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="30px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fecha Venc." FieldName="DueDate" 
                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="40px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Cantidad" 
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="30px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" 
                                        AllowSelectSingleRowOnly="True" />
                                    <ClientSideEvents />
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
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OK_Lotes" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelLotes" />
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

    <dx:ASPxPopupControl ID="ppcTSSearch" runat="server" 
            ClientInstanceName="ppcTSSearch" FooterText=" " HeaderText="Buscar Transferencias" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            RenderMode="Lightweight" ShowFooter="True" Width="800px" Modal="true"
            AllowDragging="True" PopupAnimationType="Fade">
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="pccOinvSearch" runat="server" SupportsDisabledAttribute="True">
                    <table border="0"  style="width:100%">
                        <tr>
                            <td>
                                <table class="tablespace" style="width:100%">
                                    <tr>
                                        <td style="width:105px">
                                            Rango Fechas:</td>
                                        <td style="width:130px">
                                            <dx:ASPxDateEdit ID="dteDateIn" runat="server" Width="130px" 
                                                ClientInstanceName="dteDateIn">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:130px">
                                            <dx:ASPxDateEdit ID="dteDateFi" runat="server" Width="130px" 
                                                ClientInstanceName="dteDateFi">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:130px">
                                            Nro. Documento:</td>
                                        <td style="width:170px">
                                            <dx:ASPxTextBox ID="txtNumAtCards" runat="server" 
                                                ClientInstanceName="txtNumAtCards" Width="170px">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:50px">
                                            <dx:ASPxButton ID="btnOinvSearch" runat="server" AutoPostBack="False" 
                                                ClientInstanceName="btnOinvSearch" Text="Buscar" Width="100%">
                                                <ClientSideEvents Click="get_TS" />
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxGridView ID="gdvtranSearch" runat="server" Width="100%"
                                    AutoGenerateColumns="False" ClientInstanceName="gdvtranSearch" 
                                    KeyFieldName="DocEntry" OnCustomCallback="gdvtranSearch_CustomCallback" 
                                    KeyboardSupport="True" OnDataBinding="gdvtranSearch_DataBinding">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DocDate"
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="d">
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cód. Cliente" FieldName="CardCode" 
                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" 
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="200px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nro. Interno" FieldName="DocEntry" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="6" Width="0px">                                           
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nro. Documento" FieldName="DocNum" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="7" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Almacén Origen" FieldName="AlmacenO" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="8" Width="0px">                                           
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Almacén Destino" FieldName="AlmacenD" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="9" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="SlpCode" FieldName="SlpCode" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="12" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Address" FieldName="Address" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="12" Width="0px">
                                        </dx:GridViewDataTextColumn>                                        
                                    </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" 
                                        AllowSelectSingleRowOnly="True" />
                                    <ClientSideEvents RowDblClick="OkTS"/>
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
                                            <dx:ASPxButton ID="btnOinvOk" runat="server" Text="Ok" Width="100%" 
                                                ClientInstanceName="btnOinvOk" AutoPostBack="False">
                                                <ClientSideEvents Click="OkTS" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnOinvCancel" runat="server" Text="Cancelar" Width="100%" 
                                                ClientInstanceName="btnOinvCancel" AutoPostBack="False">
                                                <ClientSideEvents Click="CancelTS" />
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
        ClientInstanceName="ppcClientSearch" FooterText=" " HeaderText="Buscar Cliente" 
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
                                            <ClientSideEvents KeyUp="Get_Client1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteClientSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Client" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="ClientParCaptin" style="width:105px">
                                        Razón Social:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtRazonS" runat="server" Width="100%" 
                                            ClientInstanceName="txtRazonS">
                                            <ClientSideEvents KeyPress="Get_Client" />
                                        </dx:ASPxTextBox>
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
    <dx:ASPxPopupControl ID="ppcProductSearch" runat="server" 
        ClientInstanceName="ppcProductSearch" FooterText=" " HeaderText="Buscar Producto" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="700px" Modal="true"
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
                                    <td id="ProductParCaption" style="width:105px">
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
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="400px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Método" FieldName="IssueMthd" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="150px" Visible="true">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents  RowDblClick="OkProduct" EndCallback="EndProductSearch"/>
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
                                    <td id="ClientParCaptio" style="width:105px">
                                        Filtro:</td>
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
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkAlmacen"/>
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
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkAlmacen" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Cancelar" Width="100%" 
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
    <dx:ASPxPopupControl ID="ppcAlmacenSearch1" runat="server" 
        ClientInstanceName="ppcAlmacenSearch1" FooterText=" " HeaderText="Buscar Almacén" 
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
                                    <td id="ClientParCapti" style="width:105px">
                                        Filtro:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="100%" 
                                            ClientInstanceName="txtParAlmacen">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteAlmacenSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Almacen1" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvWhsCodeSearch1" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvWhsCodeSearch1" 
                                KeyFieldName="WhsCode" OnCustomCallback="gdvWhsCodeSearch1_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvWhsCodeSearch1_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código Almacén" FieldName="WhsCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre Almacén" FieldName="WhsName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkAlmacen1"/>
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
                                        <dx:ASPxButton ID="ASPxButton6" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkAlmacen1" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton7" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelAlmacen1" />
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

