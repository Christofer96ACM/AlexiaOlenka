<%@ Page Title="Recursos" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Recursos.aspx.cs" Inherits="OneCommerce.Mikrotik.Recursos" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSRecursos.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Recursos Mikrotik:" GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                
                                   
                                <table style="width:1200px; height:150px" class="tablespace">
                                    <tr>
                                        <td colspan="9" style="width:1200px">
                                            <dx:ASPxGridView ID="grdvRecurso" runat="server" AutoGenerateColumns="False" Width="1000px"
                                                    ClientInstanceName="grdvRecurso" KeyFieldName="U_DXP_SEDE"
                                                    OnCustomCallback="grdvRecurso_CustomCallback" OnRowUpdating="grdvRecurso_RowUpdating"
                                                    OnRowInserting="grdvRecurso_RowInserting" OnCellEditorInitialize="grdvRecurso_CellEditorInitialize"
                                                    OnCustomButtonCallback="grdvRecurso_CustomButtonCallback" OnRowDeleting="grdvRecurso_RowDeleting"
                                                    OnDataBinding="grdvRecurso_DataBinding">
                                                    
                                                      <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="5" Width="20px" >
                                                            <%--<EditButton Visible="true">
                                                            </EditButton>--%>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                            <CustomButtons >
                                                                <dx:GridViewCommandColumnCustomButton ID="Enviar">
                                                                </dx:GridViewCommandColumnCustomButton>
                                                            </CustomButtons>
                                                             <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                            
                                                          
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="SEDE" PropertiesTextEdit-ClientInstanceName="PrjName"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" 
                                                             FieldName="PrjName">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="IP" PropertiesTextEdit-ClientInstanceName="DIRECCIONIP"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="90px"
                                                             FieldName="DIRECCIONIP">
                                                        </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn Caption="USUARIO" PropertiesTextEdit-ClientInstanceName="USUARIOMKT"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="90px" 
                                                             FieldName="USUARIOMKT">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="CONTRASEÑA" PropertiesTextEdit-ClientInstanceName="PASSWORDMKT"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" 
                                                             FieldName="PASSWORDMKT">
                                                            <PropertiesTextEdit Password="True"></PropertiesTextEdit> 
                                                        </dx:GridViewDataTextColumn>
                                                       
                                                      </Columns>
                                                     <SettingsPager Visible="true" Mode="ShowPager">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="EditForm" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Recursos" />
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

