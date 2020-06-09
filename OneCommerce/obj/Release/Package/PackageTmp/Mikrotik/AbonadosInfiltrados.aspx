<%@ Page Title="Abonados Infiltrados" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="AbonadosInfiltrados.aspx.cs" Inherits="OneCommerce.Mikrotik.AbonadosInfiltrados"%>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSInfiltrados.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Relación de Abonados Clandestinos:" GroupBoxStyle-Caption-Font-Size="X-Large"
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
                                            Código de Abonado: 
                                        </td>
                                        <td style="width:15px;"></td>
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtCliente" runat="server" Width="100%" 
                                                ClientInstanceName="txtCliente" ClientSideEvents-KeyUp="Get_Plan2"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                          

                                        
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
                                            <dx:ASPxButton ID="btnBuscar" runat="server" Width="100%" Text="Buscar" 
                                                ClientInstanceName="btnBuscar" ClientSideEvents-Click="Get_Plan2" AutoPostBack="false" >
                                            </dx:ASPxButton>
                                        </td>

                                        
                                        
                                    </tr>
                                </table>
                                <table style="width:1200px; height:150px" class="tablespace">
                                    <tr>
                                        <td colspan="9" style="width:1200px">
                                            <dx:ASPxGridView ID="grdvInfiltrados" runat="server" AutoGenerateColumns="False" Width="1000px"
                                                    ClientInstanceName="grdvInfiltrados" KeyFieldName="U_DXP_COD_ABONADO"
                                                    OnCustomCallback="grdvInfiltrados_CustomCallback" OnRowUpdating="grdvInfiltrados_RowUpdating"
                                                    OnRowInserting="grdvInfiltrados_RowInserting" OnCellEditorInitialize="grdvInfiltrados_CellEditorInitialize"
                                                    OnCustomButtonCallback="grdvInfiltrados_CustomButtonCallback" OnRowDeleting="grdvInfiltrados_RowDeleting"
                                                    OnDataBinding="grdvInfiltrados_DataBinding">
                                                    
                                                      <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="20" Width="70px" >
                                                            
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                            <CustomButtons >
                                                                <dx:GridViewCommandColumnCustomButton ID="Eliminar">
                                                                </dx:GridViewCommandColumnCustomButton>
                                                            </CustomButtons>
                                                             <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                            
                                                          
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Abonado" PropertiesTextEdit-ClientInstanceName="U_DXP_COD_ABONADO"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" 
                                                             FieldName="U_DXP_COD_ABONADO">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Descripción de Abonado" PropertiesTextEdit-ClientInstanceName="U_DXP_ABONADO"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="150px"
                                                             FieldName="U_DXP_ABONADO">
                                                        </dx:GridViewDataTextColumn>
                                                         <%-- <dx:GridViewDataTextColumn Caption="Direccion de Abonado" PropertiesTextEdit-ClientInstanceName="U_DXP_DIREC_ABO"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="90px" 
                                                             FieldName="U_DXP_DIREC_ABO">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Direccion" PropertiesTextEdit-ClientInstanceName="U_DXP_DIRECCION"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" 
                                                             FieldName="U_DXP_DIRECCION">
                                                        </dx:GridViewDataTextColumn>--%>
                                                        <dx:GridViewDataTextColumn Caption="Plan de Internet" PropertiesTextEdit-ClientInstanceName="U_DXP_PLAN_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" 
                                                            FieldName="U_DXP_PLAN_INT">
                                                        </dx:GridViewDataTextColumn>
                                                           <%-- <dx:GridViewDataButtonEditColumn Caption="Plan de Internet" FieldName="U_DXP_PLAN_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="150px" >
                                                            <PropertiesButtonEdit ClientInstanceName="U_DXP_PLAN_INT">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Plan">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_TipoPlanSearch" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>--%>



