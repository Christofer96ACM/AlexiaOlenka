<%@ Page Title="Inventario" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="OneCommerce.Reportes.Inventario" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/jquery-1.10.2.min.js"></script>--%>
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
            <dx:LayoutGroup Caption="Inventario" 
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table class="tablespace" style="width:100%;">
                                    <tr>
                                        <td style="width:100px">
                                            <dx:ASPxButton ID="btnSearch" runat="server" AutoPostBack="False" Text="Buscar" 
                                                Width="100%">
                                                <ClientSideEvents Click="SearchInventory" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:100px">
                                            <dx:ASPxButton ID="btnExport" runat="server" AutoPostBack="False" 
                                                OnClick="btnExport_Click" Text="Exportar" Width="100%">
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:900px">
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
                                                                <dx:ASPxSummaryItem DisplayFormat="f0" FieldName="CODIGO" 
                                                                    ShowInGroupFooterColumn="CÓDIGO" SummaryType="Custom" />
                                                            </TotalSummary>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="CÓDIGO" FieldName="CODIGO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="DESCRIPCIÓN ARTÍCULO" FieldName="DESCRIPCION" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="1" Width="300px">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="STOCK SISTEMA" FieldName="SISTEMA" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="f0">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="STOCK FÍSICO" FieldName="FISICO" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="CONFORME" FieldName="CONFORME" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="OBSERVACIÓN" FieldName="OBSERVACION" 
                                                                    ShowInCustomizationForm="True" VisibleIndex="6">
                                                                    <PropertiesTextEdit DisplayFormatString="c2">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsPager PageSize="14">
                                                            </SettingsPager>
                                                            <Settings ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="True" 
                                                                ShowHeaderFilterButton="True" />
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

