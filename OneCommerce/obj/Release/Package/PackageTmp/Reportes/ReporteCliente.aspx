<%@ Page Title="Estado de Cuenta" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ReporteCliente.aspx.cs" Inherits="OneCommerce.Reportes.ReporteCliente" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Reports/JSGeneral.js"></script>
<script type="text/javascript" src="../Scripts/Reports/Report.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity:"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin:"anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Estado de Cuenta" 
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table class="tablespace" style="width:100%;">
                                    <tr>
                                        <td style="font-weight:bold;">
                                         <dx:ASPxCheckBox ID="chkRangeDate" runat="server" Checked="True" 
                                        CheckState="Unchecked" ClientInstanceName="chkRangeDate"
                                         Text="Rango Fechas:" Width="105px">
                                       <ClientSideEvents CheckedChanged="Clear_RangeDate" />
                                        </dx:ASPxCheckBox>
                                        </td>
                                         
                                        
                                        <td style="width:150px;">
                                        <dx:ASPxDateEdit ID="dteDateIn" runat="server" Width="130px" 
                                            ClientInstanceName="dteDateIn">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:150px">
                                        <dx:ASPxDateEdit ID="dteDateFi" runat="server" Width="130px" 
                                            ClientInstanceName="dteDateFi">
                                        </dx:ASPxDateEdit>
                                    </td>
                                        <td style="width:100px">
                                                Cliente:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtCliente" runat="server" 
                                                    ClientInstanceName="txtCliente" Width="150px" ReadOnly="True">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <RequiredField ErrorText="Código de cliente incorrecto." IsRequired="True" />
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                         <td style="width:350px">
                                                <dx:ASPxButtonEdit ID="bteCardName" runat="server"
                                                    ClientInstanceName="bteCardName" Width="200px">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <RequiredField ErrorText="Nombre de cliente incorrecto." IsRequired="True" />
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                    <Buttons>
                                                        <dx:EditButton ToolTip="Buscar Cliente">
                                                        </dx:EditButton>
                                                    </Buttons>
                                                    <ClientSideEvents ButtonClick="ShowClientSearch" />
                                                </dx:ASPxButtonEdit>
                                            </td>
                                        <%--<td style="width:150px">
                                            Fecha Contable:</td>
                                        <td style="width:150px">
                                            <dx:ASPxDateEdit ID="dteDateIn" runat="server" Width="100%" ClientInstanceName="dteDateIn">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" 
                                                    ErrorText="Fecha Incorrecta" SetFocusOnError="True" ValidationGroup="ValEdit">
                                                    <RegularExpression ErrorText="" />
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <%--<ClientSideEvents DateChanged="Set_DateChange" />--%>
                                         <%--   </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:250px">
                                            <dx:ASPxDateEdit ID="dteDateFi" runat="server" Width="100%" ClientInstanceName="dteDateFi">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" 
                                                    ErrorText="Fecha Incorrecta" SetFocusOnError="True" ValidationGroup="ValEdit">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>--%>
                                        <td style="width:200px"></td>
                                        <td style="width:100px">
                                            <dx:ASPxButton ID="btnSearch" runat="server" AutoPostBack="False" Text="Buscar" 
                                                Width="100%" >
                                                <ClientSideEvents Click="SearchEstadoCuenta" />
                                            </dx:ASPxButton>
                                        </td>
                                        <%--<td style="width:100px">
                                            <dx:ASPxButton ID="btnExport" runat="server" AutoPostBack="False" Text="Exportar" 
                                                Width="100%" OnClick="btnExport_Click">
                                            </dx:ASPxButton>
                                        </td>--%>
                                        <td style="width:400px">
                                            &nbsp;</td>
                                    </tr>

                                    <tr>
                                         <td style="width:100px">
                                                Contrato:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtContrato" runat="server" 
                                                    ClientInstanceName="txtContrato" Width="100px" ReadOnly="True"> 
                                                </dx:ASPxTextBox>
                                            </td>
                                        <td style="width:200px" ></td>
                                         <td style="width:200px" >
                                                Fecha Inic.Contrato:</td>
                                            <td style="width:150px" >
                                                <dx:ASPxDateEdit ID="deFechaInCont" runat="server" 
                                                    ClientInstanceName="deFechaInCont" Width="150px" ReadOnly="True"> 
                                                </dx:ASPxDateEdit>
                                            </td>
                                         <td style="width:200px"></td>
                                        <td style="width:200px">
                                                Fecha Fin Contrato:</td>
                                            <td style="width:150px">
                                                <dx:ASPxDateEdit ID="deFechaFinCont" runat="server" 
                                                    ClientInstanceName="deFechaFinCont" Width="200px" ReadOnly="True"> 
                                                </dx:ASPxDateEdit>
                                            </td>
                                    </tr>
                                    <tr>
                                         <td style="width:100px">
                                                ID Dirección:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtid" runat="server" 
                                                    ClientInstanceName="txtid" Width="100px" ReadOnly="True"> 
                                                </dx:ASPxTextBox>
                                            </td>
                                        <td style="width:200px" ></td>
                                         <td style="width:200px" >
                                                Dirección:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtstreet" runat="server" 
                                                    ClientInstanceName="txtstreet" Width="150px" ReadOnly="True"> 
                                                </dx:ASPxTextBox>
                                            </td>
                                         <td style="width:200px"></td>
                                        <td style="width:200px">
                                                Servicio:</td>
                                            <td style="width:150px" >
                                                <dx:ASPxTextBox runat="server"  ID="txtserv"
                                                    ClientInstanceName="txtserv" Width="200px"  Height="40px"  ReadOnly="True"> 
                                                </dx:ASPxTextBox>
                                            </td>
                                    </tr>
                                    <tr> 
                                        <td style="width:100px"></td>
                                        <td style="width:80px"></td>
                                        <td style="width:100px" ></td>

                                        <td style="width:350px" ></td>
                                         <td style="width:200px" >
                                             </td>
                                         <td style="width:250px" ></td>

                                        <td style="width:20px" ></td>
                                         
                          
