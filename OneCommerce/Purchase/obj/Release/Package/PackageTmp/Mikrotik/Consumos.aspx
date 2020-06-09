<%@ Page Title="Consumos" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Consumos.aspx.cs" Inherits="OneCommerce.Mikrotik.Consumos" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSPlan.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Relación de Consumo de Abonados:" GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table>
                                    <tr>
                                       
                                        <td style="width:20px;"></td>
                                        <td style="font-weight:bold;">
                                            Código de Abonado: 
                                        </td>
                                        <td style="width:15px;"></td>
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtCliente" runat="server" Width="100%" 
                                                ClientInstanceName="txtCliente"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                         <td style="width:30px;"></td>
                                         <td>
                                            <dx:ASPxButton ID="btnBuscar" runat="server" Width="100%" Text="Buscar" Image-AlternateText="lupa.png"
                                                ClientInstanceName="btnBuscar" ClientSideEvents-Click="Get_Consumos" AutoPostBack="false">
                                            </dx:ASPxButton>
                                        </td>
                                        
                                    </tr>
                                </table>
                                <table style="width:1200px; height:150px" class="tablespace">
                                    <tr>
                                        <td colspan="9" style="width:1200px">
                                            <dx:ASPxGridView ID="grdvConsumos" runat="server" AutoGenerateColumns="False" Width="1000px"
                                                    ClientInstanceName="grdvConsumos" KeyFieldName="U_DXP_COD_ABONADO" 
                                                    OnCustomCallback="grdvConsumos_CustomCallback" OnRowUpdating="grdvConsumos_RowUpdating"
                                                    OnRowInserting="grdvConsumos_RowInserting" OnCellEditorInitialize="grdvConsumos_CellEditorInitialize">
                                                    <Columns>
                                                       
                                                        
                                                        <dx:GridViewDataTextColumn Caption="Codigo Abonado" PropertiesTextEdit-ClientInstanceName="U_DXP_ABONADO"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" 
                                                             FieldName="U_DXP_ABONADO">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Tx" PropertiesTextEdit-ClientInstanceName="Tx"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px"
                                                             FieldName="Tx">
                                                        </dx:GridViewDataTextColumn>
                                                 
                                                        <dx:GridViewDataDateColumn Caption="Rx" PropertiesDateEdit-ClientInstanceName="Rx"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="80px" Visible="True"
                                                            FieldName="Rx">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataDateColumn Caption="FPTx" PropertiesDateEdit-ClientInstanceName="FPTx"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" Visible="true"
                                                            FieldName="FPTx">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataDateColumn Caption="FPRx" PropertiesDateEdit-ClientInstanceName="FPRx"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="80px"  Visible="True"
                                                            FieldName="FPRx">
                                                        </dx:GridViewDataDateColumn>
                                                         
                                                    </Columns>
                                                <SettingsPager Visible="true" Mode="ShowPager">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="EditForm" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Consumo" />
                                                    <Styles>
                                                        <Row Font-Size="7pt">
                                                        </Row>
                                                        <Footer Font-Size="1pt">
                                                        </Footer>
                                                        <TitlePanel Font-Bold="True" Font-Size="7pt" HorizontalAlign="Center">
                                                        </TitlePanel>
                                                    </Styles>
                                                </dx:ASPxGridView >
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
    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
    </dx:ASPxHiddenField>
    <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

