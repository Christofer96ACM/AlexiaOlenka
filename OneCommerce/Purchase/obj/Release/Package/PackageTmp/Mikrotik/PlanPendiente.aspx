<%@ Page Title="Planes Pendientes" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="PlanPendiente.aspx.cs" Inherits="OneCommerce.Mikrotik.PlanPendiente"%>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSPlanPendientes.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Relación de Abonados Pendientes:" GroupBoxStyle-Caption-Font-Size="X-Large"
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
                                                ClientInstanceName="txtCliente" ClientSideEvents-KeyUp="Get_Plan"  AutoPostBack="false">
                                            </dx:ASPxTextBox>
                                        </td>
                                         <td style="width:30px;"></td>
                                         <td>
                                            <dx:ASPxButton ID="btnBuscar" runat="server" Width="100%" Text="Buscar" 
                                                ClientInstanceName="btnBuscar" ClientSideEvents-Click="Get_Plan" AutoPostBack="false">
                                            </dx:ASPxButton>
                                        </td>
                                        
                                    </tr>
                                </table>
                                <table style="width:1200px; height:150px" class="tablespace">
                                    <tr>
                                        <td colspan="9" style="width:1200px">
                                            <dx:ASPxGridView ID="grdvPendientes" runat="server" AutoGenerateColumns="False" Width="1000px"
                                                    ClientInstanceName="grdvPendientes" KeyFieldName="U_DXP_COD_ABONADO"  
                                                    OnCustomCallback="grdvPendientes_CustomCallback" OnRowUpdating="grdvPendientes_RowUpdating"
                                                    OnRowInserting="grdvPendientes_RowInserting" OnCellEditorInitialize="grdvPendientes_CellEditorInitialize"
                                                    OnCustomButtonCallback="grdvPendientes_CustomButtonCallback" OnRowDeleting="grdvPendientes_RowDeleting"
                                                    OnDataBinding="grdvPendientes_DataBinding">
                                                    
                                                      <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="70px" >
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                            <CustomButtons >
                                                                <dx:GridViewCommandColumnCustomButton ID="Enviar">
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
                                                        <dx:GridViewDataTextColumn Caption="Direccion" PropertiesTextEdit-ClientInstanceName="U_DXP_DIRECCION"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="90px" 
                                                             FieldName="U_DXP_DIRECCION">
                                                        </dx:GridViewDataTextColumn>
                                                        <%--<dx:GridViewDataTextColumn Caption="Plan de Internet" PropertiesTextEdit-ClientInstanceName="U_DXP_PLAN_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" 
                                                            FieldName="U_DXP_PLAN_INT">
                                                        </dx:GridViewDataTextColumn>--%>
                                                            <dx:GridViewDataButtonEditColumn Caption="Plan de Internet" FieldName="U_DXP_PLAN_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="150px" >
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



                                                        <dx:GridViewDataDateColumn Caption="Fecha Registro" PropertiesDateEdit-ClientInstanceName="U_DXP_FECHA_REG"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="80px" Visible="false"
                                                            FieldName="U_DXP_FECHA_REG">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha Registro" PropertiesDateEdit-ClientInstanceName="U_DXP_FECHA_REG1"
                                                            ShowInCustomizationForm="True" VisibleIndex="9" Width="90px" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/mm/yyyy"
                                                            FieldName="U_DXP_FECHA_REG1">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataDateColumn Caption="Fecha Corte Internet" PropertiesDateEdit-ClientInstanceName="U_DXP_FEC_CORT_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="80px"  Visible="false"
                                                            FieldName="U_DXP_FEC_CORT_INT">
                                                        </dx:GridViewDataDateColumn>
                                                           <dx:GridViewDataDateColumn Caption="Fecha Corte Internet" PropertiesDateEdit-ClientInstanceName="U_DXP_FEC_CORT_INT1"
                                                            ShowInCustomizationForm="True" VisibleIndex="9" Width="90px" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/mm/yyyy"
                                                            FieldName="U_DXP_FEC_CORT_INT1">
                                                        </dx:GridViewDataDateColumn>
                                                         <dx:GridViewDataDateColumn Caption="Fecha Corte Cable" PropertiesDateEdit-ClientInstanceName="U_DXP_FEC_CORT_CABLE"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="80px"  Visible="false"
                                                            FieldName="U_DXP_FEC_CORT_CABLE">
                                                        </dx:GridViewDataDateColumn>
                                                          <dx:GridViewDataDateColumn Caption="Fecha Corte Cable" PropertiesDateEdit-ClientInstanceName="U_DXP_FEC_CORT_CABLE1"
                                                            ShowInCustomizationForm="True" VisibleIndex="9" Width="90px" Visible="true" PropertiesDateEdit-DisplayFormatString="dd/mm/yyyy"
                                                            FieldName="U_DXP_FEC_CORT_CABLE1">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn Caption="Mac Equipo" PropertiesTextEdit-ClientInstanceName="U_DXP_MAC_EQUIPO"
                                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="90px" 
                                                            FieldName="U_DXP_MAC_EQUIPO">
                                                        </dx:GridViewDataTextColumn>
                                                         <%--<dx:GridViewDataCheckColumn Caption="Estado Internet" PropertiesDateEdit-ClientInstanceName="U_DXP_ESTADO_INT"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="80px"
                                                            FieldName="U_DXP_ESTADO_INT">
                                                        </dx:GridViewDataCheckColumn>--%>
                                                         <dx:GridViewDataCheckColumn VisibleIndex="9" UnboundType="String" Caption="Estado Internet" FieldName="U_DXP_ESTADO_INT">
                                                             <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String"></PropertiesCheckEdit>
                                                             </dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataCheckColumn VisibleIndex="10" UnboundType="String" Caption="Estado Cable" FieldName="U_DXP_ESTADO_CABLE">
                                                             <PropertiesCheckEdit AllowGrayed="false" ValueChecked="Y" ValueUnchecked="N" ValueType="System.String"></PropertiesCheckEdit>
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
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Plan" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents EndCallback="EndTipoPlan"/>
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
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

