<%@ Page Title="Reconciliación" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Reconciliacion.aspx.cs" Inherits="OneCommerce.Masters.Reconciliacion" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Tools/JSReconciliacion.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Reconciliación"  GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Alexia Cloud" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
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
                                                    Nombre Cliente:</td>
                                                <td style="width:140px">
                                                    <dx:ASPxTextBox ID="txtCustomerName" runat="server"  ReadOnly="true"
                                                        ClientInstanceName="txtCustomerName" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:140px">
                                                    Fecha Reconciliacion:</td>
                                                <td style="width:140px">
                                                    <dx:ASPxDateEdit ID="txtcreateDate1" runat="server"  ReadOnly="false"
                                                        ClientInstanceName="txtcreateDate1" Width="140px">
                                                    </dx:ASPxDateEdit>
                                                </td>
                                                <td style="width:40px"></td>
                                                <td style="width:140px">
                                                    </td>
                                                <td style="width:140px">
                                                    
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
                                                <td colspan="5" style="width:640px; text-align:center">
                                                    <dx:ASPxGridView ID="gdvFacturas" runat="server" AutoGenerateColumns="False" Width="640px"
                                                        ClientInstanceName="gdvFacturas" KeyFieldName="DocEntry" OnCommandButtonInitialize="gdvFacturas_CommandButtonInitialize"
                                                        OnCustomCallback="gdvFacturas_CustomCallback" OnRowUpdating="gdvFacturas_RowUpdating" OnDataBinding="gdvFacturas_DataBinding"
                                                        OnCellEditorInitialize="gdvFacturas_CellEditorInitialize">
                                                        <Columns>
                                                            <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                                VisibleIndex="0" Width="70px">
                                                                <EditButton Visible="true">
                                                                </EditButton>
                                                                <CellStyle Font-Size="8pt">
                                                                </CellStyle>
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataCheckColumn VisibleIndex="7" UnboundType="String" Caption="Activo" FieldName="Active">
                                                                <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String">
                                                                </PropertiesCheckEdit>
                                                            </dx:GridViewDataCheckColumn>
                                                            <dx:GridViewDataTextColumn Caption="Nro. Operación" PropertiesTextEdit-ClientInstanceName="DocEntry"
                                                                ShowInCustomizationForm="True" VisibleIndex="1" Width="100px" 
                                                                FieldName="DocEntry">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DocDate2"
                                                                ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                                <EditCellStyle Font-Size="8pt">
                                                                </EditCellStyle>
                                                                <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Info. Detallada" PropertiesTextEdit-ClientInstanceName="LineMemo"
                                                                ShowInCustomizationForm="True" VisibleIndex="3" Width="150px" 
                                                                FieldName="LineMemo">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Ref. 1" PropertiesTextEdit-ClientInstanceName="Ref1"
                                                                ShowInCustomizationForm="True" VisibleIndex="4" Width="100px" 
                                                                FieldName="Ref1">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Ref. 2" PropertiesTextEdit-ClientInstanceName="Ref2"
                                                                ShowInCustomizationForm="True" VisibleIndex="5" Width="100px" 
                                                                FieldName="Ref2">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Importe" PropertiesTextEdit-ClientInstanceName="DocTotal"
                                                                ShowInCustomizationForm="True" VisibleIndex="6" Width="100px" 
                                                                FieldName="DocTotal">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Saldo Vencido" PropertiesTextEdit-ClientInstanceName="SaldoVenc"
                                                                ShowInCustomizationForm="True" VisibleIndex="8" Width="100px" 
                                                                FieldName="SaldoVenc">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Débito" PropertiesTextEdit-ClientInstanceName="BalScCred"
                                                                ShowInCustomizationForm="True" VisibleIndex="9" Width="100px"
                                                                FieldName="BalScDeb">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Crédito" PropertiesTextEdit-ClientInstanceName="BalScDeb"
                                                                ShowInCustomizationForm="True" VisibleIndex="9" Width="100px"
                                                                FieldName="BalScCred">
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <ClientSideEvents EndCallback="End_CallbackLines"/>
                                                        <SettingsEditing Mode="Inline" />
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
                                                <td style="width:140px">
                                                    Crédito Total:</td>
                                                <td style="width:140px">
                                                    <dx:ASPxTextBox ID="txtCred" runat="server" Width="140px" ReadOnly="false" HorizontalAlign="Right"
                                                        ClientInstanceName="txtCred" Visible="true" Text="0"  DisplayFormatString="n2">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width:40px"></td>
                                                <td style="width:140px">
                                                    <br /></td>
                                                <td style="width:140px">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:140px">
                                                    Débito Total:</td>
                                                <td style="width:140px">
                                                    <dx:ASPxTextBox ID="txtDeb" runat="server" Width="140px" ReadOnly="false" HorizontalAlign="Right"
                                                        ClientInstanceName="txtDeb" Visible="true" Text="0"  DisplayFormatString="n2">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width:40px"></td>
                                                <td style="width:140px">
                                                    <br /></td>
                                                <td style="width:140px">
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </section>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItemHelpTexts Position="Bottom"></SettingsItemHelpTexts>
            </dx:LayoutGroup> 
        </Items>
    </dx:ASPxFormLayout>
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

