<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Permisos.aspx.cs" Inherits="OneCommerce.Masters.Permisos" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Tools/JSPermisos.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="ALEXIA CLOUD"  GroupBoxStyle-Caption-Font-Size="X-Large" ShowCaption="False"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Alexia Cloud" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table>
                                    <tr>
                                        <td>
                                            Usuario:
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cbbUsuario" runat="server" Width="100%" EnableSynchronization="False"
                                                ClientInstanceName="cbbUsuario" OnCallback="cbbUsuario_Callback">
                                                <ClientSideEvents SelectedIndexChanged="cambio_usuario" />
                                            </dx:ASPxComboBox>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnAddVistas" runat="server" Width="100%" EnableSynchronization="False"
                                                ClientInstanceName="btnAddVistas" OnClick="btnAddVistas_Click" Text="Agregar Vistas" AutoPostBack="true">
                                                <%--<ClientSideEvents SelectedIndexChanged="cambio_usuario" />--%>
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <dx:ASPxGridView ID="gdvPermisos" runat="server" AutoGenerateColumns="False" Width="700px"
                                                    ClientInstanceName="gdvPermisos" KeyFieldName="NOMBRE_OFICIAL" OnCommandButtonInitialize="gdvPermisos_CommandButtonInitialize"
                                                    OnCustomCallback="gdvPermisos_CustomCallback" OnRowUpdating="gdvPermisos_RowUpdating" 
                                                    OnCellEditorInitialize="gdvPermisos_CellEditorInitialize">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Usuario" PropertiesTextEdit-ClientInstanceName="USUARIO"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="100px" 
                                                            FieldName="UserName">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn VisibleIndex="3" Caption="Vista" FieldName="NOMBRE_OFICIAL">
                                                            <PropertiesTextEdit ClientInstanceName="Vista">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataCheckColumn VisibleIndex="4" UnboundType="String" Caption="Activo" FieldName="PERMISOR">
                                                            <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String"></PropertiesCheckEdit>
                                                        </dx:GridViewDataCheckColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowSort="False" ColumnResizeMode="Disabled"
                                                            ConfirmDelete="True" />
                                                    <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="PERMISOS" />
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
    <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

