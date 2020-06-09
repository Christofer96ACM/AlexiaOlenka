<%@ Page Title="Tipo de Cambio" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="TipoCambio.aspx.cs" Inherits="OneCommerce.Masters.TipoCambio" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSTipoCambio.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Tipo de Cambio" 
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table style="width:300px; height:150px" class="tablespace">
                                    <tr>
                                        <td style="width:70px; height:40px">
                                            <dx:ASPxComboBox ID="cbbMes" runat="server" Width="100%" EnableSynchronization="False"
                                                ClientInstanceName="cbbMes">
                                                <ClientSideEvents SelectedIndexChanged="InitControls" />
                                            </dx:ASPxComboBox>
                                        </td>
                                        <td style="width:50px"></td>
                                        <td style="width:70px; height:40px">
                                            <dx:ASPxComboBox ID="cbbAnio" runat="server" Width="100%" EnableSynchronization="False"
                                                ClientInstanceName="cbbAnio">
                                                <ClientSideEvents SelectedIndexChanged="InitControls" />
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:300px" colspan="3">
                                            <dx:ASPxGridView ID="gdvTipoCambio" runat="server" AutoGenerateColumns="False" Width="700px"
                                                    ClientInstanceName="gdvTipoCambio" KeyFieldName="RateDate" OnCommandButtonInitialize="gdvTipoCambio_CommandButtonInitialize"
                                                    OnCustomCallback="gdvTipoCambio_CustomCallback" OnRowUpdating="gdvTipoCambio_RowUpdating" 
                                                    OnCellEditorInitialize="gdvTipoCambio_CellEditorInitialize">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha" PropertiesDateEdit-ClientInstanceName="RateDate"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="100px" 
                                                            FieldName="RateDate">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn VisibleIndex="3" UnboundType="Decimal" Caption="USD" FieldName="RateUSD">
                                                            <PropertiesTextEdit DisplayFormatString="n4"
                                                                ClientInstanceName="RateUSD">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn VisibleIndex="4" UnboundType="Decimal" Caption="EUR" FieldName="RateEUR">
                                                            <PropertiesTextEdit DisplayFormatString="n4"
                                                                ClientInstanceName="RateEUR">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowSort="False" ColumnResizeMode="Disabled"
                                                            ConfirmDelete="True" />
                                                    <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="TIPO DE CAMBIO" />
                                                    <Styles>
                                                        <Row Font-Size="7pt">
                                                        </Row>
                                                        <Footer Font-Size="1pt">
                                                        </Footer>
                                                        <TitlePanel Font-Bold="True" Font-Size="7pt" HorizontalAlign="Center">
                                                        </TitlePanel>
                                                    </Styles>
                                                    <ClientSideEvents EndCallback="End_CallbackLines" />
                                                </dx:ASPxGridView>
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
                                    DataSourceID="XmlDataSourceFooter" ClientInstanceName="mnuOper" Visible="false"
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
    <%--<dx:ASPxCallback ID="clbOperation" runat="server"
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback" >
        <ClientSideEvents CallbackComplete="Com_Operation"/>
    </dx:ASPxCallback>--%>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

