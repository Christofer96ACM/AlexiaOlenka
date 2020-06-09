<%@ Page Title="Grupo de Articulos" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="GrupoArt.aspx.cs" Inherits="OneCommerce.Gestion.GrupoArt" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSGrupArt.js"></script>
<%--<script type="text/javascript" src="../Scripts/Jquerys/.js"></script>--%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Datos Maestros de Artículos"  GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <nav>
                                    <a href="#tab1" class="amenucrearclie"><i class="fas fa-home"></i> General</a>
                                    <a href="#tab2" class="amenucrearclie"><i class="fas fa-money-check-alt"></i> Finanzas</a>
                                 <%--   <a href="#tab3" class="amenucrearclie"><i class="fas fa-shopping-cart"></i> Datos de Ventas</a>--%>
                                  <%--  <a href="#tab4" class="amenucrearclie"><i class="fas fa-warehouse"></i> Datos de Inventario</a>--%>
                                   <%-- <a href="#tab5" class="amenucrearclie"><i class="fas fa-list-alt"></i> Lista de Precios</a>--%>
                                </nav>
                                <table id="tablaprincdecrearclie" style="width:800px; height:350px" class="tablespace">
                                    <tr>
                                        <td colspan="3" style="width:1000px" class="tablespace">
                                            <section class="sectablas" id="tab1">
                                                <table id="tab1tabla1">
                                                    <tr>
                                                        <td style="width:140px">
                                                            Nombre de Grupo de Articulos:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtItmsGrpNam" runat="server" 
                                                                ClientInstanceName="txtItmsGrpNam" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td style="width:140px">
                                                            <%--Clase de Artículo:--%>Método de Planificación:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbPlaningSys" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbPlaningSys" SelectedIndex="0">
                                                                 <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Ning." Value="N" />
                                                                    <dx:ListEditItem Text="PNM" Value="M" />
                                                                  
                                                                </Items>

                                                            </dx:ASPxComboBox>
                                                           <%--<dx:ASPxComboBox ID="cbbItemType" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbItemType" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Artículos" Value="I" />
                                                                    <dx:ListEditItem Text="Trabajo" Value="L" />
                                                                    <dx:ListEditItem Text="Viaje" Value="T" />
                                                                </Items>
                                                            </dx:ASPxComboBox>--%>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            Método Absatecimiento:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbPrcrmntMtd" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbPrcrmntMtd" Width="100%" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Comprar" Value="M" />
                                                                    <dx:ListEditItem Text="Efectuar" Value="B" />
                                                                  
                                                                </Items>
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td style="width:140px">
                                                            Intervalo Pedido:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxComboBox ID="cbbOrdrIntrvl" runat="server" Width="100%" EnableSynchronization="False"
                                                                ClientInstanceName="cbbOrdrIntrvl" SelectedIndex="0">
                                                                
                                                            </dx:ASPxComboBox>
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Método de Gestión:--%>Pedido Múltiple:</td>
                                                        <td style="width:240px">
                                                        <dx:ASPxTextBox ID="txtOrdrMulti" runat="server" Width="100%"
                                                                ClientInstanceName="txtOrdrMulti"  Visible="true">
                                                            </dx:ASPxTextBox>
                                                            <%--<dx:ASPxComboBox ID="cbbMngMethod" runat="server" EnableSynchronization="False"
                                                                ClientInstanceName="cbbMngMethod" Width="100%" SelectedIndex="0">
                                                                <Items>
                                                                    <dx:ListEditItem Selected="True" Text="Todas las Transacciones" Value="A" />
                                                                    <dx:ListEditItem Text="Solo en Release" Value="R" />
                                                                </Items>
                                                            </dx:ASPxComboBox>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                       <td style="width:140px">
                                                            Cantidad de Pedido Mínima:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtMinOrdrQty" runat="server" Width="100%"
                                                                ClientInstanceName="txtMinOrdrQty" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                       
                                                       <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            <%--Método de Gestión:--%>Tiempo de Entrega:</td>
                                                        <td style="width:240px">
                                                             <dx:ASPxTextBox ID="txtLeadTime" runat="server" Width="100%"
                                                                ClientInstanceName="txtLeadTime" Visible="true">
                                                            </dx:ASPxTextBox>
                                                           
                                                        </td>
                                                        
                                                    </tr>
                                                     <tr>
                                                       <td style="width:140px">
                                                            Dias de Tolerancia:</td>
                                                        <td style="width:240px">
                                                            <dx:ASPxTextBox ID="txtToleranDay" runat="server" Width="100%"
                                                                ClientInstanceName="txtToleranDay" DisplayFormatString="c2" Visible="true">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                       
                                                        
                                                    </tr>

                                                    <tr>
                                                        <td style="width:140px">
                                                            </td>
                                                        <td style="width:240px">
                                                            
                                                        </td>
                                                        <td style="width:40px"></td>
                                                        <td style="width:140px">
                                                            </td>
                                                        <td style="width:240px">
                                                            
                                                        </td>
                                                    </tr>
                                                   
                                                </table>
                                            </section>
                                            
                                              <section class="sectablas" id="tab2" style="width:1000px" >
                                                <table id="tab2tabla2" >
                                                     <tr>
                                                      <td style="width:310px">
                                                            Cnta. Gastos:</td>
                                                        <td style="width:80px">
                                                          <dx:ASPxButtonEdit ID="betxtExpensesAc" runat="server" 
                                                                ClientInstanceName="betxtExpensesAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch" />
                                                                
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                       
                                                       
                                                       
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtExpensesAc" runat="server" 
                                                                ClientInstanceName="txtExpensesAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                         <td style="width:20px"></td>
                                                          <td style="width:350px">
                                                            Cnta. Ingresos:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit  ID="beRevenuesAc" runat="server" 
                                                                ClientInstanceName="beRevenuesAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch2" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                       

                                                         
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtRevenuesAc" runat="server" 
                                                                ClientInstanceName="txtRevenuesAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                           
                                                       
                                                        
                                                    </tr>

   
                                                    
                                                     <tr>
                                                        <td style="width:350px">
                                                            Cnta. Existencias:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteBalInvntAc" runat="server" 
                                                                ClientInstanceName="bteBalInvntAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch3" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtBalInvntAc" runat="server" 
                                                                ClientInstanceName="txtBalInvntAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                         <td style="width:20px"></td>
                                                         <td style="width:310px">
                                                            Cnta. Costo bienes vendidos:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteSaleCostAc" runat="server" 
                                                                ClientInstanceName="bteSaleCostAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch4" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                         
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtSaleCostAc" runat="server" 
                                                                ClientInstanceName="txtSaleCostAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>

                                                    
                                                    <tr>
                                                        <td style="width:310px">
                                                            Cnta. Dotación:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteTransferAc" runat="server" 
                                                                ClientInstanceName="bteTransferAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch5" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtTransferAc" runat="server" 
                                                                ClientInstanceName="txtTransferAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                        <td style="width:20px"></td>
                                                         <td style="width:310px">
                                                           Cnta. Desviación:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteVarianceAc" runat="server" 
                                                                ClientInstanceName="bteVarianceAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch6" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtbteVarianceAc" runat="server" 
                                                                ClientInstanceName="txtbteVarianceAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                  
                                                    
                                                      <tr>
                                                        <td style="width:310px">
                                                           Cnta. Diferencias precio:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="btePriceDifAc" runat="server" 
                                                                ClientInstanceName="btePriceDifAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch7" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtPriceDifAc" runat="server" 
                                                                ClientInstanceName="txtPriceDifAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                          <td style="width:20px"></td>
                                                           <td style="width:310px">
                                                           Cnta. Ajuste stock negativo:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteNegStckAct" runat="server" 
                                                                ClientInstanceName="bteNegStckAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch8" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtNegStckAct" runat="server" 
                                                                ClientInstanceName="txtNegStckAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>

                                                     

                                                      <tr>
                                                        <td style="width:310px">
                                                           Compensación stocks - Cnta.Reducción:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteDecreasAc" runat="server" 
                                                                ClientInstanceName="bteDecreasAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch9" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtDecreasAc" runat="server" 
                                                                ClientInstanceName="txtDecreasAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                          <td style="width:20px"></td>
                                                           <td style="width:310px">
                                                          Compensación stocks - Cnta.Aumento:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteIncreasAc" runat="server" 
                                                                ClientInstanceName="bteIncreasAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch10" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtIncreasAc" runat="server" 
                                                                ClientInstanceName="txtIncreasAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                   
                                                      <tr>
                                                        <td style="width:310px">
                                                          Cnta.  Devoluciones por ventas:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteReturnAc" runat="server" 
                                                                ClientInstanceName="bteReturnAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch11" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                         
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtReturnAc" runat="server" 
                                                                ClientInstanceName="txtReturnAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                          <td style="width:20px"></td>
                                                           <td style="width:310px">
                                                          Cnta. Ingresos - Extranjero:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="betFrRevenuAc" runat="server" 
                                                                ClientInstanceName="betFrRevenuAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch12" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtFrRevenuAc" runat="server" 
                                                                ClientInstanceName="txtFrRevenuAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>

                                                    
                                                     <tr>
                                                        <td style="width:310px">
                                                          Cnta. Costos - Extranjero:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteFrExpensAc" runat="server" 
                                                                ClientInstanceName="bteFrExpensAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch13" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtFrExpensAc" runat="server" 
                                                                ClientInstanceName="txtFrExpensAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                         <td style="width:20px"></td>
                                                          <td style="width:310px">
                                                          Cnta. Diferencias tipo de cambio:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteExchangeAc" runat="server" 
                                                                ClientInstanceName="bteExchangeAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch14" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                         
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtExchangeAc" runat="server" 
                                                                ClientInstanceName="txtExchangeAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>

                                                     

                                                     <tr>
                                                        <td style="width:310px">
                                                          Cnta. Compensación mercancías:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteBalanceAcc" runat="server" 
                                                                ClientInstanceName="bteBalanceAcc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch15" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtBalanceAcc" runat="server" 
                                                                ClientInstanceName="txtBalanceAcc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                         <td style="width:20px"></td>
                                                          <td style="width:310px">
                                                          Cnta. Reducción del libro mayor:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteDecresGlAc" runat="server" 
                                                                ClientInstanceName="bteDecresGlAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch16" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtDecresGlAc" runat="server" 
                                                                ClientInstanceName="txtDecresGlAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>

                                                  

                                                     <tr>
                                                        
                                                          <td style="width:310px">
                                                          Cnta. Aumento libro mayor:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteIncresGlAc" runat="server" 
                                                                ClientInstanceName="bteIncresGlAc" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch17" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                         
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtIncresGlAc" runat="server" 
                                                                ClientInstanceName="txtIncresGlAc" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                         <td style="width:20px"></td>
                                                         <td style="width:310px">
                                                          Cnta. Stocks trabajo en curso:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteWipAcct" runat="server" 
                                                                ClientInstanceName="bteWipAcct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch18" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtWipAcct" runat="server" 
                                                                ClientInstanceName="txtWipAcct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                    </tr>

                                                     

                                                     <tr>
                                                        
                                                         <td style="width:310px">
                                                          Cnta. Desviación stock WIP:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteWipVarAcct" runat="server" 
                                                                ClientInstanceName="bteWipVarAcct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch19" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtWipVarAcct" runat="server" 
                                                                ClientInstanceName="txtWipVarAcct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                          <td style="width:20px"></td>
                                                         <td style="width:310px">
                                                          Cnta. Revalorización  stocks:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteStokRvlAct" runat="server" 
                                                                ClientInstanceName="bteStokRvlAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch20" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                         <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtStokRvlAct" runat="server" 
                                                                ClientInstanceName="txtStokRvlAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                          
                                                    </tr>

                                                   
                                                    
                                                    <tr>
                                                        
                                                        <td style="width:310px">
                                                          Cnta. Contrapartida revalorización inventario</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteStkOffsAct" runat="server" 
                                                                ClientInstanceName="bteStkOffsAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch21" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtStkOffsAct" runat="server" 
                                                                ClientInstanceName="txtStkOffsAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                        <td style="width:20px"></td>
                                                        <td style="width:310px">
                                                          Cnta. Compensación gastos</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteExpClrAct" runat="server" 
                                                                ClientInstanceName="bteExpClrAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch22" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                         
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtExpClrAct" runat="server" 
                                                                ClientInstanceName="txtExpClrAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>
                                                    </tr>


                                                    

                                                     <tr>
                                                        <td style="width:310px">
                                                          Stock cnta.Tránsito:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteStkInTnAct" runat="server" 
                                                                ClientInstanceName="bteStkInTnAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch23" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtStkInTnAct" runat="server" 
                                                                ClientInstanceName="txtStkInTnAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>


                                                           <td style="width:20px"></td>
                                                         <td style="width:310px">
                                                          Cta. Crédito Ventas:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteARCMAct" runat="server" 
                                                                ClientInstanceName="bteARCMAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch24" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtARCMAct" runat="server" 
                                                                ClientInstanceName="txtARCMAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                    </tr>

                                                    

                                                    <tr>
                                                        
                                                        
                                                         <td style="width:310px">
                                                          Cta. Crédito compras:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteAPCMAct" runat="server" 
                                                                ClientInstanceName="bteAPCMAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch25" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtAPCMAct" runat="server" 
                                                                ClientInstanceName="txtAPCMAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                        <td style="width:20px"></td>
                                                        <td style="width:310px">
                                                          Cta. Crédito ventas: Extranjero:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteARCMFrnAct" runat="server" 
                                                                ClientInstanceName="bteARCMFrnAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch26" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtARCMFrnAct" runat="server" 
                                                                ClientInstanceName="txtARCMFrnAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                       
                                                    </tr>
                                                    <tr>
                                                       
                                                        <td style="width:310px">
                                                         Cta. Crédito compras - Extranjero:</td>
                                                        <td style="width:80px">
                                                         <dx:ASPxButtonEdit ID="bteAPCMFrnAct" runat="server" 
                                                                ClientInstanceName="bteAPCMFrnAct" Width="80px">
                                                                <Buttons>
                                                                    <dx:EditButton ToolTip="Buscar Cuenta">
                                                                    </dx:EditButton>
                                                                </Buttons>
                                                                <ClientSideEvents ButtonClick="Show_AccountSearch27" />
                                                            </dx:ASPxButtonEdit>
                                                        </td>
                                                          
                                                        <td style="width:200px">
                                                            <dx:ASPxTextBox ID="txtAPCMFrnAct" runat="server" 
                                                                ClientInstanceName="txtAPCMFrnAct" Width="200px">
                                                            </dx:ASPxTextBox>
                                                        </td>

                                                    </tr>
                                                   
                                                </table>
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


  <dx:ASPxPopupControl ID="ppcbuscargrupo" runat="server" 
        ClientInstanceName="ppcbuscargrupo" FooterText=" " HeaderText="Buscar Grupo de Articulo" 
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
                                        Nombre de grupo de artículos:</td>
                                    <td style="width:280px">
                                        <dx:ASPxTextBox ID="txtnombregrupo" runat="server" Width="100%" 
                                            ClientInstanceName="txtnombregrupo">
                                            <ClientSideEvents KeyUp="Get_GrupoArt" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btebuscargrupo" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btebuscargrupo" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_GrupoArt" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvGrupoArt" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvGrupoArt" 
                                KeyFieldName="ItmsGrpCod" OnCustomCallback="gdvGrupoArt_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvGrupoArt_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="ItmsGrpCod" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="150px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nombre de Grupo de Artículo" FieldName="ItmsGrpNam" 
                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>

                                     <dx:GridViewDataTextColumn Caption="PlaningSys" FieldName="PlaningSys" 
                                        ShowInCustomizationForm="True" VisibleIndex="1"  Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="PrcrmntMtd" FieldName="PrcrmntMtd" 
                                        ShowInCustomizationForm="True" VisibleIndex="1"  Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="OrdrIntrvl" FieldName="OrdrIntrvl" 
                                        ShowInCustomizationForm="True" VisibleIndex="1"  Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="OrdrMulti" FieldName="OrdrMulti" 
                                        ShowInCustomizationForm="True" VisibleIndex="1"  Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="MinOrdrQty" FieldName="MinOrdrQty" 
                                        ShowInCustomizationForm="True" VisibleIndex="1"  Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="LeadTime" FieldName="LeadTime" 
                                        ShowInCustomizationForm="True" VisibleIndex="1"  Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="ToleranDay" FieldName="ToleranDay" 
                                        ShowInCustomizationForm="True" VisibleIndex="1"   Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="InvntSys" FieldName="InvntSys" 
                                        ShowInCustomizationForm="True" VisibleIndex="1"  Visible="false">
                                    </dx:GridViewDataTextColumn>







                                    <dx:GridViewDataTextColumn Caption="ExpensesAc" FieldName="ExpensesAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="ExpensesAcName" FieldName="ExpensesAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="RevenuesAc" FieldName="RevenuesAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="RevenuesAcName" FieldName="RevenuesAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="BalInvntAc" FieldName="BalInvntAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BalInvntAcName" FieldName="BalInvntAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Visible="false">
                                    </dx:GridViewDataTextColumn>


                                    <dx:GridViewDataTextColumn Caption="SaleCostAc" FieldName="SaleCostAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="SaleCostAcName" FieldName="SaleCostAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="TransferAc" FieldName="TransferAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="6" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="TransferAcName" FieldName="TransferAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="6" Visible="false">
                                    </dx:GridViewDataTextColumn>


                                    <dx:GridViewDataTextColumn Caption="VarianceAc" FieldName="VarianceAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="7" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="VarianceAcName" FieldName="VarianceAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="7" Visible="false">
                                    </dx:GridViewDataTextColumn>


                                    <dx:GridViewDataTextColumn Caption="PriceDifAc" FieldName="PriceDifAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="8" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="PriceDifAcName" FieldName="PriceDifAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="8" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="NegStckAct" FieldName="NegStckAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="9" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="NegStckActName" FieldName="NegStckActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="9" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="DecreasAc" FieldName="DecreasAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="10" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DecreasAcName" FieldName="DecreasAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="10" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="IncreasAc" FieldName="IncreasAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="11" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="IncreasAcName" FieldName="IncreasAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="11" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="ReturnAc" FieldName="ReturnAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="12" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ReturnAcName" FieldName="ReturnAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="12" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="FrRevenuAc" FieldName="FrRevenuAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="13" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="FrRevenuAcName" FieldName="FrRevenuAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="13" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="FrExpensAc" FieldName="FrExpensAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="14" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn Caption="FrExpensAcName" FieldName="FrExpensAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="14" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="ExchangeAc" FieldName="ExchangeAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="15" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Caption="ExchangeAcname" FieldName="ExchangeAcname" 
                                        ShowInCustomizationForm="True" VisibleIndex="15" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="BalanceAcc" FieldName="BalanceAcc" 
                                        ShowInCustomizationForm="True" VisibleIndex="16" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BalanceAccName" FieldName="BalanceAccName" 
                                        ShowInCustomizationForm="True" VisibleIndex="16" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="DecresGlAc" FieldName="DecresGlAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="17" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn Caption="DecresGlAcName" FieldName="DecresGlAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="17" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="IncresGlAc" FieldName="IncresGlAc" 
                                        ShowInCustomizationForm="True" VisibleIndex="18" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="IncresGlAcName" FieldName="IncresGlAcName" 
                                        ShowInCustomizationForm="True" VisibleIndex="18" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="WipAcct" FieldName="WipAcct" 
                                        ShowInCustomizationForm="True" VisibleIndex="19" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="WipAcctName" FieldName="WipAcctName" 
                                        ShowInCustomizationForm="True" VisibleIndex="19" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="WipVarAcct" FieldName="WipVarAcct" 
                                        ShowInCustomizationForm="True" VisibleIndex="20" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="WipVarAcctName" FieldName="WipVarAcctName" 
                                        ShowInCustomizationForm="True" VisibleIndex="20" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="StokRvlAct" FieldName="StokRvlAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="21" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="StokRvlActName" FieldName="StokRvlActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="21" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="StkOffsAct" FieldName="StkOffsAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="22" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="StkOffsActName" FieldName="StkOffsActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="22" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                     <dx:GridViewDataTextColumn Caption="ExpClrAct" FieldName="ExpClrAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="23" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ExpClrActName" FieldName="ExpClrActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="23" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="StkInTnAct" FieldName="StkInTnAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="24" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="StkInTnActName" FieldName="StkInTnActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="24" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="ARCMAct" FieldName="ARCMAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="25" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="ARCMActName" FieldName="ARCMActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="25" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="APCMAct" FieldName="APCMAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="26" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="APCMActName" FieldName="APCMActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="26" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="ARCMFrnAct" FieldName="ARCMFrnAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="27" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ARCMFrnActName" FieldName="ARCMFrnActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="27" Visible="false">
                                    </dx:GridViewDataTextColumn>

                                     <dx:GridViewDataTextColumn Caption="APCMFrnAct" FieldName="APCMFrnAct" 
                                        ShowInCustomizationForm="True" VisibleIndex="28" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                      <dx:GridViewDataTextColumn Caption="APCMFrnActName" FieldName="APCMFrnActName" 
                                        ShowInCustomizationForm="True" VisibleIndex="28" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                     
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="okGrupoArt"/>
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
                                        <dx:ASPxButton ID="btngrupook" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btngrupook" AutoPostBack="False">
                                            <ClientSideEvents Click="okGrupoArt" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btngrupoart" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btngrupoart" AutoPostBack="False">
                                            <ClientSideEvents Click="calcelgrupoart" />
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
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

