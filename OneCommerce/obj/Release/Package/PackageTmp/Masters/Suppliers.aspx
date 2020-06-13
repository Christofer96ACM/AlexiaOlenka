<%@ Page Title="Proveedores" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="OneCommerce.Masters.Suppliers"%>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Tools/General.js"></script>
<script type="text/javascript" src="../Scripts/Tools/JSSuppliers.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Proveedores." GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <nav>
                                    <a href="#tab1" class="amenucrearclie"><i class="fas fa-home"></i> General</a>
                                    <a href="#tab2" class="amenucrearclie"><i class="fas fa-user-check"></i> Contactos</a>
                                    <a href="#tab3" class="amenucrearclie"><i class="fas fa-list-ul"></i> Direcciones</a>
                                    <a href="#tab4" class="amenucrearclie"><i class="fas fa-dollar-sign"></i> Finanzas</a>
                                    <%--<a href="#tab5" class="amenucrearclie"><i class="fas fa-list-ul"></i> Direcciones 2.0</a>--%>
                                </nav>
                                <table id="tablaprincdecrearclie" style="width:700px; height:350px" class="tablespace">
                                    <tr>
                                        <td colspan="3" style="width:400px" class="tablespace">
                                            <section class="sectablas" id="tab1">
                                                <table id="tab1tabla1">
                                                    <tr>
                                                        <td style="width:140px">
                                                            Código:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtCrCardCode" runat="server" 
                                                                ClientInstanceName="txtCrCardCode" Width="100%" ReadOnly="True">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Razón Social:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtCrCardName" runat="server" Width="100%"
                                                                ClientInstanceName="txtCrCardName">
                                                                <ClientSideEvents KeyUp="Key_CrCardName"></ClientSideEvents>

                                                                    <ValidationSettings ValidationGroup="ValCrClient" SetFocusOnError="True" ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                                                    <RequiredField IsRequired="True" ErrorText="Nombre de cliente incorrecto."></RequiredField>
                                                                    </ValidationSettings>
                                                                    <ClientSideEvents KeyUp="Key_CrCardName" />
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Tipo Persona:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbCrPersonType" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbCrPersonType" SelectedIndex="0">
                                                                <ClientSideEvents SelectedIndexChanged="Get_CrDocumentType"></ClientSideEvents>
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Jurídica" Value="TPJ" />
                                                                    <dx:ListEditItem Text="Natural" Value="TPN" />
                                                                    <dx:ListEditItem Text="No Domiciliado" Value="SND" />
                                                                </Items>
                                                                <ClientSideEvents SelectedIndexChanged="Get_CrDocumentType" />
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Tipo Documento:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbCrDocumentType" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbCrDocumentType" Width="100%" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="RUC" Value="6" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Nro. Documento:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtCrLicTradNum" runat="server" MaxLength="11"
                                                                ClientInstanceName="txtCrLicTradNum" Width="100%">
                                                                <ClientSideEvents KeyPress="ProcessKeyPress" KeyUp="Key_CrLicTradNum"></ClientSideEvents>
                                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" 
                                                                    SetFocusOnError="True" ValidationGroup="ValCrClient">
                                                                    <RequiredField ErrorText="Nro. Documento incorrecto." IsRequired="True" />
                                                                    <RequiredField IsRequired="True" ErrorText="Nro. Documento incorrecto."></RequiredField>

                                                                    <RegularExpression ErrorText="Nro. Documento incorrecto." ValidationExpression="[0-9]+(\.[0-9][0-9]?)?">
                                                                    </RegularExpression>
                                                                </ValidationSettings>
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Fecha de Registro:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxDateEdit ID="dteCrU_PN_FecNac" runat="server" Width="100%"
                                                                ClientInstanceName="dteCrU_PN_FecNac">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Teléfono Fijo:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtCrPhone1" runat="server" Width="100%"
                                                                ClientInstanceName="txtCrPhone1">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Teléfono Movil:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtCrCellular" runat="server" Width="100%"
                                                                ClientInstanceName="txtCrCellular">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Correo Facturacion:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtCrE_Mail" runat="server" Width="100%"
                                                                ClientInstanceName="txtCrE_Mail">
                                                                    <ValidationSettings ValidationGroup="ValCrClient" SetFocusOnError="True" ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                                                    <RegularExpression ErrorText="E-mail invalido." ValidationExpression="\w+([-+.&#39;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></RegularExpression>
                                                                    </ValidationSettings>
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Estado:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxRadioButtonList ID="rbtnestado" runat="server" Height="20px" 
                                                                        RepeatDirection="Vertical" Width="100%" SelectedIndex="0" 
                                                                        ClientInstanceName="rbtnestado" Border-BorderStyle="None">
                                                                <Items>
                                                                    <dx:ListEditItem Text="Activo" Value="Y" Selected="True" />
                                                                    <dx:ListEditItem Text="Inactivo" Value="N" />
                                                                </Items>
                                                            </dx:ASPxRadioButtonList>
                                                        </td>
                                                    </tr>
                                                </table>
                                                
                                            </section>
                                            <section class="sectablas" id="tab2">
                                                <dx:ASPxGridView ID="gvcontacto" runat="server" AutoGenerateColumns="False" Width="700px"
                                                                ClientInstanceName="gvcontacto" KeyFieldName="CntctCode"
                                                                OnCellEditorInitialize="gvcontacto_CellEditorInitialize" OnRowUpdating="gvcontacto_RowUpdating"
                                                                OnCommandButtonInitialize="gvcontacto_CommandButtonInitialize" OnCustomCallback="gvcontacto_CustomCallback"
                                                                OnRowInserting="gvcontacto_RowInserting" OnRowDeleting="gvcontacto_RowDeleting" OnInitNewRow="gvcontacto_InitNewRow">
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="0" Width="120px">
                                                                        <NewButton Visible="True">
                                                                        </NewButton>
                                                                        <EditButton Visible="true">
                                                                        </EditButton>
                                                                        <DeleteButton Visible="True">
                                                                        </DeleteButton>
                                                                        <CellStyle Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Nombre" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="5" Width="100px" FieldName="FirstName" ReadOnly="true">
                                                                        <PropertiesTextEdit ClientInstanceName="txtNameContacto" 
                                                                            DisplayFormatInEditMode="true">
                                                                        
<Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </Style>
                                                                        
</PropertiesTextEdit>
                                                                        <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Apellidos" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="5" Width="100px" FieldName="LastName" ReadOnly="true">
                                                                        <PropertiesTextEdit ClientInstanceName="txtLastNameContacto"
                                                                            DisplayFormatInEditMode="true">
                                                                        
<Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </Style>
                                                                        
</PropertiesTextEdit>
                                                                        <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Telefono Contacto" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="5" Width="100px" FieldName="Cellolar" ReadOnly="true">
                                                                        <PropertiesTextEdit ClientInstanceName="txtTelefonoContacto"
                                                                            DisplayFormatInEditMode="true">
                                                                            
<Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                            </Style>
                                                                        
</PropertiesTextEdit>
                                                                        <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Correo Contacto" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="5" Width="100px" FieldName="E_MailL" ReadOnly="false">
                                                                        <PropertiesTextEdit ClientInstanceName="txtCorreoContacto"
                                                                            DisplayFormatInEditMode="true">                                               
                                                                        
<Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </Style>
                                                                        
</PropertiesTextEdit>
                                                                        <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                        <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataCheckColumn VisibleIndex="18" UnboundType="String" Caption="Activo" FieldName="Active">
                                                                        <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String"></PropertiesCheckEdit>
                                                                    </dx:GridViewDataCheckColumn>
                                                                </Columns>
                                                                <SettingsBehavior AllowSort="False" ColumnResizeMode="Disabled"
                                                                    ConfirmDelete="True" />
                                                                <SettingsBehavior AllowSort="False" ConfirmDelete="True"></SettingsBehavior>
                                                                <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                                </SettingsPager>
                                                                <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                                <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                                <SettingsText Title="CONTACTOS" />
                                                                <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom"></SettingsEditing>
                                                                <Settings ShowTitlePanel="True" ShowFooter="True"></Settings>
                                                                <SettingsText Title="CONTACTOS"></SettingsText>
                                                                <Styles>
                                                                    <Row Font-Size="7pt">
                                                                    </Row>
                                                                    <Footer Font-Size="1pt">
                                                                    </Footer>
                                                                    <TitlePanel Font-Bold="True" Font-Size="7pt" HorizontalAlign="Center">
                                                                    </TitlePanel>
                                                                </Styles>
                                                </dx:ASPxGridView>
                                            </section>
                                            <%--<section class="sectablas" id="tab3">
                                                <article id="direccionesdatos">
                                                    <TABLE id="datosdirec" >
                                                        <tr>
                                                            <td style="width:140px">
                                                                ID de Dirección:</td>
                                                            <td style="width:240px">
                                                                <dx:ASPxTextBox ID="textAddress" runat="server"
                                                                    ClientInstanceName="textAddress" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:140px">
                                                                Calle de Dirección:</td>
                                                            <td style="width:240px">
                                                                <dx:ASPxTextBox ID="txtStreet" runat="server" 
                                                                    ClientInstanceName="txtStreet" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:140px">
                                                                Pais:</td>
                                                            <td style="width:240px">
                                                                <dx:ASPxTextBox ID="Country" runat="server"
                                                                    ClientInstanceName="Country" Width="100%" Text="PERU" ReadOnly="true">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:140px">
                                                                Departamento:</td>
                                                            <td style="width:240px">
                                                                <dx:ASPxComboBox ID="cbbState" runat="server" Width="100%"
                                                                ClientInstanceName="cbbState" EnableSynchronization="False">
                                                                <ClientSideEvents SelectedIndexChanged="GET_PROVINCIAS_JS">
                                                                </ClientSideEvents>
                                                            </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:140px">
                                                                Provincia:</td>
                                                            <td style="width:240px">
                                                                <dx:ASPxComboBox ID="cbbU_DXP_BIZ_COPR" runat="server" Width="100%"
                                                                ClientInstanceName="cbbU_DXP_BIZ_COPR" EnableSynchronization="False">
                                                                <ClientSideEvents SelectedIndexChanged="GET_DISTRITOS_JS">
                                                                </ClientSideEvents>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:140px">
                                                                Distrito:</td>
                                                            <td style="width:240px">
                                                                <dx:ASPxComboBox ID="cbbU_DXP_BIZ_CODI" runat="server" Width="100%"
                                                                ClientInstanceName="cbbU_DXP_BIZ_CODI" EnableSynchronization="False">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:140px" >
                                                                <%--Zona:</td>
                                                            <td style="width:240px">
                                                                <dx:ASPxTextBox ID="U_BIZ_ZONA" runat="server" Width="100%" Visible="false"
                                                                ClientInstanceName="U_BIZ_ZONA" EnableSynchronization="False">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:140px">
                                                                Tipo de Direccion
                                                            </td>
                                                            <td style="width:240px; text-align:center;">
                                                                <dx:ASPxRadioButtonList ID="rdbtntipofact" runat="server" Height="20px" 
                                                                        RepeatDirection="Vertical" Width="128px" SelectedIndex="0" 
                                                                        ClientInstanceName="rdbtntipofact">
                                                                    <Items>
                                                                        <dx:ListEditItem Text=" Factura" Value="B" Selected="True" />
                                                                        <dx:ListEditItem Text=" Destino" Value="S" />
                                                                    </Items>
                                                                </dx:ASPxRadioButtonList>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:110px; text-align:center;">
                                                                <dx:ASPxButton ID="btnagregardirecc" runat="server" AutoPostBack="False"
                                                                    ClientInstanceName="btnagregardirecc" Text="Agregar" Width="70px" HorizontalAlign="Center">
                                                                    <ClientSideEvents Click="Agregar_direc"/>
                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td style="width:110px; text-align:center;">
                                                                <dx:ASPxButton ID="btnnuevodirec" runat="server" AutoPostBack="False"
                                                                    ClientInstanceName="btnnuevodirec" Text="Nuevo" Width="70px" HorizontalAlign="Center">
                                                                    <ClientSideEvents Click="Nueva_direc"/>
                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td style="width:110px; text-align:center;">
                                                                <dx:ASPxButton ID="btnmodificardirec" runat="server" AutoPostBack="False" 
                                                                    ClientInstanceName="btnmodificardirec" Text="Modificar" Width="70px" HorizontalAlign="Center">
                                                                <ClientSideEvents Click="Modificar_direc" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td style="width:110px; text-align:center;">
                                                                <dx:ASPxButton ID="btnquitardirecc" runat="server" AutoPostBack="False"
                                                                    ClientInstanceName="btnquitardirecc" Text="Quitar" Width="70px" HorizontalAlign="Center">
                                                                    <ClientSideEvents Click="Quitar_direc" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </article>
                                                <article id="direccioneslista">
                                                    <dx:ASPxListBox ID="listdirecciones" runat="server" KeyFieldName="LineNum"
                                                        ValueType="System.String" ClientInstanceName="listdirecciones"
                                                        OnCallback ="listdirecciones_Callback">
                                                        <ClientSideEvents SelectedIndexChanged="cambiardirec" EndCallback="fincallback"/>
                                                        <Columns>
                                                            <%--<dx:ListBoxColumn Caption="Linea" FieldName="LineNum"/>
                                                            <dx:ListBoxColumn Caption="Id Direccion" FieldName="Address"/>
                                                            <dx:ListBoxColumn Caption="Calle" FieldName="Street"/>
                                                            <dx:ListBoxColumn Caption="Pais" FieldName="Country"/>
                                                            <dx:ListBoxColumn Caption="Estado" FieldName="State"/>
                                                            <dx:ListBoxColumn Caption="Provincia" FieldName="U_DXP_BIZ_COPR"/>
                                                            <dx:ListBoxColumn Caption="Nombre Provincia" FieldName="U_DXP_BIZ_PROV"/>
                                                            <dx:ListBoxColumn Caption="Distrito" FieldName="U_DXP_BIZ_CODI"/>
                                                            <dx:ListBoxColumn Caption="Nombre Distrito" FieldName="U_DXP_BIZ_DIST"/>
                                                            <dx:ListBoxColumn Caption="Tipo" FieldName="AdresType"/>
                                                            <%--<dx:ListBoxColumn Caption="Linea" FieldName="Linea"/>
                                                        </Columns>
                                                    </dx:ASPxListBox>
                                                </article>
                                            </section>--%>
                                            <section class="sectablas" id="tab4">
                                                <table>
                                                    <tr>
                                                        <td>Condiciones de Pago: </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="GroupNum" runat="server" Width="100%"
                                                                ClientInstanceName="GroupNum" EnableSynchronization="False">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Lista de Precios: </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="ListNum" runat="server" Width="100%"
                                                                ClientInstanceName="ListNum" EnableSynchronization="False">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Moneda: </td>
                                                        <td>
                                                            <dx:ASPxComboBox ID="cbbCurrency" runat="server" Width="100%"
                                                                ClientInstanceName="cbbCurrency" EnableSynchronization="False">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </section>
                                            <section class="sectablas" id="tab3">
                                                <dx:ASPxGridView ID="gvDirecciones" runat="server" AutoGenerateColumns="False" Width="800px"
                                                    ClientInstanceName="gvDirecciones" KeyFieldName="Address"
                                                    OnCellEditorInitialize="gvDirecciones_CellEditorInitialize" OnRowUpdating="gvDirecciones_RowUpdating"
                                                    OnCommandButtonInitialize="gvDirecciones_CommandButtonInitialize" OnCustomCallback="gvDirecciones_CustomCallback"
                                                    OnRowInserting="gvDirecciones_RowInserting" OnRowDeleting="gvDirecciones_RowDeleting"
                                                    OnDataBinding="gvDirecciones_DataBinding" OnInitNewRow="gvDirecciones_InitNewRow">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <NewButton Visible="True">
                                                            </NewButton>
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                            <DeleteButton Visible="True">
                                                            </DeleteButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="ID Direccion" ShowInCustomizationForm="True" 
                                                            VisibleIndex="1" Width="100px" FieldName="Address" ReadOnly="true">
                                                            <PropertiesTextEdit ClientInstanceName="Address"
                                                                DisplayFormatInEditMode="true">
                                                                        
                                                            </PropertiesTextEdit>
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Calle/Direccion" ShowInCustomizationForm="True" 
                                                            VisibleIndex="2" Width="100px" FieldName="Street" ReadOnly="true">
                                                            <PropertiesTextEdit ClientInstanceName="Street"
                                                                DisplayFormatInEditMode="true">
                                                            </PropertiesTextEdit>
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Departamento" FieldName="StateName"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="300px">
                                                            <PropertiesButtonEdit ClientInstanceName="StateName">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Departamentos">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_DepartamentoSearch" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Departamento" ShowInCustomizationForm="True" 
                                                            VisibleIndex="4" Width="0px" FieldName="State" ReadOnly="false">
                                                            <PropertiesTextEdit ClientInstanceName="State"
                                                                DisplayFormatInEditMode="true">    </PropertiesTextEdit>                                           
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Provincia" FieldName="U_DXP_BIZ_PROV"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="300px">
                                                            <PropertiesButtonEdit ClientInstanceName="U_DXP_BIZ_PROV">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Provincia">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_ProvinciaSearch" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Provincia" ShowInCustomizationForm="True" 
                                                            VisibleIndex="6" Width="0px" FieldName="U_DXP_BIZ_COPR" ReadOnly="false">
                                                            <PropertiesTextEdit ClientInstanceName="U_DXP_BIZ_COPR"
                                                                DisplayFormatInEditMode="true">    </PropertiesTextEdit>                                           
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Distrito" FieldName="U_DXP_BIZ_DIST"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="300px">
                                                            <PropertiesButtonEdit ClientInstanceName="U_DXP_BIZ_DIST">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Distrito">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_DistritoSearch" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Provincia" ShowInCustomizationForm="True" 
                                                            VisibleIndex="8" Width="0px" FieldName="U_DXP_BIZ_CODI" ReadOnly="false">
                                                            <PropertiesTextEdit ClientInstanceName="U_DXP_BIZ_CODI"
                                                                DisplayFormatInEditMode="true">    </PropertiesTextEdit>                                           
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataCheckColumn VisibleIndex="9" UnboundType="String" Caption="Fiscal" FieldName="AdresType">
                                                            <PropertiesCheckEdit AllowGrayed="false" ValueChecked="B" ValueUnchecked="S" ValueType="System.String"></PropertiesCheckEdit>
                                                        </dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataCheckColumn VisibleIndex="10" UnboundType="String" Caption="Activo" FieldName="Active">
                                                            <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Activo" ValueUnchecked="Inactivo" ValueType="System.String"></PropertiesCheckEdit>
                                                        </dx:GridViewDataCheckColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowSort="False" ColumnResizeMode="Disabled"
                                                        ConfirmDelete="True" />
                                                    <SettingsBehavior AllowSort="False" ConfirmDelete="True"></SettingsBehavior>
                                                    <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Direcciones" />
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom"></SettingsEditing>
                                                    <Settings ShowTitlePanel="True" ShowFooter="True"></Settings>
                                                    <SettingsText Title="Direcciones"></SettingsText>
                                                    <Styles>
                                                        <Row Font-Size="7pt">
                                                        </Row>
                                                        <Footer Font-Size="1pt">
                                                        </Footer>
                                                        <TitlePanel Font-Bold="True" Font-Size="7pt" HorizontalAlign="Center">
                                                        </TitlePanel>
                                                    </Styles>
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
    <dx:ASPxPopupControl ID="ppcDepaSearch" runat="server" 
        ClientInstanceName="ppcDepaSearch" FooterText=" " HeaderText="Buscar Departamento" 
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
                                    <td style="width:105px">
                                        Departamento:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtDepaSearch" runat="server" Width="100%" 
                                            ClientInstanceName="txtDepaSearch" ClientSideEvents-KeyPress="Get_Depa">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDepa" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnDepaSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Depa1"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvDepartamento" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvDepartamento" 
                                KeyFieldName="Code" OnCustomCallback="gdvDepartamento_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvDepartamento_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Departamento" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkDepa" EndCallback="EndDepaSearch"/>
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
                                        <dx:ASPxButton ID="btnDepaOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnDepaOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkDepa" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDepaCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnDepaCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelDepa" />
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
    <dx:ASPxPopupControl ID="ppcProvinciaSearch" runat="server" 
        ClientInstanceName="ppcProvinciaSearch" FooterText=" " HeaderText="Buscar Provincia" 
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
                                    <td style="width:105px">
                                        Provincia:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtProvincia" runat="server" Width="100%" 
                                            ClientInstanceName="txtProvincia" ClientSideEvents-KeyPress="Get_Prov">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProvinciaSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnProvinciaSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Prov1"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvProvincia" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvProvincia" 
                                KeyFieldName="Code" OnCustomCallback="gdvProvincia_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvProvincia_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Provincia" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkProvincia" EndCallback="EndProvinciaSearch"/>
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
                                        <dx:ASPxButton ID="btnProvinciaOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProvinciaOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkProvincia" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProvinciaCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProvinciaCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProvincia" />
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
    <dx:ASPxPopupControl ID="ppcDistritoSearch" runat="server" 
        ClientInstanceName="ppcDistritoSearch" FooterText=" " HeaderText="Buscar Distrito" 
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
                                    <td style="width:105px">
                                        Distrito:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtDistrito" runat="server" Width="100%" 
                                            ClientInstanceName="txtDistrito" ClientSideEvents-KeyPress="Get_Dist">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDistritoSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnDistritoSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Dist1"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvDistrito" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvDistrito" 
                                KeyFieldName="Code" OnCustomCallback="gdvDistrito_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvDistrito_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Distrito" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkDistrito" EndCallback="EndDistritoSearch"/>
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
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProvinciaOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkDistrito" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProvinciaCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelDistrito" />
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
                                            <ClientSideEvents KeyUp="Get_Client"/>
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
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lista de Precios" FieldName="ListNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Vendedor Asignado" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkClient" EndCallback="EndClientSearch"/>
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
        <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
        </dx:ASPxHiddenField>
        <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

