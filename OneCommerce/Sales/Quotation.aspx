<%@ Page Title="Cotización de RP'S" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Quotation.aspx.cs" Inherits="OneCommerce.Sales.Quotation" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Sales/Quotation.js"></script>
    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False">
        <Items>
            <dx:LayoutGroup Caption="Cotización de RP'S" 
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" 
                                SupportsDisabledAttribute="True">
                                    <table class="tablespace">
                                        <tr>
                                            <td style="width:160px">
                                                Artículo:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtU_BIZ_CODR" runat="server" Width="100%" 
                                                    ClientInstanceName="txtU_BIZ_CODR" Text="60100000" ReadOnly="true">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:350px">
                                                <dx:ASPxTextBox ID="txtU_BIZ_NOMR" runat="server" Width="100%" 
                                                    ClientInstanceName="txtU_BIZ_NOMR" Text="RP - PERSONALIZADO COTIZACIÓN" ReadOnly="true">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:22px">
                                            </td>
                                            <td style="width:150px" class="FormatLabel">
                                                Nro. Interno:
                                            </td>
                                            <td style="width:217px">
                                                <dx:ASPxTextBox ID="txtDocEntry" runat="server" 
                                                    ClientInstanceName="txtDocEntry" ReadOnly="True" Width="100%">
                                                    <ReadOnlyStyle Font-Bold="True">
                                                    </ReadOnlyStyle>
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:160px">
                                                Cliente:</td>
                                            <td style="width:150px">
                                                <dx:ASPxTextBox ID="txtU_BIZ_COSN" runat="server" Width="100%" 
                                                    ClientInstanceName="txtU_BIZ_COSN" ReadOnly="True">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:350px">
                                                <dx:ASPxButtonEdit ID="bteCardName" runat="server" Width="100%"
                                                    ClientInstanceName="bteCardName">
                                                    <Buttons>
                                                        <dx:EditButton ToolTip="Buscar Cliente">
                                                        </dx:EditButton>
                                                    </Buttons>
                                                    <ClientSideEvents ButtonClick="ShowClientSearch" />
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <RequiredField ErrorText="Cliente incorrecto." IsRequired="True" />
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxButtonEdit>
                                            </td>
                                            <td style="width:22px">
                                                &nbsp;</td>
                                            <td style="width:150px">
                                                Presentación:</td>
                                            <td style="width:217px">
                                                <dx:ASPxButtonEdit ID="bteU_BIZ_CNTP" runat="server" Width="100%" HorizontalAlign="Right" VerticalAlign="Middle" 
                                                    ClientInstanceName="bteU_BIZ_CNTP" DisplayFormatString="0.00####">
                                                    <MaskSettings Mask="&lt;0..9999999999&gt;.&lt;00..999999&gt;" />
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                        <RegularExpression ErrorText="Cantidad incorrecta." 
                                                            ValidationExpression="^([0-9]*[1-9][0-9]*\.[0-9]*|[0]*\.[0-9]*[1-9][0-9]*)$" />
                                                    </ValidationSettings>
                                                    <Buttons>
                                                        <dx:EditButton Text="Calcular" ToolTip="Calcular Precios">
                                                        </dx:EditButton>
                                                    </Buttons>
                                                    <ButtonStyle Font-Bold="True">
                                                    </ButtonStyle>
                                                    <ClientSideEvents GotFocus="function(s, e) {  s.SelectAll(); }" ButtonClick="Set_ReCalc" />
                                                </dx:ASPxButtonEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:160px">
                                                Forma Farmacéutica:</td>
                                            <td style="width:150px">
                                                <dx:ASPxComboBox ID="cbbU_BF_FOFA" runat="server" Width="100%" 
                                                    ClientInstanceName="cbbU_BF_FOFA" EnableSynchronization="False">
                                                    <ClientSideEvents SelectedIndexChanged="jose" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td style="width:350px">
                                                <dx:ASPxTextBox ID="txtU_BF_DEET" runat="server" Width="100%" 
                                                    ClientInstanceName="txtU_BF_DEET" NullText="Descripción de Etiqueta">
                                                    <ValidationSettings ErrorDisplayMode="ImageWithTooltip" SetFocusOnError="True" Display="Dynamic"
                                                        ValidationGroup="ValEditors">
                                                        <RequiredField ErrorText="Descripción de etiqueta incorrecta." IsRequired="True" />
                                                        <ErrorFrameStyle>
                                                            <Paddings Padding="0px" />
                                                            <Border BorderWidth="0px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:22px">
                                                &nbsp;</td>
                                            <td style="width:150px">
                                                Unidad Medida:</td>
                                            <td style="width:217px">
                                                <table style="width:217px" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width:100px">
                                                            <dx:ASPxTextBox ID="cbbU_BIZ_UNPR" runat="server" Width="100%" 
                                                                ClientInstanceName="cbbU_BIZ_UNPR" ReadOnly="True">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:117px">
                                                            <dx:ASPxCheckBox ID="chkConvert" runat="server" CheckState="Unchecked" 
                                                                Text="Conversión" ClientInstanceName="chkConvert">
                                                            </dx:ASPxCheckBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <dx:ASPxGridView ID="gdvQUT17" runat="server" AutoGenerateColumns="False" 
                                                    Width="100%" ClientInstanceName="gdvQUT17" KeyFieldName="U_BIZ_CCOM"
                                                    OnCellEditorInitialize="gdvQUT17_CellEditorInitialize" 
                                                    OnRowInserting="gdvQUT17_RowInserting" 
                                                    OnRowUpdating="gdvQUT17_RowUpdating" 
                                                    OnRowValidating="gdvQUT17_RowValidating" 
                                                    OnRowDeleting="gdvQUT17_RowDeleting" 
                                                    OnCustomCallback="gdvQUT17_CustomCallback"
                                                    OnCommandButtonInitialize="gdvQUT17_CommandButtonInitialize" 
                                                    OnInitNewRow="gdvQUT17_InitNewRow">
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:f6}%" FieldName="U_BIZ_PCTO" 
                                                            ShowInColumn="Porcentaje" SummaryType="Sum" 
                                                            ShowInGroupFooterColumn="Porcentaje" ValueDisplayFormat="{0:f6}" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:c6}" FieldName="U_BIZ_RESU" 
                                                            ShowInColumn="Costo Total" SummaryType="Sum" 
                                                            ShowInGroupFooterColumn="Costo Total" ValueDisplayFormat="{0:f6}" />
                                                    </TotalSummary>
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Materia Prima" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <EditButton Visible="True">
                                                            </EditButton>
                                                            <NewButton Visible="True">
                                                            </NewButton>
                                                            <DeleteButton Visible="True">
                                                            </DeleteButton>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Código" 
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="100px" FieldName="U_BIZ_CCOM">
                                                            <PropertiesButtonEdit ClientInstanceName="txtU_BIZ_CCOM">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Materia Prima">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_Material" />
                                                            </PropertiesButtonEdit>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descripción" ShowInCustomizationForm="True" 
                                                            VisibleIndex="2" Width="250px" FieldName="U_BIZ_NCOM">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BIZ_NCOM">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Porcentaje" ShowInCustomizationForm="True" 
                                                            VisibleIndex="3" Width="100px" FieldName="U_BIZ_PCTO">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BIZ_PCTO" DisplayFormatString="0.00####">
                                                                <MaskSettings Mask="&lt;0..999&gt;.&lt;00..999999&gt;" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                    <ErrorFrameStyle>
                                                                        <Paddings Padding="0px" />
                                                                        <Border BorderWidth="0px" />
                                                                    </ErrorFrameStyle>
                                                                </ValidationSettings>
                                                                <Style HorizontalAlign="Right" VerticalAlign="Middle">
                                                                </Style>    
                                                                <ClientSideEvents GotFocus="function(s, e) {  s.SelectAll(); }" KeyUp="Set_Percent" />                                                            
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Costo Unitario" FieldName="U_BIZ_COST"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BIZ_COST" DisplayFormatString="c6">
                                                                <Style HorizontalAlign="Right" VerticalAlign="Middle">
                                                                </Style>     
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Costo Total" ShowInCustomizationForm="True" 
                                                            VisibleIndex="5" Width="100px" FieldName="U_BIZ_RESU">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BIZ_RESU" DisplayFormatString="c6">
                                                                <Style HorizontalAlign="Right" VerticalAlign="Middle">
                                                                </Style>     
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior ConfirmDelete="True" AllowSort="False" />
                                                    <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsLoadingPanel Mode="Disabled" />
                                                    <Styles>
                                                        <Row Font-Size="8pt">
                                                        </Row>
                                                    </Styles>
                                                    <ClientSideEvents EndCallback="Mat_EndCallback" />
                                                </dx:ASPxGridView>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <dx:ASPxGridView ID="gdvQUT18" runat="server" AutoGenerateColumns="False" 
                                                    KeyFieldName="U_BIZ_CENV" Width="100%" ClientInstanceName="gdvQUT18"
                                                    OnCellEditorInitialize="gdvQUT18_CellEditorInitialize"
                                                    OnRowDeleting="gdvQUT18_RowDeleting" 
                                                    OnCustomCallback="gdvQUT18_CustomCallback"
                                                    OnCommandButtonInitialize="gdvQUT18_CommandButtonInitialize" 
                                                    OnInitNewRow="gdvQUT18_InitNewRow">
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:f0}" FieldName="U_BIZ_CANT" 
                                                            ShowInColumn="Cantidad" SummaryType="Sum" 
                                                            ShowInGroupFooterColumn="Cantidad" ValueDisplayFormat="{0:f0}" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:c6}" FieldName="U_BIZ_RESU" 
                                                            ShowInColumn="Costo Total" SummaryType="Sum" 
                                                            ShowInGroupFooterColumn="Costo Total" ValueDisplayFormat="{0:f6}" />
                                                    </TotalSummary>
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Envases" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <NewButton Visible="True">
                                                            </NewButton>
                                                            <DeleteButton Visible="True">
                                                            </DeleteButton>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Código"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="100px" FieldName="U_BIZ_CENV">
                                                            <PropertiesButtonEdit ClientInstanceName="txtU_BIZ_CENV">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Envase">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_Package" />
                                                            </PropertiesButtonEdit>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descripción" ShowInCustomizationForm="True" 
                                                            VisibleIndex="2" Width="250px" FieldName="U_BIZ_NENV">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BIZ_NENV">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" 
                                                            VisibleIndex="3" Width="100px" FieldName="U_BIZ_CANT">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BIZ_CANT">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Costo Unitario" FieldName="U_BIZ_COST"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BIZ_COST">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Costo Total" ShowInCustomizationForm="True" FieldName="U_BIZ_RESU"
                                                            VisibleIndex="5" Width="100px">
                                                            <PropertiesTextEdit ClientInstanceName="txtU_BIZ_RESU">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior ConfirmDelete="True" AllowSort="False" />
                                                    <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsLoadingPanel Mode="Disabled" />
                                                    <Styles>
                                                        <Row Font-Size="8pt">
                                                        </Row>
                                                    </Styles>
                                                    <ClientSideEvents EndCallback="Pac_EndCallback" />
                                                </dx:ASPxGridView>
                                            </td>
                                        </tr>
                                            <tr>
                                                <td style="width:160px">
                                                    Maquila:</td>
                                                <td style="width:150px">
                                                    <dx:ASPxTextBox ID="txtU_BIZ_CODM" runat="server" Width="100%" 
                                                        ClientInstanceName="txtU_BIZ_CODM" Text="85300002" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width:350px">
                                                    <dx:ASPxTextBox ID="txtU_BIZ_NOMM" runat="server" Width="100%"
                                                        ClientInstanceName="txtU_BIZ_NOMM" Text="MAQUILA DE COTIZACIÓN" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width:22px">
                                                </td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Costo Maquila:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="txtU_BIZ_COSM" runat="server" Width="100%" HorizontalAlign="Right" DisplayFormatString="c2" 
                                                        ClientInstanceName="txtU_BIZ_COSM" ReadOnly="True">
                                                        <ReadOnlyStyle Font-Bold="True">
                                                        </ReadOnlyStyle>
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
                                                <td style="width:22px">
                                                    &nbsp;</td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Costo Total:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="txtU_BIZ_TOTC" runat="server" Width="100%" HorizontalAlign="Right" DisplayFormatString="c2" 
                                                        ClientInstanceName="txtU_BIZ_TOTC" ReadOnly="True">
                                                        <ReadOnlyStyle Font-Bold="True">
                                                        </ReadOnlyStyle>
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
                                                <td style="width:22px">
                                                    &nbsp;</td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Ganancia(%):</td>
                                                <td style="width:217px">
                                                    <dx:ASPxButtonEdit ID="bteU_BIZ_PMAR" runat="server" Width="100%" 
                                                        HorizontalAlign="Right" DisplayFormatString="0.00" 
                                                        ClientInstanceName="bteU_BIZ_PMAR" Font-Bold="True">
                                                        <ButtonStyle Font-Bold="True">
                                                        </ButtonStyle>
                                                        <MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />
                                                        <ValidationSettings ErrorDisplayMode="None">
                                                            <ErrorFrameStyle>
                                                                <Paddings Padding="0px" />
                                                                <Border BorderWidth="0px" />
                                                            </ErrorFrameStyle>
                                                        </ValidationSettings>
                                                        <ClientSideEvents GotFocus="function(s, e) {  s.SelectAll(); }" KeyUp="Key_ProfitMargin" />
                                                    </dx:ASPxButtonEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width:160px">
                                                    &nbsp;</td>
                                                <td style="width:150px">
                                                    &nbsp;</td>
                                                <td style="width:350px">
                                                    &nbsp;</td>
                                                <td style="width:22px">
                                                    &nbsp;</td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Precio Venta:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="txtU_BIZ_PREV" runat="server" Width="100%" HorizontalAlign="Right" DisplayFormatString="c2"
                                                        ClientInstanceName="txtU_BIZ_PREV" ReadOnly="True">
                                                        <ReadOnlyStyle Font-Bold="True">
                                                        </ReadOnlyStyle>
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
                                                <td style="width:22px">
                                                    &nbsp;</td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Valor IGV:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="txtU_BIZ_MIGV" runat="server" Width="100%" HorizontalAlign="Right" DisplayFormatString="c2" 
                                                        ClientInstanceName="txtU_BIZ_MIGV" ReadOnly="True">
                                                        <ReadOnlyStyle Font-Bold="True">
                                                        </ReadOnlyStyle>
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
                                                <td style="width:22px">
                                                    &nbsp;</td>
                                                <td style="width:150px" class="FormatLabel">
                                                    Precio Final:</td>
                                                <td style="width:217px">
                                                    <dx:ASPxTextBox ID="txtU_BIZ_PVMI" runat="server" Width="100%" HorizontalAlign="Right" DisplayFormatString="c2" 
                                                        ClientInstanceName="txtU_BIZ_PVMI" ReadOnly="True">
                                                        <ReadOnlyStyle Font-Bold="True">
                                                        </ReadOnlyStyle>
                                                    </dx:ASPxTextBox>
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
                    <dx:LayoutItemNestedControlContainer runat="server" 
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
    <dx:ASPxPopupControl ID="ppcClientSearch" runat="server" 
        ClientInstanceName="ppcClientSearch" FooterText=" " HeaderText="Buscar Cliente" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="500px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccClientSearch" runat="server" SupportsDisabledAttribute="True">
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
                                            <ClientSideEvents KeyDown="OnEnterClientSearch" />
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
                                <SettingsBehavior AllowSelectByRowClick="True" AllowFocusedRow="true"
                                    AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
                                <ClientSideEvents ColumnSorting="Set_ParName" RowDblClick="OkClient" EndCallback="EndClientSearch"/>
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
    <dx:ASPxPopupControl ID="ppcMaterialSearch" runat="server" 
        ClientInstanceName="ppcMaterialSearch" FooterText=" " HeaderText="Buscar Material" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="600px" Modal="True"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccMaterialSearch" runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <table class="tablespace" style="width:100%">
                                <tr>
                                    <td id="MaterialParCaption" style="width:105px">
                                        Código:</td>
                                    <td style="width:250px">
                                        <dx:ASPxTextBox ID="txtParMaterial" runat="server" Width="100%" 
                                            ClientInstanceName="txtParMaterial">
                                            <ClientSideEvents KeyDown="OnEnterMaterialSearch" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width:70px">
                                        <dx:ASPxButton ID="btnMaterialSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnMaterialSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Material" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:120px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvMaterialSearch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvMaterialSearch" 
                                KeyFieldName="ItemCode" OnCustomCallback="gdvMaterialSearch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvMaterialSearch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="ItemCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="60px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="290px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Costo" FieldName="Cost" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="c6">
                                        </PropertiesTextEdit>
                                        <Settings AllowSort="false" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Stock" FieldName="stock" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                        <Settings AllowSort="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" EnableRowHotTrack="True" />
                                <ClientSideEvents ColumnSorting="Set_ParName" RowDblClick="OkMaterial" EndCallback="EndMaterialSearch"/>
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
                                    <td style="width:430px">
                                        &nbsp;</td>
                                    <td>
                                        <dx:ASPxButton ID="btnMaterialOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnMaterialOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkMaterial" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnMaterialCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnMaterialCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelMaterial" />
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
    <dx:ASPxPopupControl ID="ppcQutSearch" runat="server" 
        ClientInstanceName="ppcQutSearch" FooterText=" " HeaderText="Buscar Cotización" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="830px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccQutSearch" runat="server" SupportsDisabledAttribute="True">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <table border="0" class="tablespace">
                                <tr>
                                    <td>
                                        <dx:ASPxCheckBox ID="chkqDocEntry" runat="server" CheckState="Unchecked" 
                                            ClientInstanceName="chkqDocEntry" Text="Nro. Interno:">
                                            <ClientSideEvents CheckedChanged="OnCheckChange" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtqDocEntry" runat="server" Width="150px"
                                            ClientInstanceName="txtqDocEntry">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxCheckBox ID="chkqCreateDate" runat="server" CheckState="Checked"
                                            ClientInstanceName="chkqCreateDate" Text="Fecha:">
                                            <ClientSideEvents CheckedChanged="OnCheckChange" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="dteqCreateDate" runat="server" Width="150px"
                                            ClientInstanceName="dteqCreateDate">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="sbtqSearch" runat="server" Height="19px" Text="Buscar" 
                                            Width="40px" AutoPostBack="False" 
                                            EnableClientSideAPI="True" ClientInstanceName="sbtqSearch">
                                            <ClientSideEvents Click="Get_Qut" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxCheckBox ID="chkqCardCode" runat="server" CheckState="Unchecked" 
                                            ClientInstanceName="chkqCardCode" Text="Código Cliente:">
                                            <ClientSideEvents CheckedChanged="OnCheckChange" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtqCardCode" runat="server" Width="150px"
                                            ClientInstanceName="txtqCardCode">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxCheckBox ID="chkqCardName" runat="server" CheckState="Unchecked"
                                            ClientInstanceName="chkqCardName" Text="Cliente:">
                                            <ClientSideEvents CheckedChanged="OnCheckChange" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txtqCardName" runat="server" Width="150px"
                                            ClientInstanceName="txtqCardName">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxCheckBox ID="chkqActives" runat="server" CheckState="Unchecked" 
                                            ClientInstanceName="chkqActives" Text="Activos:">
                                            <ClientSideEvents CheckedChanged="OnCheckChange" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td colspan="3">
                                        <dx:ASPxTextBox ID="txtqActives" runat="server" Width="368px"
                                            ClientInstanceName="txtqActives">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvQutSearch" runat="server" Width="800px" 
                                AutoGenerateColumns="False" KeyFieldName="DocEntry" 
                                ClientInstanceName="gdvQutSearch" KeyboardSupport="True" 
                                OnCustomCallback="gdvQutSearch_CustomCallback" 
                                OnDataBinding="gdvQutSearch_DataBinding" Font-Size="7.5pt" 
                                OnHtmlDataCellPrepared="gdvQutSearch_HtmlDataCellPrepared" >
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Nro. Interno" FieldName="DocEntry" 
                                        ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha" FieldName="CreateDate" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="75px">
                                        <PropertiesTextEdit DisplayFormatString="d">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cód. Cliente" FieldName="U_BIZ_COSN" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cliente" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="220px" 
                                        SortIndex="0" SortOrder="Ascending">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Activos" FieldName="Actives" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Precio Final" FieldName="U_BIZ_PVMI" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                        <PropertiesTextEdit DisplayFormatString="c">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_CNTP" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_COSM" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_TOTC" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_PMAR" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_PREV" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_DOCE" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_TOTM" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_UNPR" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BIZ_MIGV" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BF_DEET" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="" FieldName="U_BF_FOFA" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="6" Width="279px">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="false" EnableRowHotTrack="True"  AllowFocusedRow="true" />
                                <SettingsPager Mode="ShowAllRecords" Visible="False">
                                </SettingsPager>
                                <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="250" 
                                    VerticalScrollBarStyle="Virtual" />
                                <Styles>
                                    <Cell HorizontalAlign="Left">
                                    </Cell>
                                </Styles>
                                <ClientSideEvents EndCallback="EndQutSearch" RowDblClick="OkQut" />
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width: 660px;">&nbsp;</td>
                                    <td style="width: 50px;">
                                        <dx:ASPxButton ID="sboQutOk" runat="server" Height="16px" Text="OK" Width="50px" 
                                            AutoPostBack="False" ClientInstanceName="sboQutOk">
                                            <ClientSideEvents Click="OkQut" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width: 90px;">
                                        <dx:ASPxButton ID="sbtQutCancel" runat="server" AutoPostBack="False" Width="90px" 
                                            ClientInstanceName="sbtQutCancel" Text="Cancelar">
                                            <ClientSideEvents Click="CancelQut" />
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
    <dx:ASPxPopupControl ID="ppcGrupoEnv" runat="server" Height="221px" 
        RenderMode="Lightweight" Width="744px" AllowDragging="True" 
        ClientInstanceName="ppcGrupoEnv" Modal="True" PopupAnimationType="Fade" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        ShowFooter="True" FooterText="" HeaderText="Grupo">
        <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <dx:ASPxGridView ID="gvgroup" runat="server" AutoGenerateColumns="False" 
        Width="664px" ClientInstanceName="gvgroup" KeyboardSupport="True" 
        KeyFieldName="COD_PHANTOM" OnCustomCallback="gvgroup_CustomCallback" 
        OnDataBinding="gvgroup_DataBinding">
       
        <Columns>
            <dx:GridViewDataTextColumn Caption="Código" ShowInCustomizationForm="True" 
                VisibleIndex="0" FieldName="U_BIZ_CENV" Width="60px" SortIndex="0" 
                SortOrder="Ascending">
                <Settings AllowSort="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" 
                Caption="Descripción" FieldName="U_BIZ_NENV">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="3" 
                Caption="Costo Unitario" FieldName="U_BIZ_COST">
                <Settings AllowSort="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="U_BIZ_CANT" 
                ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Costo Total" FieldName="U_BIZ_RESU" 
                ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Phantom" FieldName="COD_PHANTOM" 
                ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="U_BF_GRUPO" 
                ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" 
            EnableRowHotTrack="True" />
        <ClientSideEvents EndCallback="EndGrupoSearch" RowDblClick="OkGrupo" />
    </dx:ASPxGridView>
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="ppcQuoteList" runat="server" 
        ClientInstanceName="ppcQuoteList" FooterText=" " HeaderText="Crear la Oferta de Venta" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="830px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccQuoteList" runat="server" SupportsDisabledAttribute="True">
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <table border="0" class="tablespace">
                                <tr>
                                    <td>
                                        Rando Fechas:</td>
                                    <td>
                                        <dx:ASPxDateEdit ID="dteDateIn" runat="server" ClientInstanceName="dteDateIn" 
                                            Width="150px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="dteDateFi" runat="server" ClientInstanceName="dteDateFi" 
                                            Width="150px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="sbtQuoteList" runat="server" Height="19px" Text="Buscar" 
                                            Width="40px" AutoPostBack="False" 
                                            EnableClientSideAPI="True" ClientInstanceName="sbtQuoteList">
                                            <ClientSideEvents Click="Get_QuoteList" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvQuoteList" runat="server" Width="800px" 
                                AutoGenerateColumns="False" KeyFieldName="DocEntry" 
                                ClientInstanceName="gdvQuoteList" KeyboardSupport="True" 
                                OnCustomCallback="gdvQuoteList_CustomCallback" 
                                OnDataBinding="gdvQuoteList_DataBinding" Font-Size="8pt">
                                <Columns>
                                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" 
                                        ShowSelectCheckbox="True" VisibleIndex="0" Width="39px">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="Nro. Cotización" FieldName="DocEntry" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fecha" FieldName="CreateDate" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                        <PropertiesTextEdit DisplayFormatString="d">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cód. Cliente" FieldName="U_BIZ_COSN" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cliente" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="210px" 
                                        SortIndex="0" SortOrder="Ascending">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Etiqueta" FieldName="U_BF_DEET" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="240px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Precio Final" FieldName="U_BIZ_PVMI" 
                                        ShowInCustomizationForm="True" VisibleIndex="6" Width="75px">
                                        <PropertiesTextEdit DisplayFormatString="c">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="false" EnableRowHotTrack="True"  AllowFocusedRow="true" />
                                <SettingsPager Mode="ShowAllRecords" Visible="False">
                                </SettingsPager>
                                <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="250" 
                                    VerticalScrollBarStyle="Virtual" />
                                <Styles>
                                    <Cell HorizontalAlign="Left">
                                    </Cell>
                                </Styles>
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width: 630px;">&nbsp;</td>
                                    <td style="width: 80px;">
                                        <dx:ASPxButton ID="sbtQuoteCreate" runat="server" Height="16px" Text="Crear" Width="80px" 
                                            AutoPostBack="False" ClientInstanceName="sbtQuoteCreate" 
                                            UseSubmitBehavior="False">
                                            <ClientSideEvents Click="QuoteCreate" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width: 90px;">
                                        <dx:ASPxButton ID="sbtQuoteCancel" runat="server" AutoPostBack="False" Width="90px" 
                                            ClientInstanceName="sbtQuoteCancel" Text="Cancelar" 
                                            UseSubmitBehavior="False">
                                            <ClientSideEvents Click="QuoteCancel" />
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

    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
    </dx:ASPxHiddenField>
    <dx:ASPxLoadingPanel ID="ldpProcess" runat="server" ClientInstanceName="ldpProcess" Modal="true" >
    </dx:ASPxLoadingPanel>
    <dx:ASPxCallback ID="clbOperation" runat="server" 
        ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
    <dx:ASPxCallback ID="clbQutSearch" runat="server" 
        ClientInstanceName="clbQutSearch" oncallback="clbQutSearch_Callback">
        <ClientSideEvents CallbackComplete="Com_QutSearch" />
    </dx:ASPxCallback>
    <asp:XmlDataSource ID="XmlDataSourceFooter" runat="server" DataFile="~/App_Data/BottomOper.xml"
        XPath="/items/*">
    </asp:XmlDataSource>
</asp:Content>
