<%@ Page Language="C#" Title="Documentos por Pagar" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="OneCommerce._Default" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="Scripts/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../Scripts/Reports/Report.js"></script>
    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False">
        <Items>
            <dx:LayoutGroup Caption="Documentos por Pagar" 
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table style="width:100%;">
                                    <tr>
                                        <td>
                                            <dx:ASPxGridView ID="gdvData" runat="server" AutoGenerateColumns="False" 
                                                ClientInstanceName="gdvData" Width="1060px" 
                                                OnCustomCallback="gdvData_CustomCallback" 
                                                OnDataBinding="gdvData_DataBinding" 
                                                OnHtmlRowPrepared="gdvData_HtmlRowPrepared">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Cod. Interno" FieldName="DocEntry" 
                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nro. SAP" FieldName="DocNum" 
                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nro. Documento" FieldName="NumAtCard" 
                                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="100px" 
                                                        SortIndex="0" SortOrder="Descending">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Estado" FieldName="DocStatus" 
                                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn Caption="Fecha" FieldName="DocDate" 
                                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn Caption="Cod. Cliente" FieldName="CardCode" 
                                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Razon Social" FieldName="CardName" 
                                                        ShowInCustomizationForm="True" VisibleIndex="6" Width="280px">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Total" FieldName="DocTotal" 
                                                        ShowInCustomizationForm="True" VisibleIndex="7" Width="95px">
                                                        <PropertiesTextEdit DisplayFormatString="c2">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Pagado" FieldName="PaidToDate" 
                                                        ShowInCustomizationForm="True" VisibleIndex="8" Width="95px">
                                                        <PropertiesTextEdit DisplayFormatString="c2">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Pendiente" FieldName="PendingBal" 
                                                        ShowInCustomizationForm="True" VisibleIndex="9" Width="95px">
                                                        <PropertiesTextEdit DisplayFormatString="c2">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Pagar con" FieldName="DetPayment" ShowInCustomizationForm="True" 
                                                        VisibleIndex="10" Width="135px">
                                                        <DataItemTemplate>
                                                            <a href="javascript:void(0);" onclick="Med_Payment('efc', '<%# Eval("DocEntry") %>', '<%# Eval("PendingBal") %>')">
                                                                Efectivo</a>&nbsp;-&nbsp;
                                                            <a href="javascript:void(0);" onclick="Med_Payment('taj', '<%# Eval("DocEntry") %>', '<%# Eval("PendingBal") %>')">
                                                                Tarjeta</a>
                                                        </DataItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsPager NumericButtonCount="20">
                                                </SettingsPager>
                                               <ClientSideEvents EndCallback="End_Payment" />
                                                <SettingsLoadingPanel Mode="Disabled" />
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
                            <dx:ASPxPageControl ID="pgcPayment" runat="server" ActiveTabIndex="0" 
                                RenderMode="Classic" Width="300px" ClientInstanceName="pgcPayment">
                                <TabPages>
                                    <dx:TabPage Name="tbEfe" Text="Efectivo">
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                                <table style="width:100%;" class="tablespace">
                                                    <tr>
                                                        <td style="width:130px">
                                                            Saldo Pendiente:</td>
                                                        <td>
                                                            <dx:ASPxTextBox ID="txtSalEfe" runat="server" ClientInstanceName="txtSalEfe" 
                                                                Width="100%" HorizontalAlign="Right" DisplayFormatString="c2">
                                                            <MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />
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
                                            <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
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
                                                            <MaskSettings Mask="&lt;0..99999999&gt;.&lt;00..99&gt;" />
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
    <dx:ASPxLoadingPanel ID="ldpProcess" runat="server" ClientInstanceName="ldpProcess" Modal="true" >
    </dx:ASPxLoadingPanel>
</asp:Content>