<%@ Page Title="Planes" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Planes.aspx.cs" Inherits="OneCommerce.Mikrotik.Planes" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSPlan.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>

<script type="text/javascript" src="../Grafico/highchart/js/highcharts.js"></script>
<script type="text/javascript" src="../Grafico/highchart/js/themes/grid.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Relación de Abonados:" GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table>
                                    <tr>
                                        <td style="font-weight:bold;">
                                         <dx:ASPxCheckBox ID="chkRangeDate" runat="server" Checked="True" 
                                        CheckState="Checked" ClientInstanceName="chkRangeDate"
                                         Text="Rango Fechas:" Width="105px">
                                       <ClientSideEvents CheckedChanged="Clear_RangeDate" />
                                        </dx:ASPxCheckBox>
                                        </td>
                                         
                                        
                                        <td style="width:150px;">
                                        <dx:ASPxDateEdit ID="dterdDateIn" runat="server" Width="130px" 
                                            ClientInstanceName="dterdDateIn">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width:150px">
                                        <dx:ASPxDateEdit ID="dterdDateFi" runat="server" Width="130px" 
                                            ClientInstanceName="dterdDateFi">
                                        </dx:ASPxDateEdit>
                                    </td>
                                        
                                         <td style="width:60px;"></td>
                                        <td style="font-weight:bold; width:100px">
                                            Cod. Abonado: 
                                        </td>
                                        
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtCliente" runat="server" Width="100px" 
                                                ClientInstanceName="txtCliente" ClientSideEvents-KeyUp="Get_Plan_Tecla"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:60px;"></td>
                                        <td style="font-weight:bold;">
                                             Abonado: 
                                        </td>
                                       
                                        <td style="width:100px;">
                                            <dx:ASPxTextBox ID="txtabo" runat="server" Width="200px" 
                                                ClientInstanceName="txtabo" ClientSideEvents-KeyUp="Get_Plan_Tecla"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                        </tr>
                                    <tr>
                                        
                                        
                                        <td style="font-weight:bold;">
                                            Dirección Abonado: 
                                        </td>
                                        
                                        <td style="width:80px;" colspan="2">
                                            <dx:ASPxTextBox ID="txtDireccion" runat="server" Width="280px" 
                                                ClientInstanceName="txtDireccion" ClientSideEvents-KeyUp="Get_Plan_Tecla"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:80px;"></td>
                                        
                                        <td style="font-weight:bold;">
                                            Direc. IP: 
                                        </td>
                                       
                                        <td style="width:80px;">
                                            <dx:ASPxTextBox ID="txtipDirec" runat="server" Width="100px" 
                                                ClientInstanceName="txtipDirec" ClientSideEvents-KeyUp="Get_Plan_Tecla"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                        
                                        
                                       

                                        <td style="width:20px;"></td>
                                        <td style="font-weight:bold;">
                                                  Sede:</td>
                                         
                                         <td colspan="2" style="width:120px">
                                           <dx:ASPxComboBox ID="cbbssede" runat="server" EnableSynchronization="False"
                                            ClientInstanceName="cbbssede" Width="200px" ClientSideEvents-SelectedIndexChanged="cambio_sede"
                                            IncrementalFilteringMode="Contains">
                                            </dx:ASPxComboBox> </td>
                                        




                                         <td style="width:60px;font-weight:bold"></td>
                                         <td>
                                            <dx:ASPxButton ID="btnBuscar" runat="server" Width="100%" Text="Buscar" Image-AlternateText="lupa.png"
                                                ClientInstanceName="btnBuscar" ClientSideEvents-Click="Get_Plan_Tecla" AutoPostBack="false">
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:35px;font-weight:bold"></td>
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
                                            <dx:ASPxGridView ID="grdvPlanes" runat="server" AutoGenerateColumns="False" Width="1000px"
                                                    ClientInstanceName="grdvPlanes" KeyFieldName="U_DXP_COD_ABONADO" 
                                                    OnCustomCallback="grdvPlanes_CustomCallback" OnRowUpdating="grdvPlanes_RowUpdating" 
                                                    OnRowInserting="grdvPlanes_RowInserting" OnCellEditorInitialize="grdvPlanes_CellEditorInitialize"
                                                     OnDataBinding="grdvPlanes_DataBinding" ClientSideEvents-RowClick="fila">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="70px" >
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                         <dx:GridViewDataTextColumn Caption=" " PropertiesTextEdit-ClientInstanceName=" "
                                                            ShowInCustomizationForm="True" VisibleIndex="18" Width="0px" Visible="true"
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
                                                          <dx:GridViewDataTextColumn Caption=" " PropertiesTextEdit-ClientInstanceName=" "
                                                            ShowInCustomizationForm="True" VisibleIndex="19" Width="0px" Visible="true"
                                                             FieldName="U_U_DXP_CODE">
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
                                                       

                                                          <dx:GridViewDataButtonEditColumn Caption="Cod. Abonado"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" 
                                                            FieldName="U_DXP_COD_ABONADO">
                                                            <PropertiesButtonEdit ClientInstanceName="U_DXP_COD_ABONADO">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Consumo">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="ShowConsumo" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>









                                                        <dx:GridViewDataTextColumn Caption=" Abonado " PropertiesTextEdit-ClientInstanceName="U_DXP_ABONADO"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="200px"
                                                             FieldName="U_DXP_ABONADO">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Direccion Abonado" PropertiesTextEdit-ClientInstanceName="U_DXP_DIREC_ABO"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="90px" 
                                                             FieldName="U_DXP_DIREC_ABO">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Direccion" PropertiesTextEdit-ClientInstanceName="U_DXP_DIRECCION"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" 
                                                             FieldName="U_DXP_DIRECCION">
                                                        </dx:GridViewDataTextColumn>
                                                        <%--<dx:GridViewDataTextColumn Caption="Plan de Internet" PropertiesTextEdit-ClientInstanceName="U_DXP_PLAN_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" 
                                                            FieldName="U_DXP_PLAN_INT">
                                                        </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewDataButtonEditColumn Caption="Plan de Internet" FieldName="U_DXP_PLAN_INT"
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
                                                        </dx:GridViewDataButtonEditColumn>

                                                         <dx:GridViewDataButtonEditColumn Caption="Status" FieldName="Status"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="150px" >
                                                            <PropertiesButtonEdit ClientInstanceName="Status">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Status">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_Status" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>



                                                        <dx:GridViewDataDateColumn Caption="Fecha Registro" PropertiesDateEdit-ClientInstanceName="U_DXP_FECHA_REG"
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
                                                          <dx:GridViewDataDateColumn Caption="Fecha de Último Pago" PropertiesDateEdit-ClientInstanceName="U_DXP_ULT_PAGO"
                                                            ShowInCustomizationForm="True" VisibleIndex="12" Width="80px"  Visible="false"
                                                            FieldName="U_DXP_ULT_PAGO">
                                                        </dx:GridViewDataDateColumn>
                                                          <dx:GridViewDataDateColumn Caption="Fecha de Último Pago" PropertiesDateEdit-ClientInstanceName="U_DXP_ULT_PAGO1"
                                                            ShowInCustomizationForm="True" VisibleIndex="13" Width="90px" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/mm/yyyy"
                                                            FieldName="U_DXP_ULT_PAGO1">
                                                        </dx:GridViewDataDateColumn>
                                                         <dx:GridViewDataTextColumn Caption="Deuda Actual" PropertiesTextEdit-ClientInstanceName="U_U_DXP_DEUDA_ACT"
                                                            ShowInCustomizationForm="True" VisibleIndex="14" Width="90px" 
                                                            FieldName="U_U_DXP_DEUDA_ACT">
                                                        </dx:GridViewDataTextColumn>




                                                        <dx:GridViewDataTextColumn Caption="Mac Equipo" PropertiesTextEdit-ClientInstanceName="U_DXP_MAC_EQUIPO"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" 
                                                            FieldName="U_DXP_MAC_EQUIPO">
                                                        </dx:GridViewDataTextColumn>
                                                         <%--<dx:GridViewDataCheckColumn Caption="Estado Internet" PropertiesDateEdit-ClientInstanceName="U_DXP_ESTADO_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="80px"
                                                            FieldName="U_DXP_ESTADO_INT">
                                                        </dx:GridViewDataCheckColumn>--%>
                                                         <dx:GridViewDataCheckColumn VisibleIndex="16" UnboundType="String" Caption="Estado Internet" FieldName="U_DXP_ESTADO_INT">
                                                             <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String"></PropertiesCheckEdit>
                                                             </dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataCheckColumn VisibleIndex="17" Visible="false" UnboundType="String" Caption="Estado Cable" FieldName="U_DXP_ESTADO_CABLE">
                                                             <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String" ></PropertiesCheckEdit>
                                                             </dx:GridViewDataCheckColumn>

                                                        <%--<dx:GridViewDataSpinEditColumn Caption="Estado Internet" FieldName="Remind" VisibleIndex="7">
                                                            <PropertiesSpinEdit MinValue="01" MaxValue="31" NumberType="Integer" NullTextStyle-HorizontalAlign="Left" MaxLength="2" />
                                                        </dx:GridViewDataSpinEditColumn>--%>
                                                       <%-- <dx:GridViewDataCheckColumn Caption="Estado Cable" PropertiesDateEdit-ClientInstanceName="U_DXP_ESTADO_CABLE"
                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="80px"
                                                            FieldName="U_DXP_ESTADO_CABLE">
                                                        </dx:GridViewDataCheckColumn>--%>
                                                        
                                                    </Columns>
                                                   <SettingsPager Visible="true" Mode="ShowPager">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="EditForm" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Conexiones" />
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
    <dx:ASPxGridViewExporter ID="gexData" runat="server" GridViewID="grdvPlanes">
    </dx:ASPxGridViewExporter>
     <%-- popup CONSUMOS --%>

    <dx:ASPxPopupControl ID="ppcConsumo" runat="server" 
        ClientInstanceName="ppcConsumo" FooterText=" " HeaderText="Consumos" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="1000px" Height="200px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table border="0"  style="width:100%">
                    <tr>
                        <td style="width:80px"> </td>
                        <td style="width:50px;margin-right:50px">
                                            Rango Fechas:</td>
                                        <td style="width:10px"></td>
                                        <td style="width:10px">
                                            <dx:ASPxDateEdit ID="dteDateIn" runat="server" Width="150px" 
                                                ClientInstanceName="dteDateIn">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:10px">
                                            <dx:ASPxDateEdit ID="dteDateFi" runat="server" Width="150px" 
                                                ClientInstanceName="dteDateFi">
                                            </dx:ASPxDateEdit>
                                        </td>
                                         <td style="width:10px">
                                            <dx:ASPxButton ID="btnbusqueda" runat="server" AutoPostBack="False" 
                                                ClientInstanceName="btnbusqueda" Text="Buscar" Width="130px">
                                                <ClientSideEvents Click="showgrafico2" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:250px">

                                        </td>
                    </tr>
                 </table>
                <div style="height:20px">


                </div>
                <div id="container1" style="min-width: 1300px; height: 400px; margin: 0 auto"></div>
                <div id="trafico1"></div>
                
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>  



    <%-- popup CONSUMOS --%>


     <%-- popup STATUS --%>

    <dx:ASPxPopupControl ID="ppcStatus" runat="server" 
        ClientInstanceName="ppcStatus" FooterText=" " HeaderText="Status" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="800px" Height="200px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
               
                
                <div>
                    <%-- <input type="text" runat="server" name="txtIP" id="txtIP" value="190.116.50.218" />
                     <input type="text" runat="server" name="txtUSERNAME" id="txtUSERNAME" value="soporte" />
                     <input type="text" runat="server" name="txtPASSWORD" id="txtPASSWORD" value="odex2020" />
                     <input type="text" runat="server" name="txtABONADO" id="txtABONADO" value="<pppoe-0045>" />--%>

                </div>
                <div id="container" style="min-width: 800px; height: 400px; margin: 0 auto"></div>
                <div id="trafico"></div>



               
    








            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>  








    <%-- popup plan internet --%>

    <dx:ASPxPopupControl ID="ppcTipoPlanSearch" runat="server" 
        ClientInstanceName="ppcTipoPlanSearch" FooterText=" " HeaderText="Buscar Plan" 
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
                                    <td style="width:105px">
                                        Plan:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtTipoPlanSearch" runat="server" Width="100%" 
                                            ClientInstanceName="txtTipoPlanSearch" ClientSideEvents-KeyUp="Get_TipoPlan">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnTipoPlan" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnTipoPlanSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_TipoPlan"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvTipoPlan" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvTipoPlan" 
                                KeyFieldName="Code" OnCustomCallback="gdvTipoPlan_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvTipoPlan_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Plan" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents EndCallback="EndTipoPlan"  RowDblClick="OkTipoPlan"/>
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
                                        <dx:ASPxButton ID="btnTipoPlanOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnTipoPlanOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkTipoPlan" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnTipoPlanCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnTipoPlanCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelTipoPlan" />
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
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css"/>
</asp:Content>

