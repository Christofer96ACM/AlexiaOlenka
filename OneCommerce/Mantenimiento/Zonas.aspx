<%@ Page Title="Documento de Venta" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Zonas.aspx.cs" Inherits="OneCommerce.Mantenimiento.Zonas" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../Scripts/Sales/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Tools/Zonas.js"></script>
<script type="text/javascript" src="../Scripts/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Documento de Venta" 
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <%-- --%>
                                <table id="tab1zonas">
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxListBox  ID="listazonas" runat="server" KeyFieldName="DocEntry"
                                                ValueType="System.String" ClientInstanceName="listazonas" 
                                                DataSourceID="ListaZona" Height="650px">
                                                <Columns>
                                                    <dx:ListBoxColumn  Caption="Codigo" FieldName="Code" />
                                                    <dx:ListBoxColumn Caption="Nombre" FieldName="Name"/>
                                                    <dx:ListBoxColumn Caption="Movilidad" FieldName="U_DXP_BIZ_MOV"/>
                                                </Columns>
                                            </dx:ASPxListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="AgregarZona" runat="server" Text="Agregar Nuevo" Width="100%" 
                                                ClientInstanceName="AgregarZona" AutoPostBack="False">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="ActualizarZona" runat="server" Text="Actualizar" Width="100%" 
                                                ClientInstanceName="ActualizarZona" AutoPostBack="False">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                                <table id="tab2zonas">
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Nombre</th>
                                        <th>Movilidad</th>
                                    </tr>
                                    <tr>
                                        <td><dx:ASPxTextBox ID="CodeZona" runat="server" Width="100%" 
                                            ClientInstanceName="CodeZona"></dx:ASPxTextBox></td>
                                        <td><dx:ASPxTextBox ID="NameZona" runat="server" Width="100%" 
                                            ClientInstanceName="NameZona"></dx:ASPxTextBox></td>
                                        <td><dx:ASPxTextBox ID="MoviZona" runat="server" Width="100%" 
                                            ClientInstanceName="MoviZona"></dx:ASPxTextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                                <dx:ASPxGridView ID="listaDezo" runat="server" Width="100%" 
                                                    AutoGenerateColumns="False" ClientInstanceName="listaDezo" 
                                                    KeyFieldName="LineId" KeyboardSupport="True">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="1" Width="120px">
                                                            <NewButton Visible="True">
                                                            </NewButton>
                                                            <DeleteButton Visible="True">
                                                            </DeleteButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                                            ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                                            VisibleIndex="1" Width="150px">
                                                            <Settings AllowSort="True" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Linea" FieldName="LineId" 
                                                            ShowInCustomizationForm="True" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Movilidad" FieldName="U_DXP_BIZ_UBIG" 
                                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowSelectByRowClick="True" 
                                                        AllowSelectSingleRowOnly="True"/>
                                                    <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkClient" EndCallback="EndClientSearch"/>
                                                    <Styles>
                                                        <Row Font-Size="7pt">
                                                        </Row>
                                                    </Styles>
                                                </dx:ASPxGridView>
                                        </td>
                                    </tr>
                                
                                </table>
                                
                                <%-- --%>
                                <asp:SqlDataSource ID="ListaZona" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:BT%>" 
                                    SelectCommand="SELECT [Code],[Name],[U_DXP_BIZ_MOV] FROM [@DXP_BIZ_CAZO]">
                                </asp:SqlDataSource>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItemHelpTexts Position="Bottom"></SettingsItemHelpTexts>
            </dx:LayoutGroup> 
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxLoadingPanel ID="ldpProcess"  runat="server" ClientInstanceName="ldpProcess" Modal="true" >
    </dx:ASPxLoadingPanel>
    <%-- 
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
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteClientSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Client" />
                                        </dx:ASPxButton>
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
    </dx:ASPxPopupControl> --%>    
    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
        </dx:ASPxHiddenField>
        <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