<%--                                                        <dx:GridViewDataDateColumn Caption="Fecha Registro" PropertiesDateEdit-ClientInstanceName="U_DXP_FECHA_REG"
                                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="80px" Visible="false"
                                                            FieldName="U_DXP_FECHA_REG">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha Registro" PropertiesDateEdit-ClientInstanceName="U_DXP_FECHA_REG1"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="90px" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/mm/yyyy"
                                                            FieldName="U_DXP_FECHA_REG1">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha Corte Internet" PropertiesDateEdit-ClientInstanceName="U_DXP_FEC_CORT_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="80px"  Visible="false"
                                                            FieldName="U_DXP_FEC_CORT_INT">
                                                        </dx:GridViewDataDateColumn>
                                                           <dx:GridViewDataDateColumn Caption="Fecha Corte Internet" PropertiesDateEdit-ClientInstanceName="U_DXP_FEC_CORT_INT1"
                                                            ShowInCustomizationForm="True" VisibleIndex="9" Width="90px" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/mm/yyyy"
                                                            FieldName="U_DXP_FEC_CORT_INT1">
                                                        </dx:GridViewDataDateColumn>
                                                         <dx:GridViewDataDateColumn Caption="Fecha Corte Cable" PropertiesDateEdit-ClientInstanceName="U_DXP_FEC_CORT_CABLE"
                                                            ShowInCustomizationForm="True" VisibleIndex="10" Width="80px"  Visible="false"
                                                            FieldName="U_DXP_FEC_CORT_CABLE">
                                                        </dx:GridViewDataDateColumn>
                                                          <dx:GridViewDataDateColumn Caption="Fecha Corte Cable" PropertiesDateEdit-ClientInstanceName="U_DXP_FEC_CORT_CABLE1"
                                                            ShowInCustomizationForm="True" VisibleIndex="11" Width="90px" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/mm/yyyy"
                                                            FieldName="U_DXP_FEC_CORT_CABLE1">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn Caption="Mac Equipo" PropertiesTextEdit-ClientInstanceName="U_DXP_MAC_EQUIPO"
                                                            ShowInCustomizationForm="True" VisibleIndex="12" Width="90px" 
                                                            FieldName="U_DXP_MAC_EQUIPO">
                                                        </dx:GridViewDataTextColumn>
                                                         <%--<dx:GridViewDataCheckColumn Caption="Estado Internet" PropertiesDateEdit-ClientInstanceName="U_DXP_ESTADO_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="80px"
                                                            FieldName="U_DXP_ESTADO_INT">
                                                        </dx:GridViewDataCheckColumn>--%>
                                                         <dx:GridViewDataCheckColumn VisibleIndex="13" UnboundType="String" Caption="Estado Internet" FieldName="U_DXP_ESTADO_INT" Width="50px">
                                                             <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String" ></PropertiesCheckEdit>
                                                             </dx:GridViewDataCheckColumn>
                                                        <%--<dx:GridViewDataCheckColumn  Visible="false" VisibleIndex="14" UnboundType="String" Caption="Estado Cable" FieldName="U_DXP_ESTADO_CABLE" >
                                                             <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String" ></PropertiesCheckEdit>
                                                             </dx:GridViewDataCheckColumn>--%>
                                                          

                                                        <%--<dx:GridViewDataSpinEditColumn Caption="Estado Internet" FieldName="Remind" VisibleIndex="7">
                                                            <PropertiesSpinEdit MinValue="01" MaxValue="31" NumberType="Integer" NullTextStyle-HorizontalAlign="Left" MaxLength="2" />
                                                        </dx:GridViewDataSpinEditColumn>--%>
                                                       <%-- <dx:GridViewDataCheckColumn Caption="Estado Cable" PropertiesDateEdit-ClientInstanceName="U_DXP_ESTADO_CABLE"
                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="80px"
                                                            FieldName="U_DXP_ESTADO_CABLE">
                                                        </dx:GridViewDataCheckColumn>--%>
                                                           <dx:GridViewDataDateColumn Caption="Fecha Registro" PropertiesDateEdit-ClientInstanceName="U_DXP_FECHA_REG"
                                                            ShowInCustomizationForm="True" VisibleIndex="14" Width="80px" Visible="true"
                                                            FieldName="U_DXP_FECHA_REG">
                                                        </dx:GridViewDataDateColumn>
                                                 </Columns>
                                                <SettingsPager Visible="true" Mode="ShowPager">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="EditForm" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Abonados Pendientes" />
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

   
    <%-- plan --%>











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

