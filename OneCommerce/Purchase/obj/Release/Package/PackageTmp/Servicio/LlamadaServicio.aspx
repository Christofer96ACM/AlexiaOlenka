<%@ Page Title="Llamada de Servicio" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="LlamadaServicio.aspx.cs" Inherits="OneCommerce.Servicio.LlamadaServicio" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSLlamadaServicio.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity:"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin:"anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Llamada de Servicio"  GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                 <%--<nav style="">
                                    <a href="#tab1" class="amenucrearclie"><i class="fas fa-home"></i> Principal</a>
                                    <a href="#tab2" class="amenucrearclie"><i class="fas fa-user-check"></i>Programación</a>
                                </nav>--%>
                                <%--<table id="tablaprincdecrearclie" style="width:700px; height:350px" class="tablespace">
                                    <tr>
                                        <td colspan="3" style="width:600px" class="tablespace">--%>
                                            <section class="sectablas" id="tab1">
                                                <table id="tab1tabla1">
                                                    <tr>
                                                        <td style="width:140px">
                                                            Código de Cliente:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxButtonEdit ID="bteCustomer" runat="server" 
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
                                                            Nro. Documento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDocNum" runat="server" 
                                                                ClientInstanceName="txtDocNum" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <%--<td style="width:140px">
                                                            Nombre de Cliente:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtCustomerName" runat="server" 
                                                                ClientInstanceName="txtCustomerName" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>--%>
                                                        <%--<td style="width:140px">
                                                            Estado de llamada:
                                                          </td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbStatus" SelectedIndex="0">
                                                        </dx:ASPxComboBox>
                                                        </td>--%>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Nombre de Cliente:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtCustomerName" runat="server" 
                                                                ClientInstanceName="txtCustomerName" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <%--<td style="width:140px">
                                                            Persona de Contacto:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" 
                                                                ClientInstanceName="txtcontctCode" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>--%>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Estado de llamada:
                                                          </td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbStatus" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbStatus" SelectedIndex="0">
                                                        </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Número de Telefono:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txttelf" runat="server" 
                                                                ClientInstanceName="txttelf" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Prioridad:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbPriority" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbPriority" Width="100%" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Bajo" Value="B" />
                                                                    <dx:ListEditItem Text="Medio" Value="M" />
                                                                    <dx:ListEditItem Text="Alto" Value="A" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Persona de Contacto:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtcontctCode" runat="server" 
                                                                ClientInstanceName="txtcontctCode" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Id Llamada: </td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtidllamada" runat="server" 
                                                                ClientInstanceName="txtidllamada" Width="100%" ReadOnly="true">
                                                            </dx:ASPxTextBox>
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
                                                        <td style="width:160px">
                                                            Nro. Serie del Fabri.:</td>
                                                        <td style="width:140px">
                                                           <dx:ASPxTextBox ID="txtmanufSN" runat="server" 
                                                                ClientInstanceName="txtmanufSN" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Creado el:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtcreateDate" runat="server" 
                                                                ClientInstanceName="txtcreateDate" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                           Número de Serie:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtinternalSN" runat="server" Width="100%"
                                                                ClientInstanceName="txtinternalSN" DisplayFormatString="c2" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Cerrado el:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtcloseDate" runat="server" Width="100%"
                                                                ClientInstanceName="txtcloseDate" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                            Articulo:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxTextBox ID="txtitemCode" runat="server" Width="100%"
                                                                ClientInstanceName="txtitemCode" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Nro. de Contrato:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxTextBox ID="txtnumContrato" runat="server" Width="100%"
                                                                ClientInstanceName="txtnumContrato" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                            Descripcion:</td>
                                                        <td style="width:140px; text-align:center">
                                                           <dx:ASPxTextBox ID="txtItemName" runat="server" Width="100%"
                                                                ClientInstanceName="txtItemName" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Fecha Final:</td>
                                                        <td style="width:140px; text-align:center">
                                                           <dx:ASPxTextBox ID="txtcntrctDate" runat="server" Width="100%"
                                                                ClientInstanceName="txtcntrctDate" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                            Grupo de Articulos:</td>
                                                        <td style="width:140px; text-align:center">
                                                             <dx:ASPxTextBox ID="txtItemGroup" runat="server" Width="100%"
                                                                ClientInstanceName="txtItemGroup" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Asunto:</td>
                                                        <td style="width:140px; text-align:center" >
                                                            <dx:ASPxTextBox ID="txtSubject" runat="server" Width="100%"
                                                                ClientInstanceName="txtSubject" Visible="true">
                                                            </dx:ASPxTextBox>
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
                                                        <td style="width:160px">
                                                            Origen:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxComboBox ID="cbbOrigin" runat="server" Width="100%"
                                                                ClientInstanceName="cbbOrigin" Visible="true">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:160px">
                                                            Tipo Problema:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxComboBox ID="cbbProblemTyp" runat="server" Width="100%"
                                                                ClientInstanceName="cbbProblemTyp" Visible="true">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Detalle Servicio:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxComboBox ID="cbbCallType" runat="server" Width="100%"
                                                                ClientInstanceName="cbbCallType" Visible="true">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Técnico Responsable:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxComboBox ID="cbbTecnico" runat="server" Width="100%"
                                                                ClientInstanceName="cbbTecnico" Visible="true">
                                                            </dx:ASPxComboBox>
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
                                                        <td style="vertical-align:text-top;width:140px">
                                                            Resolución: </td>                                           
                                                        <td colspan="4" style="width:460px">
                                                            <dx:ASPxMemo ID="mmoResolution" runat="server" ClientInstanceName="mmoResolution" 
                                                                Height="40px" Width="480px">
                                                            </dx:ASPxMemo>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="vertical-align:text-top;width:140px">
                                                            Comentario: </td>                                           
                                                        <td colspan="4" rowspan="3" style="width:460px">
                                                            <dx:ASPxMemo ID="mmoComments" runat="server" ClientInstanceName="mmoComments" 
                                                                Height="40px" Width="480px">
                                                            </dx:ASPxMemo>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </section>
                                            <section class="sectablas" id="tab2">
                                                <table id="tab2tabla2">
                                                    <tr>
                                                        <td style="width:100px">
                                                            Hora de Inicio: </td>
                                                        <td style="width:180px">
                                                            <dx:ASPxDateEdit ID="dteDocDateInit" runat="server" Width="180px" EditFormat="DateTime"
                                                                ClientInstanceName="dteDocDateInit" Font-Bold="true" TimeSectionProperties-Visible="true">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:100px">
                                                            Duración: </td>
                                                        <td style="width:180px">
                                                            <dx:ASPxTextBox ID="txtDuration" runat="server" Width="180px" EditFormat="DateTime"
                                                                ClientInstanceName="txtDuration" Font-Bold="true" TimeSectionProperties-Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:100px">
                                                            Hora de Fin: </td>
                                                        <td style="width:180px">
                                                            <dx:ASPxDateEdit ID="dteDocDateFin" runat="server" Width="180px" EditFormat="DateTime"
                                                                ClientInstanceName="dteDocDateFin" Font-Bold="true" TimeSectionProperties-Visible="true">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:100px">
                                                            Id Dirección: </td>
                                                        <td style="width:180px">
                                                            <dx:ASPxComboBox ID="cbbAddress" runat="server" Width="180px" EditFormat="DateTime"
                                                                ClientInstanceName="cbbAddress" Font-Bold="true" TimeSectionProperties-Visible="true">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        
                                                    </tr>
                                                    <tr>
                                                        
                                                    </tr>
                                                </table>
                                            </section>
                                        <%--</td>
                                        
                                    </tr>
                                </table>--%>
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
                                    <dx:GridViewDataTextColumn Caption="Lista de Precios" FieldName="ListNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Vendedor Asignado" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="GroupNum" FieldName="GroupNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <%--<dx:GridViewDataTextColumn Caption="CDR Defecto" FieldName="ShipToDef" 
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
                                    </dx:GridViewDataTextColumn>--%>
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

