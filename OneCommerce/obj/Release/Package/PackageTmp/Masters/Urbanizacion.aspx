<%@ Page Title="Urbanización" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Urbanizacion.aspx.cs" Inherits="OneCommerce.Masters.Urbanizacion"%>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Tools/General.js"></script>
<script type="text/javascript" src="../Scripts/Tools/JSUrbanizacion.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Urbanización" GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <nav>
                                   <%-- <a href="#tab1" class="amenucrearclie"><i class="fas fa-home"></i> General</a>
                                    <a href="#tab2" class="amenucrearclie"><i class="fas fa-user-check"></i> Contactos</a>--%>
                                   <%-- <a href="#tab3" class="amenucrearclie"><i class="fas fa-list-ul"></i> Urbanizaciones</a>--%>
                                   <%-- <a href="#tab4" class="amenucrearclie"><i class="fas fa-dollar-sign"></i> Finanzas</a>--%>
                                    <%--<a href="#tab5" class="amenucrearclie"><i class="fas fa-list-ul"></i> Direcciones 2.0</a>--%>
                                </nav>
                                <table id="tablaprincdecrearclie" style="width:600px; height:350px" class="tablespace">
                                    <tr>
                                        <td colspan="10" style="width:1000px" class="tablespace">
                                            
                                           
                                            <section class="sectablas" id="tab3" >
                                            <table style="width:800px">
                                                <tr>
                                                    <td style="width:105px">
                                                            Departamento:</td>
                                                    <td style="width:5px"></td>
                                                    <td>
                                                        <dx:ASPxTextBox runat="server" 
                                                        ClientInstanceName="txtcoddep" Width="100px" ReadOnly="True">

                                                        </dx:ASPxTextBox>
                                                    </td>
                                                        <td >
                                                            <dx:ASPxButtonEdit ID="btedepartamento" runat="server" ReadOnly="true"
                                                                ClientInstanceName="btedepartamento" Width="140px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Departamento">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_DepartamentoSearch" />
                                                            </dx:ASPxButtonEdit> </td>

                                                    <td style="width:10px"> </td>
                                                     <td style="width:105px">
                                                            Provincia:</td>
                                                    <td style="width:5px"></td>
                                                    <td>
                                                        <dx:ASPxTextBox runat="server" 
                                                        ClientInstanceName="txtcodprov" Width="100px" ReadOnly="True">

                                                        </dx:ASPxTextBox>
                                                    </td>
                                                        <td >
                                                            <dx:ASPxButtonEdit ID="bteprovincia" runat="server" ReadOnly="true"
                                                                ClientInstanceName="bteprovincia" Width="140px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Provincia">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_ProvinciaSearch" />
                                                            </dx:ASPxButtonEdit> </td>



                                                

                                                </tr>

                                                <tr>
                                                    <td style="width:105px">
                                                            Distrito:</td>
                                                    <td style="width:5px"></td>
                                                    <td>
                                                        <dx:ASPxTextBox runat="server" 
                                                        ClientInstanceName="txtcoddit" Width="100px" ReadOnly="True">

                                                        </dx:ASPxTextBox>
                                                    </td>
                                                        <td>
                                                            <dx:ASPxButtonEdit ID="btedistrito" runat="server" ReadOnly="true"
                                                                ClientInstanceName="btedistrito" Width="140px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Distrito">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_DistritoSearch" />
                                                            </dx:ASPxButtonEdit> </td>


                                                    <%--<td style="width:10px"> </td>
                                                     <td style="width:105px">
                                                            Urbanización:</td>
                                                    <td style="width:5px"></td>
                                                    <td>
                                                        <dx:ASPxTextBox runat="server" 
                                                        ClientInstanceName="txturbacrear" Width="100px" ReadOnly="false">
                                                         </dx:ASPxTextBox>
                                                    </td>--%>

                                                     <td style="width:10px"> </td>
                                                     <td style="width:105px">
                                                           </td>
                                                    <td style="width:5px"></td>
                                                    <td>
                                                        <b></b>
                                                    </td>

                                                    <td style="width:100px"> </td>
                                               <td>
                                             <dx:ASPxButton ID="btecrear" runat="server" Text="Buscar" Width="80px" 
                                            ClientInstanceName="btecrear" AutoPostBack="False" ClientSideEvents-Click="Buscar">
                                              </dx:ASPxButton>
                                             </td>

                                              </tr>


                                      <%--  <tr>
                                        <td style="width:105px">
                                        Urbanizacion:</td>
                                       <td style="width:20px"></td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txturb" runat="server" Width="150px"
                                            ClientInstanceName="txturb" ClientSideEvents-KeyPress="Get_urbtotal">
                                        </dx:ASPxTextBox>
                                    </td>


                                     
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Buscar" Width="80px" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_urbtotal" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                              --%>
                                            
                                            </table>
                                             


                                                <dx:ASPxGridView ID="gdvCrearUrbanizacion" runat="server" AutoGenerateColumns="False" Width="800px"
                                                    ClientInstanceName="gdvCrearUrbanizacion" KeyFieldName="Code"
                                                    OnCellEditorInitialize="gdvCrearUrbanizacion_CellEditorInitialize" OnRowUpdating="gdvCrearUrbanizacion_RowUpdating"
                                                    OnCommandButtonInitialize="gdvCrearUrbanizacion_CommandButtonInitialize" OnCustomCallback="gdvCrearUrbanizacion_CustomCallback"
                                                    OnRowInserting="gdvCrearUrbanizacion_RowInserting" OnRowDeleting="gdvCrearUrbanizacion_RowDeleting"
                                                    OnDataBinding="gdvCrearUrbanizacion_DataBinding" OnInitNewRow="gdvCrearUrbanizacion_InitNewRow">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                            VisibleIndex="0" Width="120px">
                                                            <NewButton Visible="True">
                                                            </NewButton>
                                                            <EditButton Visible="true">
                                                            </EditButton>
                                                          <%--  <DeleteButton Visible="True">
                                                            </DeleteButton>--%>
                                                            <CellStyle Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewCommandColumn>
                                                         <dx:GridViewDataTextColumn Caption="Código Urbanización" ShowInCustomizationForm="True" 
                                                            VisibleIndex="10" Width="100px" FieldName="Code" ReadOnly="true">
                                                            <PropertiesTextEdit ClientInstanceName="Code" 
                                                                DisplayFormatInEditMode="true">
                                                                        
                                                            </PropertiesTextEdit>
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Nombre de Urbanización" ShowInCustomizationForm="True" 
                                                            VisibleIndex="10" Width="100px" FieldName="U_DXP_NOMBRE_URBA" ReadOnly="false" >
                                                            <PropertiesTextEdit ClientInstanceName="U_DXP_NOMBRE_URBA" 
                                                                DisplayFormatInEditMode="true">
                                                                        
                                                            </PropertiesTextEdit>
                                                            <%--<EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </CellStyle>--%>
                                                        </dx:GridViewDataTextColumn>

                                                         <dx:GridViewDataButtonEditColumn Caption="Departamento" FieldName="U_DXP_DEPARTAMENTO"
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="300px">
                                                            <PropertiesButtonEdit ClientInstanceName="U_DXP_DEPARTAMENTO">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Departamentos" Visible="true">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_DepartamentoSearch2" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Departamento" ShowInCustomizationForm="True" 
                                                            VisibleIndex="4" Width="0px" FieldName="U_DXP_COD_DEP" ReadOnly="false">
                                                            <PropertiesTextEdit ClientInstanceName="U_DXP_COD_DEP"
                                                                DisplayFormatInEditMode="true">    </PropertiesTextEdit>                                           
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataButtonEditColumn Caption="Provincia" FieldName="U_DXP_PROVINCIA"
                                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="300px">
                                                            <PropertiesButtonEdit ClientInstanceName="U_DXP_PROVINCIA">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Provincia" Visible="True">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_ProvinciaSearch2" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn Caption="Codigo Provincia" ShowInCustomizationForm="True" 
                                                            VisibleIndex="6" Width="0px" FieldName="U_DXP_COD_PROV" ReadOnly="false">
                                                            <PropertiesTextEdit ClientInstanceName="U_DXP_COD_PROV"
                                                                DisplayFormatInEditMode="true">    </PropertiesTextEdit>                                           
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>

                                                        <dx:GridViewDataTextColumn Caption="Código Distrito" ShowInCustomizationForm="True" 
                                                            VisibleIndex="2" Width="200px" FieldName="U_DXP_CODIGO_DIST" ReadOnly="true">
                                                            <PropertiesTextEdit ClientInstanceName="U_DXP_CODIGO_DIST"
                                                                DisplayFormatInEditMode="true">
                                                            </PropertiesTextEdit>
                                                            <EditCellStyle HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                             <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <CellStyle ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                       
                                                        <dx:GridViewDataButtonEditColumn Caption="Distrito" FieldName="U_DXP_NOMBRE_DIST"
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="300px">
                                                            <PropertiesButtonEdit ClientInstanceName="U_DXP_NOMBRE_DIST">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Distrito" Visible="True" Enabled="true">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="Show_DistritoSearch2" />
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        
                                                    </Columns>
                                                    <SettingsBehavior AllowSort="False" ColumnResizeMode="Disabled"
                                                        ConfirmDelete="True" />
                                                    <SettingsBehavior AllowSort="False" ConfirmDelete="True"></SettingsBehavior>
                                                    <SettingsPager Visible="true" Mode="ShowPager">
                                                    </SettingsPager>
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                    <SettingsText Title="Direcciones" />
                                                    <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom"></SettingsEditing>
                                                    <Settings ShowTitlePanel="True" ShowFooter="True"></Settings>
                                                    <SettingsText Title="Urbanizacion"></SettingsText>
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
    <dx:ASPxGridViewExporter ID="gexData" runat="server" GridViewID="gdvCrearUrbanizacion"></dx:ASPxGridViewExporter>
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
    <dx:ASPxPopupControl ID="ppcDepaSearch" runat="server" 
        ClientInstanceName="ppcDepaSearch" FooterText=" " HeaderText="Buscar Departamento" 
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
                                        Departamento:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtDepaSearch" runat="server" Width="100%" 
                                            ClientInstanceName="txtDepaSearch" ClientSideEvents-KeyPress="Get_Depa">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDepa" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnDepaSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Depa1"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvDepartamento" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvDepartamento" 
                                KeyFieldName="Code" OnCustomCallback="gdvDepartamento_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvDepartamento_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Departamento" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkDepa" EndCallback="EndDepaSearch"/>
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
                                        <dx:ASPxButton ID="btnDepaOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnDepaOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkDepa" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDepaCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnDepaCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelDepa" />
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
    
     <dx:ASPxPopupControl ID="ppcDepaSearch2" runat="server" 
        ClientInstanceName="ppcDepaSearch2" FooterText=" " HeaderText="Buscar Departamento" 
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
                           <%-- <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:105px">
                                        Departamento:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtDepaSearch2" runat="server" Width="100%" 
                                            ClientInstanceName="txtDepaSearch2" ClientSideEvents-KeyPress="Get_Depa2">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDepaSearch2" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnDepaSearch2" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Depa22"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvDepartamento2" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvDepartamento2" 
                                KeyFieldName="Code" OnCustomCallback="gdvDepartamento2_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvDepartamento2_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Departamento" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkDepa2" EndCallback="EndDepaSearch"/>
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
                                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnDepaOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkDepa2" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnDepaCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelDepa2" />
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
    

    <dx:ASPxPopupControl ID="ppcbuscarurbanizaciontotal" runat="server" 
        ClientInstanceName="ppcbuscarurbanizaciontotal" FooterText=" " HeaderText="Buscar Urbanizaciones" 
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
                                        Urbanizacion:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtbusquedaurb" runat="server" Width="100%" 
                                            ClientInstanceName="txtbusquedaurb" ClientSideEvents-KeyPress="Get_urbtotal">
                                        </dx:ASPxTextBox>
                                    </td>

                                    <td style="width:105px">
                                        </td>
                                    <td style="width:280px">
                                        <dx:ASPxButton ID="btnbuscarurbtotal" Text="Buscar" runat="server" Width="100%" AutoPostBack="false"
                                            ClientInstanceName="btnbuscarurbtotal" ClientSideEvents-Click="Get_urbtotal">
                                        </dx:ASPxButton>
                                    </td>

                                   
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvurbanizaciontotal" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvurbanizaciontotal" 
                                KeyFieldName="Code" OnCustomCallback="gdvurbanizaciontotal_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvurbanizaciontotal_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Cod.Urbanizacion" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                         <PropertiesTextEdit ClientInstanceName="txtCode">
                                             </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Urbanizacion" FieldName="U_DXP_NOMBRE_URBA" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit ClientInstanceName="txturb">
                                             </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Cod.Distrito" FieldName="U_DXP_CODIGO_DIST" 
                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                         <PropertiesTextEdit ClientInstanceName="txtcoddist">
                                             </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Distrito" FieldName="U_DXP_NOMBRE_DIST" 
                                        ShowInCustomizationForm="True" VisibleIndex="3">
                                         <PropertiesTextEdit ClientInstanceName="txtnomdist">
                                             </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Cod.Provincia" FieldName="U_DXP_COD_PROV" 
                                        ShowInCustomizationForm="True" VisibleIndex="4">
                                         <PropertiesTextEdit ClientInstanceName="txtcodprov">
                                             </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Provincia" FieldName="U_DXP_PROVINCIA" 
                                        ShowInCustomizationForm="True" VisibleIndex="5">
                                         <PropertiesTextEdit ClientInstanceName="txtnomprov">
                                             </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Cod.Departamento" FieldName="U_DXP_COD_DEP" 
                                        ShowInCustomizationForm="True" VisibleIndex="6">
                                         <PropertiesTextEdit ClientInstanceName="txtcodep">
                                             </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Departamento" FieldName="U_DXP_DEPARTAMENTO" 
                                        ShowInCustomizationForm="True" VisibleIndex="7">
                                         <PropertiesTextEdit ClientInstanceName="txtnombdep">
                                             </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents  RowDblClick="Okurbtotal" EndCallback="EndUrbTotalteSearch"/>
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
                                            ClientInstanceName="btnGabineteOk" AutoPostBack="False">
                                            <ClientSideEvents Click="Okurbtotal" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnGabineteCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelUrbTotal" />
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






    <dx:ASPxPopupControl ID="ppcUrbanizacionSearch" runat="server" 
        ClientInstanceName="ppcUrbanizacionSearch" FooterText=" " HeaderText="Buscar Urbanizacion" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="500px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <%--<tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:105px">
                                        Provincia:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtProvincia" runat="server" Width="100%" 
                                            ClientInstanceName="txtProvincia">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProvinciaSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnProvinciaSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Provincia"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvUrbanizacion" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvUrbanizacion" 
                                KeyFieldName="Code" OnCustomCallback="gdvUrbanizacion_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvUrbanizacion_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Urbanizacion" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkUrbanizacion" EndCallback="EndUrbanizacionSearch"/>
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
                                        <dx:ASPxButton ID="btnUrbanizacionOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnUrbanizacionOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkUrbanizacion" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnUrbanizacionCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnUrbanizacionCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelUrbanizacion" />
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
    <dx:ASPxPopupControl ID="ppcProvinciaSearch" runat="server" 
        ClientInstanceName="ppcProvinciaSearch" FooterText=" " HeaderText="Buscar Provincia" 
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
                                        Provincia:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtProvincia" runat="server" Width="100%" 
                                            ClientInstanceName="txtProvincia" ClientSideEvents-KeyPress="Get_Prov">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProvinciaSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnProvinciaSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Prov1"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvProvincia" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvProvincia" 
                                KeyFieldName="Code" OnCustomCallback="gdvProvincia_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvProvincia_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Provincia" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkProvincia" EndCallback="EndProvinciaSearch"/>
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
                                        <dx:ASPxButton ID="btnProvinciaOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProvinciaOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkProvincia" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProvinciaCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProvinciaCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProvincia" />
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

    <dx:ASPxPopupControl ID="ppcProvinciaSearch2" runat="server" 
        ClientInstanceName="ppcProvinciaSearch2" FooterText=" " HeaderText="Buscar Provincia" 
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
                           <%-- <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:105px">
                                        Provincia:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtProvincia2" runat="server" Width="100%" 
                                            ClientInstanceName="txtProvincia2" ClientSideEvents-KeyPress="Get_Prov2">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnProvinciaSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Prov22"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvProvincia2" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvProvincia2" 
                                KeyFieldName="Code" OnCustomCallback="gdvProvincia2_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvProvincia2_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Provincia" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkProvincia2" EndCallback="EndProvinciaSearch2"/>
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
                                        <dx:ASPxButton ID="ASPxButton6" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProvinciaOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkProvincia2" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton7" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProvinciaCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProvincia2" />
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




    <dx:ASPxPopupControl ID="ppcDistritoSearch" runat="server" 
        ClientInstanceName="ppcDistritoSearch" FooterText=" " HeaderText="Buscar Distrito" 
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
                                        Distrito:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtDistrito" runat="server" Width="100%" 
                                            ClientInstanceName="txtDistrito" ClientSideEvents-KeyPress="Get_Dist">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDistritoSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnDistritoSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Dist1"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvDistrito" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvDistrito" 
                                KeyFieldName="Code" OnCustomCallback="gdvDistrito_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvDistrito_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Distrito" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkDistrito" EndCallback="EndDistritoSearch"/>
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
                                        <dx:ASPxButton ID="btnDistritoOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnDistritoOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkDistrito" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDistritoCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnDistritoCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelDistrito" />
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

     <dx:ASPxPopupControl ID="ppcDistritoSearch2" runat="server" 
        ClientInstanceName="ppcDistritoSearch2" FooterText=" " HeaderText="Buscar Distrito" 
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
                          <%--  <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td style="width:105px">
                                        Distrito:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtDistrito2" runat="server" Width="100%" 
                                            ClientInstanceName="txtDistrito2" ClientSideEvents-KeyPress="Get_Dist2">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton8" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnDistritoSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Dist22"/>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvDistrito2" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvDistrito2" 
                                KeyFieldName="Code" OnCustomCallback="gdvDistrito2_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvDistrito2_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="Code" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Distrito" FieldName="Name" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkDistrito2" EndCallback="EndDistritoSearch2"/>
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
                                        <dx:ASPxButton ID="ASPxButton9" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnDistritoOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkDistrito2" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton10" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnDistritoCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelDistrito2" />
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
                                    <td id="Client" style="width:105px">
                                        Código:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtParClient" runat="server" Width="100%" 
                                            ClientInstanceName="txtParClient">
                                            <ClientSideEvents KeyUp="Get_Client"/>
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
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lista de Precios" FieldName="ListNum" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Vendedor Asignado" FieldName="SlpCode" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="0">
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
        <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
        </dx:ASPxHiddenField>
        <dx:ASPxCallback ID="clbOperation" runat="server" 
            ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <%--<ClientSideEvents CallbackComplete="Com_Operation" />--%>
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

