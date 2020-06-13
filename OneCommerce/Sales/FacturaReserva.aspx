<%@ Page Title="Documento de Venta de Reserva" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="FacturaReserva.aspx.cs" Inherits="OneCommerce.Sales.FacturaReserva" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>--%>
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Sales/ARReserva.js"></script>
<script type="text/javascript" src="../Scripts/Sales/ARReserva2.js"></script>
<script type="text/javascript" src="../Scripts/Sales/ChristoferJS.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity:"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin:"anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Documento de Venta de Reserva" GroupBoxStyle-Caption-Font-Size="X-Large"
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
                                                Cliente:
                                            </td>
                                            <td colspan="2" style="width:500px">
					                            <table style="width:500px" border:"0" cellpadding:"0" cellspacing:"0">
                                                    <tr>
                                                        <td style="width:150px">
                                                            <dx:ASPxTextBox ID="txtCardCode" runat="server" Width="150px"
                                                                ClientInstanceName="txtCardCode" ReadOnly="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:350px">
                                                            <dx:ASPxButtonEdit ID="bteCardName" runat="server" 
                                                                ClientInstanceName="bteCardName" Width="350px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cliente">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="ShowClientSearch"  />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width:5px">
                                            </td>
                                            <td style="width:150px" class="FormatLabel">
                                                Nro. Interno:</td>
                                            <td style="width:217px">
                                                <table style="width:197px" border="0" cellpadding:"0" cellspacing:"0">
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
                                                RUC/DNI:</td>
                                            <td colspan="2" style="width:500px">
                                                <table style="width:500px" border="0" cellpadding:"0" cellspacing:"0">
                                                    <tr>
                                                        <td style="width:200px">
                                                            <dx:ASPxButtonEdit ID="bteLicTradNum" runat="server" Width="200px"
                                                                ClientInstanceName="bteLicTradNum" ReadOnly="true">
                                                                <Buttons>
                                                                    <dx:EditButton Text="Verficar Cliente" Width="100px" Visible="false">
                                                                    </dx:EditButton>
                                                                </Buttons>                                                    
                                                                <ButtonStyle Font-Bold="True">
                                                                </ButtonStyle>
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                        <td style="width:100px; text-align:center;">
                                                            Tipo Operacion:
                                                        </td>
                                                        <td style="width:200px">
                                                            <dx:ASPxComboBox ID="cbbTipoOperacion" runat="server" Width="200px" EnableSynchronization="False"
                                                                ClientInstanceName="cbbTipoOperacion">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td style="width:150px" class="FormatLabel">
                                                Estado:</td>
                                            <td style="width:217px" class="FormatLabel">
                                                <dx:ASPxTextBox ID="txtDocStatus" runat="server" Width="197px"
                                                    ClientInstanceName="txtDocStatus" ReadOnly="true">
                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:160px">
                                                Lista de Precios:</td>
                                            <td colspan="2" style="width:500px">
                                                 <table style="width:500px" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width:200px">
                                                            <dx:ASPxComboBox ID="cbbListNum" runat="server" Width="200px" EnableSynchronization="False"
                                                                ClientInstanceName="cbbListNum">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:100px; text-align:center;">
                                                            Moneda:
                                                        </td>
                                                        <td style="width:200px">
                                                            <dx:ASPxComboBox ID="cbbDocCur" runat="server" Width="200px" EnableSynchronization="False"
                                                                ClientInstanceName="cbbDocCur" SelectedIndex="0" Visible="true" 
                                                                ClientSideEvents-SelectedIndexChanged="cambio_moneda"
                                                                AutoPostBack="false">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                                    <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                                    <dx:ListEditItem Text="Euro" Value="EUR" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td style="width:150px" class="FormatLabel">
                                                Fecha Contable:</td>
                                            <td style="width:217px">
                                                <dx:ASPxDateEdit ID="dteDocDate" runat="server" Width="197px"
                                                    ClientInstanceName="dteDocDate" Font-Bold="true">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td style="width:160px">
                                                Nro. de Documento:</td>
                                            <td colspan="2" style="width:500px">
					                            <table style="width:500px" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width:200px">
                                                            <dx:ASPxComboBox ID="cbbU_BPP_MDTD" runat="server" Width="200px"
                                                            ClientInstanceName="cbbU_BPP_MDTD" EnableSynchronization="False">
                                                            <ClientSideEvents SelectedIndexChanged="Get_DocumentSerie" />
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:100px">
                                                            <dx:ASPxComboBox ID="cbbU_BPP_MDSD" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbU_BPP_MDSD" Width="100px">
                                                                <ClientSideEvents SelectedIndexChanged="Get_DocumentCorrelative" />
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtU_BPP_MDCD" runat="server" ClientInstanceName="txtU_BPP_MDCD" 
                                                                Width="200px" ReadOnly="false">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td style="width:150px" class="FormatLabel">
                                                Fecha Documento:</td>
                                            <td style="width:217px">
                                                <dx:ASPxDateEdit ID="dteDocumentoDate" runat="server" Width="197px"
                                                    ClientInstanceName="dteDocumentoDate" Font-Bold="true">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>   
                                        <tr>
                                            <td style="width:160px">
                                                Contacto:</td>
                                            <td colspan="2" style="width:500px">
					                            <table style="width:500px" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width:200px">
                                                            <dx:ASPxComboBox ID="cbbPersonContact" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbPersonContact" Width="200px" OnCallback="cbbPersonContact_Callback">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:100px">
                                                            
                                                        </td>
                                                        <td style="width:200px">
                                                            
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td style="width:150px" class="FormatLabel">
                                                Nro. Legal Sunat:</td>
                                            <td style="width:217px">
                                                <dx:ASPxTextBox ID="txtNumAtCard" runat="server" Width="197px"
                                                    ClientInstanceName="txtNumAtCard" ReadOnly="true">
                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>                                      
                                        <tr>
                                            <td colspan="6">
                                                <dx:ASPxGridView ID="gdvinv1" runat="server" AutoGenerateColumns="False" Width="1022px"
                                                    ClientInstanceName="gdvinv1" KeyFieldName="LineNum"
                                                    OnCellEditorInitialize="gdvinv1_CellEditorInitialize" 
                                                    OnRowInserting="gdvinv1_RowInserting" 
                                                    OnRowValidating="gdvinv1_RowValidating" 
                                                    OnRowDeleting="gdvinv1_RowDeleting" 
                                                    OnCustomCallback="gdvinv1_CustomCallback"
                                                    OnCommandButtonInitialize="gdvinv1_CommandButtonInitialize"
                                                    OnHtmlRowPrepared="gdvinv1_HtmlRowPrepared"
                                                    OnRowUpdating="gdvinv1_RowUpdating">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <EditButton Visible="True">
                                                            </EditButton>
                                                            <NewButton Visible="True">
                                                            </NewButton>
                                                            <DeleteButton Visible="True">
                                                            </DeleteButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Línea" ShowInCustomizationForm="True" 
                                                            VisibleIndex="1" Width="50px" FieldName="LineNum">
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
                                                        <dx:GridViewDataButtonEditColumn Caption="Código" FieldName="ItemCode" 
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
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
                                                        <dx:GridViewDataButtonEditColumn Caption="Descripción" FieldName="ItemName" 
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="260px">
                                                            <PropertiesButtonEdit ClientInstanceName="bteItemName">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Artículo">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="ShowProductSearch" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" 
                                                            VisibleIndex="4" Width="70px" FieldName="Quantity">
                                                            <PropertiesTextEdit ClientInstanceName="txtQuantity" Width="100%" DisplayFormatInEditMode="true">
                                                            <MaskSettings Mask="&lt;0..9999999&gt;" />
                                                                <Style HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                                </Style>                                                                
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                    <ErrorFrameStyle>
                                                                        <Paddings Padding="0px" />
                                                                        <Border BorderWidth="0px" />
                                                                    </ErrorFrameStyle>
                                                                </ValidationSettings>
                                                                <ClientSideEvents KeyUp="Cal_LineTotals" /> 
                                                            </PropertiesTextEdit>
                                                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <CellStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Precio Unit." ShowInCustomizationForm="True" 
                                                            VisibleIndex="5" Width="100px" FieldName="PriceBefDi" ReadOnly="true">
                                                            <PropertiesTextEdit ClientInstanceName="txtPriceBefDi" DisplayFormatString="{0:n4}"
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
                                                            VisibleIndex="6" Width="60px" FieldName="DiscPrcnt">
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
                                                        <dx:GridViewDataTextColumn Caption="Precio C/Desc." FieldName="Price"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="90px" ReadOnly="true">
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
                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="90px" ReadOnly="true">
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
                                                        <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="90px" 
                                                            Caption="Total C/IGV" VisibleIndex="9" FieldName="GTotal" ReadOnly="true">
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
                                                        <dx:GridViewDataTextColumn Caption="Gestion de Articulo" FieldName="IssueMthd"
                                                            ShowInCustomizationForm="True" VisibleIndex="10" Width="80px">
                                                                <PropertiesTextEdit ClientInstanceName="txtIssueMthd"
                                                                    DisplayFormatInEditMode="true">
                                                                    <Style VerticalAlign="Middle" Font-Size="8pt">
                                                                    </Style>
                                                                </PropertiesTextEdit>
                                                                <EditCellStyle VerticalAlign="Middle" Font-Size="8pt">
                                                                </EditCellStyle>
                                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <CellStyle ForeColor="Black"  VerticalAlign="Middle" Font-Size="8pt">
                                                                </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Serie a Seleccionar" FieldName="Serie" 
                                                            ShowInCustomizationForm="True" VisibleIndex="11" Width="0px">
                                                            <PropertiesButtonEdit ClientInstanceName="bteSerialNumber">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Seleccionar Serie" Visible="true">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="ShowSerialNumber"/>
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn  ShowInCustomizationForm="True" VisibleIndex="12" 
                                                            FieldName="TreeType" Width="0px">
                                                            <PropertiesTextEdit ClientInstanceName="TreeType" Width="0px">
                                                            <Style CssClass="DisplayNone"></Style>
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <%--<dx:GridViewDataTextColumn  ShowInCustomizationForm="True" VisibleIndex="10" 
                                                            FieldName="BatchNum" Width="0px" Visible="False">
                                                            <PropertiesTextEdit ClientInstanceName="txtBatchNum" Width="0px">
                                                            <Style CssClass="DisplayNone"></Style>
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn  ShowInCustomizationForm="True" VisibleIndex="11" 
                                                            FieldName="U_BF_CodKit" Width="0px" Visible="False">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BF_CodKit" Width="0px">
                                                            <Style CssClass="DisplayNone"></Style>
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn  ShowInCustomizationForm="True" VisibleIndex="12" 
                                                            FieldName="NumInSale" Width="0px" Visible="False">
                                                            <PropertiesTextEdit ClientInstanceName="txtNumInSale" Width="0px">
                                                            <Style CssClass="DisplayNone"></Style>
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn  ShowInCustomizationForm="True" VisibleIndex="13" 
                                                            FieldName="OItemCode" Width="0px" Visible="False">
                                                            <PropertiesTextEdit ClientInstanceName="txtOItemCode" Width="0px">
                                                            <Style CssClass="DisplayNone"></Style>
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>--%>
                                                    </Columns>
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
                                            <tr>
                                                <td style="width:160px">
                                                    Vendedor Asignado:</td>
                                                <td colspan="2" style="width:500px">
                                                    <dx:ASPxComboBox ID="cbeSalesPerson" runat="server" EnableSynchronization="False"
                                                        ClientInstanceName="cbeSalesPerson" Width="500px"
                                                        IncrementalFilteringMode="Contains">
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td style="width:5px">
                                                </td>
                                                <td style="width:150px" class="FormatLabel">
                                                    SubTotal:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="txtLineSum" runat="server" Width="197px" HorizontalAlign="Right"
                                                        ClientInstanceName="txtLineSum" ReadOnly="True" DisplayFormatString="c2">
                                                        <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:160px">
                                                    Responsable Venta:</td>
                                                <td colspan="2" style="width:500px">
                                                    <dx:ASPxComboBox ID="cbeOwnerCode" runat="server" EnableSynchronization="False"
                                                        ClientInstanceName="cbeOwnerCode" Width="500px"
                                                        IncrementalFilteringMode="Contains">
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td style="width:5px">
                                                    &nbsp;</td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Descuento:</td>
                                                <td style="width:217px">
                                                    <table style="width:197px" border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width:80px">
                                                                <dx:ASPxTextBox ID="txtDiscPrcntTotal" runat="server" ClientInstanceName="txtDiscPrcntTotal" 
                                                                    HorizontalAlign="Right" Width="80px" Text="0.00" Font-Bold="true">
                                                                   <%--<MaskSettings Mask="&lt;0..999&gt;.&lt;00..999&gt;" />   --%>                                                                
                                                                    <ValidationSettings ErrorDisplayMode="None">
                                                                        <ErrorFrameStyle>
                                                                            <Paddings Padding="0px" />
                                                                            <Border BorderWidth="0px" />
                                                                        </ErrorFrameStyle>
                                                                    </ValidationSettings>
                                                                    <ClientSideEvents KeyUp="Set_Discount" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="text-align:left;width:117px">
                                                                <dx:ASPxTextBox ID="txtDiscSum" runat="server" ClientInstanceName="txtDiscSum" 
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
                                                    Condición de Pago:</td>
                                                <td colspan="2" style="width:500px">
                                                    <dx:ASPxComboBox ID="cbbGroupNum" runat="server" EnableSynchronization="False"
                                                        ClientInstanceName="cbbGroupNum" Width="500px">
                                                    </dx:ASPxComboBox>
                                                </td>
                                                <td style="width:5px">
                                                </td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Anticipo Total:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxButtonEdit ID="bteAnticipo" runat="server" ReadOnly="true" HorizontalAlign="Right"
                                                        ClientInstanceName="bteAnticipo" Width="197px" DisplayFormatString="c2">
                                                        <Buttons>
                                                            <dx:EditButton ToolTip="Anticipos">
                                                            </dx:EditButton>
                                                        </Buttons>
                                                        <ClientSideEvents ButtonClick="ShowAnticipos"/>
                                                    </dx:ASPxButtonEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:text-top;width:160px" rowspan="2">
                                                    Comentario: </td>                                           
                                                <td colspan="2" rowspan="2" style="width:500px">
                                                    <dx:ASPxMemo ID="mmoComments" runat="server" ClientInstanceName="mmoComments" 
                                                        Height="40px" Width="500px">
                                                    </dx:ASPxMemo>
                                                </td>
                                                <td style="width:5px">
                                                    &nbsp;</td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Gasto Adicional:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="txtTotalExpns" runat="server" Width="197px" ClientInstanceName="txtTotalExpns"
                                                    HorizontalAlign="Right" DisplayFormatString="c2" Font-Bold="true">
                                                    <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                    <ClientSideEvents KeyUp="Set_TotalExpns" />
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        <tr>
                                            
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td style="width:150px" class="FormatLabel">
                                                Impuesto:</td>
                                            <td style="width:217px">
                                                <dx:ASPxTextBox ID="txtVatSum" runat="server" HorizontalAlign="Right"
                                                    ClientInstanceName="txtVatSum" ReadOnly="True" Width="197px" 
                                                    DisplayFormatString="c2">
                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
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
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td style="width:150px" class="FormatLabel">
                                                Total Documento:</td>
                                            <td style="width:217px">
                                                <dx:ASPxTextBox ID="txtDocTotal" runat="server" HorizontalAlign="Right"
                                                    ClientInstanceName="txtDocTotal" ReadOnly="True" Width="197px" 
                                                    DisplayFormatString="c2">
                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                </dx:ASPxTextBox>
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
                                            <%--<td style="width:160px">
                                                Pedido Origen:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtU_BF_PED_ORIG" runat="server" 
                                                    ClientInstanceName="txtU_BF_PED_ORIG" Width="150px">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:350px">
                                                &nbsp;</td>--%>
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td class="FormatLabel" style="width:150px">
                                                Importe Aplicado:</td>
                                            <td style="width:217px">
                                                <dx:ASPxTextBox ID="txtPaidToDate" runat="server" HorizontalAlign="Right"
                                                    ClientInstanceName="txtPaidToDate" ReadOnly="True" Width="197px" 
                                                    DisplayFormatString="c2">
                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:160px">
                                                </td>
                                            <td style="width:150px">
                                                
                                            </td>
                                            <td style="width:350px">
                                                
                                            </td>  
                                            <%--<td style="width:160px">
                                                &nbsp;</td>
                                            <td style="width:150px">
                                                &nbsp;</td>
                                            <td style="width:350px">
                                                &nbsp;</td>--%>
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td class="FormatLabel" style="width:150px">
                                                Saldo Pendiente:</td>
                                            <td style="width:217px">
                                                <dx:ASPxTextBox ID="txtPendingBal" runat="server" HorizontalAlign="Right" 
                                                    ClientInstanceName="txtPendingBal" ReadOnly="True" Width="197px" 
                                                    DisplayFormatString="c2">
                                                    <ReadOnlyStyle Font-Bold="true"></ReadOnlyStyle>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-style: none; width:160px">
                                                <%--Nro. Pedido:--%></td>
                                            <td style="border-style: none; width:150px">
                                                <dx:ASPxTextBox ID="txtnropedido" runat="server" Width="150px" 
                                                    ClientInstanceName="txtnropedido" Visible="false">
                                                    <%--<ClientSideEvents KeyPress="ValidaSoloNumeros" />--%>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="border-style: inherit; width:350px">
                                                <dx:ASPxButton ID="btnImprimirPed" runat="server" Text="Imprimir Pedido" 
                                                    Width="150px" AutoPostBack="False" ClientInstanceName="btnImprimirPed" Visible="false">
                                                    <%--<ClientSideEvents Click="Operacion"/>--%>
                                                </dx:ASPxButton>
                                            </td>
                                            <td style="width:5px">
                                                &nbsp;</td>
                                            <td class="FormatLabel" style="width:150px">
                                                &nbsp;</td>
                                            <td style="width:217px">
                                                &nbsp;</td>
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
                                            <ClientSideEvents KeyDown="Get_Client1" />
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
                                    <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="RUC/DNI" FieldName="LicTradNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lista de Precios" FieldName="ListNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Vendedor Asignado" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="GroupNum" FieldName="GroupNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CDR Defecto" FieldName="ShipToDef" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DDR Defecto" FieldName="ShipStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CDF Defecto" FieldName="BillToDef" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DDF Defecto" FieldName="BillStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9">
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
                                        <td id="ProductParCaption" style="width:105px">
                                            Código:</td>
                                        <td style="width:300px">
                                            <dx:ASPxTextBox ID="txtParProduct" runat="server" Width="100px" 
                                                ClientInstanceName="txtParProduct">
                                                <ClientSideEvents KeyPress="Get_Product" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        
                                        <td id="ProductParCaption2" style="width:105px">
                                            Descripción:</td>
                                        <td style="width:300px">
                                            <dx:ASPxTextBox ID="txtDescription" runat="server" Width="400px" 
                                                ClientInstanceName="txtDescription">
                                                <ClientSideEvents KeyUp="Get_Product" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td id="ProductParCaption3" style="width:105px">
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
                                                <ClientSideEvents Click="Get_Product1" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:50px">
                                            <dx:ASPxCheckBox ID="chkKit" runat="server" CheckState="Unchecked" 
                                                ClientInstanceName="chkKit" Text="Kit:" TextAlign="Left" Visible="false">
                                                <ClientSideEvents CheckedChanged="Set_Kit"/>
                                            </dx:ASPxCheckBox>
                                        </td>
                                        <td style="width:200px">
                                            <dx:ASPxTextBox ID="txtQuantityKit" runat="server" Width="100%" Visible="false"
                                                ClientInstanceName="txtQuantityKit" DisplayFormatString="f0">
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
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="290px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Stock" FieldName="OnHand" 
                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Precio Unit." FieldName="PriceBefDi" 
                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="n4"></PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Desc." FieldName="DiscPrcnt" 
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Precio S/IGV" FieldName="Price" 
                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="n4"></PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Precio C/IGV" FieldName="PriceVat" 
                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="n4"></PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Numero de Serie" FieldName="IssueMthd" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="7" Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cantidad de Venta" FieldName="NumInSale" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="8" Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ActivoC" FieldName="ActivoC" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="9" 
                                        Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ActivoS" FieldName="ActivoS" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="10" 
                                            Width="80px">
                                        </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="InvntItem" FieldName="InvntItem" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="11" 
                                            Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Marca" FieldName="U_GOS_MARCA" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="12" 
                                            Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <%--<dx:GridViewDataTextColumn Caption="Lote/Cantidad" FieldName="BatchNum" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Kit" FieldName="U_BF_CodKit" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="NumInSale" FieldName="NumInSale" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="8" Width="80px">
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
    <dx:ASPxPopupControl ID="ppcOinvSearch" runat="server" 
            ClientInstanceName="ppcOinvSearch" FooterText=" " HeaderText="Buscar Documento de Venta" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            RenderMode="Lightweight" ShowFooter="True" Width="800px" Modal="true"
            AllowDragging="True" PopupAnimationType="Fade">
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="pccOinvSearch" runat="server" SupportsDisabledAttribute="True">
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
                                            Serie Doc.:</td>
                                        <td style="width:170px">
                                            <dx:ASPxTextBox ID="txtNumAtCards" runat="server"
                                                ClientInstanceName="txtNumAtCards" Width="170px">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:130px">
                                            Correlativo Doc.:</td>
                                        <td style="width:100px">
                                            <dx:ASPxTextBox ID="txtCorrelativo" runat="server"
                                                ClientInstanceName="txtCorrelativo" Width="100px">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:50px">
                                            <dx:ASPxButton ID="btnOinvSearch" runat="server" AutoPostBack="False" 
                                                ClientInstanceName="btnOinvSearch" Text="Buscar" Width="100%">
                                                <ClientSideEvents Click="Get_Oinv" />
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
                                            Código Cliente:</td>
                                        <td style="width:170px">
                                            <dx:ASPxTextBox ID="txtsCardCode" runat="server" 
                                                ClientInstanceName="txtsCardCode" Width="170px">
                                            </dx:ASPxTextBox>
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
                                <dx:ASPxGridView ID="gdvOinvSearch" runat="server" Width="100%"
                                    AutoGenerateColumns="False" ClientInstanceName="gdvOinvSearch" 
                                    KeyFieldName="DocEntry" OnCustomCallback="gdvOinvSearch_CustomCallback" 
                                    KeyboardSupport="True" OnDataBinding="gdvOinvSearch_DataBinding">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nro. Documento" FieldName="NumAtCard" 
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
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                <Style HorizontalAlign="Right"></Style>
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="DocEntry" FieldName="DocEntry" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="0px">                                           
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="DocNum" FieldName="DocNum" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="LicTradNum" FieldName="LicTradNum" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="8" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="U_BPP_MDTD" FieldName="U_BPP_MDTD" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="9" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="U_BPP_MDSD" FieldName="U_BPP_MDSD" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="10" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="U_BPP_MDCD" FieldName="U_BPP_MDCD" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="11" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="SlpCode" FieldName="SlpCode" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="12" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="OwnerCode" FieldName="OwnerCode" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="13" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="GroupNum" FieldName="GroupNum" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="14" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Comments" FieldName="Comments" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="15" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="U_BF_PED_ORIG" FieldName="U_BF_PED_ORIG" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="16" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="DiscPrcntTotal" FieldName="DiscPrcntTotal" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="17" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="DiscSum" FieldName="DiscSum" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="18" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="TotalExpns" FieldName="TotalExpns" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="19" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="PaidToDate" FieldName="PaidToDate" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="20" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="DocCur" FieldName="DocCur" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="21" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ListNumSrch" FieldName="ListNumSrch" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="22" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ShipToCode" FieldName="ShipToCode" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="23" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="PayToCode" FieldName="PayToCode" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="24" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="BillStreet" FieldName="BillStreet" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="25" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dirección" FieldName="ShipStreet" 
                                            ShowInCustomizationForm="True" Visible="true" VisibleIndex="26" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="TipoOperacion" FieldName="U_DXP_FE_TO" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="27" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="DpmAmnt" FieldName="DpmAmnt" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="28" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="TaxDate" FieldName="TaxDate" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="29" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" 
                                        AllowSelectSingleRowOnly="True" />
                                    <ClientSideEvents RowDblClick="OkOinv" EndCallback="EndOinvSearch"/>
                                    <Styles>
                                        <Row Font-Size="7pt">
                                        </Row>
                                    </Styles>
                                     <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Facturas de Reserva" />
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
                                            <dx:ASPxButton ID="btnOinvOk" runat="server" Text="Ok" Width="100%" 
                                                ClientInstanceName="btnOinvOk" AutoPostBack="False">
                                                <ClientSideEvents Click="OkOinv" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnOinvCancel" runat="server" Text="Cancelar" Width="100%" 
                                                ClientInstanceName="btnOinvCancel" AutoPostBack="False">
                                                <ClientSideEvents Click="CancelOinv" />
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
    <dx:ASPxGridViewExporter ID="gexData" runat="server" GridViewID="gdvOinvSearch">
    </dx:ASPxGridViewExporter>

        <dx:ASPxPopupControl ID="ppcOdlnSearch" runat="server" 
        ClientInstanceName="ppcOdlnSearch" FooterText=" " HeaderText="Buscar Guia de Remision" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="800px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccOdlnSearch" runat="server" SupportsDisabledAttribute="True">
                <table border="0"  style="width:100%">
                    <tr>
                        <td>
                            <table class="tablespace" style="width:100%">
                                <tr>
                                    <td style="width:105px">
                                        Rango Fechas:</td>
                                    <td style="width:130px">
                                        <dx:ASPxDateEdit ID="dterdDateIn" runat="server" Width="130px" 
                                            ClientInstanceName="dterdDateIn">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:130px">
                                        <dx:ASPxDateEdit ID="dterdDateFi" runat="server" Width="130px" 
                                            ClientInstanceName="dterdDateFi">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:130px">
                                        Nro. Orden:</td>
                                    <td style="width:170px">
                                        <dx:ASPxTextBox ID="txtrdDocNum" runat="server" 
                                            ClientInstanceName="txtrdDocNum" Width="170px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width:50px">
                                        <dx:ASPxButton ID="btnOdlnSearch" runat="server" AutoPostBack="False" 
                                            ClientInstanceName="btnOdlnSearch" Text="Buscar" Width="100%">
                                            <ClientSideEvents Click="Get_Odln" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvOdlnSearch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvOdlnSearch" 
                                KeyFieldName="DocEntry" OnCustomCallback="gdvOdlnSearch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvOdlnSearch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Nro. Orden" FieldName="DocNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DocDate"
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="d">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cód. Cliente" FieldName="CardCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="200px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Total" FieldName="DocTotalSrch" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="c2">
                                            <Style HorizontalAlign="Right"></Style>
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="DocEntry" FieldName="DocEntry" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="5" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="GroupNum" FieldName="GroupNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SlpCode" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Comments" FieldName="Comments" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DocCur" FieldName="DocCur" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="OwnerCode" FieldName="OwnerCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="10" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DiscPrcntTotal" FieldName="DiscPrcntTotal" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DiscSum" FieldName="DiscSum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ShipToCode" FieldName="ShipToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PayToCode" FieldName="PayToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="14" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BillStreet" FieldName="BillStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="15" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dirección" FieldName="ShipStreet" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="16" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkOdln" EndCallback="EndOdlnSearch"/>
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
                                        <dx:ASPxButton ID="btnOdlnOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnOdlnOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkOdln" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnOdlnCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnOdlnCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelOdln" />
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

        <dx:ASPxPopupControl ID="ASPxSerialNumber" runat="server" 
            ClientInstanceName="ppcSerialNumber" FooterText=" " HeaderText="Seleccionar Serie" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            RenderMode="Lightweight" ShowFooter="True" Width="220px" Modal="true" Height="200px"
            AllowDragging="True" PopupAnimationType="Fade">
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                    <table border="0" style="width:100%">
                        <tr>
                            <td>
                                <table style="width:100%;" class="tablespace">
                                    <tr>
                                        <td id="Td1" style="width:105px">
                                            </td>
                                        <td style="width:280px">
                                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%" 
                                                ClientInstanceName="txtParClient" Visible="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>
                                            <%--<dx:ASPxButton ID="ASPxButton1" runat="server" Text="Buscar" Width="100%" 
                                                ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                                <ClientSideEvents Click="Get_Client"/>
                                            </dx:ASPxButton>--%>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxListBox  ID="ListSeries" runat="server" KeyFieldName="SysNumber"
                                    ValueType="System.String" ClientInstanceName="ListSeries" 
                                    Height="320px" SelectionMode="CheckColumn">
                                    <Columns>
                                        <%--<dx:ListBoxColumn Caption="Codigo" FieldName="ItemCode"/>--%>
                                        <dx:ListBoxColumn Caption="Serie" FieldName="Serie" />
                                        <%--<dx:ListBoxColumn Caption="SysNumber" FieldName="SysNumber" />--%>
                                    </Columns>
                                </dx:ASPxListBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width:100%;" class="tablespace">
                                    <tr>
                                        <td style="width:340px">
                                            &nbsp;</td>
                                        <td>
                                            <dx:ASPxButton ID="ASPxAceptarSerie" runat="server" Text="Ok" Width="100%" 
                                                ClientInstanceName="btnClientOk" AutoPostBack="False">
                                                <ClientSideEvents Click="OK_Series" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="ASPxCancelarSerie" runat="server" Text="Cancelar" Width="100%" 
                                                ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                                <ClientSideEvents Click="CancelSeries" />
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
    <dx:ASPxPopupControl ID="ppcPagos" runat="server" 
                ClientInstanceName="ppcPagos" FooterText=" " HeaderText="Pagos Recibidos" 
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
                RenderMode="Lightweight" ShowFooter="True" Width="370px" Modal="true"
                AllowDragging="True" PopupAnimationType="Fade">
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl5" runat="server" SupportsDisabledAttribute="True">
                    <table style="width:360px" class="tablespace">
                        <tr>
                            <td colspan="3" style="width:360px">
                                <fieldset>
                                    <legend>Pago Efectivo <dx:ASPxCheckBox ID = "checkpagoefe" ClientInstanceName = "checkpagoefe" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="true" ValueType="System.String">
                                                            </dx:ASPxCheckBox></legend>
                                    <table>
                                        <tr>
                                            <td>Moneda: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCurPagoEfe" runat="server" Width="200px" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCurPagoEfe" SelectedIndex="0" Visible="true" 
                                                    ClientSideEvents-SelectedIndexChanged="cambio_moneda_pago">
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                        <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                        <dx:ListEditItem Text="Euro" Value="EUR" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Fecha Transfe.</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxDateEdit ID="dteDocDateEfect" runat="server"
                                                    ClientInstanceName="dteDocDateEfect" Font-Bold="true">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cuenta: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtCuentaEfe" runat="server" ClientInstanceName="txtCuentaEfe" 
                                                    Width="100%" Text="Caja Principal" ReadOnly="true">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Saldo Pendiente:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalEfe1" runat="server" ClientInstanceName="txtSalEfe1" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2" ReadOnly="true">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
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
                                            <td>
                                                Total:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalEfe2" runat="server" ClientInstanceName="txtSalEfe2" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                                <fieldset>
                                    <legend>Pago Tarjeta <dx:ASPxCheckBox ID = "checkpagotar" ClientInstanceName = "checkpagotar" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String">
                                                            </dx:ASPxCheckBox></legend>
                                    <table>
                                        <tr>
                                            <td>Moneda: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCurPagoTar" runat="server" Width="200px" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCurPagoTar" SelectedIndex="0" Visible="true" 
                                                    ClientSideEvents-SelectedIndexChanged="cambio_moneda_pago">
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                        <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                        <dx:ListEditItem Text="Euro" Value="EUR" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Fecha Transfe.</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxDateEdit ID="dteDocDateTarj" runat="server"
                                                    ClientInstanceName="dteDocDateTarj" Font-Bold="true">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tipo Tarjeta: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCreditCard1" runat="server" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCreditCard1" Width="100%">
                                                    <ClientSideEvents SelectedIndexChanged="Sel_CreditCard1" />
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Num. Tarjeta</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtNumTarjeta" runat="server" ClientInstanceName="txtNumTarjeta" 
                                                    Width="100%" DisplayFormatString="d">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Num. Operación</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtNumOperacion" runat="server" ClientInstanceName="txtNumOperacion" 
                                                    Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Saldo Pendiente:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalTar1" runat="server" ClientInstanceName="txtSalTar1" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2" ReadOnly="true">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
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
                                            <td>
                                                Total:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalTar2" runat="server" ClientInstanceName="txtSalTar2" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                                <fieldset>
                                    <legend>Transferencia <dx:ASPxCheckBox ID = "checkpagotrans" ClientInstanceName = "checkpagotrans" 
                                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String">
                                                            </dx:ASPxCheckBox></legend>
                                
                                <table>
                                        <tr>
                                            <td>Moneda: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCurPagoTrans" runat="server" Width="200px" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCurPagoTrans" SelectedIndex="0" Visible="true" 
                                                    ClientSideEvents-SelectedIndexChanged="cambio_moneda_pago">
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="SOL" Value="SOL" />
                                                        <dx:ListEditItem Text="Dolar Americano" Value="USD" />
                                                        <dx:ListEditItem Text="Euro" Value="EUR" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cuenta: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxComboBox ID="cbbCuentaTrans" runat="server" ClientInstanceName="cbbCuentaTrans" 
                                                    Width="100%" ReadOnly="false" OnCallback="cbbCuentaTrans_Callback">
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Fecha Transfe.</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxDateEdit ID="dteDocDateTrans" runat="server"
                                                    ClientInstanceName="dteDocDateTrans" Font-Bold="true">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Num. Operación: </td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtNumOperacion2" runat="server" ClientInstanceName="txtNumOperacion2" 
                                                    Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Saldo Pendiente:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalTrans1" runat="server" ClientInstanceName="txtSalTrans1" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2" ReadOnly="true">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
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
                                            <td>
                                                Total:</td>
                                            <td style="width:30px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtSalTrans2" runat="server" ClientInstanceName="txtSalTrans2" 
                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="n2">
                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                <ValidationSettings ErrorDisplayMode="None">
                                                    <ErrorFrameStyle>
                                                        <Paddings Padding="0px" />
                                                        <Border BorderWidth="0px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:180px">
                                &nbsp;
                            </td>
                            <td style="width:70px">
                                <dx:ASPxButton ID="btnPago" runat="server" AutoPostBack="False" 
                                    ClientInstanceName="btnPago" Text="Pagar" Width="70px">
                                    <ClientSideEvents Click="Set_Pago" />
                                </dx:ASPxButton>
                            </td>
                            <td style="width:70px">
                                <dx:ASPxButton ID="btnCancelPago" runat="server" AutoPostBack="False" 
                                    ClientInstanceName="btnCancelPago" Text="Cancelar" Width="70px">
                                    <ClientSideEvents Click="CancelPago" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ppcAnticipos" runat="server" 
        ClientInstanceName="ppcAnticipos" FooterText=" " HeaderText="Seleccionar Anticipos" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="220px" Modal="true" Height="200px"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td id="Td11" style="width:105px">
                                        </td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="100%" 
                                            ClientInstanceName="txtParClient" Visible="false">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <%--<dx:ASPxButton ID="ASPxButton1" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Client"/>
                                        </dx:ASPxButton>--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvAnticipos" runat="server" Width="100%" 
                                    AutoGenerateColumns="False" ClientInstanceName="gdvAnticipos" 
                                    KeyFieldName="DocEntry" OnCustomCallback="gdvAnticipos_CustomCallback" 
                                    KeyboardSupport="True" OnDataBinding="gdvAnticipos_DataBinding" 
                                    OnCellEditorInitialize="gdvAnticipos_CellEditorInitialize" 
                                    OnCommandButtonInitialize="gdvAnticipos_CommandButtonInitialize"
                                    OnRowUpdating="gdvAnticipos_RowUpdating">
                                    <Columns>
                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                            VisibleIndex="0" Width="60px">
                                            <EditButton Visible="True">
                                            </EditButton>
                                            <CellStyle Font-Size="8pt">
                                            </CellStyle>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="Nro. Interno" FieldName="DocEntry" 
                                            ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                            VisibleIndex="0" Width="60px">
                                            <Settings AllowSort="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nro. Documento" FieldName="DocNum" 
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="20px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fecha de Doc." FieldName="DocDate" 
                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="30px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Monto a Arrastrar" FieldName="Monto" 
                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="40px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn VisibleIndex="4" UnboundType="String" Caption="Activo" FieldName="Active">
                                            <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String">
                                            </PropertiesCheckEdit>
                                        </dx:GridViewDataCheckColumn>
                                    </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" 
                                        AllowSelectSingleRowOnly="True" />
                                    <ClientSideEvents />
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
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OK_Anticipos" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelAnticipos" />
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
        <dx:ASPxPopupControl ID="ppcPayment" runat="server" 
                ClientInstanceName="ppcPayment" FooterText=" " HeaderText="Medios de Pago" 
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
                RenderMode="Lightweight" ShowFooter="True" Width="320px" Modal="true"
                AllowDragging="True" PopupAnimationType="Fade">
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="pccPayment" runat="server" SupportsDisabledAttribute="True">
                    <table style="width:300px" class="tablespace">
                        <tr>
                            <td colspan="3" style="width:280px">
                                <dx:ASPxPageControl ID="pgcPayment" runat="server" ActiveTabIndex="1" 
                                    RenderMode="Classic" Width="300px" ClientInstanceName="pgcPayment">
                                    <TabPages>
                                        <dx:TabPage Name="tbEfe" Text="Efectivo">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                    <table style="width:100%;" class="tablespace">
                                                        <tr>
                                                            <td style="width:130px">
                                                                Saldo Pendiente:</td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtSalEfe" runat="server" ClientInstanceName="txtSalEfe" 
                                                                    Width="100%" HorizontalAlign="Right" DisplayFormatString="c2">
                                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                    <ErrorFrameStyle>
                                                                        <Paddings Padding="0px" />
                                                                        <Border BorderWidth="0px" />
                                                                    </ErrorFrameStyle>
                                                                </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                        <dx:TabPage Name="tbTar" Text="Tarjeta de Crédito">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                    <table style="width:100%;" class="tablespace">
                                                        <tr>
                                                            <td style="width:130px">
                                                                Tipo Tarjeta:</td>
                                                            <td>
                                                                <dx:ASPxComboBox ID="cbbCreditCard" runat="server" EnableSynchronization="False"
                                                                    ClientInstanceName="cbbCreditCard" Width="100%">
                                                                    <ClientSideEvents SelectedIndexChanged="Sel_CreditCard" />
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:130px">
                                                                Ultimos 4 digitos:</td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtCardNum" runat="server" ClientInstanceName="txtCardNum" 
                                                                    Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width:130px">
                                                                Saldo Pendiente:</td>
                                                            <td>
                                                                <dx:ASPxTextBox ID="txtSalTacre" runat="server" HorizontalAlign="Right" DisplayFormatString="c2"
                                                                    ClientInstanceName="txtSalTacre" Width="100%">
                                                                <%--<MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />--%>
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                    <ErrorFrameStyle>
                                                                        <Paddings Padding="0px" />
                                                                        <Border BorderWidth="0px" />
                                                                    </ErrorFrameStyle>
                                                                </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                    </TabPages>
                                </dx:ASPxPageControl>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:180px">
                                &nbsp;
                            </td>
                            <td style="width:70px">
                                <dx:ASPxButton ID="btnPayPayment" runat="server" AutoPostBack="False" 
                                    ClientInstanceName="btnPayPayment" Text="Pagar" Width="70px">
                                    <ClientSideEvents Click="Set_Payment" />
                                </dx:ASPxButton>
                            </td>
                            <td style="width:70px">
                                <dx:ASPxButton ID="btnPayCancel" runat="server" AutoPostBack="False" 
                                    ClientInstanceName="btnPayCancel" Text="Cancelar" Width="70px">
                                    <ClientSideEvents Click="CancelPayment" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        
        <dx:ASPxPopupControl ID="ppcClientCr" runat="server" 
                ClientInstanceName="ppcClientCr" FooterText=" " HeaderText="Crear Cliente" 
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
                RenderMode="Lightweight" ShowFooter="True" Width="750px" Height="500px" Modal="true"
                AllowDragging="True" PopupAnimationType="Fade">
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="pccClientCr" runat="server" SupportsDisabledAttribute="True">
                    <nav>
                        <a href="#tab1" class="amenucrearclie"><i class="fas fa-home"></i> General</a>
                        <a href="#tab2" class="amenucrearclie"><i class="fas fa-user-check"></i> Contactos</a>
                        <a href="#tab3" class="amenucrearclie"><i class="fas fa-list-ul"></i> Direcciones</a>
                    </nav>
                    <table id="tablaprincdecrearclie" style="width:700px; height:350px" class="tablespace">
                        <tr>
                            <td colspan="3" style="width:400px" class="tablespace">
                                <section class="sectablas" id="tab1">
                                    <table id="tab1tabla1">
                                        <tr>
                                            <td style="width:140px">
                                                Código:</td>
                                            <td style="width:240px">
                                                <dx:ASPxTextBox ID="txtCrCardCode" runat="server" 
                                                    ClientInstanceName="txtCrCardCode" Width="100%" ReadOnly="True">
                                                </dx:ASPxTextBox>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="width:140px">
                                                Cliente:</td>
                                            <td style="width:240px">
                                                <dx:ASPxTextBox ID="txtCrCardName" runat="server" Width="100%"
                                                    ClientInstanceName="txtCrCardName">
                                                    <ClientSideEvents KeyUp="Key_CrCardName"></ClientSideEvents>

                                                        <ValidationSettings ValidationGroup="ValCrClient" SetFocusOnError="True" ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                                            <RequiredField IsRequired="true" ErrorText="Nombre de cliente incorrecto." />
