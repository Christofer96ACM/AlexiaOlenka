<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="RegisterConsult1.aspx.cs" Inherits="OneCommerce.Sales.RegisterConsult1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Sales/RegisterConsult1.js"></script>
<script type="text/javascript" src="../Scripts/Sunat.js"></script>
    
    <table style="width:487px" class="tablespace" __designer:mapid="9de">
        <tr __designer:mapid="9df">
            <td style="width:400px" class="tablespace" __designer:mapid="9e0">
                <table style="width:392px; height: 186px;" __designer:mapid="9e1">
                    <tr __designer:mapid="9e2">
                        <td style="font-weight: bold; height: 30px;" 
                            __designer:mapid="9e3" colspan="2">
                                            DATOS NUEVA CONSULTORA</td>
                    </tr>
                    <tr __designer:mapid="9e2">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="9e3">
                                            Código:</td>
                        <td style="width:255px" __designer:mapid="9e4">
                            <dx:ASPxTextBox runat="server" Width="100%" ReadOnly="True" 
                                ClientInstanceName="txtCrCardCode" ID="txtCrCardCode">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="9e2">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="9e3">
                                            Tipo Persona:</td>
                        <td style="width:255px" __designer:mapid="9e4">
                                            <dx:ASPxComboBox runat="server" EnableSynchronization="False" 
                                Width="100%" ClientInstanceName="cbbCrPersonType" ID="cbbCrPersonType">
                                                <ClientSideEvents SelectedIndexChanged="Get_CrDocumentType" />
