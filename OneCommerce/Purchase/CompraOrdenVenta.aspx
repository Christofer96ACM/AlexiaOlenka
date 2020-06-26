<%@ Page Title="Orden de Compra" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="CompraOrdenVenta.aspx.cs" Inherits="OneCommerce.Purchase.CompraOrdenVenta" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Purchase/OrdenCompra.js"></script>
<%--<script type="text/javascript" src="../Scripts/PLUSQUERYS/PLUSOrdenCompra.js""></script>--%>
<style type="text/css">
    .dxgvEmptyDataRow td.dxgv {
        text-align: left;
    }
    .dxgvEmptyDataRow_PlasticBlue td.dxgv {
        text-align: left;
    }
    .dxgvEmptyDataRow_Office2003Olive td.dxgv {
        text-align: left;
    }
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 115px;
    }
    .style4
    {
        width: 340px;
    }
    .style5
    {
    }
    .style6
    {
        width: 147px;
        height: 25px;
    }
    .style7
    {
        width: 340px;
        height: 25px;
    }
    .style8
    {
        height: 25px;
    }
</style>
    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False">
        <Items>
            <dx:LayoutGroup Caption="Orden de Compra" GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                    <table class="tablespace">
                                        <tr>
                                            <td style="width:160px">
                                                Proveedor</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtCardCode" runat="server" 
                                                    ClientInstanceName="txtCardCode" Width="150px" ReadOnly="True">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <RequiredField ErrorText="Código de Proveedor incorrecto." IsRequired="True" />
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:350px">
                                                <dx:ASPxButtonEdit ID="bteCardName" runat="server"
                                                    ClientInstanceName="bteCardName" Width="350px">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <RequiredField ErrorText="Nombre de Proveedor incorrecto." IsRequired="True" />
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                    <Buttons>
                                                        <dx:EditButton ToolTip="Buscar Proveedor">
                                                        </dx:EditButton>
                                                    </Buttons>
                                                    <ClientSideEvents ButtonClick="ShowClientSearch" />
                                                </dx:ASPxButtonEdit>
                                            </td>
                                            <%--<td style="width:5px">
                                            </td>--%>
                                            <td style="width:150px">
                                                Nro. de Orden:</td>
                                            <td style="width:217px">
                                                <table style="width:197px" border:"0" cellpadding:"0" cellspacing:"0">
                                                    <tr>
                                                        <td style="width:80px">
                                                            <dx:ASPxTextBox ID="txtDocEntry" runat="server" ClientInstanceName="txtDocEntry" ReadOnly="true" Width="80px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="text-align:left;width:117px">
                                                            <dx:ASPxTextBox ID="txtDocNum" runat="server" Width="117px" ClientInstanceName="txtDocNum" ReadOnly="true">
                                                                <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:160px">
                                                Referencia:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtNumAtCard" runat="server" Width="150px"
                                                    ClientInstanceName="txtNumAtCard">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:350px">
                                                <dx:ASPxComboBox ID="cbbListNum" runat="server" Width="350px" EnableSynchronization="False"
                                                    ClientInstanceName="cbbListNum">
                                                </dx:ASPxComboBox>
                                            </td>
                                            <%--<td style="width:5px">
                                                &nbsp;</td>--%>
                                            <td style="width:150px">
                                                Estado:</td>
                                            <td style="width:217px">
                                                <dx:ASPxTextBox ID="txtDocStatus" runat="server" Width="197px" ReadOnly="true"
                                                    ClientInstanceName="txtDocStatus" Text="Abierto">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:160px">
                                                Dirección de Entrega:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtShipToCode" runat="server" ClientInstanceName="txtShipToCode" ReadOnly="true"
                                                    Width="150px">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:350px">
                                                <dx:ASPxButtonEdit ID="bteShipToCode" runat="server" ClientInstanceName="bteShipToCode" ReadOnly="true"
                                                    Width="350px">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <RequiredField ErrorText="Dirección de entrega incorrecta."/>
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                    <Buttons>
                                                        <dx:EditButton>
                                                        </dx:EditButton>
                                                    </Buttons>
                                                    <ClientSideEvents ButtonClick="Show_AddreListDestino" />
                                                </dx:ASPxButtonEdit>
                                            </td>
                                            <%--<td style="width:5px">
                                                &nbsp;</td>--%>
                                            <td style="width:150px">
                                                Fecha Contable:</td>
                                            <td style="width:217px">
                                                <dx:ASPxDateEdit ID="dteDocDate" runat="server" 
                                                    ClientInstanceName="dteDocDate" Width="197px">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:160px">
                                                Dirección de Factura:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtBillToCode" runat="server" ClientInstanceName="txtBillToCode" ReadOnly="true"
                                                    Width="150px">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:350px">
                                                <dx:ASPxButtonEdit ID="bteBillToCode" runat="server" ClientInstanceName="bteBillToCode" ReadOnly="true" 
                                                    Width="350px">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <RequiredField ErrorText="Dirección de facturación incorrecta."/>
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                    <Buttons>
                                                        <dx:EditButton>
                                                        </dx:EditButton>
                                                    </Buttons>
                                                    <ClientSideEvents ButtonClick="Show_AddreListFactura" />
                                                </dx:ASPxButtonEdit>
                                            </td>
                                            <%--<td style="width:5px">
                                                &nbsp;</td>--%>
                                            <td style="width:150px">
                                                Fecha de Entrega:</td>
                                            <td style="width:217px">
                                                <dx:ASPxDateEdit ID="dteDocDueDate" runat="server" Width="197px" 
                                                    ClientInstanceName="dteDocDueDate">
                                                    <ClientSideEvents DateChanged="Set_CalcMovility" />
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:150px">
                                                Moneda:</td>
                                            <td style="width:150px">
                                                <dx:ASPxComboBox ID="cbbDocCur" runat="server" Width="150px" EnableSynchronization="False"
                                                    ClientInstanceName="cbbDocCur" SelectedIndex="0" Visible="true" 
                                                    ClientSideEvents-SelectedIndexChanged="cambio_moneda"
                                                    AutoPostBack="false">
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                        <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                        <dx:ListEditItem Text="Euro" Value="EUR" />
                                                        <%--<dx:ListEditItem Text="Transferencia Gratuita" Value="05" />--%>
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td  style="width:350px">
                                                <table>
                                                    <tr>
                                                        <td style="width:10px">
                                                            </td>
                                                        <td style="width:150px">
                                                            Persona Contacto</td>
                                                        <td style="width:190px">
                                                            <dx:ASPxComboBox ID="cbbPersonContact" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbPersonContact" Width="190px" OnCallback="cbbPersonContact_Callback">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            
                                        </tr>

                                        <tr>
                                            <td colspan="6" style="width:1022px">
                                                <dx:ASPxPageControl ID="pctData" runat="server" ActiveTabIndex="0" 
                                                    RenderMode="Lightweight" Width="1022px" ClientInstanceName="pctData">
                                                    <TabPages>
                                                        <dx:TabPage Text="Artículos">
                                                            <ContentCollection>
                                                                <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                                                    <table border="0" style="width:1022px">
                                                                        <tr>
                                                                            <td>
                                                                                <dx:ASPxGridView ID="gdvrdr1" runat="server" AutoGenerateColumns="False"
                                                                                    Width="1022px" KeyFieldName="LineNum" ClientInstanceName="gdvrdr1"
                                                                                    OnCellEditorInitialize="gdvrdr1_CellEditorInitialize" 
                                                                                    OnRowInserting="gdvrdr1_RowInserting"
                                                                                    OnRowValidating="gdvrdr1_RowValidating" 
                                                                                    OnRowDeleting="gdvrdr1_RowDeleting" 
                                                                                    OnCustomCallback="gdvrdr1_CustomCallback"
                                                                                    OnCommandButtonInitialize="gdvrdr1_CommandButtonInitialize"
                                                                                    OnHtmlRowPrepared="gdvrdr1_HtmlRowPrepared" 
                                                                                    OnAfterPerformCallback="gdvrdr1_AfterPerformCallback" 
                                                                                    OnHtmlCommandCellPrepared="gdvrdr1_HtmlCommandCellPrepared" 
                                                                                    OnRowUpdating="gdvrdr1_RowUpdating">
                                                                                    <Columns>
                                                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                                                            VisibleIndex="0" Width="130px">
                                                                                            <EditButton Visible="True">
                                                                                            </EditButton>
                                                                                            <NewButton Visible="True">
                                                                                            </NewButton>
                                                                                            <DeleteButton Visible="True">
                                                                                            </DeleteButton>
                                                                                        </dx:GridViewCommandColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Línea" ShowInCustomizationForm="True" 
                                                                                            VisibleIndex="1" Width="40px" FieldName="LineNum">
                                                                                            <PropertiesTextEdit ClientInstanceName="txtLineNum">
                                                                                                <Style HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </Style>
                                                                                            </PropertiesTextEdit>
                                                                                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <CellStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataButtonEditColumn Caption="Código" 
                                                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="150px" 
                                                                                            FieldName="ItemCode" ReadOnly="true">
                                                                                            <PropertiesButtonEdit ClientInstanceName="bteItemCode">
                                                                                                <Buttons>
                                                                                                    <dx:EditButton ToolTip="Agregar Artículo">
                                                                                                    </dx:EditButton>
                                                                                                </Buttons>
                                                                                                <Style Font-Size="8pt">
                                                                                                </Style>
                                                                                                <ClientSideEvents ButtonClick="Add_Product" KeyPress="Key_Product" />
                                                                                            </PropertiesButtonEdit>
                                                                                            <EditCellStyle Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataButtonEditColumn>
                                                                                        <dx:GridViewDataButtonEditColumn Caption="Descripción de Artículo" FieldName="ItemName"
                                                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="250px">
                                                                                            <PropertiesButtonEdit ClientInstanceName="bteItemName">
                                                                                                <Buttons>
                                                                                                    <dx:EditButton ToolTip="Buscar Artículo">
                                                                                                    </dx:EditButton>
                                                                                                </Buttons>
                                                                                                <Style Font-Size="8pt">
                                                                                                </Style>
                                                                                                <ClientSideEvents ButtonClick="Show_ProductSearch" />
                                                                                            </PropertiesButtonEdit>
                                                                                            <EditCellStyle Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataButtonEditColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" 
                                                                                            VisibleIndex="4" Width="100px" FieldName="Quantity">
                                                                                            <PropertiesTextEdit ClientInstanceName="txtQuantity" Width="100%" DisplayFormatInEditMode="true">
                                                                                            
                                                                                                <Style HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </Style>                                                                
                                                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                                                    <ErrorFrameStyle>
                                                                                                        <Paddings Padding="0px" />
                                                                                                        <Border BorderWidth="0px" />
                                                                                                    </ErrorFrameStyle>
                                                                                                </ValidationSettings>
                                                                                                <ClientSideEvents KeyUp="Cal_LineTotals"/> 
                                                                                            </PropertiesTextEdit>
                                                                                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <CellStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Precio Unitario" ShowInCustomizationForm="True" 
                                                                                            VisibleIndex="5" Width="100px" FieldName="PriceBefDi">
                                                                                            <PropertiesTextEdit ClientInstanceName="txtPriceBefDi" DisplayFormatString="n4"
                                                                                                DisplayFormatInEditMode="true">
                                                                                                <ClientSideEvents KeyUp="Cal_PriceUpdate" />
                                                                                                <Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </Style>
                                                                                            </PropertiesTextEdit>
                                                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="% Desc." ShowInCustomizationForm="True" 
                                                                                            VisibleIndex="6" Width="100px" FieldName="DiscPrcnt">
                                                                                            <PropertiesTextEdit ClientInstanceName="txtDiscPrcnt" Width="100%" DisplayFormatString="0.00#"
                                                                                                    DisplayFormatInEditMode="true">
                                                                                            <MaskSettings Mask="&lt;0..999&gt;.&lt;00..999&gt;" />
                                                                                                <Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </Style>
                                                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                                                    <ErrorFrameStyle>
                                                                                                        <Paddings Padding="0px" />
                                                                                                        <Border BorderWidth="0px" />
                                                                                                    </ErrorFrameStyle>
                                                                                                </ValidationSettings>
                                                                                                <ClientSideEvents KeyUp="Cal_LineDescTotals" />
                                                                                            </PropertiesTextEdit>
                                                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Precio C/Desc." FieldName="Price" ReadOnly="true"
                                                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="100px">
                                                                                            <PropertiesTextEdit ClientInstanceName="txtPrice" DisplayFormatString="{0:n4}"
                                                                                                DisplayFormatInEditMode="true">
                                                                                                <Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </Style>
                                                                                            </PropertiesTextEdit>
                                                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Total S/IGV" FieldName="LineTotal"
                                                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="100px" ReadOnly="true">
                                                                                            <PropertiesTextEdit ClientInstanceName="txtLineTotal" DisplayFormatString="{0:n4}"
                                                                                                DisplayFormatInEditMode="true">
                                                                                                <Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </Style>
                                                                                            </PropertiesTextEdit>
                                                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataTextColumn Caption="Total C/IGV" ShowInCustomizationForm="True" ReadOnly="true" 
                                                                                            VisibleIndex="9" Width="100px" FieldName="GTotal">
                                                                                                <PropertiesTextEdit ClientInstanceName="txtGTotal" DisplayFormatString="{0:n4}"
                                                                                                    DisplayFormatInEditMode="true">
                                                                                                    <Style HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                    </Style>
                                                                                                </PropertiesTextEdit>
                                                                                                <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </EditCellStyle>
                                                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                                <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </CellStyle>
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        <dx:GridViewDataButtonEditColumn Caption="Almacén" ShowInCustomizationForm="True" ReadOnly="true" 
                                                                                            VisibleIndex="10" Width="100px" FieldName="WhsCode">
                                                                                                <PropertiesButtonEdit ClientInstanceName="WhsCode">
                                                                                                <Buttons>
                                                                                                    <dx:EditButton ToolTip="Agregar Almacén">
                                                                                                    </dx:EditButton>
                                                                                                </Buttons>
                                                                                                <Style Font-Size="8pt">
                                                                                                </Style>
                                                                                                <ClientSideEvents ButtonClick="Show_AlmacenSearch"/>
                                                                                            </PropertiesButtonEdit>
                                                                                            <EditCellStyle Font-Size="8pt">
                                                                                            </EditCellStyle>
                                                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                                            </CellStyle>
                                                                                        </dx:GridViewDataButtonEditColumn>
                                                                                        <%--<dx:GridViewDataTextColumn Caption="Moneda" ShowInCustomizationForm="false" 
                                                                                            VisibleIndex="10" Width="0px" FieldName="LastPurCur">
                                                                                                <PropertiesTextEdit ClientInstanceName="LastPurCur"
                                                                                                    DisplayFormatInEditMode="false">
                                                                                                    <Style VerticalAlign="Middle" Font-Size="8pt">
                                                                                                    </Style>
                                                                                                </PropertiesTextEdit>
                                                                                                <EditCellStyle VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </EditCellStyle>
                                                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                                <HeaderStyle CssClass="DisplayNone" />
                                                                                                <EditCellStyle CssClass="DisplayNone" />
                                                                                                <CellStyle CssClass="DisplayNone" />
                                                                                                <FilterCellStyle CssClass="DisplayNone" />
                                                                                                <FooterCellStyle CssClass="DisplayNone" />
                                                                                                <GroupFooterCellStyle CssClass="DisplayNone" />
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        
                                                                                        <dx:GridViewDataTextColumn Caption="Gestion de Articulo" FieldName="IssueMthd"
                                                                                            ShowInCustomizationForm="True" VisibleIndex="11" Width="0px">
                                                                                                <PropertiesTextEdit ClientInstanceName="txtIssueMthd"
                                                                                                    DisplayFormatInEditMode="false">
                                                                                                    <Style VerticalAlign="Middle" Font-Size="8pt">
                                                                                                    </Style>
                                                                                                </PropertiesTextEdit>
                                                                                                <EditCellStyle VerticalAlign="Middle" Font-Size="8pt">
                                                                                                </EditCellStyle>
                                                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                                <HeaderStyle CssClass="DisplayNone" />
                                                                                                <EditCellStyle CssClass="DisplayNone" />
                                                                                                <CellStyle CssClass="DisplayNone" />
                                                                                                <FilterCellStyle CssClass="DisplayNone" />
                                                                                                <FooterCellStyle CssClass="DisplayNone" />
                                                                                                <GroupFooterCellStyle CssClass="DisplayNone" />
                                                                                        </dx:GridViewDataTextColumn>
                                                                                        
                                                                                       --%>
                                                                                    </Columns>
                                                                                    <%--<Settings HorizontalScrollBarMode="Visible" />
                                                                                    <SettingsBehavior AllowSort="False" ConfirmDelete="True" ColumnResizeMode="Disabled" />
                                                                                    <SettingsPager Visible="False" Mode="ShowAllRecords" />
                                                                                    <SettingsLoadingPanel Mode="Disabled" />
                                                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom"/>
                                                                                    <Styles>
                                                                                        <Row Font-Size="7pt">
                                                                                        </Row>
                                                                                    </Styles>--%>
                                                                                    <SettingsBehavior AllowSort="False" ColumnResizeMode="Disabled"
                                                                                        ConfirmDelete="True" />
                                                                                    <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                                                    </SettingsPager>
                                                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                                                    <SettingsText Title="ARTÍCULOS" />
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
                                                                </dx:ContentControl>
                                                            </ContentCollection>
                                                        </dx:TabPage>
                                                        <dx:TabPage Text="Finanzas">
                                                            <ContentCollection>
                                                                <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                                                    <table class="tablespace" style="width:100%;">
                                                                        <tr>
                                                                            <td style="width:157px">
                                                                                Usuario:</td>
                                                                            <td>
                                                                                <dx:ASPxTextBox ID="txtU_BF_PickRmrk" runat="server" Width="500px" ReadOnly="true"
                                                                                    ClientInstanceName="txtU_BF_PickRmrk">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                            <td style="width:5px">
                                                                                &nbsp;</td>
                                                                            <td style="width:152px">
                                                                                <%--Docum. Generar:--%></td>
                                                                            <td style="width:500px">
                                                                                <dx:ASPxComboBox ID="cbbU_BIZ_DOCG" runat="server" Width="100%" EnableSynchronization="False"
                                                                                    ClientInstanceName="cbbU_BIZ_DOCG" SelectedIndex="0" Visible="false">
                                                                                    <Items>
                                                                                        <dx:ListEditItem Selected="True" Text="Boleta" Value="01" />
                                                                                        <dx:ListEditItem Text="Factura" Value="02" />
                                                                                    </Items>
                                                                                </dx:ASPxComboBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width:157px">
                                                                                <%--Moneda:--%></td>
                                                                            <td style="width:500px">
                                                                                <dx:ASPxComboBox ID="cbbDocCur2" runat="server" Width="500px" EnableSynchronization="False"
                                                                                    ClientInstanceName="cbbDocCur2" SelectedIndex="0" Visible="false" 
                                                                                    AutoPostBack="false">
                                                                                    <Items>
                                                                                        <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                                                        <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                                                        <dx:ListEditItem Text="Euro" Value="EUR" />
                                                                                        <%--<dx:ListEditItem Text="Transferencia Gratuita" Value="05" />--%>
                                                                                    </Items>
                                                                                </dx:ASPxComboBox>
                                                                            </td>
                                                                            <td style="width:5px">
                                                                                &nbsp;</td>
                                                                            <td style="width:152px">
                                                                                <%--Crédito:--%></td>
                                                                            <td>
                                                                                <dx:ASPxTextBox ID="txtU_BF_CREDBM" runat="server" Width="100%" 
                                                                                    ClientInstanceName="txtU_BF_CREDBM" ReadOnly="true" DisplayFormatString="c2" Visible="false">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                            <td style="width:157px">
                                                                                Condición Pago:</td>
                                                                            <td style="width:500px">
                                                                                <dx:ASPxComboBox ID="cbbGroupNum" runat="server" Width="500px" EnableSynchronization="False"
                                                                                    ClientInstanceName="cbbGroupNum">
                                                                                </dx:ASPxComboBox>
                                                                            </td>
                                                                            <%--<td style="width:5px">
                                                                                &nbsp;</td>--%>
                                                                            <td style="width:152px">
                                                                                <%--Hora Pedido:--%></td>
                                                                            <td>
                                                                                <dx:ASPxTextBox ID="txtDocTime" runat="server" Width="100%" ReadOnly="true"
                                                                                    ClientInstanceName="txtDocTime" Visible="false">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </dx:ContentControl>
                                                            </ContentCollection>
                                                        </dx:TabPage>
                                                        <dx:TabPage Text="Médico y Consignatario" Visible="false">
                                                            <ContentCollection>
                                                                <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                                                                    <table class="tablespace" style="width:100%;">
                                                                        <tr>
                                                                            <td style="width:157px">
                                                                                Médico:</td>
                                                                            <td style="width:500px">
                                                                                <dx:ASPxButtonEdit ID="bteU_BIZ_MEDI" runat="server" ClientInstanceName="bteU_BIZ_MEDI" 
                                                                                    ReadOnly="false" Width="500px">
                                                                                    <Buttons>
                                                                                        <dx:EditButton>
                                                                                        </dx:EditButton>
                                                                                    </Buttons>
                                                                                    <ClientSideEvents ButtonClick="Show_Doctor" />
                                                                                </dx:ASPxButtonEdit>
                                                                            </td>
                                                                            <td style="width: 5px">
                                                                                &nbsp;</td>
                                                                            <td style="width: 152px">
                                                                                <strong>CONSIGNATARIO</strong></td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width:157px">
                                                                                Especialidad:</td>
                                                                            <td style="width:500px">
                                                                                <dx:ASPxTextBox ID="txtU_BIZ_ESPE" runat="server" Width="500px"
                                                                                    ClientInstanceName="txtU_BIZ_ESPE" ReadOnly="false">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                            <td style="width: 5px">
                                                                                &nbsp;</td>
                                                                            <td style="width: 152px">
                                                                                DNI:</td>
                                                                            <td>
                                                                                <dx:ASPxTextBox ID="txtConsigDni" runat="server" 
                                                                                    ClientInstanceName="txtConsigDni" Width="100%">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width:157px">
                                                                                Nro. Colegiatura:</td>
                                                                            <td style="width:500px">
                                                                                <dx:ASPxTextBox ID="txtU_BIZ_COLE" runat="server" Width="500px"
                                                                                    ClientInstanceName="txtU_BIZ_COLE" ReadOnly="false">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                            <td style="width: 5px">
                                                                                &nbsp;</td>
                                                                            <td style="width: 152px">
                                                                                Nombre:</td>
                                                                            <td>
                                                                                <dx:ASPxTextBox ID="txtU_BIZ_SOLI" runat="server" 
                                                                                    ClientInstanceName="txtU_BIZ_SOLI" Width="100%">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width:157px">
                                                                                Dirección:</td>
                                                                            <td style="width:500px">
                                                                                <dx:ASPxTextBox ID="txtU_BIZ_DIRE_MED" runat="server" Width="500px"
                                                                                    ClientInstanceName="txtU_BIZ_DIRE_MED" ReadOnly="True">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                            <td style="width: 5px">
                                                                                &nbsp;</td>
                                                                            <td style="width: 152px">
                                                                                Ciudad:</td>
                                                                            <td>
                                                                                <dx:ASPxTextBox ID="txtConsigCity" runat="server" 
                                                                                    ClientInstanceName="txtConsigCity" Width="100%">
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </dx:ContentControl>
                                                            </ContentCollection>
                                                        </dx:TabPage>
                                                        <dx:TabPage Text="Dirección del Médico" Visible="false">
                                                            <ContentCollection>
                                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                                    <table class="style1">
                                                                        <tr>
                                                                            <td class="style5">
                                                                                &nbsp;</td>
                                                                            <td class="style5">
                                                                                <dx:ASPxRadioButtonList ID="rbttipovilla" runat="server" Height="24px" 
                                                                                    RepeatDirection="Horizontal" SelectedIndex="0" Width="100%" 
                                                                                    ClientInstanceName="rbttipovilla">
                                                                                    <ClientSideEvents ValueChanged="Key_direcdoc" />
                                                                                    <Items>
                                                                                        <dx:ListEditItem Selected="True" Text="AV." Value="AV." />
                                                                                        <dx:ListEditItem Text="CLL." Value="CLL." />
                                                                                        <dx:ListEditItem Text="JR." Value="JR." />
                                                                                        <dx:ListEditItem Text="PJ." Value="PJ." />
                                                                                        <dx:ListEditItem Text="Prolong." Value="Prolong." />
                                                                                        <dx:ListEditItem Text="NF" Value="NF" />
                                                                                    </Items>
                                                                                </dx:ASPxRadioButtonList>
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style6">
                                                                                Nombre:</td>
                                                                            <td class="style7">
                                                                                <dx:ASPxTextBox ID="txtnombredirec" runat="server" Width="100%" 
                                                                                    ClientInstanceName="txtnombredirec">
                                                                                    <ClientSideEvents KeyUp="Key_direcdoc" />
                                                                                </dx:ASPxTextBox>
                                                                            </td>
                                                                            <td class="style8">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style5">
                                                                                Departamento:</td>
                                                                            <td class="style4">
                                                                                <dx:ASPxComboBox ID="cbodepartamento" runat="server" Width="100%" 
                                                                                    ClientInstanceName="cbodepartamento">
                                                                                    <ClientSideEvents SelectedIndexChanged="Set_Lugar_Prov" 
                                                                                        ValueChanged="Key_direcdoc" />
                                                                                </dx:ASPxComboBox>
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style5">
                                                                                Provincia:</td>
                                                                            <td class="style4">
                                                                                <dx:ASPxComboBox ID="cboprovincia" runat="server" Width="100%" 
                                                                                    ClientInstanceName="cboprovincia">
                                                                                    <ClientSideEvents SelectedIndexChanged="Set_Lugar_Disti" />
                                                                                </dx:ASPxComboBox>
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="style5">
                                                                                Distrito:</td>
                                                                            <td class="style4">
                                                                                <dx:ASPxComboBox ID="cbodistrito" runat="server" Width="100%" 
                                                                                    ClientInstanceName="cbodistrito">
                                                                                    <ClientSideEvents ValueChanged="Key_direcdoc" />
                                                                                </dx:ASPxComboBox>
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                </dx:ContentControl>
                                                            </ContentCollection>
                                                        </dx:TabPage>
                                                    </TabPages>
                                                    <TabStyle>
                                                        <Border BorderStyle="None" BorderWidth="0px" />
                                                        <BorderLeft BorderStyle="None" BorderWidth="0px" />
                                                        <BorderTop BorderStyle="None" BorderWidth="0px" />
                                                        <BorderRight BorderStyle="None" BorderWidth="0px" />
                                                        <BorderBottom BorderStyle="None" BorderWidth="0px" />
                                                    </TabStyle>
                                                    <ContentStyle Wrap="False" BackColor="#f5f5f5">
                                                        <Paddings PaddingBottom="0px" PaddingLeft="0px" PaddingRight="0px" PaddingTop="3px"></Paddings>
                                                        <BackgroundImage Repeat="NoRepeat" />
                                                        <Border BorderStyle="None" BorderWidth="0px" />
                                                        <BorderLeft BorderStyle="None" BorderWidth="0px" />
                                                        <BorderTop BorderStyle="None" BorderWidth="0px" />
                                                        <BorderRight BorderStyle="None" BorderWidth="0px" />
                                                        <BorderBottom BorderStyle="None" BorderWidth="0px" />
                                                    </ContentStyle>
                                                </dx:ASPxPageControl>
                                            </td>
                                        </tr>
                                            <tr>
                                                <td style="width:160px">
                                                    Encargado de Compras:</td>
                                                <td colspan="2" style="width:500px">
                                                    <dx:ASPxComboBox ID="cbeSalesPerson" runat="server" EnableSynchronization="False"
                                                        ClientInstanceName="cbeSalesPerson" Width="500px"
                                                        IncrementalFilteringMode="Contains">
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <%--<td style="width:5px">
                                                </td>--%>
                                                <td style="width:150px">
                                                    SubTotal:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="txtLineSum" runat="server" Width="197px" Text="0" 
                                                        ClientInstanceName="txtLineSum" HorizontalAlign="Right" ReadOnly="True" DisplayFormatString="c2">
                                                        <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:160px">
                                                    Responsable Compra:</td>
                                                <td colspan="2" style="width:500px">
                                                    <dx:ASPxComboBox ID="cbeOwnerCode" runat="server" EnableSynchronization="False"
                                                        ClientInstanceName="cbeOwnerCode" Width="500px"
                                                        IncrementalFilteringMode="Contains">
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <%--<td style="width:5px">
                                                    &nbsp;</td>--%>
                                                <td style="width:150px">
                                                    Descuento:</td>
                                                <td style="width:217px">
                                                    <table style="width:197px" border:"0" cellpadding:"0" cellspacing:"0">
                                                        <tr>
                                                            <td style="width:80px">
                                                                <dx:ASPxTextBox ID="txtDiscPrcntTotal" runat="server" ClientInstanceName="txtDiscPrcntTotal" 
                                                                    HorizontalAlign="Right" Width="80px" Text="0.00" Font-Bold="true">
                                                                   <%--<MaskSettings Mask="&lt;0..999&gt;.&lt;00..999&gt;" /> --%>                                                                  
                                                                    <ValidationSettings ErrorDisplayMode="None">
                                                                        <ErrorFrameStyle>
                                                                            <Paddings Padding="0px" />
                                                                            <Border BorderWidth="0px" />
                                                                        </ErrorFrameStyle>
                                                                    </ValidationSettings>
                                                                    <ClientSideEvents KeyUp="Set_Discount" LostFocus="Set_Discount" GotFocus="Sel_txtObject"/>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="text-align:left;width:117px">
                                                                <dx:ASPxTextBox ID="txtDiscSum" runat="server" ClientInstanceName="txtDiscSum" Text="0" 
                                                                    HorizontalAlign="Right" Width="117px" DisplayFormatString="c2" ReadOnly="true">
                                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:160px">
                                                    Comentario:</td>
                                                <td colspan="2" rowspan="2">
                                                    <dx:ASPxMemo ID="mmoComment" runat="server" ClientInstanceName="mmoComment" 
                                                        Height="38px" Width="500px">
                                                    </dx:ASPxMemo>
                                                </td>
                                                <td style="width:150px">
                                                    Impuesto:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" HorizontalAlign="Right" Text="0" 
                                                        ClientInstanceName="txtVatSum" ReadOnly="True" Width="197px" 
                                                        DisplayFormatString="c2">
                                                        <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                    </dx:ASPxTextBox>
                                                </td>

                                            </tr>
                                        <tr>
                                            <td style="width:160px">
                                                &nbsp;</td>
                                            <%--<td style="width:5px">
                                                &nbsp;</td>--%>
                                            <td style="width:150px" class="FormatLabel">
                                                Total Documento:</td>
                                            <td style="width:217px">
                                                <dx:ASPxTextBox ID="txtDocTotal" runat="server" HorizontalAlign="Right" Text="0" 
                                                    ClientInstanceName="txtDocTotal" ReadOnly="True" Width="197px" 
                                                    DisplayFormatString="c2">
                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:160px">
                                                &nbsp;</td>
                                            <td style="width:150px">
                                                &nbsp;</td>
                                            <td style="width:350px">
                                                &nbsp;</td>
                                            <%--<td style="width:5px">
                                                &nbsp;</td>--%>
                                            <td style="width:150px">
                                                <%--Impuesto:--%></td>
                                            <td style="width:217px">
                                                <%--<dx:ASPxTextBox ID="txtVatSum" runat="server" HorizontalAlign="Right" Text="0" 
                                                    ClientInstanceName="txtVatSum" ReadOnly="True" Width="197px" 
                                                    DisplayFormatString="c2">
                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                </dx:ASPxTextBox>--%>
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
                            <div class="MenuFloat01">
                                <dx:ASPxMenu ID="mnuOper" runat="server" RenderMode="Lightweight" Width="100%"
                                    DataSourceID="XmlDataSourceFooter" ClientInstanceName="mnuOper">
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
    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp" OnCustomCallback="hdfTemp_CustomCallback" SyncWithServer="true">
    </dx:ASPxHiddenField>
    <dx:ASPxLoadingPanel ID="ldpProcess" runat="server" ClientInstanceName="ldpProcess" Modal="true" >
    </dx:ASPxLoadingPanel>
    <dx:ASPxPopupControl ID="ppcAlmacenSearch" runat="server" 
        ClientInstanceName="ppcAlmacenSearch" FooterText=" " HeaderText="Buscar Almacén" 
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
                                    <td id="Client3" style="width:105px">
                                        Filtro:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtParAlmacen" runat="server" Width="100%" 
                                            ClientInstanceName="txtParAlmacen">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteAlmacenSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteAlmacenSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Almacen" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvWhsCodeSearch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvWhsCodeSearch" 
                                KeyFieldName="WhsCode" OnCustomCallback="gdvWhsCodeSearch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvWhsCodeSearch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código Almacén" FieldName="WhsCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre Almacén" FieldName="WhsName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkAlmacen"/>
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
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkAlmacen" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelAlmacen" />
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
        ClientInstanceName="ppcClientSearch" FooterText=" " HeaderText="Buscar Proveedor" 
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
                                        Filtro:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtParClient" runat="server" Width="100%" 
                                            ClientInstanceName="txtParClient">
                                            <ClientSideEvents KeyUp="Get_Client" />
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
                                    <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" Width="200px"
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre Comercial" FieldName="CardFName" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="RUC/DNI" FieldName="LicTradNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lista de Precios" FieldName="ListNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Vendedor Asignado" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Condición de Pago" FieldName="GroupNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Grupo" FieldName="GroupCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Documento a Generar" FieldName="GenDoc" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Limite de Credito" FieldName="Credit" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CDR Defecto" FieldName="ShipToDef" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DDR Defecto" FieldName="ShipStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CDF Defecto" FieldName="BillToDef" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DDF Defecto" FieldName="BillStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Médico" FieldName="Doctor" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Responsable" FieldName="empID" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Movilidad" FieldName="U_BIZ_MOV" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="16">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ubigeo" FieldName="U_BIZ_CODI" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="17">
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
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ppcPrecio" runat="server" 
        ClientInstanceName="ppcPrecio" FooterText=" " HeaderText="Buscar Proveedor" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="200px" Modal="true"
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
                                    <td id="" style="width:180px">
                                        <dx:ASPxRadioButtonList ID="rbtnPrecio" runat="server" Height="20px" 
                                                    RepeatDirection="Vertical" Width="100%" SelectedIndex="0" 
                                                    ClientInstanceName="rbtnPrecio" Border-BorderStyle="None">
                                            <Items>
                                                <dx:ListEditItem Text="C/ IGV" Value="Y" Selected="True" />
                                                <dx:ListEditItem Text="S/ IGV" Value="N" />
                                            </Items>
                                        </dx:ASPxRadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="" style="width:80px">
                                        Ingresar Precio: </td>
                                    <td style="width:100px">
                                        <dx:ASPxTextBox ID="AddPrecio" runat="server" Width="100%" 
                                            ClientInstanceName="AddPrecio" DisplayFormatString="{0:n4}" Text="0">
                                            <ClientSideEvents KeyUp="OkPrecio" />
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:340px">
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnOkPrecio" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnOkPrecio" AutoPostBack="False">
                                            <ClientSideEvents Click="OkPrecio" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnCancelPrecio" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnCancelPrecio" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelPrecio" />
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
    <dx:ASPxPopupControl ID="ppcClientAddress" runat="server" 
        ClientInstanceName="ppcClientAddress" FooterText=" " HeaderText="Direcciones del Proveedor Seleccionado" 
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
                            <dx:ASPxGridView ID="gdvAddress" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvAddress" 
                                KeyFieldName="Address" OnCustomCallback="gdvAddress_CustomCallback" 
                                OnDataBinding="gdvAddress_DataBinding"
                                KeyboardSupport="True">
                                <Columns>
                                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="25px">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="Tipo" FieldName="Address" 
                                        ShowInCustomizationForm="True"
                                        VisibleIndex="1" Width="100px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dirección" FieldName="Street" 
                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="AdresType" FieldName="AdresType" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="InDef" FieldName="InDef" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BIZ_ZONA" FieldName="U_BIZ_ZONA" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BIZ_CODI" FieldName="U_BIZ_CODI" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BIZ_MOV" FieldName="U_BIZ_MOV" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSort="False" />
                                <SettingsPager Visible="False">
                                </SettingsPager>
                                <Styles>
                                    <Row Font-Size="7pt">
                                    </Row>
                                </Styles>
                                <ClientSideEvents EndCallback="End_AddrCallback" />
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
                                        <dx:ASPxButton ID="btnClientAddressOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientAddressOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkClientAddress" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnClientAddressCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientAddressCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelClientAddress" />
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
        <%--<dx:ASPxPopupControl ID="ppcClientAddress2" runat="server" 
        ClientInstanceName="ppcClientAddress2" FooterText=" " HeaderText="Direcciones del Cliente Seleccionado" 
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
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvAddress" 
                                KeyFieldName="Address" OnCustomCallback="gdvAddress_CustomCallback" 
                                OnDataBinding="gdvAddress_DataBinding"
                                KeyboardSupport="True">
                                <Columns>
                                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0" Width="25px">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="Tipo" FieldName="Address" 
                                        ShowInCustomizationForm="True"
                                        VisibleIndex="1" Width="100px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dirección" FieldName="Street" 
                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="AdresType" FieldName="AdresType" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="InDef" FieldName="InDef" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BIZ_ZONA" FieldName="U_BIZ_ZONA" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BIZ_CODI" FieldName="U_BIZ_CODI" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BIZ_MOV" FieldName="U_BIZ_MOV" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSort="False" />
                                <SettingsPager Visible="False">
                                </SettingsPager>
                                <Styles>
                                    <Row Font-Size="7pt">
                                    </Row>
                                </Styles>
                                <ClientSideEvents EndCallback="End_AddrCallback" />
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
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientAddressOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkClientAddress" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientAddressCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelClientAddress" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>--%>
    <dx:ASPxPopupControl ID="ppcDoctor" runat="server" 
        ClientInstanceName="ppcDoctor" FooterText=" " HeaderText="Seleccionar Médico" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="500px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccDoctor" runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvDoctor" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvDoctor" 
                                KeyFieldName="U_BIZ_COLE" OnCustomCallback="gdvDoctor_CustomCallback" 
                                OnDataBinding="gdvDoctor_DataBinding"
                                KeyboardSupport="True">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Colegiatura" FieldName="U_BIZ_COLE" 
                                        ShowInCustomizationForm="True"
                                        VisibleIndex="1" Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Médico" FieldName="U_BIZ_MEDI" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Especialidad" FieldName="U_BIZ_ESPE" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dirección" FieldName="U_BIZ_DIRE_MED" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSort="False" />
                                <SettingsPager Visible="False">
                                </SettingsPager>
                                <Styles>
                                    <Row Font-Size="7pt">
                                    </Row>
                                </Styles>
                                <ClientSideEvents EndCallback="End_DocCallback" />
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:340px">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDoctorOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnDoctorOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkDoctor" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDoctorCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnDoctorCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelDoctor" />
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
    <dx:ASPxPopupControl ID="ppcProductSearch" runat="server" 
        ClientInstanceName="ppcProductSearch" FooterText=" " HeaderText="Buscar Producto" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="800px" Modal="true"
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
                                        Codigo:</td>
                                    <td style="width:300px">
                                            <dx:ASPxTextBox ID="txtParProduct" runat="server" Width="100px" 
                                                ClientInstanceName="txtParProduct">
                                                <ClientSideEvents KeyPress="Get_Product" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        
                                        <td id="Product2" style="width:105px">
                                            Descripción:</td>
                                        <td style="width:300px">
                                            <dx:ASPxTextBox ID="txtDescription" runat="server" Width="400px" 
                                                ClientInstanceName="txtDescription">
                                                <ClientSideEvents KeyUp="Get_Product" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td id="Product3" style="width:105px">
                                            Marca:</td>
                                        <td style="width:300px">
                                            <dx:ASPxTextBox ID="txtMarca" runat="server" Width="100px" 
                                                ClientInstanceName="txtMarca">
                                                <ClientSideEvents KeyUp="Get_Product" />
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
                                    <td style="width:80px">
                                        Almacén:
                                        <%--<dx:ASPxTextBox ID="txtWareHouse" runat="server"
                                            ClientInstanceName="txtWareHouse" Text="Almacén: " TextAlign="Left" Visible="true">
                                        </dx:ASPxTextBox>--%>
                                    </td>
                                    <td style="width:200px">
                                        <dx:ASPxComboBox ID="cbbWareHouse" runat="server" Width="100%" 
                                            ClientInstanceName="cbbWareHouse" ClientVisible="true" Visible="true">
                                            <ClientSideEvents SelectedIndexChanged="search_warehouse" />
                                        </dx:ASPxComboBox>
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
                                    <dx:GridViewDataTextColumn Caption="Stock" FieldName="OnHand" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="2" Width="50px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tipo Moneda" FieldName="LastPurCur" 
                                        ShowInCustomizationForm="True" VisibleIndex="11" Width="80px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Precio Unit." FieldName="PriceBefDi" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="n4">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Desc." FieldName="DiscPrcnt" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="0.00#">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Precio S/IGV" FieldName="Price" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="n4">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Precio C/IGV" FieldName="PriceVat" 
                                        ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="n4">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cantidad de Compra" FieldName="NumInBuy" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="7" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Gestion Articulo" FieldName="IssueMthd" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="8" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ActivoC" FieldName="ActivoC" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="9" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ActivoS" FieldName="ActivoS" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="10" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Marca" FieldName="U_GOS_MARCA" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="11" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <%--<dx:GridViewDataTextColumn Caption="Stock" FieldName="U_StoDiBE"
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>--%>
                                    <%--<dx:GridViewDataTextColumn Caption="Stock Yobel" FieldName="U_BF_StoDiYo"
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Comprometido" FieldName="U_U_BF_CompTot"
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Stock BL050" FieldName="BL050" 
                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="14" Width="80px">
                                    </dx:GridViewDataTextColumn>--%>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkProduct" EndCallback="EndProductSearch"/>
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
    <dx:ASPxPopupControl ID="ppcQKit" runat="server" 
        ClientInstanceName="ppcQKit" FooterText=" " HeaderText="Unidades del Kit" 
        RenderMode="Lightweight" ShowFooter="True" Width="170px"
        AllowDragging="True" PopupAnimationType="Fade" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccQKit" runat="server" SupportsDisabledAttribute="True">                    
                <table class="tablespace" style="width:100%">
                    <tr>
                        <td style="width:100px">
                            Cantidad:</td>
                        <td style="width:100%">
                            <dx:ASPxTextBox ID="txtQKit" runat="server" Width="100%" ClientInstanceName="txtQKit"
                                DisplayFormatString="f0" HorizontalAlign="Center">
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
                        <td style="width:100px">
                            &nbsp;</td>
                        <td style="text-align:right; width:100%">
                            <dx:ASPxButton ID="btnOKQKit" runat="server" AutoPostBack="False" Text="OK" 
                                Width="50px" ClientInstanceName="btnOKQKit">
                                <ClientSideEvents Click="Add_Kits" />
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>                    
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ppcOrdrSearch" runat="server" 
        ClientInstanceName="ppcOrdrSearch" FooterText=" " HeaderText="Buscar Orden de Compra" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="800px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccOrdrSearch" runat="server" SupportsDisabledAttribute="True">
                <table border="0"  style="width:100%">
                    <tr>
                        <td>
                            <table class="tablespace" style="width:100%">
                                <tr>
                                    <td style="width:105px">
                                        <dx:ASPxCheckBox ID="chkRangeDate" runat="server" Checked="True" 
                                            CheckState="Checked" ClientInstanceName="chkRangeDate"
                                            Text="Rango Fechas:" Width="105px">
                                            <ClientSideEvents CheckedChanged="Clear_RangeDate" />
                                        </dx:ASPxCheckBox>
                                   </td>
                                    <td style="width:130px">
                                        <dx:ASPxDateEdit ID="dteDateIn" runat="server" Width="130px" 
                                            ClientInstanceName="dteDateIn">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:130px">
                                        <dx:ASPxDateEdit ID="dteDateFi" runat="server" Width="130px" 
                                            ClientInstanceName="dteDateFi">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:130px">
                                        Nro. Pedido:</td>
                                    <td style="width:170px">
                                        <dx:ASPxTextBox ID="txtDocNums" runat="server" 
                                            ClientInstanceName="txtDocNums" Width="170px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width:50px">
                                        <dx:ASPxButton ID="btnOrdrSearch" runat="server" AutoPostBack="False" 
                                            ClientInstanceName="btnOrdrSearch" Text="Buscar" Width="100%">
                                            <ClientSideEvents Click="Get_Ordr" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:105px">
                                        Razón Social:</td>
                                    <td colspan="2">
                                        <dx:ASPxTextBox ID="txtsCardName" runat="server" 
                                            ClientInstanceName="txtsCardName" Width="260px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:130px">
                                        Código Cliente::</td>
                                    <td style="width:170px">
                                        <dx:ASPxTextBox ID="txtsCardCode" runat="server" 
                                            ClientInstanceName="txtsCardCode" Width="170px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width:50px">

                                    </td>
                                </tr>
                                <tr>
                                    <td style="width:105px">
                                        Dirección:</td>
                                    <td colspan="2">
                                        <dx:ASPxTextBox ID="txtdirec" runat="server" 
                                            ClientInstanceName="txtdirec" Width="260px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width:5px">
                                    </td>

                                      <td style="width:40px"></td>
                                        <td>
                                             <dx:ASPxButton ID="btnExport" runat="server" AutoPostBack="False" 
                                                OnClick="btnExport_Click" Text="Exportar" Width="100%">
                                            </dx:ASPxButton>
                                        </td>
                                    
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvOrdrSearch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvOrdrSearch" 
                                KeyFieldName="DocEntry" OnCustomCallback="gdvOrdrSearch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvOrdrSearch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Nro. Pedido" FieldName="DocNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DocDate"
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="d">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Estado" FieldName="DocStatus" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cód. Cliente" FieldName="CardCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="200px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Total" FieldName="DocTotalSrch" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                        <PropertiesTextEdit>
                                            <Style HorizontalAlign="Right"></Style>
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DocEntry" FieldName="DocEntry" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="0px">                                           
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DocDueDate" FieldName="DocDueDate"
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" Width="0px">
                                        <PropertiesTextEdit DisplayFormatString="d">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NumAtCard" FieldName="NumAtCard" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8" Width="0px">                                           
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SlpCode" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="OwnerCode" FieldName="OwnerCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="10" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="GroupNum" FieldName="GroupNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Comments" FieldName="Comments" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DiscPrcntTotal" FieldName="DiscPrcntTotal" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DiscSum" FieldName="DiscSum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="14" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TotalExpns" FieldName="TotalExpns" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="15" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PaidToDate" FieldName="PaidToDate" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="16" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ShipToCode" FieldName="ShipToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="17" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PayToCode" FieldName="PayToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="18" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BillStreet" FieldName="BillStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="19" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ShipStreet" FieldName="ShipStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="20" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DocCur" FieldName="DocCur" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="21" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ListNumSrch" FieldName="ListNumSrch" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="22" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                                          
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkOrdr"  EndCallback="EndOrdrSearch"/>
                                
                                <Styles>
                                    <Row Font-Size="7pt">
                                    </Row>
                                </Styles>
                                 <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Orden de Compra - Compras" />
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
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:650px">
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnOrdrOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnOrdrOk" AutoPostBack="false">
                                            <ClientSideEvents Click="OkOrdr" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnOrdrCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnOrdrCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelOrdr" />
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
     <dx:ASPxGridViewExporter ID="gexData" runat="server" GridViewID="gdvOrdrSearch">
    </dx:ASPxGridViewExporter>

    <dx:ASPxPopupControl ID="ppcOqutSearch" runat="server" 
        ClientInstanceName="ppcOqutSearch" FooterText=" " HeaderText="Buscar Oferta de Compra" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="800px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccOqutSearch" runat="server" SupportsDisabledAttribute="True">
                <table border="0"  style="width:100%">
                    <tr>
                        <td>
                            <table class="tablespace" style="width:100%">
                                <tr>
                                    <td style="width:105px">
                                        Rango Fechas:</td>
                                    <td style="width:130px">
                                        <dx:ASPxDateEdit ID="dtequDateIn" runat="server" Width="130px" 
                                            ClientInstanceName="dtequDateIn">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:130px">
                                        <dx:ASPxDateEdit ID="dtequDateFi" runat="server" Width="130px" 
                                            ClientInstanceName="dtequDateFi">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:130px">
                                        Nro. Oferta:</td>
                                    <td style="width:170px">
                                        <dx:ASPxTextBox ID="txtquDocNum" runat="server" 
                                            ClientInstanceName="txtquDocNum" Width="170px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width:50px">
                                        <dx:ASPxButton ID="btnOqutSearch" runat="server" AutoPostBack="False" 
                                            ClientInstanceName="btnOqutSearch" Text="Buscar" Width="100%">
                                            <ClientSideEvents Click="Get_Oqut" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvOqutSearch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvOqutSearch" 
                                KeyFieldName="DocEntry" OnCustomCallback="gdvOqutSearch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvOqutSearch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Nro. Oferta" FieldName="DocNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DocDate"
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="d">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DocDueDate"
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="d">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cód. Cliente" FieldName="CardCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="200px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Total" FieldName="DocTotalSrch" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="c2">
                                            <Style HorizontalAlign="Right"></Style>
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lista Precio" FieldName="ListNumSrch" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="0px">
                                        <PropertiesTextEdit DisplayFormatString="c2">
                                            <Style HorizontalAlign="Right"></Style>
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DocEntry" FieldName="DocEntry" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DocCur" FieldName="DocCur" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SlpCode" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="OwnerCode" FieldName="OwnerCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="10" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ShipToCode" FieldName="ShipToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PayToCode" FieldName="PayToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Address" FieldName="Address" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Address2" FieldName="Address2" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="14" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="GroupNum" FieldName="GroupNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="15" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DiscPrcntTotal" FieldName="DiscPrcntTotal" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="16" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DiscSum" FieldName="DiscSum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="17" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkOqut" EndCallback="EndOqutSearch"/>
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
                                        <dx:ASPxButton ID="btnOqutOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnOqutOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkOqut" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnOqutCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnOqutCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelOqut" />
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
    <dx:ASPxCallback ID="clbOperation" runat="server" 
        ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
    <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
    <asp:XmlDataSource ID="XmlDataSourceFooter" runat="server" DataFile="~/App_Data/BottomOper.xml"
        XPath="/items/*">
    </asp:XmlDataSource>
</asp:Content>