<RequiredField IsRequired="True" ErrorText="Nombre de cliente incorrecto."></RequiredField>
                                                        </ValidationSettings>
                                                        <ClientSideEvents KeyUp="Key_CrCardName" />
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:140px">
                                                Tipo Persona:</td>
                                            <td style="width:240px">
                                                <dx:ASPxComboBox ID="cbbCrPersonType" runat="server" Width="100%" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCrPersonType" SelectedIndex="0">
                                                    <ClientSideEvents SelectedIndexChanged="Get_CrDocumentType"></ClientSideEvents>
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="Jurídica" Value="TPJ" />
                                                        <dx:ListEditItem Text="Natural" Value="TPN" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="Get_CrDocumentType" />
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:140px">
                                                Tipo Documento:</td>
                                            <td style="width:240px">
                                                <dx:ASPxComboBox ID="cbbCrDocumentType" runat="server" EnableSynchronization="False"
                                                    ClientInstanceName="cbbCrDocumentType" Width="100%">
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:140px">
                                                Nro. Documento:</td>
                                            <td style="width:240px">
                                                <dx:ASPxTextBox ID="txtCrLicTradNum" runat="server" MaxLength="11"
                                                    ClientInstanceName="txtCrLicTradNum" Width="100%">
                                                    <ClientSideEvents KeyPress="ProcessKeyPress" KeyUp="Key_CrLicTradNum"></ClientSideEvents>

                                                    <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip" 
                                                        SetFocusOnError="True" ValidationGroup="ValCrClient">
                                                        <RequiredField ErrorText="Nro. Documento incorrecto." IsRequired="True" />
                                                        <RegularExpression ValidationExpression="[0-9]+(\.[0-9][0-9]?)?" ErrorText="Nro. Documento incorrecto." /> 
