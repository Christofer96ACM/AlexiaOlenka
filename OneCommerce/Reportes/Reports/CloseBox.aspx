<%@ Page Title="Cierre de Caja" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CloseBox.aspx.cs" Inherits="OneCommerce.Reports.CloseBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Reports/Report.js"></script>
    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False">
        <Items>
            <dx:LayoutGroup Caption="Cierre de Caja" 
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Criterios de Búsqueda" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table class="tablespace" style="width:100%;">
                                    <tr>
                                        <td style="width:150px">
                                            Fecha Contable:</td>
                                        <td style="width:150px">
                                            <dx:ASPxDateEdit ID="dteDateIn" runat="server" Width="100%" ClientInstanceName="dteDateIn">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" 
                                                    ErrorText="Fecha Incorrecta" SetFocusOnError="True" ValidationGroup="ValEdit">
                                                    <RegularExpression ErrorText="" />
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                                <ClientSideEvents DateChanged="Set_DateChange" />
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:150px">
                                            <dx:ASPxDateEdit ID="dteDateFi" runat="server" Width="100%" ClientInstanceName="dteDateFi">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" 
                                                    ErrorText="Fecha Incorrecta" SetFocusOnError="True" ValidationGroup="ValEdit">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:100px">
                                            <dx:ASPxButton ID="btnSearch" runat="server" AutoPostBack="False" Text="Buscar" 
                                                Width="100%" >
                                                <ClientSideEvents Click="SearchCloseBox" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:100px">
                                            <dx:ASPxButton ID="btnExport" runat="server" AutoPostBack="False" Text="Exportar" 
                                                Width="100%" OnClick="btnExport_Click">
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:400px">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">
                                            <table cellpadding:"0" cellspacing:"0" style="width:100%;">
                                                <tr>
                                                    <td>
                                                        <dx:ASPxGridView ID="gdvData" runat="server" AutoGenerateColumns="False" 
                                                            ClientInstanceName="gdvData" Width="1060px" 
                                                            OnCustomCallback="gdvData_CustomCallback" OnDataBinding="gdvData_DataBinding">
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="FT_TOTAL" 
                                                                    ShowInGroupFooterColumn="TOTAL DOCUMENTO" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="MontoPagado" 
                                                                    ShowInGroupFooterColumn="TOTAL PAGADO" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="EFECTIVO" 
                                                                    ShowInGroupFooterColumn="PAGO EFECTIVO" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="T_CREDITO" 
                                                                    ShowInGroupFooterColumn="PAGO TARJETA" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="c2" FieldName="NC_TOTAL" 
                                                                    ShowInGroupFooterColumn="TOTAL NOTA CREDITO" SummaryType="Sum" />
                                                            </TotalSummary>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="NRO. DOCUMENTO" FieldName="FT_NRO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="0" Width="110px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="NRO. NOTA CREDITO" FieldName="NC_NRO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn Caption="FECHA" FieldName="Fecha" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn Caption="COD. CLIENTE" FieldName="CardCode" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="3" Width="120px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="RAZON SOCIAL" FieldName="CardName" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="4" Width="300px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="TOTAL DOCUMENTO" FieldName="FT_TOTAL" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="5" Width="160px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="PAGO EFECTIVO" FieldName="EFECTIVO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="6" Width="130px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="PAGO TARJETA" FieldName="T_CREDITO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="7" Width="130px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="TOTAL PAGADO" FieldName="MontoPagado" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="10" Width="130px">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="TOTAL NOTA CREDITO" FieldName="NC_TOTAL" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="12" Width="170px">
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
    <dx:ASPxGridViewExporter ID="gexData" runat="server" GridViewID="gdvData">
    </dx:ASPxGridViewExporter>
</asp:Content>
