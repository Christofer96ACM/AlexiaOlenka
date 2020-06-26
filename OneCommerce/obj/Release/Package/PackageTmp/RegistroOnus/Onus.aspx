<%@ Page Title="Onus" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Onus.aspx.cs" Inherits="OneCommerce.RegistroOnus.Onus" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSPOnu.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>

<script type="text/javascript" src="../Grafico/highchart/js/highcharts.js"></script>
<script type="text/javascript" src="../Grafico/highchart/js/themes/grid.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Relación de Onus:" GroupBoxStyle-Caption-Font-Size="X-Large"
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
                                            Cod. Abonado: 
                                        </td>
                                        <td style="width:15px;"></td>
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtCliente" runat="server" Width="100px" 
                                                ClientInstanceName="txtCliente" ClientSideEvents-KeyUp="Get_Plan2"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:20px;"></td>
                                        <td style="font-weight:bold;">
                                            Abonado: 
                                        </td>
                                        <td style="width:15px;"></td>
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtabo" runat="server" Width="200px" 
                                                ClientInstanceName="txtabo" ClientSideEvents-KeyUp="Get_Plan2"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:20px;"></td>
                                        <td style="font-weight:bold;">
                                            Serial: 
                                        </td>
                                        <td style="width:15px;"></td>
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtserial" runat="server" Width="100px" 
                                                ClientInstanceName="txtserial" ClientSideEvents-KeyUp="Get_Plan2"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                      
                                        <%--<td style="width:20px;"></td>
                                        <td style="font-weight:bold;">
                                            Dirección de Abonado: 
                                        </td>
                                        <td style="width:15px;"></td>
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtDireccion" runat="server" Width="100%" 
                                                ClientInstanceName="txtDireccion" ClientSideEvents-KeyUp="Get_Plan_Tecla"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>--%>

                                        <td style="width:20px;"></td>
                                        <td style="font-weight:bold;">
                                                  Sede:</td>
                                         <td style="width:15px;"></td>
                                         <td colspan="2" style="width:120px">
                                           <dx:ASPxComboBox ID="cbbssede" runat="server" EnableSynchronization="False"
                                            ClientInstanceName="cbbssede" Width="120px" ClientSideEvents-SelectedIndexChanged="cambio_sede"
                                            IncrementalFilteringMode="Contains">
                                            </dx:ASPxComboBox> </td>
                                        




                                         <td style="width:30px;"></td>
                                         <td>
                                            <dx:ASPxButton ID="btnBuscar" runat="server" Width="100%" Text="Buscar" Image-AlternateText="lupa.png"
                                                ClientInstanceName="btnBuscar" ClientSideEvents-Click="Get_Plan2" AutoPostBack="false">
                                            </dx:ASPxButton>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td style="width:20px;"></td>
                                        <td style="font-weight:bold;">
                                            Onu: 
                                        </td>
                                        <td style="width:15px;"></td>
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtonu" runat="server" Width="100px" 
                                                ClientInstanceName="txtonu" ClientSideEvents-KeyUp="Get_Plan2"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:20px;"></td>
                                        <td style="font-weight:bold;">
                                            Type Onu: 
                                        </td>
                                        <td style="width:15px;"></td>
                                        <td style="width:80px;">
                                              <dx:ASPxComboBox ID="cbbtypeonu" runat="server" Width="100%" EnableSynchronization="False"
                                               ClientInstanceName="cbbtypeonu" SelectedIndex="0"  ClientSideEvents-SelectedIndexChanged="Get_Plan2">
                                               <Items>
                                                <dx:ListEditItem Selected="True" Text="ONU+CATV" Value="ONU+CATV" />
                                                 <dx:ListEditItem Text="ONU+DATOS" Value="ONU+DATOS" />
                                                 </Items>
                                                 </dx:ASPxComboBox>

                                        </td>

                                          <td style="width:20px;" colspan="3"></td>
                                        <td>
                                              <dx:ASPxButton ID="btnExport" runat="server" AutoPostBack="False" 
                                                OnClick="btnExport_Click" Text="Exportar" Width="100%">
                                            </dx:ASPxButton>
                                        </td>


                                    </tr>
                                </table>
                                <table style="width:1200px; height:150px" class="tablespace">
                                    <tr>
                                        <td colspan="9" style="width:1200px">
                                            <dx:ASPxGridView ID="grdvRegistroOnus" runat="server" AutoGenerateColumns="False" Width="1000px"
                                                    ClientInstanceName="grdvRegistroOnus" KeyFieldName="Code" 
                                                    OnCustomCallback="grdvRegistroOnus_CustomCallback" OnRowUpdating="grdvRegistroOnus_RowUpdating" 
                                                    OnRowInserting="grdvRegistroOnus_RowInserting" OnCellEditorInitialize="grdvRegistroOnus_CellEditorInitialize"
                                                     OnDataBinding="grdvRegistroOnus_DataBinding"  OnCustomButtonCallback="grdvRegistroOnus_CustomButtonCallback"
                                                     OnRowDeleting="grdvRegistroOnus_RowDeleting"
                                                     ClientSideEvents-EndCallback="get_mensaje" >
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="20" Width="70px" >
                                                            <CustomButtons>
                                                                <dx:GridViewCommandColumnCustomButton ID="Cortar">
                                                                </dx:GridViewCommandColumnCustomButton>
                                                            </CustomButtons>
                                                            <CustomButtons>
                                                                <dx:GridViewCommandColumnCustomButton ID="Eliminar">
                                                                </dx:GridViewCommandColumnCustomButton>
                                                            </CustomButtons>
                                                            <CustomButtons>
                                                                <dx:GridViewCommandColumnCustomButton ID="Activar">
                                                                </dx:GridViewCommandColumnCustomButton>
                                                            </CustomButtons>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                        
                                                         <dx:GridViewDataTextColumn Caption=" " PropertiesTextEdit-ClientInstanceName=" "
                                                            ShowInCustomizationForm="True" VisibleIndex="13" Width="0px" Visible="true"
                                                             FieldName="Code">
                                                            <PropertiesTextEdit Width="0px">
                                                            <Style CssClass="DisplayNone"></Style>
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="Display" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                       <%-- <dx:GridViewDataTextColumn Caption="Codigo Abonado" PropertiesTextEdit-ClientInstanceName="U_DXP_COD_ABONADO"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" 
                                                             FieldName="U_DXP_COD_ABONADO">
                                                        </dx:GridViewDataTextColumn>--%>
                                                       
                                                         

                                                        <dx:GridViewDataTextColumn Caption="Cod.Abonado" PropertiesTextEdit-ClientInstanceName="U_DXP_ABO_MIKROT"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="150px"
                                                             FieldName="U_DXP_ABO_MIKROT">
                                                        </dx:GridViewDataTextColumn>
                                                        
                                                        <dx:GridViewDataTextColumn Caption=" Abonado" PropertiesTextEdit-ClientInstanceName="U_DXP_ABONADO"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="150px"
                                                             FieldName="U_DXP_ABONADO">
                                                        </dx:GridViewDataTextColumn>

                                                        <dx:GridViewDataTextColumn Caption="Abonado Onu" PropertiesTextEdit-ClientInstanceName="U_DXP_ONU_CODABO"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="150px" 
                                                             FieldName="U_DXP_ONU_CODABO">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Tarjeta" PropertiesTextEdit-ClientInstanceName="U_DXP_ONU_TARJETA"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="90px" 
                                                             FieldName="U_DXP_ONU_TARJETA">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Puerto" PropertiesTextEdit-ClientInstanceName="U_DXP_ONU_PUERTO"
                                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="90px" 
                                                            FieldName="U_DXP_ONU_PUERTO">
                                                        </dx:GridViewDataTextColumn>
                                              
                                                        <dx:GridViewDataTextColumn Caption="N° Abo.ONU" PropertiesTextEdit-ClientInstanceName="U_DXP_ONU_ABONADO"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="80px" Visible="true"
                                                            FieldName="U_DXP_ONU_ABONADO">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Onu" PropertiesTextEdit-ClientInstanceName="U_DXP_COD_ONU"
                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="150px" Visible="true" 
                                                            FieldName="U_DXP_COD_ONU">
                                                        </dx:GridViewDataTextColumn>
                                                       
                                                          
                                                         <dx:GridViewDataTextColumn Caption="Type Onu" PropertiesTextEdit-ClientInstanceName="U_DXP_ONU_TYPE"
                                                            ShowInCustomizationForm="True" VisibleIndex="9" Width="90px" 
                                                            FieldName="U_DXP_ONU_TYPE">
                                                        </dx:GridViewDataTextColumn>

                                                        <dx:GridViewDataTextColumn Caption="Descripcion Type" PropertiesTextEdit-ClientInstanceName="TIPO"
                                                            ShowInCustomizationForm="True" VisibleIndex="10" Width="90px" 
                                                            FieldName="TIPO">
                                                        </dx:GridViewDataTextColumn>





                                                        <dx:GridViewDataTextColumn Caption="Serial Onu" PropertiesTextEdit-ClientInstanceName="U_U_DXP_ONU_SERIAL"
                                                            ShowInCustomizationForm="True" VisibleIndex="11" Width="90px" 
                                                            FieldName="U_U_DXP_ONU_SERIAL">
                                                        </dx:GridViewDataTextColumn>
                                                        
                                                        
                                                        <dx:GridViewDataTextColumn Caption="Estado Onu" PropertiesTextEdit-ClientInstanceName="U_DXP_ONU_ESTADO"
                                                            ShowInCustomizationForm="True" VisibleIndex="12" Width="90px" 
                                                            FieldName="U_DXP_ONU_ESTADO">
                                                        </dx:GridViewDataTextColumn>

                                                       

                                                        
                                                    </Columns>
                                                   <SettingsPager Visible="true" Mode="ShowPager">
                                                    </SettingsPager>
                                                   <%-- <SettingsEditing Mode="EditForm" NewItemRowPosition="Bottom" />--%>
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Registro Onu" />
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
    <dx:ASPxGridViewExporter ID="gexData" runat="server" GridViewID="grdvRegistroOnus">
    </dx:ASPxGridViewExporter>
  
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
    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp" OnCustomCallback="hdfTemp_CustomCallback">
    </dx:ASPxHiddenField>
    <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css"/>
</asp:Content>

