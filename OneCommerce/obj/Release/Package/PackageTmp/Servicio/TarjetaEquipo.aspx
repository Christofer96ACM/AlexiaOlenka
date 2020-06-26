<%@ Page Title="Tarjeta de Equipo" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="TarjetaEquipo.aspx.cs" Inherits="OneCommerce.Servicio.TarjetaEquipo" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<%--<script type="text/javascript" src="../Scripts/Tools/JSArticulos.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSTarjetaEquipo.js"></script>
<%--<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>--%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Tarjeta de Equipo"  GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <nav>
                                    <a href="#tab1" class="amenucrearclie"><i class="fas fa-home"></i> General</a>
                                    <a href="#tab2" class="amenucrearclie"><i class="fas fa-home"></i> Dirección</a>
                                    <a href="#tab3" class="amenucrearclie"><i class="fas fa-shopping-cart"></i> Datos de Venta</a>
                                    <a href="#tab4" class="amenucrearclie"><i class="fas fa-money-check-alt"></i>Llamada de Servicio</a>
                                   
                                </nav>
                                <table id="tablaprincdecreartar" style="width:700px; height:350px" class="tablespace">
                                    <tr>
                                        <td colspan="3" style="width:400px" class="tablespace">
                                            <section class="sectablas" id="tab1">
                                                <table id="tab1tabla1">
                                                    <tr>
                                                       <td style="width:140px">
                                                            Código de Cliente:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxButtonEdit ID="bteCustomer" runat="server" ReadOnly="true"
                                                                ClientInstanceName="bteCustomer" Width="100%">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cliente">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="ShowClientSearch" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                       
                                                       <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Clase de Artículo:--%>Estado:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbstatus" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbstatus" SelectedIndex="0">
                                                                 <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Activo" Value="A" />
                                                                    <dx:ListEditItem Text="Devuelto" Value="R" />
                                                                    <dx:ListEditItem Text="Cancelado" Value="T" />
                                                                    <dx:ListEditItem Text="Préstamo" Value="L" />
                                                                    <dx:ListEditItem Text="Reparación" Value="I" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                           
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                           Nombre del Cliente:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtcustmrName" runat="server" Width="100%"
                                                                ClientInstanceName="txtcustmrName" ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                         <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            ID Tarjeta</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtinsID" runat="server" Width="100%"
                                                                ClientInstanceName="txtinsID" Visible="true" ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                            
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                           Persona de Contacto:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="txtcontctCode1" runat="server" 
                                                                ClientInstanceName="txtcontctCode1" Width="100%" OnCallback="txtcontctCode1_Callback">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                       
                                                       
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Número de Articulo:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxButtonEdit ID="bteitemCode" runat="server" ReadOnly="true"
                                                                ClientInstanceName="bteitemCode" Width="100%">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cliente">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="ShowProductSearch" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Método de Gestión:--%>Marca:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtMarca" runat="server" Width="100%"
                                                                ClientInstanceName="txtMarca">
                                                            </dx:ASPxTextBox>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Descripción de Articulo:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtitemName" runat="server" Width="100%"
                                                                ClientInstanceName="txtitemName" ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                         <td style="width:40px"></td>
                                                        <td style="width:140px">Modelo:</td>
                                                        <td style="width:240px">
                                                          <dx:ASPxTextBox ID="txtModelo" runat="server" Width="100%"
                                                                ClientInstanceName="txtModelo">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            N° Serie de Fabricante:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtmanufSN" runat="server" 
                                                                ClientInstanceName="txtmanufSN" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                         <td style="width:40px"></td>
                                                         <td style="width:140px">
                                                            <%--Técnico--%></td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txttecnico" runat="server" Width="100%"
                                                                ClientInstanceName="txttecnico" Visible="false">
                                                            </dx:ASPxTextBox>
                                                            
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                      
                                                        <td style="width:140px">
                                                            Número de Serie:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtinternalSN" runat="server" Width="100%"
                                                                ClientInstanceName="txtinternalSN">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Método de Gestión:Modelo:--%></td>
                                                        <td style="width:240px">
                                                            
                                                        </td>
                                                    </tr>
                                                    
                                                    
                                                </table>
                                            </section>
                                            <section class="sectablas" id="tab2">
                                                <table id="tab2tabla2">
                                                    <tr>
                                                        <td style="width:140px">
                                                            Dirección:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbAddress" runat="server" Width="140px"
                                                                ClientInstanceName="cbbAddress" OnCallback="cbbAddress_Callback">
                                                                <ClientSideEvents SelectedIndexChanged="cambio_direccion" />
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        

                                                          <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Provincia:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtProvincia1" runat="server" Width="100%"
                                                                ClientInstanceName="txtProvincia1"  ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                            
                                                        </td>
                                                    </tr>
                                                   

                                                    <tr>
                                                        <td style="width:140px">
                                                            Distrito:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtDistrito1" runat="server"  ReadOnly="true"
                                                                ClientInstanceName="txtDistrito1" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    
                                                    
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Departamento:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtDepartamento1" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="txtDepartamento1" Width="100%" ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td style="width:140px">
                                                            Calle:</td>
                                                        <td style="width:240px" colspan="4">
                                                            <dx:ASPxTextBox ID="txtStreets1" runat="server" Width="100%"
                                                                ClientInstanceName="txtStreets1"  ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        
                                                    </tr>
                                                </table>
                                            </section>
                                            
                                            <section class="sectablas" id="tab4">
                                               <dx:ASPxGridView ID="grdvLlamada" runat="server" AutoGenerateColumns="False" Width="700px"
                                                    ClientInstanceName="grdvLlamada" KeyFieldName="CallId" OnCustomCallback="grdvLlamada_CustomCallback"
                                                   OnDataBinding="grdvLlamada_DataBinding">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="ID de llamada" PropertiesTextEdit-ClientInstanceName="ID Llamada"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" 
                                                            FieldName="CallId">
                                                        </dx:GridViewDataTextColumn> 
                                                        <dx:GridViewDataDateColumn Caption="Fecha de Creación" PropertiesDateEdit-ClientInstanceName="Creacion"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" 
                                                            FieldName="Creacion">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn Caption="Número de Articulo" PropertiesTextEdit-ClientInstanceName="ItemCode"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" 
                                                            FieldName="ItemCode">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Número de Serie" PropertiesTextEdit-ClientInstanceName="SerieFab"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="90px" 
                                                            FieldName="SerieFab">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre de Cliente" PropertiesTextEdit-ClientInstanceName="CardName"
                                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="0px" Visible="true"
                                                            FieldName="CardName">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Estado" PropertiesTextEdit-ClientInstanceName="Estado"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="0px" Visible="true"
                                                            FieldName="Estado">
                                                        </dx:GridViewDataTextColumn>   
                                                    </Columns>
                                                </dx:ASPxGridView>
                                               
                                            </section>
                                           <section class="sectablas" id="tab3">
                                                <table id="tab3tabla3">
                                                    <tr>
                                                       <td style="width:140px">
                                                            Código:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtdirectCsmr" runat="server"  ReadOnly="true"
                                                                ClientInstanceName="txtdirectCsmr" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                          <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Entrega:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtdeliveryNo" runat="server" Width="100%"
                                                                ClientInstanceName="txtdeliveryNo" ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                           Nombre:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtdrctCsmNam" runat="server" Width="100%"
                                                                ClientInstanceName="txtdrctCsmNam" ReadOnly="true" >
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Factura:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtInvoiceNum" runat="server" Width="100%"
                                                                ClientInstanceName="txtInvoiceNum" ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                            
                                                        </td>
                                                    
                                                    </tr>

                                                  </table> 
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
                                    <dx:GridViewDataTextColumn Caption="Marca" FieldName="U_GOS_MARCA" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Modelo" FieldName="U_GOS_MODELO" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="0px" Visible="false">
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
                                    <td id="Client" style="width:105px">
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
    <dx:ASPxPopupControl ID="ppcTarjetaSearch" runat="server" 
        ClientInstanceName="ppcTarjetaSearch" FooterText=" " HeaderText="Buscar Tarjeta" 
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
                                    <td id="Client2" style="width:50px">
                                        Cliente:</td>
                                    <td style="width:100px">
                                        <dx:ASPxTextBox ID="txtCliente" runat="server" Width="100px" 
                                            ClientInstanceName="txtCliente">
                                            <ClientSideEvents KeyUp="Get_Tarjeta2" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td id="Client3" style="width:50px">
                                        Artículo:</td>
                                    <td style="width:100px">
                                        <dx:ASPxTextBox ID="txtProducto" runat="server" Width="100px" 
                                            ClientInstanceName="txtProducto">
                                            <ClientSideEvents KeyUp="Get_Tarjeta2" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td id="Client4" style="width:50px">
                                        Serie:</td>
                                    <td style="width:100px">
                                        <dx:ASPxTextBox ID="txtSerie" runat="server" Width="100px" 
                                            ClientInstanceName="txtSerie">
                                            <ClientSideEvents KeyUp="Get_Tarjeta1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteServicioSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteServicioSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Tarjeta" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvTarjeta" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvTarjeta" 
                                KeyFieldName="manufSN" OnCustomCallback="gdvTarjeta_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvTarjeta_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="ID Tarjeta" FieldName="insID"  SortIndex="0" SortOrder="Ascending" 
                                        ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Código Art." FieldName="ItemCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Código Cliente" FieldName="CardCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nro. Serie Fabricante" FieldName="manufSN" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nro. Serie Interno" FieldName="internalSN" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Id Dirección" FieldName="instLction" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Address" FieldName="directCsmr" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Calle" FieldName="drctCsmNam" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Departamento" FieldName="deliveryNo" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Provincia" FieldName="invoiceNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Distrito" FieldName="U_GOS_MARCA" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Asunto" FieldName="U_GOS_MODELO" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Estado" FieldName="Status" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="txtStreet" FieldName="street" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="provincia" FieldName="county" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="distrito" FieldName="distrito" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Estado" FieldName="state" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="okTarjeta"/>
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
                                        <dx:ASPxButton ID="btnTarjetaOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnTarjetaOk" AutoPostBack="False">
                                            <ClientSideEvents Click="okTarjeta" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnTarjetaCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnTarjetaCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelTarjeta" />
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