<%--                                         <td style="width:100px">
                                            <dx:ASPxButton ID="btnExport" runat="server" AutoPostBack="False" Text="Exportar" 
                                                Width="100%" OnClick="btnExport_Click">
                                            </dx:ASPxButton>
                                        </td>--%>
                                    </tr>
                                    <tr>
                                        <td style="height:13px" ></td>
                                    </tr>
                                    <tr>
                                           
                                        <td colspan="14">
                                            <table cellpadding:"0" cellspacing:"0" style="width:100%; ">
                                                <tr>
                                                    <td>
                                                        <dx:ASPxGridView ID="gdvEstadoCuenta" runat="server" AutoGenerateColumns="False" 
                                                            ClientInstanceName="gdvEstadoCuenta" Width="1120px" 
                                                            OnCustomCallback="gdvEstadoCuenta_CustomCallback" OnDataBinding="gdvEstadoCuenta_DataBinding">
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="TOTAL_FACTURA" 
                                                                    ShowInGroupFooterColumn="Total Factura" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="MONTOPAGADO_FACTURA" 
                                                                    ShowInGroupFooterColumn="Monto Pagado" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="EFECTIVO" 
                                                                    ShowInGroupFooterColumn="Pago Efectivo" SummaryType="Sum" />

                                                                 <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="CREDITO" 
                                                                    ShowInGroupFooterColumn="Crédito" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="TRANSFERENCIA" 
                                                                    ShowInGroupFooterColumn="Tranferencia" SummaryType="Sum" />
                                                               

                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="T_CREDITO" 
                                                                    ShowInGroupFooterColumn="Pago Tarjeta" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="NC_TOTAL" 
                                                                    ShowInGroupFooterColumn="Total Nota de Crédito" SummaryType="Sum" />
                                                            </TotalSummary>
                                                            <Columns>
                                                                <%--<dx:GridViewDataTextColumn Caption="Tipo de Documento" FieldName="TIPO_DOC" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="0" Width="130px">
                                                                </dx:GridViewDataTextColumn>--%>
                                                                <dx:GridViewDataTextColumn Caption="Orden de Venta" FieldName="DocNum" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="1" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn Caption="Fecha Orden Venta" FieldName="DocDate" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="2" Width="110px">
                                                                </dx:GridViewDataDateColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Total OV" FieldName="DocTotal" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="3" Width="110px" Visible="true">
                                                                       <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                              <%--  <dx:GridViewDataTextColumn Caption="Guia" FieldName="GU_NRO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="4" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn Caption="Fecha Guia" FieldName="GU_FECHA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="5" Width="110px">
                                                                <%--</dx:GridViewDataDateColumn>--%>
                                                                <%-- <dx:GridViewDataTextColumn Caption="Total Guia" FieldName="GU_TOTAL" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="6" Width="110px" Visible="true">
                                                                       <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>--%>
                                                                <dx:GridViewDataTextColumn Caption="Cancelado Ov" FieldName="CANCELADO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Estado OV" FieldName="ESTADO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Factura" FieldName="FACTURA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Factura SUNAT" FieldName="NumAtCard" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Fecha Factura" FieldName="FECHA_FACTURA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Moneda" FieldName="MONEDA_FACTURA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Total Factura" FieldName="TOTAL_FACTURA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                      <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Cancelado Factura" FieldName="CANCELADO_FACTURA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Estado Factura" FieldName="ESTADO_FACTURA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                          
                                                            
                                                                <dx:GridViewDataTextColumn Caption="Monto Pagado" FieldName="MONTOPAGADO_FACTURA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="11" Width="130px">
                                                                      <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Saldo" FieldName="SALDO_FACTURA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="19" Width="130px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Pago Efectivo" FieldName="EFECTIVO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="12" Width="130px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Transferencia" FieldName="TRANSFERENCIA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="13" Width="130px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Pago Tarjeta" FieldName="T_CREDITO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="14" Width="130px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Nota de Credito" FieldName="NC_NRO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="15" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn Caption="Fecha Nota Credito" FieldName="NC_FECHA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="16" Width="110px">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn Caption="Total Nota Crédito" FieldName="NC_TOTAL" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="17" Width="170px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                 <dx:GridViewDataTextColumn Caption="Conciliacion" FieldName="CONCILIACIONES" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="18" Width="170px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" 
                                                                ShowTitlePanel="True" VerticalScrollableHeight="393" 
                                                                VerticalScrollBarMode="Visible" UseFixedTableLayout="True" 
                                                                VerticalScrollBarStyle="Virtual" />
                                                            <SettingsText Title="Estado de Cuenta" />
                                                    <Styles>
                                                        <Row Font-Size="7pt">
                                                        </Row>
                                                        <Footer Font-Size="1pt">
                                                        </Footer>
                                                        <TitlePanel Font-Bold="True" Font-Size="7pt" HorizontalAlign="Center">
                                                        </TitlePanel>
                                                    </Styles>
                                                        </dx:ASPxGridView>
                                                    </td>
                                                </tr>
                                            </table>
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
    <dx:ASPxGridViewExporter ID="gexData" runat="server" GridViewID="gdvEstadoCuenta">
    </dx:ASPxGridViewExporter>
     <dx:ASPxPopupControl ID="ppcClientSearch" runat="server" 
        ClientInstanceName="ppcClientSearch" FooterText=" " HeaderText="Buscar Cliente" 
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
                                    <td id="Client" style="width:105px">
                                        Código:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtcode" runat="server" Width="150px"  ClientSideEvents-KeyUp="Get_Client"  AutoPostBack="false"
                                            ClientInstanceName="txtcode">
                                           
                                        </dx:ASPxTextBox>
                                    </td>
                                     <td id="ClientParCaptin" style="width:105px">
                                        Razón Social:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtrason" runat="server" Width="250px"  ClientSideEvents-KeyUp="Get_Client"  AutoPostBack="false"
                                            ClientInstanceName="txtrason">
                                           
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteClientSearch" runat="server" Text="Buscar" Width="120px" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Client" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                     <td id="ID" style="width:105px">
                                        ID.Dirección:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtidir" runat="server" Width="150px"  ClientSideEvents-KeyUp="Get_Client"  AutoPostBack="false"
                                            ClientInstanceName="txtidir">
                                           
                                        </dx:ASPxTextBox>
                                    </td>

                                    <td id="Contrato" style="width:105px">
                                        Contrato:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtcontratobus" runat="server" Width="150px"  ClientSideEvents-KeyUp="Get_Client"  AutoPostBack="false"
                                            ClientInstanceName="txtcontratobus">
                                           
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
                                    <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" Width="200px"
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    
                                     <dx:GridViewDataTextColumn Caption="contrato" FieldName="DocNum" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha Inic." FieldName="StartDate" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha Fin" FieldName="EndDate2" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="ID" FieldName="Id_Direccion" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dirección" FieldName="Street" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn Caption="Distrito" FieldName="Distrito" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn Caption="Departamento" FieldName="Departamento" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn Caption="Provincia" FieldName="Provincia" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataDateColumn Caption="Descripción" PropertiesDateEdit-ClientInstanceName="Detalle"
                                       ShowInCustomizationForm="True" VisibleIndex="21" Width="200px" Visible="true"
                                       FieldName="Detalle">
                                       </dx:GridViewDataDateColumn>
                                </Columns>
                                 <SettingsPager Visible="true" Mode="ShowPager"></SettingsPager>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents  RowDblClick="OkClient" EndCallback="EndClientSearch"/>
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

