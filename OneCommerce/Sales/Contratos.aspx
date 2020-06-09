<%@ Page Title="Contratos" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Contratos.aspx.cs" Inherits="OneCommerce.Sales.Contratos" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSContratos.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Contrato" GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="btnBuscar" runat="server" Width="100%" Text="Buscar"
                                                ClientInstanceName="btnBuscar" ClientSideEvents-Click="Get_Contrato" AutoPostBack="false">
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:20px;"></td>
                                        <td>
                                            Cliente: 
                                        </td>
                                        <td style="width:100px;">
                                            <dx:ASPxTextBox ID="txtCliente" runat="server" Width="100%" 
                                                ClientInstanceName="txtCliente" ClientSideEvents-KeyUp="Get_Contrato_Tecla">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:20px;"></td>
                                        <td>
                                            Id Dirección: 
                                        </td>
                                        <td style="width:100px;">
                                            <dx:ASPxTextBox ID="txtIdDirec" runat="server" Width="100%" 
                                                ClientInstanceName="txtIdDirec" ClientSideEvents-KeyUp="Get_Contrato_Tecla">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:20px;"></td>
                                        <td>
                                            Codigo Contrato: 
                                        </td>
                                        <td style="width:100px;">
                                            <dx:ASPxTextBox ID="txtCode" runat="server" Width="100%" 
                                                ClientInstanceName="txtCode" ClientSideEvents-KeyUp="Get_Contrato_Tecla">
                                            </dx:ASPxTextBox>
                                        </td>
                                        
                                    </tr>
                                </table>
                                <table style="width:1500px; height:150px" class="tablespace">
                                    <tr>
                                        <td colspan="9" style="width:1500px">
                                            <dx:ASPxGridView ID="grdvContratos" runat="server" AutoGenerateColumns="False" Width="1500px" 
                                                    ClientInstanceName="grdvContratos" KeyFieldName="AbsEntry"
                                                    OnCustomCallback="grdvContratos_CustomCallback" OnRowUpdating="grdvContratos_RowUpdating" 
                                                    OnRowInserting="grdvContratos_RowInserting" OnCellEditorInitialize="grdvContratos_CellEditorInitialize"
                                                    OnDataBinding="grdvContratos_DataBinding">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="100px">
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Contrato" PropertiesTextEdit-ClientInstanceName="Code"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" Visible="false"
                                                            FieldName="Code">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descripcion" PropertiesTextEdit-ClientInstanceName="Dscription"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" Visible="false"
                                                            FieldName="Dscription">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Tipo de Doc." PropertiesTextEdit-ClientInstanceName="DocObjType"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" Visible="false"
                                                            FieldName="DocObjType">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Contrato"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="90px" 
                                                            FieldName="DocNum">
                                                            <PropertiesButtonEdit ClientInstanceName="DocNum">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Servicio">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="ShowServicio" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="Periodo Repeticion" PropertiesComboBox-ClientInstanceName="Frequency"
                                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="90px" 
                                                            FieldName="Frequency">
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataSpinEditColumn Caption="Fecha Repeticion" FieldName="Remind" VisibleIndex="7">
                                                            <PropertiesSpinEdit MinValue="01" MaxValue="31" NumberType="Integer" NullTextStyle-HorizontalAlign="Left" MaxLength="2" />
                                                        </dx:GridViewDataSpinEditColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha Inicio" PropertiesDateEdit-ClientInstanceName="StartDate"
                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="90px"
                                                            FieldName="StartDate">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha Final" PropertiesDateEdit-ClientInstanceName="EndDate2"
                                                            ShowInCustomizationForm="True" VisibleIndex="9" Width="90px" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/mm/yyyy"
                                                            FieldName="EndDate2">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Cliente" PropertiesTextEdit-ClientInstanceName="CardCode"
                                                            ShowInCustomizationForm="True" VisibleIndex="10" Width="90px"
                                                            FieldName="CardCode">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre Cliente" PropertiesTextEdit-ClientInstanceName="CardName"
                                                            ShowInCustomizationForm="True" VisibleIndex="11" Width="90px"
                                                            FieldName="CardName">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Departamento" PropertiesTextEdit-ClientInstanceName="Departamento"
                                                            ShowInCustomizationForm="True" VisibleIndex="17" Width="90px"
                                                            FieldName="Departamento">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Provincia" PropertiesTextEdit-ClientInstanceName="Provincia"
                                                            ShowInCustomizationForm="True" VisibleIndex="16" Width="90px"
                                                            FieldName="Provincia">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Distrito" PropertiesTextEdit-ClientInstanceName="Distrito"
                                                            ShowInCustomizationForm="True" VisibleIndex="15" Width="90px"
                                                            FieldName="Distrito">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Id Direccion" PropertiesTextEdit-ClientInstanceName="Id_Direccion"
                                                            ShowInCustomizationForm="True" VisibleIndex="12" Width="90px"
                                                            FieldName="Id_Direccion">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Dirección" PropertiesTextEdit-ClientInstanceName="Street"
                                                            ShowInCustomizationForm="True" VisibleIndex="13" Width="90px"
                                                            FieldName="Street">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Urbanización" PropertiesTextEdit-ClientInstanceName="Urbanización"
                                                            ShowInCustomizationForm="True" VisibleIndex="14" Width="90px"
                                                            FieldName="Urbanizacion">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Vendedor" PropertiesTextEdit-ClientInstanceName="Vendedor"
                                                            ShowInCustomizationForm="True" VisibleIndex="18" Width="90px"
                                                            FieldName="Vendedor">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="AbsEntry" PropertiesTextEdit-ClientInstanceName="AbsEntry"
                                                            ShowInCustomizationForm="True" VisibleIndex="19" Width="0px" Visible="false"
                                                            FieldName="AbsEntry">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha Final" PropertiesDateEdit-ClientInstanceName="EndDate"
                                                            ShowInCustomizationForm="True" VisibleIndex="20" Width="80px" Visible="false"
                                                            FieldName="EndDate">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataDateColumn Caption="Descripción" PropertiesDateEdit-ClientInstanceName="Detalle"
                                                            ShowInCustomizationForm="True" VisibleIndex="21" Width="200px" Visible="true"
                                                            FieldName="Detalle">
                                                        </dx:GridViewDataDateColumn>
                                                    </Columns>
                                                    <SettingsPager Visible="true" Mode="ShowPager">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="EditForm" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Contratos" />
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
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItemHelpTexts Position="Bottom"></SettingsItemHelpTexts>
            </dx:LayoutGroup> 
        </Items>
    </dx:ASPxFormLayout>
    <dx:ASPxPopupControl ID="ppcServicio" runat="server" 
        ClientInstanceName="ppcServicio" FooterText=" " HeaderText="Servicios" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="500px" Height="200px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvServicio" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvServicio" 
                                KeyFieldName="ItemCode" OnCustomCallback="gdvServicio_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvServicio_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Codigo" FieldName="ItemCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName"  
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Plan" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="90px"
                                        FieldName="PLAN">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Detalle Servicio" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="90px"
                                        FieldName="DetalleServicio">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="False" 
                                    AllowSelectSingleRowOnly="True" />
                                <%--<ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkAlmacen" EndCallback="EndClientSearch"/>--%>
                                <Styles>
                                    <Row Font-Size="7pt">
                                    </Row>
                                </Styles>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>  
    <dx:ASPxFormLayout ID="frlMenu" runat="server" Visible="false">
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

