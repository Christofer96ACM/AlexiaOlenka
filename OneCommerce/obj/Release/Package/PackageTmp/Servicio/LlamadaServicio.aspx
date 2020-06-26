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

    <dx:ASPxFormLayout runat="server" ID="frlMain" Height="800px"
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
                                                            <dx:ASPxButtonEdit ID="bteCustomer" runat="server" ReadOnly="true"
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
                                                            <%--Nro. Documento:--%></td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDocNum" runat="server" Visible="false" 
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
                                                            <dx:ASPxTextBox ID="txtCustomerName" runat="server"  ReadOnly="true"
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
                                                            <dx:ASPxTextBox ID="txttelf" runat="server"  ReadOnly="true"
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
                                                                    <dx:ListEditItem Selected="True" Text="Bajo" Value="L" />
                                                                    <dx:ListEditItem Text="Medio" Value="M" />
                                                                    <dx:ListEditItem Text="Alto" Value="H" />
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            Persona de Contacto:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="txtcontctCode1" runat="server" 
                                                                ClientInstanceName="txtcontctCode1" Width="100%" OnCallback="txtcontctCode1_Callback">
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Id Llamada: </td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtidllamada" runat="server"  ReadOnly="true"
                                                                ClientInstanceName="txtidllamada" Width="100%">
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
                                                    <%--<tr>
                                                        
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Calle:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxMemo ID="txtStreets1" runat="server" Width="140px" Height="40px"
                                                                ClientInstanceName="txtStreets1" Font-Bold="true">
                                                            </dx:ASPxMemo>
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td style="width:140px">
                                                            ID Dirección:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxComboBox ID="cbbAddress" runat="server" Width="140px"
                                                                ClientInstanceName="cbbAddress" OnCallback="cbbAddress_Callback">
                                                                <ClientSideEvents SelectedIndexChanged="cambio_direccion" />
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Departamento:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDepartamento1" runat="server" Width="140px" ReadOnly="true"
                                                                ClientInstanceName="txtDepartamento1">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td style="width:140px">
                                                            Provincia:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtProvincia1" runat="server" Width="140px" ReadOnly="true"
                                                                ClientInstanceName="txtProvincia1">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Distrito:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtDistrito1" runat="server" Width="140px" ReadOnly="true"
                                                                ClientInstanceName="txtDistrito1">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td style="width:140px">
                                                            Calle:</td>
                                                        <td style="width:140px" >
                                                            <dx:ASPxMemo ID="txtStreets1" runat="server" Width="140px"  ReadOnly="true"
                                                                ClientInstanceName="txtStreets1">
                                                            </dx:ASPxMemo>
                                                        </td>
                                                         
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            </td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtguia" runat="server" Width="140px" ReadOnly="true"
                                                                ClientInstanceName="txtguia" Visible="true">
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
                                                           <dx:ASPxButtonEdit ID="txtmanufSN1" runat="server"  ReadOnly="true"
                                                                ClientInstanceName="txtmanufSN1" Width="140px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Tarjeta de Equipo">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="ShowCardSearch" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Creado el:</td>
                                                        
                                                        <td style="width:140px">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <dx:ASPxDateEdit ID="txtcreateDate1" runat="server"  ReadOnly="true"
                                                                          ClientInstanceName="txtcreateDate1" Width="100%">
                                                                        </dx:ASPxDateEdit>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxTextBox ID="txtcreatetime" runat="server"  ReadOnly="true"
                                                                          ClientInstanceName="txtcreatetime" Width="100%">
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                           Número de Serie:</td>
                                                        <td style="width:140px">
                                                            <dx:ASPxTextBox ID="txtinternalSN" runat="server" Width="100%" ReadOnly="true"
                                                                ClientInstanceName="txtinternalSN" DisplayFormatString="c2" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Cerrado el:</td>
                                                        <td style="width:140px">
                                                             <table>
                                                                <tr>
                                                                    <td>
                                                                        <dx:ASPxDateEdit ID="txtcloseDate1" runat="server" Width="100%" ReadOnly="true"
                                                                          ClientInstanceName="txtcloseDate1" Visible="true">
                                                                         </dx:ASPxDateEdit>
                                                                    </td>
                                                                    <td>
                                                                        <dx:ASPxTextBox ID="txtclosetime" runat="server"  ReadOnly="true"
                                                                          ClientInstanceName="txtclosetime" Width="100%">
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                            Articulo:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxTextBox ID="txtitemCode" runat="server" Width="100%" ReadOnly="true"
                                                                ClientInstanceName="txtitemCode" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Nro. de Contrato:</td>
                                                        <td style="width:140px; text-align:center">
                                                            <dx:ASPxTextBox ID="txtnumContrato" runat="server" Width="100%" ReadOnly="true"
                                                                ClientInstanceName="txtnumContrato" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:160px">
                                                            Descripcion:</td>
                                                        <td style="width:140px; text-align:center">
                                                           <dx:ASPxTextBox ID="txtItemName" runat="server" Width="100%" ReadOnly="true"
                                                                ClientInstanceName="txtItemName" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                           <%--Fecha Final:--%></td>
                                                        <td style="width:140px; text-align:center">
                                                           <dx:ASPxTextBox ID="txtcntrctDate" runat="server" Width="100%" ReadOnly="true"
                                                                ClientInstanceName="txtcntrctDate" Visible="false">
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
                                                        <td style="width:140px; font-weight:bold;">
                                                            Asunto:</td>
                                                        <td style="width:460px; text-align:center" colspan="4">
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
                                                        <td colspan="5" style="width:600px; text-align:center">
                                                            <dx:ASPxGridView ID="gdvTecnicos" runat="server" AutoGenerateColumns="False" Width="640px"
                                                                ClientInstanceName="gdvTecnicos" KeyFieldName="LineNum" OnCommandButtonInitialize="gdvTecnicos_CommandButtonInitialize"
                                                                OnCustomCallback="gdvTecnicos_CustomCallback" OnRowUpdating="gdvTecnicos_RowUpdating" OnDataBinding="gdvTecnicos_DataBinding"
                                                                OnRowInserting="gdvTecnicos_RowInserting" OnCellEditorInitialize="gdvTecnicos_CellEditorInitialize" OnRowDeleting="gdvTecnicos_RowDeleting">
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="0" Width="120px">
                                                                        <NewButton Visible="True">
                                                                        </NewButton>
                                                                        <EditButton Visible="true">
                                                                        </EditButton>
                                                                        <DeleteButton Visible="true">
                                                                        </DeleteButton>
                                                                        <CellStyle Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Linea" PropertiesTextEdit-ClientInstanceName="LineNum"
                                                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="100px" 
                                                                        FieldName="LineNum">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataButtonEditColumn Caption="Codigo Tecnico" FieldName="ID"
                                                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                                        <PropertiesButtonEdit ClientInstanceName="bteCode">
                                                                            <Buttons>
                                                                                <dx:EditButton ToolTip="Buscar Tecnico">
                                                                                </dx:EditButton>
                                                                            </Buttons>
                                                                            <Style Font-Size="8pt">
                                                                            </Style>
                                                                            <ClientSideEvents ButtonClick="Show_TecnicoSearch"/>
                                                                        </PropertiesButtonEdit>
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataButtonEditColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Nombre Técnico" PropertiesTextEdit-ClientInstanceName="Tecnico"
                                                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="400px" 
                                                                        FieldName="Tecnico">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:ASPxGridView>
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
      <dx:ASPxPopupControl ID="ppcLotesNumber" runat="server" 
        ClientInstanceName="ppcLotesNumber" FooterText=" " HeaderText="Seleccionar Lotes" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="220px" Modal="true" Height="200px"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
                <table border="0" style="width:100%">
                    <tr>
                        <td>
                            <table style="width:100%;" class="tablespace">
                                <tr>
                                    <td id="Td10" style="width:105px">
                                        </td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="100%" 
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
                            <dx:ASPxGridView ID="gdvLotes" runat="server" Width="100%" 
                                    AutoGenerateColumns="False" ClientInstanceName="gdvLotes" 
                                    KeyFieldName="Lote" OnCustomCallback="gdvLotes_CustomCallback" 
                                    KeyboardSupport="True" OnDataBinding="gdvLotes_DataBinding" 
                                    OnCellEditorInitialize="gdvLotes_CellEditorInitialize" 
                                    OnCommandButtonInitialize="gdvLotes_CommandButtonInitialize"
                                    OnRowUpdating="gdvLotes_RowUpdating">
                                    <Columns>
                                        <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                            VisibleIndex="0" Width="60px">
                                            <EditButton Visible="True">
                                            </EditButton>
                                            <CellStyle Font-Size="8pt">
                                            </CellStyle>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="Lote" FieldName="Lote" 
                                            ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                            VisibleIndex="0" Width="60px">
                                            <Settings AllowSort="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Numero Interno" FieldName="SysNumber" 
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="20px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Stock" FieldName="Stock" 
                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="30px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fecha Venc." FieldName="DueDate" 
                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="40px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Cantidad" 
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="30px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
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
                                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OK_Lotes" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelLotes" />
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







    <dx:ASPxPopupControl ID="ppcServicioSearch" runat="server" 
        ClientInstanceName="ppcServicioSearch" FooterText=" " HeaderText="Buscar Servicio" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="700px" Modal="true"
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
                                    <td id="Client2" style="width:50px">
                                        Cliente:</td>
                                    <td style="width:100px">
                                        <dx:ASPxTextBox ID="txtCliente" runat="server" Width="100px" 
                                            ClientInstanceName="txtCliente">
                                            <ClientSideEvents KeyUp="Get_Service2" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td id="Client3" style="width:50px">
                                        Artículo:</td>
                                    <td style="width:100px">
                                        <dx:ASPxTextBox ID="txtProducto" runat="server" Width="100px" 
                                            ClientInstanceName="txtProducto">
                                            <ClientSideEvents KeyUp="Get_Service2" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td id="Client4" style="width:50px">
                                        Fecha Inicio:</td>
                                    <td style="width:100px">
                                        <dx:ASPxDateEdit ID="dteFecha" runat="server" Width="100px" 
                                            ClientInstanceName="dteFecha">
                                            <ClientSideEvents DateChanged="Get_Service1" />
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td id="cli" style="width:50px">
                                        Fecha Fin:</td>
                                    <td style="width:100px">
                                        <dx:ASPxDateEdit ID="dteFecha2" runat="server" Width="100px" 
                                            ClientInstanceName="dteFecha2">
                                            <ClientSideEvents DateChanged="Get_Service1" />
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteServicioSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteServicioSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Service" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvServicio" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvServicio" 
                                KeyFieldName="CallId" OnCustomCallback="gdvServicio_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvServicio_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Id Llamada" FieldName="CallId" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="30px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Código Art." FieldName="ItemCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Código Cliente" FieldName="CardCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre" FieldName="CardName" 
                                        ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nro. Serie Fabricante" FieldName="SerieFab" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nro. Serie Interno" FieldName="SerieInt" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Grupo" FieldName="ItmsGrpCod" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Address" FieldName="IdDireccion" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Calle" FieldName="Street" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Guia" FieldName="NumDoc" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Departamento" FieldName="State" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Provincia" FieldName="U_DXP_BIZ_PROV" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Distrito" FieldName="U_DXP_BIZ_DIST" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Asunto" FieldName="Asunto" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Estado" FieldName="Estado" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Prioridad" FieldName="Prioridad" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Creacion" FieldName="Creacion" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="16">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cerrado" FieldName="Cerrado" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="17">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NroContrato" FieldName="NroContrato" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="18">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Origen" FieldName="Origen" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="19">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TipoProblema" FieldName="TipoProblema" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="20">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tecnico" FieldName="Tecnico" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="21">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DetalleServicio" FieldName="DetalleServicio" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="22">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Comentario" FieldName="Comentario" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="23">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Resolucion" FieldName="Resolucion" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="24">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Celular" FieldName="Cellular" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="25">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ContactPerson" FieldName="ContactPerson" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="26">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ContactPerson" FieldName="AddressType" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="27">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TecnicoAux" FieldName="U_GOS_TECN1" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="28">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TecnicoAux" FieldName="U_GOS_TECN2" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="29">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TecnicoAux" FieldName="U_GOS_TECN3" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="30">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TecnicoAux" FieldName="U_GOS_TECN4" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="31">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TecnicoAux" FieldName="U_GOS_TECN5" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="32">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TecnicoAux" FieldName="U_GOS_TECN6" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="33">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="CreateTime" FieldName="createtime" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="33">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="CloseTime" FieldName="closetime" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="33">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="okServicio"/>
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
                                        <dx:ASPxButton ID="btnServicioOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnServicioOk" AutoPostBack="False">
                                            <ClientSideEvents Click="okServicio" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnServicioCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnServicioCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelServicio" />
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
    <dx:ASPxPopupControl ID="ppcCardsSearch" runat="server" 
        ClientInstanceName="ppcCardsSearch" FooterText=" " HeaderText="Buscar Tarjeta de Equipo" 
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
                                    <td id="Client1" style="width:105px">
                                        Código:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtProduct" runat="server" Width="100%" 
                                            ClientInstanceName="txtProduct">
                                            <ClientSideEvents KeyUp="Get_Product1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteProductSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteProductSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Product" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvCards" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvCards" 
                                KeyFieldName="ItemCode" OnCustomCallback="gdvCards_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvCards_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="ItemCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nro. Serie Fabricante" FieldName="Seriefabricante" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nro. Serie Interno" FieldName="SerieInterna" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Grupo" FieldName="ItmsGrpCod" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tienda" FieldName="instLction" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkCards" EndCallback="EndClientSearch"/>
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
                                        <dx:ASPxButton ID="btnCardsOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnCardsOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkCards" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnCardsCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnCardsCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelCards" />
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

     <dx:ASPxPopupControl ID="ppcRecursos" runat="server" 
        ClientInstanceName="ppcRecursos" FooterText=" " HeaderText="Buscar Articulos de LLamada de Servicio" 
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
                                
                            </table>
                        </td>
                    </tr>
                    <tr>
                        
                                            <td colspan="6">
                                                <dx:ASPxGridView ID="gdvdln1" runat="server" AutoGenerateColumns="False" Width="1022px"
                                                    ClientInstanceName="gdvdln1" KeyFieldName="LineNum"
                                                    OnCellEditorInitialize="gdvdln1_CellEditorInitialize" 
                                                    OnRowInserting="gdvdln1_RowInserting"                                                    
                                                    OnRowValidating="gdvdln1_RowValidating" 
                                                    OnRowDeleting="gdvdln1_RowDeleting" 
                                                    OnCustomCallback="gdvdln1_CustomCallback"
                                                    OnCommandButtonInitialize="gdvdln1_CommandButtonInitialize"
                                                    OnHtmlRowPrepared="gdvdln1_HtmlRowPrepared" 
                                                    OnRowUpdating="gdvdln1_RowUpdating"
                                                    OnAfterPerformCallback="gdvdln1_AfterPerformCallback"
                                                    OnHtmlCommandCellPrepared="gdvdln1_HtmlCommandCellPrepared"
                                                    OnDataBinding="gdvdln1_DataBinding">
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
                                                                    <dx:EditButton ToolTip="Buscar Artículo" Visible="true">
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
                                                        <dx:GridViewDataButtonEditColumn Caption="Descripción" FieldName="ItemName" 
                                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="260px">
                                                            <PropertiesButtonEdit ClientInstanceName="bteItemName">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Artículo" Visible="true">
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
                                                          <dx:GridViewDataTextColumn Caption="Marca" FieldName="U_GOS_MARCA"
                                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                                                <PropertiesTextEdit ClientInstanceName="txtmarca"
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
                                                        <dx:GridViewDataTextColumn Caption="Cantidad" ShowInCustomizationForm="True" 
                                                            VisibleIndex="5" Width="70px" FieldName="Quantity">
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
                                                               
                                                            </PropertiesTextEdit>
                                                            <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                            <CellStyle ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="8pt">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                      
                                                       
                                                        
                                                        <dx:GridViewDataTextColumn Caption="Gestion de Articulo" FieldName="IssueMthd"
                                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
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
                                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="260px">
                                                            <PropertiesButtonEdit ClientInstanceName="bteSerialNumber">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Seleccionar Serie" Visible="true">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <Style Font-Size="8pt">
                                                                </Style>
                                                                <ClientSideEvents ButtonClick="ShowPoput"/>
                                                            </PropertiesButtonEdit>
                                                            <EditCellStyle Font-Size="8pt">
                                                            </EditCellStyle>
                                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                            </CellStyle>
                                                        </dx:GridViewDataButtonEditColumn>
                                                        <dx:GridViewDataTextColumn  ShowInCustomizationForm="True" VisibleIndex="12" 
                                                            FieldName="TreeType" Width="0px" >
                                                            <PropertiesTextEdit ClientInstanceName="TreeType" Width="0px">
                                                           <%-- <Style CssClass="DisplayNone"></Style>--%>
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn  ShowInCustomizationForm="True" VisibleIndex="13" 
                                                            FieldName="DetalleServicio" Width="0px">
                                                            <PropertiesTextEdit ClientInstanceName="DetalleServicio" Width="0px">
                                                            <Style CssClass="DisplayNone"></Style>
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle CssClass="DisplayNone" />
                                                            <EditCellStyle CssClass="DisplayNone" />
                                                            <CellStyle CssClass="DisplayNone" />
                                                            <FilterCellStyle CssClass="DisplayNone" />
                                                            <FooterCellStyle CssClass="DisplayNone" />
                                                            <GroupFooterCellStyle CssClass="DisplayNone" />
                                                        </dx:GridViewDataTextColumn>
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
                                                    <ClientSideEvents BeginCallback="Beg_CallbackLines" EndCallback="End_CallbackLines" />
                                                </dx:ASPxGridView>
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
                    <table border="0" style="width:100%">
                        <tr>
                            <td>
                                <table class="tablespace" style="width:100%">
                                    <tr>
                                        <td id="Product" style="width:105px">
                                            Código/Descripción:</td>
                                        <td style="width:5px"></td>
                                        <td style="width:300px">
                                            <dx:ASPxTextBox ID="txtParProduct" runat="server" Width="100%" 
                                                ClientInstanceName="txtParProduct">
                                                <ClientSideEvents KeyPress="Get_Prod" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:10px"></td>
                                        <td id="ProductMarc" style="width:60px">
                                            Marca:</td>
                                        <td style="width:300px">
                                            <dx:ASPxTextBox ID="txtmarcabus" runat="server" Width="100%" 
                                                ClientInstanceName="txtmarcabus">
                                                <ClientSideEvents KeyPress="Get_Prod" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnProductSearch" runat="server" Text="Buscar" Width="100%" 
                                                ClientInstanceName="btnProductSearch" AutoPostBack="False">
                                                <ClientSideEvents Click="Get_Prod" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:50px">
                                            <%--<dx:ASPxCheckBox ID="chkKit" runat="server" CheckState="Unchecked" 
                                                ClientInstanceName="chkKit" Text="Combos:" TextAlign="Left">
                                                <ClientSideEvents CheckedChanged="Set_Kit"/>
                                            </dx:ASPxCheckBox>--%>
                                        </td>
                                        <td style="width:200px">
                                           
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
                                         <dx:GridViewDataTextColumn Caption="Marca" FieldName="U_GOS_MARCA" 
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="290px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Stock" FieldName="OnHand" 
                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                       
                                        <dx:GridViewDataTextColumn Caption="Numero de Serie" FieldName="IssueMthd" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" Width="80px">
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
                                    <dx:GridViewDataTextColumn Caption="DetalleServicio" FieldName="DetalleServicio" 
                                        ShowInCustomizationForm="True" Visible="true" VisibleIndex="12" 
                                        Width="80px">
                                    </dx:GridViewDataTextColumn>
                                        <%--<dx:GridViewDataTextColumn Caption="Kit" FieldName="U_BF_CodKit" 
                                            ShowInCustomizationForm="True" Visible="false" VisibleIndex="7" Width="80px">
                                        </dx:GridViewDataTextColumn>--%>
                                    </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" 
                                        AllowSelectSingleRowOnly="True" />
                                    <ClientSideEvents ColumnSorting="SetParName" RowDblClick="OkProd" EndCallback="EndProdSearch"/>
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
                                                <ClientSideEvents Click="OkProd" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnProductCancel" runat="server" Text="Cancelar" Width="100%" 
                                                ClientInstanceName="btnProductCancel" AutoPostBack="False">
                                                <ClientSideEvents Click="CancelProd" />
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
                                            <ClientSideEvents KeyUp="Get_Client1" />
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
                                    <dx:GridViewDataTextColumn Caption="Cellular" FieldName="Cellular" 
                                        ShowInCustomizationForm="True" Visible="false" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>

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
    <dx:ASPxPopupControl ID="ppcTecnicoSearch" runat="server" 
        ClientInstanceName="ppcTecnicoSearch" FooterText=" " HeaderText="Buscar Técnico" 
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
                                    <td id="Client6" style="width:105px">
                                        Nombre:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txttec" runat="server" Width="100%" 
                                            ClientInstanceName="txttec">
                                            <ClientSideEvents KeyUp="Get_Tecnico1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Tecnico" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvTecnicosrch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvTecnicosrch" 
                                KeyFieldName="CardCode" OnCustomCallback="gdvTecnicosrch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvTecnicosrch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Técnico" FieldName="Tecnico" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkTecnico"/>
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
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkTecnico" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelTecnico" />
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