<RegularExpression ErrorText="Nro. Documento incorrecto." ValidationExpression="[0-9]+(\.[0-9][0-9]?)?"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="Nro. Documento incorrecto."></RequiredField>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:140px">
                                                Fecha de Registro:</td>
                                            <td style="width:240px">
                                                <dx:ASPxDateEdit ID="dteCrU_PN_FecNac" runat="server" Width="100%"
                                                    ClientInstanceName="dteCrU_PN_FecNac">
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:140px">
                                                Teléfono Fijo:</td>
                                            <td style="width:240px">
                                                <dx:ASPxTextBox ID="txtCrPhone1" runat="server" Width="100%"
                                                    ClientInstanceName="txtCrPhone1">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:140px">
                                                Teléfono Movil:</td>
                                            <td style="width:240px">
                                                <dx:ASPxTextBox ID="txtCrCellular" runat="server" Width="100%"
                                                    ClientInstanceName="txtCrCellular">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:140px">
                                                Correo Facturacion:</td>
                                            <td style="width:240px">
                                                <dx:ASPxTextBox ID="txtCrE_Mail" runat="server" Width="100%"
                                                    ClientInstanceName="txtCrE_Mail">
                                                        <ValidationSettings ValidationGroup="ValCrClient" SetFocusOnError="True" ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                                        <RegularExpression ErrorText="E-mail invalido." ValidationExpression="\w+([-+.&#39;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></RegularExpression>
                                                        </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <label>Estado:</label>
                                    <dx:ASPxRadioButtonList ID="rbtnestado" runat="server" Height="20px" 
                                                            RepeatDirection="Vertical" Width="128px" SelectedIndex="0" 
                                                            ClientInstanceName="rbtnestado">
                                        <Items>
                                            <dx:ListEditItem Text="Activo" Value="Activo" Selected="True" />
                                            <dx:ListEditItem Text="Inactivo" Value="Inactivo" />
                                        </Items>
                                    </dx:ASPxRadioButtonList>
                                    
                                </section>
                                <section class="sectablas" id="tab2">
                                    <dx:ASPxGridView ID="gvcontacto" runat="server" AutoGenerateColumns="False" Width="700px"
                                                    ClientInstanceName="gvcontacto" KeyFieldName="CntctCode"
                                                    OnCellEditorInitialize="gvcontacto_CellEditorInitialize" 
                                        OnCommandButtonInitialize="gvcontacto_CommandButtonInitialize" 
                                        OnRowInserting="gvcontacto_RowInserting">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <NewButton Visible="True">
                                                            </NewButton>
                                                            <DeleteButton Visible="True">
                                                            </DeleteButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre" ShowInCustomizationForm="True" 
                                                            VisibleIndex="5" Width="100px" FieldName="FirstName" ReadOnly="true">
                                                            <PropertiesTextEdit ClientInstanceName="txtNameContacto" DisplayFormatString="{0:c6}"
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
                                                        <dx:GridViewDataTextColumn Caption="Apellidos" ShowInCustomizationForm="True" 
                                                            VisibleIndex="5" Width="100px" FieldName="LastName" ReadOnly="true">
                                                            <PropertiesTextEdit ClientInstanceName="txtLastNameContacto"
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
                                                        <dx:GridViewDataTextColumn Caption="Telefono Contacto" ShowInCustomizationForm="True" 
                                                            VisibleIndex="5" Width="100px" FieldName="Cellolar" ReadOnly="true">
                                                            <PropertiesTextEdit ClientInstanceName="txtTelefonoContacto"
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
                                                        <dx:GridViewDataTextColumn Caption="Correo Contacto" ShowInCustomizationForm="True" 
                                                            VisibleIndex="5" Width="100px" FieldName="E_MailL" ReadOnly="false">
                                                            <PropertiesTextEdit ClientInstanceName="txtCorreoContacto"
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
                                                    </Columns>
                                                    <SettingsBehavior AllowSort="False" ColumnResizeMode="Disabled"
                                                        ConfirmDelete="True" />
                                                    <SettingsBehavior AllowSort="False" ConfirmDelete="True"></SettingsBehavior>
                                                    <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="CONTACTOS" />
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom"></SettingsEditing>
                                                    <Settings ShowTitlePanel="True" ShowFooter="True"></Settings>
                                                    <SettingsText Title="CONTACTOS"></SettingsText>
                                                    <Styles>
                                                        <Row Font-Size="7pt">
                                                        </Row>
                                                        <Footer Font-Size="1pt">
                                                        </Footer>
                                                        <TitlePanel Font-Bold="True" Font-Size="7pt" HorizontalAlign="Center">
                                                        </TitlePanel>
                                                    </Styles>
                                                </dx:ASPxGridView>
                                </section>
                                <section class="sectablas" id="tab3">
                                    <article id="direccionesdatos">
                                        <TABLE id="datosdirec" >
                                            <tr>
                                                <td style="width:140px">
                                                    ID de Dirección:</td>
                                                <td style="width:240px">
                                                    <dx:ASPxTextBox ID="textAddress" runat="server"
                                                        ClientInstanceName="textAddress" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:140px">
                                                    Calle de Dirección:</td>
                                                <td style="width:240px">
                                                    <dx:ASPxTextBox ID="txtStreet" runat="server" 
                                                        ClientInstanceName="txtStreet" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:140px">
                                                    Pais:</td>
                                                <td style="width:240px">
                                                    <dx:ASPxTextBox ID="Country" runat="server"
                                                        ClientInstanceName="Country" Width="100%" Text="PERU" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:140px">
                                                    Departamento:</td>
                                                <td style="width:240px">
                                                    <dx:ASPxComboBox ID="cbbState" runat="server" Width="100%"
                                                    ClientInstanceName="cbbState" EnableSynchronization="False">
                                                    <ClientSideEvents SelectedIndexChanged="GET_PROVINCIAS_JS" />
                                                    <ClientSideEvents SelectedIndexChanged="GET_PROVINCIAS_JS"></ClientSideEvents>
                                                </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:140px">
                                                    Provincia:</td>
                                                <td style="width:240px">
                                                    <dx:ASPxComboBox ID="cbbU_DXP_BIZ_COPR" runat="server" Width="100%"
                                                    ClientInstanceName="cbbU_DXP_BIZ_COPR" EnableSynchronization="False">
                                                    <ClientSideEvents SelectedIndexChanged="GET_DISTRITOS_JS" />
                                                    <ClientSideEvents SelectedIndexChanged="GET_DISTRITOS_JS"></ClientSideEvents>
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:140px">
                                                    Distrito:</td>
                                                <td style="width:240px">
                                                    <dx:ASPxComboBox ID="cbbU_DXP_BIZ_CODI" runat="server" Width="100%"
                                                    ClientInstanceName="cbbU_DXP_BIZ_CODI" EnableSynchronization="False">
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:140px">
                                                    Tipo de Direccion
                                                </td>
                                                <td style="width:240px; text-align= center;">
                                                    <dx:ASPxRadioButtonList ID="rdbtntipofact" runat="server" Height="20px" 
                                                            RepeatDirection="Vertical" Width="128px" SelectedIndex="0" 
                                                            ClientInstanceName="rdbtntipofact">
                                                        <Items>
                                                            <dx:ListEditItem Text=" Factura" Value="B" Selected="True" />
                                                            <dx:ListEditItem Text=" Destino" Value="S" />
                                                        </Items>
                                                    </dx:ASPxRadioButtonList>

                                                </td>
                                            </tr>

                                            
                                            <tr>
                                                <td style="width:220px; text-align:center;">
                                                    <dx:ASPxButton ID="btnagregardirecc" runat="server" AutoPostBack="False"
                                                        ClientInstanceName="btnagregardirecc" Text="Agregar" Width="70px" HorizontalAlign="Center">
                                                        <ClientSideEvents Click="Agregar_direc"/>
                                                    </dx:ASPxButton></td>
                                                <td style="width:220px; text-align:center;">
                                                    <dx:ASPxButton ID="btnquitardirecc" runat="server" AutoPostBack="False"
                                                        ClientInstanceName="btnquitardirecc" Text="Quitar" Width="70px" HorizontalAlign="Center">
                                                        <ClientSideEvents Click="Quitar_direc" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </TABLE>
                                    </article>
                                    <article id="direccioneslista">
                                        <dx:ASPxListBox ID="listdirecciones" runat="server" KeyFieldName="LineNum"
                                            ValueType="System.String" ClientInstanceName="listdirecciones" OnItemInserting="listdirecciones_ItemInserting">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Id Direccion"/>
                                                <dx:ListBoxColumn Caption="Calle"/>
                                            </Columns>
                                        </dx:ASPxListBox>
                                    </article>
                                </section>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:200px">
                                <dx:ASPxButton ID="btnClientCrSave" runat="server" AutoPostBack="False" 
                                    ClientInstanceName="btnClientCrSave" Text="Crear" Width="70px">
                                    <ClientSideEvents Click="Set_ClientCr" />
                                </dx:ASPxButton>
                            </td>
                            <td style="width:200px">
                                <dx:ASPxButton ID="btnClientCrCancel" runat="server" AutoPostBack="False" 
                                    ClientInstanceName="btnClientCrCancel" Text="Cancelar" Width="70px">
                                    <ClientSideEvents Click="CancelClientCr" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ppcClientAddress" runat="server" 
        ClientInstanceName="ppcClientAddress" FooterText=" " HeaderText="Direcciones del Cliente Seleccionado" 
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
        <dx:ASPxPopupControl ID="ppcOrdrSearch" runat="server" 
            ClientInstanceName="ppcOrdrSearch" FooterText=" " HeaderText="Buscar Orden de Venta" 
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
                                            Rango Fechas:</td>
                                        <td style="width:130px">
                                            <dx:ASPxDateEdit ID="dteorDateIn" runat="server" Width="130px" 
                                                ClientInstanceName="dteorDateIn">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:130px">
                                            <dx:ASPxDateEdit ID="dteorDateFi" runat="server" Width="130px" 
                                                ClientInstanceName="dteorDateFi">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:130px">
                                            Nro. Orden:</td>
                                        <td style="width:170px">
                                            <dx:ASPxTextBox ID="txtorDocNum" runat="server" 
                                                ClientInstanceName="txtorDocNum" Width="170px">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:50px">
                                            <dx:ASPxButton ID="btnOrdrSearch" runat="server" AutoPostBack="False" 
                                                ClientInstanceName="btnOrdrSearch" Text="Buscar" Width="100%">
                                                <ClientSideEvents Click="Get_Ordr" />
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
                                        <dx:GridViewDataTextColumn Caption="Nro. Orden" FieldName="DocNum" 
                                            ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DocDate"
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="d">
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cód. Cliente" FieldName="CardCode" 
                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Razón Social" FieldName="CardName" 
                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="200px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="DocTotalSrch" 
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                <Style HorizontalAlign="Right"></Style>
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="DocEntry" FieldName="DocEntry" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="5" Width="0px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="GroupNum" FieldName="GroupNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SlpCode" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Comments" FieldName="Comments" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="DocCur" FieldName="DocCur" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="OwnerCode" FieldName="OwnerCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="10" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DiscPrcntTotal" FieldName="DiscPrcntTotal" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DiscSum" FieldName="DiscSum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="ShipToCode" FieldName="ShipToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PayToCode" FieldName="PayToCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="14" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BillStreet" FieldName="BillStreet" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="15" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dirección" FieldName="ShipStreet" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="16" Width="0px">
                                    </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" 
                                        AllowSelectSingleRowOnly="True" />
                                    <ClientSideEvents RowDblClick="OkOrdr" EndCallback="EndOrdrSearch"/>
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
                                            <dx:ASPxButton ID="btnOrdrOk" runat="server" Text="Ok" Width="100%" 
                                                ClientInstanceName="btnOrdrOk" AutoPostBack="False">
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
    <dx:ASPxPopupControl ID="ppckitnaiah" runat="server" RenderMode="Lightweight" 
        AllowDragging="True" ClientInstanceName="ppckitnaiah" HeaderText="KIT NAIAH" 
        Modal="True" PopupAnimationType="Fade" PopupHorizontalAlign="WindowCenter" 
        PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="800px">
        <ContentCollection>
    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxGridView ID="dgkitnaih" runat="server" AutoGenerateColumns="False" 
        ClientInstanceName="dgkitnaih" KeyboardSupport="True" KeyFieldName="ItemCode" 
        OnCustomCallback="dgkitnaih_CustomCallback" 
        OnDataBinding="dgkitnaih_DataBinding">
        <ClientSideEvents EndCallback="EndNaiahSearch" RowDblClick="Okkitnaiah" />
        <Columns>
            <dx:GridViewDataTextColumn Caption="Línea" FieldName="LineNum" 
                ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Código" FieldName="ItemCode" 
                ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                ShowInCustomizationForm="True" VisibleIndex="2" Width="300px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Precio Unit." FieldName="PriceBefDi" 
                ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="%Desc." FieldName="DiscPrcnt" 
                ShowInCustomizationForm="True" VisibleIndex="5" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Precio C/Desc." FieldName="Price" 
                ShowInCustomizationForm="True" VisibleIndex="6" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Total S/IGV" FieldName="LineTotal" 
                ShowInCustomizationForm="True" VisibleIndex="7" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Total C/IGV" FieldName="GTotal" 
                ShowInCustomizationForm="True" VisibleIndex="9" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Batch Num" FieldName="BatchNum" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="10" 
                Width="0px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="U_BF_Cod kit" FieldName="U_BF_CodKit" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="11" 
                Width="0px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Num In Sale" FieldName="NumInSale" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="12" 
                Width="0px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="OItem Code" FieldName="OItemCode" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="8" 
                Width="0px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Quantity" 
                ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" 
            EnableRowHotTrack="True" />
    </dx:ASPxGridView>
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
        <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
        </dx:ASPxHiddenField>
        <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
        </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

