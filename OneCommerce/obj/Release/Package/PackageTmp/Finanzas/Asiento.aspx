<%@ Page Title="Asiento" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Asiento.aspx.cs" Inherits="OneCommerce.Finanzas.Asiento" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Tools/JSAsiento.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity:"sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin:"anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" Height="800px" Width="1000"
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Registro en el Diario"  GroupBoxStyle-Caption-Font-Size="X-Large"
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
                                            <section class="sectablas" id="tab1" >
                                                <table id="tab1tabla1" >
                                               <tr>
                                                    <td style="width:80px">
                                                            Serie:</td>
                                                        <td style="width:40px">
                                                       
                                                       <dx:ASPxComboBox ID="cbbnumero" runat="server" EnableSynchronization="False"
                                                        ClientInstanceName="cbbnumero" Width="60px" 
                                                        IncrementalFilteringMode="Contains">
                                                        </dx:ASPxComboBox> </td>

                                                        <%-- 
                                                        <td style="width:20px">
                                                       
                                                       <dx:ASPxTextBox ID="txtnumero" runat="server" EnableSynchronization="False"
                                                        ClientInstanceName="txtnumero" Width="60px" 
                                                        IncrementalFilteringMode="Contains">
                                                        </dx:ASPxTextBox> </td>--%>

                                                    <td style="width:30px"></td>
                                                        <td style="width:80px">
                                                            Fecha de Contab.:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxDateEdit ID="txtRefDate" runat="server"  ReadOnly="false"
                                                                ClientInstanceName="txtRefDate" Width="120px">
                                                            </dx:ASPxDateEdit>
                                                        </td>
                                                     <td style="width:40px"></td>
                                                          <td style="width:80px">
                                                           Tipo de Cambio:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxCheckBox ID="chktipocamb" runat="server"  ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String"
                                                                ClientInstanceName="chktipocamb" Width="120px">
                                                                <ClientSideEvents CheckedChanged="checktipocambio" />
                                                            </dx:ASPxCheckBox>
                                                              
                                                        </td>
                                                   <td style="width:5px">
                                                       <dx:ASPxComboBox ID="cbbmoneda" runat="server" 
                                                                ClientInstanceName="cbbmoneda" Width="60px">
                                                        </dx:ASPxComboBox>
                                                   </td>
                                                   <td style="width:5px">
                                                            <dx:ASPxTextBox ID="txttipocambio" runat="server" 
                                                                ClientInstanceName="txttipocambio" Width="60px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                               </tr>

                                            
                                             <tr>
                                                 <td style="width:80px">
                                                 Fecha de Venc.:</td>
                                                 <td style="width:20px">
                                                   <dx:ASPxDateEdit ID="txtDueDate" runat="server"  ReadOnly="false"
                                                    ClientInstanceName="txtDueDate" Width="120px">
                                                   </dx:ASPxDateEdit>
                                                   </td>

                                                 <td style="width:30px"></td>
                                                  <td style="width:80px">
                                                    Fecha de Doc.:</td>
                                                    <td style="width:20px">
                                                    <dx:ASPxDateEdit ID="txtTaxDate" runat="server"  ReadOnly="false"
                                                     ClientInstanceName="txtTaxDate" Width="120px">
                                                      </dx:ASPxDateEdit>
                                                     </td>

                                                  <td style="width:40px"> </td>
                                                    <td style="width:80px">
                                                     Anular:</td>
                                                   <td style="width:20px">
                                                   <dx:ASPxCheckBox ID="chkanular" runat="server" 
                                                     ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String"
                                                     ClientSideEvents-CheckedChanged="checkAnular"
                                                      ClientInstanceName="chkanular" Width="10px">
                                                   </dx:ASPxCheckBox>
                                                    </td>

                                                 <td style="width:5px">
                                                    <dx:ASPxDateEdit ID="txtanular" runat="server"  ReadOnly="false"
                                                     ClientInstanceName="txtanular" Width="60px">
                                                     </dx:ASPxDateEdit>
                                                   </td>


                                             </tr>

                                                    

                                             <tr>
                                                 <td style="width:80px"> 
                                                  Comentarios:</td>
                                                  <td style="width:20px">
                                                    <dx:ASPxMemo ID="txtmemo" runat="server" Width="120px" Height="40px"
                                                    ClientInstanceName="txtmemo" Font-Bold="true">
                                                    </dx:ASPxMemo>
                                                   </td>

                                                  <td style="width:30px"></td>
                                                    <td style="width:80px">
                                                      Número Origen: </td>
                                                     <td style="width:20px">
                                                     <dx:ASPxTextBox ID="txtBaseRef" runat="server"   ReadOnly="false"
                                                      ClientInstanceName="txtBaseRef" Width="120px">
                                                      </dx:ASPxTextBox>
                                                        </td>

                                                   <td style="width:40px"> </td>
                                                    <td style="width:80px">
                                                      Ajuste Trans.(Periodo 13.):</td>
                                                     <td style="width:20px">
                                                      <dx:ASPxCheckBox ID="chkajuste" runat="server" 
                                                       alueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String"
                                                        ClientInstanceName="chkajuste" Width="10px">
                                                      </dx:ASPxCheckBox>
                                                        </td>

                                             </tr>
                                                    <tr>
                                                        <td style="width:80px">
                                                           N° Transacción:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtTransId" runat="server"   ReadOnly="false"
                                                                ClientInstanceName="txtTransId" Width="120px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                        <td style="width:30px"></td>
                                                        <td style="width:80px">
                                                            Indicador:</td>
                                                        <td style="width:20px; text-align:center">
                                                            <dx:ASPxComboBox ID="cbbIndicator" runat="server" Width="120px"
                                                                ClientInstanceName="cbbIndicator" Visible="true">
                                                            </dx:ASPxComboBox>
                                                        </td>

                                                       <td style="width:40px"> </td>
                                                          <td style="width:80px">
                                                           Impuesto Aut.:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxCheckBox ID="chkimpu" runat="server" 
                                                                alueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String"
                                                                ClientInstanceName="chkimpu" Width="10px">
                                                            </dx:ASPxCheckBox>
                                                        </td>

                                                    </tr>
                                                   
                                                    <tr>
                                                        <td style="width:80px">
                                                            Proyecto:</td>
                                                         <td style="width:20px">
                                                            <dx:ASPxButtonEdit ID="bteProject" runat="server" 
                                                                ClientInstanceName="bteProject" Width="120px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Proyecto">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_ProyectSearch" />
                                                            </dx:ASPxButtonEdit> </td>


                                                         <td style="width:30px"> </td>
                                                          <td style="width:80px">
                                                            Código Trans:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxComboBox ID="cbbTransCode" runat="server" Width="120px"
                                                                ClientInstanceName="cbbTransCode" Visible="true">
                                                            </dx:ASPxComboBox>
                                                        </td>

                                                        <td style="width:40px"> </td>
                                                        <td style="width:80px">
                                                           Gestionar Ret. Imp.:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxCheckBox ID="chkretencion" runat="server" 
                                                                alueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String"
                                                                  ClientInstanceName="chkretencion" Width="10px">
                                                            </dx:ASPxCheckBox>
                                                        </td>

                                                       
                                                    </tr>
                                                    


                                                    <tr> 
                                                         <td style="width:80px">
                                                              Referencia 1:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtRef1" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtRef1">
                                                            </dx:ASPxTextBox>
                                                        </td>


                                                        <td style="width:30px"> </td>
                                                         <td style="width:80px">
                                                            Referencia 2:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtRef2" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtRef2">
                                                            </dx:ASPxTextBox>

                                                        </td>

                                                        <td style="width:40px"> </td>
                                                         <td style="width:80px">
                                                         Referencia 3:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtRef3" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtRef3">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                         </tr>
                                                     
                                                           <tr>
                                                              <td style="width:80px">
                                                              Estado Doc.LE:</td>
                                                        <td style="width:20px">
                                                           <dx:ASPxComboBox ID="cbbestadodoc" runat="server" Width="120px"
                                                                ClientInstanceName="cbbestadodoc" Visible="true">
                                                            </dx:ASPxComboBox>
                                                        </td>


                                                        <td style="width:30px"> </td>
                                                         <td style="width:80px">
                                                            Periodo Libro Elec.:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtlibroelec" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtlibroelec">
                                                            </dx:ASPxTextBox>

                                                        </td>

                                                        <td style="width:40px"> </td>
                                                         <td style="width:80px">
                                                         N° Doc. Destino:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtdocdes" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtdocdes">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                         </tr>

                                                 <tr>
                                                  <td style="width:80px"></td>
                                                   <td style="width:20px">
                                                            <br /></td>
                                                     <td style="width:30px"></td>
                                                        <td style="width:80px"></td>
                                                         <td style="width:20px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:80px"></td>
                                                        <td style="width:20px">
                                                            <br /></td>
                                                      </tr>

                                                    <tr>
                                                     <td style="width:80px">
                                                     <b> Modo de  Tratamiento:</b></td></tr>

                                                    <tr>
                                                         <td style="width:80px">
                                                            Cuenta Mayor:</td>
                                                       
                                                         <td style="width:20px">
                                                            <dx:ASPxButtonEdit ID="txtShortname" runat="server" 
                                                                ClientInstanceName="txtShortname" Width="120px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch2" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>

                                                         <td style="width:30px"> </td>
                                                         <td style="width:80px">
                                                            Cuenta Mayor Nom.</td>
                                                        <td style="width:20px">
                                                              <dx:ASPxTextBox ID="txtAcctName" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtAcctName">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                          <td style="width:40px"> </td>
                                                        <td style="width:80px">
                                                            Cuenta Asociada</td>
                                                        <td style="width:20px">
                                                              <dx:ASPxTextBox ID="txtAccount" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtAccount">
                                                            </dx:ASPxTextBox>
                                                        </td>


                                                    </tr>
                                                     

                                                    <tr>
                                                        <td style="width:80px">
                                                            Referencia 1:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtRefmodo1" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtRefmodo1">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:30px"></td>
                                                        <td style="width:80px">
                                                            Referencia 2:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtRefmodo2" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtRefmodo2">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"> </td>
                                                         <td style="width:80px">
                                                            Referencia 3:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtRefmodo3" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtRefmodo3">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        </tr>

                                                    <tr>
                                                      
                                                        <td style="width:80px">
                                                        
                                                            Cuenta Contrapartida</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtcuentacontra" runat="server" Width="120px"  ReadOnly="false"
                                                                ClientInstanceName="txtcuentacontra">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                        <td style="width:30px"></td>
                                                        <td style="width:80px">
                                                           Débito (ME): </td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtdebitome" runat="server" Width="120px"  ReadOnly="false"
                                                                ClientInstanceName="txtdebitome">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:80px">
                                                            Crédito (ME):</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtcreditome" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtcreditome">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                     

                                                    <tr>
                                                        <td style="width:80px">
                                                           Débito:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtdebito" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtdebito">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                        <td style="width:30px"></td>
                                                        <td style="width:80px">
                                                            Crédito:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtcredito" runat="server" Width="120px"  ReadOnly="false"
                                                                ClientInstanceName="txtcredito">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                        <td style="width:40px"> </td>
                                                         <td style="width:80px">
                                                           Débito (MS):</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtdebitoms" runat="server" Width="120px"  ReadOnly="false"
                                                                ClientInstanceName="txtdebitoms">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>

                                                   

                                                    <tr>
                                                        <td style="width:80px">
                                                        
                                                            Crédito (MS):</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtcreditoms" runat="server" Width="120px"  ReadOnly="false"
                                                                ClientInstanceName="txtcreditoms">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                         <td style="width:30px"> </td>
                                                         <td style="width:80px">
                                                            Fecha Contab.:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxDateEdit ID="txtRefDatemodo" runat="server"   ReadOnly="false"
                                                                ClientInstanceName="txtRefDatemodo" Width="120px">
                                                            </dx:ASPxDateEdit>
                                                        </td>

                                                        <td style="width:40px"></td>
                                                        <td style="width:80px">
                                                            Fecha Venc.:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxDateEdit ID="txtDueDatemodo" runat="server"  ReadOnly="false"
                                                                ClientInstanceName="txtDueDatemodo" Width="120px">
                                                            </dx:ASPxDateEdit>
                                                            </td>
                                                    </tr>
                                                    
                        

                                                    <tr>
                                                          
                                                        <td style="width:80px">
                                                            Fecha Documento:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxDateEdit ID="txtTaxDatemodo" runat="server"  ReadOnly="false"
                                                                ClientInstanceName="txtTaxDatemodo" Width="120px">
                                                            </dx:ASPxDateEdit>
                                                        </td>

                                                         <td style="width:30px"></td>
                                                        <td style="width:80px">
                                                            Comentarios:</td>
                                                        <td style="width:20px">
                                                            <dx:ASPxTextBox ID="txtlinememomodo" runat="server" Width="120px" ReadOnly="false"
                                                                ClientInstanceName="txtlinememomodo">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                        <td style="width:40px"></td>
                                                          <td style="width:80px">
                                                            Proyecto:</td>
                                                       
                                                         <td style="width:20px">
                                                            <dx:ASPxButtonEdit ID="txtProjectmodo" runat="server" 
                                                                ClientInstanceName="txtProjectmodo" Width="120px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Proyecto">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_ProyectSearch2" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>

                                                    </tr>
                                                   <tr>

                                                  <td style="width:80px"></td>
                                                   <td style="width:20px">
                                                            <br /></td>
                                                     <td style="width:30px"></td>
                                                        <td style="width:80px"></td>
                                                         <td style="width:20px">
                                                            <br />
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:80px"></td>
                                                        <td style="width:20px">
                                                            <br /></td>
                                                      </tr>


                                                      <tr>
                                                        <td colspan="8" style="width:800px; text-align:center">
                                                            <dx:ASPxGridView ID="gdvAsiento" runat="server" AutoGenerateColumns="False" Width="940px"
                                                                ClientInstanceName="gdvAsiento" KeyFieldName="LineNum" OnCommandButtonInitialize="gdvAsiento_CommandButtonInitialize"
                                                                OnCustomCallback="gdvAsiento_CustomCallback" OnRowUpdating="gdvAsiento_RowUpdating" OnDataBinding="gdvAsiento_DataBinding"
                                                                OnRowInserting="gdvAsiento_RowInserting" OnCellEditorInitialize="gdvAsiento_CellEditorInitialize" OnRowDeleting="gdvAsiento_RowDeleting"
                                                                OnHtmlRowPrepared="gdvAsiento_HtmlRowPrepared"  SettingsBehavior-AllowSelectSingleRowOnly="true" OnCustomButtonCallback="gdvAsiento_CustomButtonCallback">
                                                                <Columns>
                                                                    <dx:GridViewCommandColumn Caption="Operación" ShowInCustomizationForm="True" 
                                                                        VisibleIndex="0" Width="150px">
                                                                         <NewButton Visible="True">
                                                                        </NewButton>
                                                                        <EditButton Visible="true">
                                                                        </EditButton>
                                                                        <DeleteButton Visible="true">
                                                                        </DeleteButton>
                                                                        <CustomButtons >
                                                                             <dx:GridViewCommandColumnCustomButton ID="Ver">
                                                                              </dx:GridViewCommandColumnCustomButton>
                                                                        </CustomButtons>
                                                                        
                                                                        <CellStyle Font-Size="8pt">
                                                                        </CellStyle>
                                                                    </dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Linea" PropertiesTextEdit-ClientInstanceName="LineNum"
                                                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="40px" 
                                                                        FieldName="LineNum">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataButtonEditColumn Caption="Código Cuenta" FieldName="ShortName"
                                                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                                        <PropertiesButtonEdit ClientInstanceName="ShortName">
                                                                            <Buttons>
                                                                                <dx:EditButton ToolTip="Buscar Cuenta">
                                                                                </dx:EditButton>
                                                                            </Buttons>
                                                                            <Style Font-Size="8pt">
                                                                            </Style>
                                                                            <ClientSideEvents ButtonClick="Show_AccountSearch" />
                                                                        </PropertiesButtonEdit>
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataButtonEditColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Cuenta Mayor" PropertiesTextEdit-ClientInstanceName="AcctName"
                                                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="100px" 
                                                                        FieldName="AcctName">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Cuenta Asoc." PropertiesTextEdit-ClientInstanceName="Account"
                                                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="80px" 
                                                                        FieldName="Account">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Débito(ME)" PropertiesTextEdit-ClientInstanceName="Debit_ME"
                                                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="70px" 
                                                                        FieldName="Debit_ME">
                                                                    </dx:GridViewDataTextColumn>
                                                                     <dx:GridViewDataTextColumn Caption="Crédito(ME)" PropertiesTextEdit-ClientInstanceName="Credit_ME"
                                                                        ShowInCustomizationForm="True" VisibleIndex="6" Width="70px" 
                                                                        FieldName="Credit_ME">
                                                                    </dx:GridViewDataTextColumn>
                                                                     <dx:GridViewDataTextColumn Caption="Débito" PropertiesTextEdit-ClientInstanceName="Debit"
                                                                        ShowInCustomizationForm="True" VisibleIndex="7" Width="60px" 
                                                                        FieldName="Debit">
                                                                    </dx:GridViewDataTextColumn>
                                                                     <dx:GridViewDataTextColumn Caption="Crédito" PropertiesTextEdit-ClientInstanceName="Credit"
                                                                        ShowInCustomizationForm="True" VisibleIndex="8" Width="60px" 
                                                                        FieldName="Credit">
                                                                    </dx:GridViewDataTextColumn>
                                                                       <dx:GridViewDataTextColumn Caption="Débito(MS)" PropertiesTextEdit-ClientInstanceName="Debit_MS"
                                                                        ShowInCustomizationForm="True" VisibleIndex="9" Width="70px" 
                                                                        FieldName="Debit_MS">
                                                                    </dx:GridViewDataTextColumn>
                                                                     <dx:GridViewDataTextColumn Caption="Crédito(MS)" PropertiesTextEdit-ClientInstanceName="Credit_MS"
                                                                        ShowInCustomizationForm="True" VisibleIndex="10" Width="70px" 
                                                                        FieldName="Credit_MS">
                                                                    </dx:GridViewDataTextColumn>
                                                                     <dx:GridViewDataTextColumn Caption="Comentarios    " PropertiesTextEdit-ClientInstanceName="LineMemo"
                                                                        ShowInCustomizationForm="True" VisibleIndex="11" Width="100px" 
                                                                        FieldName="LineMemo">
                                                                    </dx:GridViewDataTextColumn>
                                                                     <dx:GridViewDataTextColumn Caption="Referencia 1" PropertiesTextEdit-ClientInstanceName="Ref1d"
                                                                        ShowInCustomizationForm="True" VisibleIndex="12" Width="100px" 
                                                                        FieldName="Ref1d">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Referencia 2" PropertiesTextEdit-ClientInstanceName="Ref2d"
                                                                        ShowInCustomizationForm="True" VisibleIndex="13" Width="100px" 
                                                                        FieldName="Ref2d">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Referencia 3" PropertiesTextEdit-ClientInstanceName="Ref3Line"
                                                                        ShowInCustomizationForm="True" VisibleIndex="14" Width="100px" 
                                                                        FieldName="Ref3Line">
                                                                    </dx:GridViewDataTextColumn>
                                                                   <dx:GridViewDataDateColumn Caption="Fecha Venc." PropertiesDateEdit-ClientInstanceName="DueDated"
                                                                     ShowInCustomizationForm="True" VisibleIndex="15" Width="80px" Visible="true"
                                                                     FieldName="DueDated">
                                                                     </dx:GridViewDataDateColumn>
                                                                    <dx:GridViewDataDateColumn Caption="Fecha Contab" PropertiesDateEdit-ClientInstanceName="RefDated"
                                                                     ShowInCustomizationForm="True" VisibleIndex="16" Width="80px" Visible="true"
                                                                     FieldName="RefDated">
                                                                     </dx:GridViewDataDateColumn>
                                                                    <dx:GridViewDataDateColumn Caption="Fecha Doc." PropertiesDateEdit-ClientInstanceName="TaxDated"
                                                                     ShowInCustomizationForm="True" VisibleIndex="17" Width="80px" Visible="true"
                                                                     FieldName="TaxDated">
                                                                     </dx:GridViewDataDateColumn>
                                                                   
                                                                     <dx:GridViewDataButtonEditColumn Caption="Proyecto" FieldName="Projectd"
                                                                        ShowInCustomizationForm="True" VisibleIndex="18" Width="60px">
                                                                        <PropertiesButtonEdit ClientInstanceName="Projectd">
                                                                            <Buttons>
                                                                                <dx:EditButton ToolTip="Buscar Proyecto">
                                                                                </dx:EditButton>
                                                                            </Buttons>
                                                                            <Style Font-Size="8pt">
                                                                            </Style>
                                                                            <ClientSideEvents ButtonClick="Show_ProyectSearch2" />
                                                                        </PropertiesButtonEdit>
                                                                        <EditCellStyle Font-Size="8pt">
                                                                        </EditCellStyle>
                                                                        <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataButtonEditColumn>
                                                                </Columns>
                                                                <SettingsEditing Mode="Inline"/>
                                                                <Settings HorizontalScrollBarMode="Visible" />
                                                                <ClientSideEvents CustomButtonClick="Ok_Detalle" />
                                                            </dx:ASPxGridView>
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
   
    <dx:ASPxPopupControl ID="ppcAccountSearch" runat="server" 
        ClientInstanceName="ppcAccountSearch" FooterText=" " HeaderText="Buscar Cuenta" 
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
                                    <td id="ClientParCaption6" style="width:105px">
                                        Número de Cuenta:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtcuenta" runat="server" Width="100%" 
                                            ClientInstanceName="txtcuenta">
                                            <ClientSideEvents KeyUp="Get_Cuenta1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Cuenta1" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvAccountsrch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvAccountsrch" 
                                KeyFieldName="AcctCode" OnCustomCallback="gdvAccountsrch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvAccountsrch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Número de Cuenta" FieldName="AcctCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre de cuenta" FieldName="AcctName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Saldo" FieldName="CurrTotal" 
                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cuenta Asociada" FieldName="FormatCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Proyecto" FieldName="Project" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkCuenta"/>
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
                                            <ClientSideEvents Click="OkCuenta" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnClientCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelCuenta" />
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

     <dx:ASPxPopupControl ID="ppcAccountSearch2" runat="server" 
        ClientInstanceName="ppcAccountSearch2" FooterText=" " HeaderText="Buscar Cuenta" 
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
                                    <td id="ClientParCaption9" style="width:105px">
                                        Número de Cuenta:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtcuenta2" runat="server" Width="100%" 
                                            ClientInstanceName="txtcuenta2">
                                            <ClientSideEvents KeyUp="Get_Cuenta2" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton7" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Cuenta2" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvAccountsrch2" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvAccountsrch2" 
                                KeyFieldName="AcctCode" OnCustomCallback="gdvAccountsrch2_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvAccountsrch2_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Número de Cuenta" FieldName="AcctCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre de cuenta" FieldName="AcctName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Saldo" FieldName="CurrTotal" 
                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cuenta Asociada" FieldName="FormatCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Proyecto" FieldName="Project" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkCuenta2"/>
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
                                        <dx:ASPxButton ID="btnClientOk2" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnClientOk2" AutoPostBack="False">
                                            <ClientSideEvents Click="OkCuenta2" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnCuentaCancel2" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnCuentaCancel2" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelCuenta2" />
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








    <dx:ASPxPopupControl ID="ppcProyectSearch" runat="server" 
        ClientInstanceName="ppcProyectSearch" FooterText=" " HeaderText="Buscar Proyecto" 
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
                                    <td id="ClientParCaption7" style="width:105px">
                                        Proyecto:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtPrjCode" runat="server" Width="100%" 
                                            ClientInstanceName="txtPrjCode">
                                            <ClientSideEvents KeyUp="Get_Proyect1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Proyect1" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvProyectsrch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvProyectsrch" 
                                KeyFieldName="AcctCode" OnCustomCallback="gdvProyectsrch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvProyectsrch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="PrjCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Proyecto" FieldName="PrjName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>      
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OKProyect"/>
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
                                        <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProyecttOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OKProyect" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton6" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProyectCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProyect" />
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
    <dx:ASPxPopupControl ID="ppcProyectSearch2" runat="server" 
        ClientInstanceName="ppcProyectSearch2" FooterText=" " HeaderText="Buscar Proyecto" 
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
                                    <td id="ClientParCaption8" style="width:105px">
                                        Proyecto:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtPrjCode2" runat="server" Width="100%" 
                                            ClientInstanceName="txtPrjCode2">
                                            <ClientSideEvents KeyUp="Get_Proyectp1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="bteClientSearch2" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="bteClientSearch2" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Proyectp1" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvProyect2srch" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvProyect2srch" 
                                KeyFieldName="AcctCode" OnCustomCallback="gdvProyect2srch_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvProyect2srch_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="PrjCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Proyecto" FieldName="PrjName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>      
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OKProyect2"/>
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
                                        <dx:ASPxButton ID="btnProyect2tOk" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProyect2tOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OKProyect2" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProyect2Cancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProyect2Cancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProyect2" />
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

    <dx:ASPxPopupControl ID="ppcAsientoSearch" runat="server" 
            ClientInstanceName="ppcAsientoSearch" FooterText=" " HeaderText="Buscar Asiento" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            RenderMode="Lightweight" ShowFooter="True" Width="800px" Modal="true"
            AllowDragging="True" PopupAnimationType="Fade">
            <ContentStyle>
                <Paddings PaddingBottom="0px" />
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl ID="ppcAsientoSearch13" runat="server" SupportsDisabledAttribute="True">
                    <table border="0"  style="width:100%">
                        <tr>
                            <td>
                                <table class="tablespace" style="width:100%">
                                    <tr>
                                        <td style="width:105px">
                                            Rango Fechas:</td>
                                        <td style="width:130px">
                                            <dx:ASPxDateEdit ID="dteDateIn" runat="server" Width="130px" 
                                                ClientInstanceName="dteDateIn">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:130px">
                                            <dx:ASPxDateEdit ID="dteDateFi" runat="server" Width="130px" 
                                                ClientInstanceName="dteDateFi">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:130px">
                                            Nro. Documento:</td>
                                        <td style="width:170px">
                                            <dx:ASPxTextBox ID="txtNumAtCards" runat="server" 
                                                ClientInstanceName="txtNumAtCards" Width="170px">
                                               <ClientSideEvents KeyUp="Get_Asiento" />
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:50px">
                                            <dx:ASPxButton ID="btnOinvSearch" runat="server" AutoPostBack="False" 
                                                ClientInstanceName="btnOinvSearch" Text="Buscar" Width="100%">
                                                <ClientSideEvents Click="Get_Asiento" />
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxGridView ID="gdvAsientoSearch" runat="server" Width="100%"
                                    AutoGenerateColumns="False" ClientInstanceName="gdvAsientoSearch" 
                                    KeyFieldName="TransId" OnCustomCallback="gdvAsientoSearch_CustomCallback" 
                                    KeyboardSupport="True" OnDataBinding="gdvAsientoSearch_DataBinding">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Series" FieldName="Series" 
                                            ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nro. Documento" FieldName="Number" 
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fecha Contab." FieldName="RefDate"
                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="d">
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fecha Venc." FieldName="DueDate"
                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="d">
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fecha Doc." FieldName="TaxDate"
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="d">
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Anulado" FieldName="AutoStorno" 
                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="60px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fecha Anulacion" FieldName="StornoDate"
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="d">
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Comentarios" FieldName="Memo" 
                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="70px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Referencia 1" FieldName="Ref1" 
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="200px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Referencia 2" FieldName="Ref2" 
                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                <Style HorizontalAlign="Right"></Style>
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Referencia 3" FieldName="Ref3" 
                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                <Style HorizontalAlign="Right"></Style>
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Estado Doc. LE" FieldName="U_GOS_ESTDOC_LE" 
                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                <Style HorizontalAlign="Right"></Style>
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Periodo Libro Elec." FieldName="U_GOS_FECHA_LE" 
                                            ShowInCustomizationForm="True" VisibleIndex="7" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="c2">
                                                <Style HorizontalAlign="Right"></Style>
                                            </PropertiesTextEdit>
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="N° Asiento Dest." FieldName="U_MSS_TransIdAD" 
                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="80px">
                                            <Settings AllowSort="False" />
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Cuenta Mayor"
                                         ShowInCustomizationForm="True" VisibleIndex="2" Width="0px" visible="false"
                                          FieldName="ShortName">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Caption="Cuenta Mayor" 
                                         ShowInCustomizationForm="True" VisibleIndex="3" Width="0px" visible="false"
                                          FieldName="AcctName">
                                         </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn Caption="Cuenta Asoc." 
                                           ShowInCustomizationForm="True" VisibleIndex="4" Width="0px"  visible="false"
                                           FieldName="Account">
                                            </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="Débito(ME)" 
                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="0px"  visible="false"
                                            FieldName="Debit_ME">
                                             </dx:GridViewDataTextColumn>
                                             <dx:GridViewDataTextColumn Caption="Crédito(ME)" 
                                           ShowInCustomizationForm="True" VisibleIndex="6" Width="0px"  visible="false"
                                             FieldName="Credit_ME">
                                              </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Débito" 
                                             ShowInCustomizationForm="True" VisibleIndex="7" Width="0px" visible="false"
                                              FieldName="Debit">
                                             </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Crédito" 
                                            ShowInCustomizationForm="True" VisibleIndex="8" Width="0px" visible="false"
                                            FieldName="Credit">
                                             </dx:GridViewDataTextColumn>
                                              <dx:GridViewDataTextColumn Caption="Débito(MS)" 
                                               ShowInCustomizationForm="True" VisibleIndex="9" Width="0px"  Visible="false"
                                              FieldName="Debit_MS">
                                             </dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Crédito(MS)" 
                                               ShowInCustomizationForm="True" VisibleIndex="10" Width="0px"   Visible="false"
                                               FieldName="Credit_MS">
                                               </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Comentarios    " 
                                               ShowInCustomizationForm="True" VisibleIndex="11" Width="0px"  Visible="false"
                                               FieldName="LineMemo">
                                               </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Referencia 1" 
                                               ShowInCustomizationForm="True" VisibleIndex="12" Width="0px"  Visible="false"
                                                FieldName="Ref1d">
                                              </dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Referencia 2" 
                                                ShowInCustomizationForm="True" VisibleIndex="13" Width="0px"  Visible="false"
                                                 FieldName="Ref2d">
                                                 </dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn Caption="Referencia 3" 
                                                 ShowInCustomizationForm="True" VisibleIndex="14" Width="0px"  Visible="false"
                                                 FieldName="Ref3Line">
                                                   </dx:GridViewDataTextColumn>
                                               <dx:GridViewDataDateColumn Caption="Fecha Venc." 
                                                ShowInCustomizationForm="True" VisibleIndex="15" Width="0px" Visible="false"
                                                 FieldName="DueDated">
                                                  </dx:GridViewDataDateColumn>
                                                  <dx:GridViewDataDateColumn Caption="Fecha Contab" 
                                                 ShowInCustomizationForm="True" VisibleIndex="16" Width="0px" Visible="false"
                                                  FieldName="RefDated">
                                                    </dx:GridViewDataDateColumn>
                                                 <dx:GridViewDataDateColumn Caption="Fecha Doc." 
                                                   ShowInCustomizationForm="True" VisibleIndex="17" Width="0px" Visible="false"
                                                 FieldName="TaxDated">
                                                  </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataDateColumn Caption="Projectd" 
                                                   ShowInCustomizationForm="True" VisibleIndex="18" Width="0px" Visible="false"
                                                 FieldName="Projectd">
                                                  </dx:GridViewDataDateColumn>


                                    </Columns>
                                    <SettingsBehavior AllowSelectByRowClick="True" 
                                        AllowSelectSingleRowOnly="True" />
                                    <ClientSideEvents RowDblClick="OkAsiento" EndCallback="EndAsientoSearch"/>
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
                                            <dx:ASPxButton ID="btnAsientoOk" runat="server" Text="Ok" Width="100%" 
                                                ClientInstanceName="btnAsientoOk" AutoPostBack="False">
                                                <ClientSideEvents Click="OkAsiento" />
                                            </dx:ASPxButton>
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnAsientoCancel" runat="server" Text="Cancelar" Width="100%" 
                                                ClientInstanceName="btnAsientoCancel" AutoPostBack="False">
                                                <ClientSideEvents Click="CancelAsiento" />
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