</dx:ASPxComboBox>

                        </td>
                    </tr>
                    <tr __designer:mapid="9e2">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="9e3">
                                            Tipo Documento:</td>
                        <td style="width:255px" __designer:mapid="9e4">
                                            <dx:ASPxComboBox runat="server" EnableSynchronization="False" 
                                Width="100%" ClientInstanceName="cbbCrDocumentType" ID="cbbCrDocumentType">
                                                <ClientSideEvents SelectedIndexChanged="Val_Tip_Clie" />
                                            </dx:ASPxComboBox>

                        </td>
                    </tr>
                    <tr __designer:mapid="9e2">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="9e3">
                                            Nro. Documento:</td>
                        <td style="width:255px" __designer:mapid="9e4">
                            <dx:ASPxTextBox runat="server" Width="100%" MaxLength="11" 
                                ClientInstanceName="txtCrLicTradNum" ID="txtCrLicTradNum">
                                <ClientSideEvents KeyPress="ProcessKeyPress" KeyUp="Key_CrLicTradNum">
                                </ClientSideEvents>
                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" 
                                    SetFocusOnError="True" ValidationGroup="ValCrClient">
                                    <RegularExpression ErrorText="Nro. Documento incorrecto." 
                                        ValidationExpression="[0-9]+(\.[0-9][0-9]?)?">
                                    </RegularExpression>
                                    <RequiredField IsRequired="True" ErrorText="Nro. Documento incorrecto.">
                                    </RequiredField>
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="9e6">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="9e7">
                                            Nombres:</td>
                        <td style="width:255px" __designer:mapid="9e8">
                            <dx:ASPxTextBox runat="server" Width="100%" ClientInstanceName="txtCrCardName" 
                                ID="txtCrCardName">
                                <ClientSideEvents KeyUp="Key_CrCardName">
                                </ClientSideEvents>
                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" 
                                    SetFocusOnError="True" ValidationGroup="ValCrClient">
                                    <RequiredField IsRequired="True" ErrorText="Nombre de cliente incorrecto.">
                                    </RequiredField>
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="9ed">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="9ee">
                                            Primer Apellido:</td>
                        <td style="width:255px" __designer:mapid="9ef">
                <dx:ASPxTextBox ID="txtapepater" runat="server" Width="100%" 
                    ClientInstanceName="txtapepater">
                    <ClientSideEvents KeyUp="Key_app" />
                </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="9f5">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="9f6">
                                            Segundo Apellido:</td>
                        <td style="width:255px" __designer:mapid="9f7">
                <dx:ASPxTextBox ID="txtapemater" runat="server" Width="100%" 
                    ClientInstanceName="txtapemater">
                    <ClientSideEvents KeyUp="Key_apm" />
                </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="9f9">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="9fa">
                                            Sexo:</td>
                        <td style="width:255px" __designer:mapid="9fb">
                <dx:ASPxRadioButtonList ID="rbtnsexo" runat="server" Height="20px" 
                    RepeatDirection="Horizontal" Width="128px" SelectedIndex="0" 
                                ClientInstanceName="rbtnsexo">
                    <Items>
                        <dx:ListEditItem Text="Masculino" Value="Masculino" Selected="True" />
                        <dx:ListEditItem Text="Femenino" Value="Femenino" />
                    </Items>
                </dx:ASPxRadioButtonList>
                        </td>
                    </tr>
                    <tr __designer:mapid="a05">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a06">
                                            Teléfono Fijo:</td>
                        <td style="width:255px" __designer:mapid="a07">
                            <dx:ASPxTextBox runat="server" Width="100%" ClientInstanceName="txtCrPhone1" 
                                ID="txtCrPhone1">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a05">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a06">
                                            Teléfono Movil:</td>
                        <td style="width:255px" __designer:mapid="a07">
                            <dx:ASPxTextBox runat="server" Width="100%" ClientInstanceName="txtCrCellular" 
                                ID="txtCrCellular">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Correo:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                            <dx:ASPxTextBox runat="server" Width="100%" ClientInstanceName="txtCrE_Mail" 
                                ID="txtCrE_Mail">
                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" 
                                    SetFocusOnError="True" ValidationGroup="ValCrClient">
                                    <RegularExpression ErrorText="E-mail inv&#225;lido." 
                                        ValidationExpression="\w+([-+.&#39;]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                    </RegularExpression>
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="font-weight: bold; height: 30px;" 
                            __designer:mapid="a0e" colspan="2">
                                            DIRECCION DONDE VIVE</td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td __designer:mapid="a0e" colspan="2">
                <dx:ASPxRadioButtonList ID="rbttipovilla" runat="server" Height="25px" 
                    RepeatDirection="Horizontal" Width="300px" 
                    ClientInstanceName="rbttipovilla" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Av" Value="Av" Selected="True" />
                        <dx:ListEditItem Text="Cll" Value="Cll" />
                        <dx:ListEditItem Text="Jr" Value="Jr" />
                        <dx:ListEditItem Text="Pj" Value="Pj" />
                        <dx:ListEditItem Text="Prolong" Value="Prolong" />
                    </Items>
                </dx:ASPxRadioButtonList>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Nombre:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                <dx:ASPxTextBox ID="txtnombredirec" runat="server" Width="100%" 
                    ClientInstanceName="txtnombredirec">
                </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Departamento:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                <dx:ASPxComboBox ID="cbodepartamento" runat="server" Height="21px" Width="100%" 
                    ClientInstanceName="cbodepartamento">
                    <ClientSideEvents SelectedIndexChanged="Set_Lugar_Prov" />
                </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Provincia:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                <dx:ASPxComboBox ID="cboprovincia" runat="server" Height="21px" Width="100%" 
                    ClientInstanceName="cboprovincia">
                    <ClientSideEvents SelectedIndexChanged="Set_Lugar_Disti" />
                </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Distrito:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                <dx:ASPxComboBox ID="cbodistrito" runat="server" Height="21px" Width="100%" 
                    ClientInstanceName="cbodistrito">
                    <ClientSideEvents SelectedIndexChanged="select_distrito" />
                </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Referencia:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                <dx:ASPxTextBox ID="txtreferencia" runat="server" Width="100%" 
                    ClientInstanceName="txtreferencia">
                </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="font-weight: bold; height: 30px;" 
                            __designer:mapid="a0e" colspan="2">
                                            DATOS DE VENTAS</td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Responsable Venta:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                <dx:ASPxComboBox ID="cboresponsableventa" runat="server" 
                    ClientInstanceName="cboresponsableventa" Height="21px" Width="100%">
                </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Linea de Negocio:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                <dx:ASPxComboBox ID="cbonegocio" runat="server" Height="21px" 
                    ValueType="System.String" Width="100%" ClientInstanceName="cbonegocio">
                </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px; font-family: 'Comic Sans MS'; font-size: 14px;" 
                            __designer:mapid="a0e">
                                            Comentarios:</td>
                        <td style="width:255px" __designer:mapid="a0f">
                <dx:ASPxMemo ID="memocoment" runat="server" Height="50px" Width="107%" 
                    ClientInstanceName="memocoment">
                </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr __designer:mapid="a0d">
                        <td style="width:129px" __designer:mapid="a0e">
                                            &nbsp;</td>
                        <td style="width:255px" __designer:mapid="a0f">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr __designer:mapid="a13">
            <td __designer:mapid="a14">
                <dx:ASPxMenu ID="mnuOper" runat="server" ClientInstanceName="mnuOper" 
                    DataSourceID="XmlDataSourceFooter" FirstSubMenuDirection="LeftOrTop" 
                    RenderMode="Lightweight" Width="100%">
                    <ClientSideEvents ItemClick="Set_Operation" />
                    <Border BorderWidth="0px" />
                    <BorderTop BorderWidth="1px" />
                </dx:ASPxMenu>
                </td>
        </tr>
    </table>
    <dx:ASPxLoadingPanel ID="ldpProcess" runat="server" 
        ClientInstanceName="ldpProcess" Modal="True">
    </dx:ASPxLoadingPanel>

                <asp:XmlDataSource ID="XmlDataSourceFooter" runat="server" 
                    DataFile="~/App_Data/BottomOper.xml" XPath="/items/*"></asp:XmlDataSource>
         
         
    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
    </dx:ASPxHiddenField>

    <dx:ASPxCallback ID="clbOperation" runat="server" 
        ClientInstanceName="clbOperation" oncallback="clbOperation_Callback">
        <ClientSideEvents CallbackComplete="Com_Operation" />
    </dx:ASPxCallback>
</asp:Content>
