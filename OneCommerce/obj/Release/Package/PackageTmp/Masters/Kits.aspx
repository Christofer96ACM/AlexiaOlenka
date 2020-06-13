<%@ Page Title="Kits" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Kits.aspx.cs" Inherits="OneCommerce.Masters.Kits" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<%--<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/jquery-1.10.2.min.js"></script>--%>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<%--<script type="text/javascript" src="../Tools/General.js"></script>--%>
<script type="text/javascript" src="../Scripts/Tools/JSKits.js"></script>
<script type="text/javascript" src="../Scripts/Sunat.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="Kits"  GroupBoxStyle-Caption-Font-Size="X-Large"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Datos Generales" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <table style="width:700px; height:50px" class="tablespace">
                                    <tr>
                                        <td style="width:140px">
                                            Codigo Producto:
                                        </td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:240px">
                                            <dx:ASPxButtonEdit ID="bteItemcode" runat="server" 
                                                ClientInstanceName="bteItemcode" Width="350px">
                                                <Buttons>
                                                    <dx:EditButton ToolTip="Buscar Producto">
                                                    </dx:EditButton>
                                                </Buttons>
                                                <ClientSideEvents ButtonClick="Show_ProductSearch3" />
                                            </dx:ASPxButtonEdit>
                                        </td>
                                        <td style="width:40px">
                                        </td>
                                        <td style="width:140px">
                                            Tipo ListaM:
                                        </td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:240px">
                                            <dx:ASPxComboBox ID="cbbTreeType" runat="server" Width="100%" EnableSynchronization="False"
                                                ClientInstanceName="cbbTreeType" SelectedIndex="0">
                                                <Items>
                                                    <dx:ListEditItem Selected="True" Text="Ventas" Value="V" />
                                                    <dx:ListEditItem Text="Conjunto" Value="C" />
                                                    <dx:ListEditItem Text="Produccion" Value="P" />
                                                    <dx:ListEditItem Text="Modelo" Value="M" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:140px">
                                            Nombre Producto:
                                        </td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:240px">
                                            <dx:ASPxTextBox ID="txtItemName" runat="server" 
                                                ClientInstanceName="txtItemName" Width="100%">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td style="width:40px">
                                        </td>
                                        <td style="width:140px">
                                            Suprimir Componentes:</td>
                                        <td style="width:5px">
                                        </td>
                                        <td style="width:240px; text-align:center">
                                            <dx:ASPxCheckBox ID="checkHideComp" ClientInstanceName="checkHideComp"
                                                runat="server" ValueChecked="Y" ValueUnchecked="N" Checked="false" ValueType="System.String">
                                            </dx:ASPxCheckBox>
                                        </td>
                                    </tr>
                                </table><br/>
                                <dx:ASPxGridView ID="gdvHijos" runat="server" AutoGenerateColumns="False" Width="700px"
                                    ClientInstanceName="gdvHijos" KeyFieldName="ChildNum" OnCommandButtonInitialize="gdvHijos_CommandButtonInitialize"
                                    OnCustomCallback="gdvHijos_CustomCallback" OnRowUpdating="gdvHijos_RowUpdating" OnDataBinding="gdvHijos_DataBinding"
                                    OnRowInserting="gdvHijos_RowInserting" OnCellEditorInitialize="gdvHijos_CellEditorInitialize" OnRowDeleting="gdvHijos_RowDeleting">
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
                                        <dx:GridViewDataTextColumn Caption="Linea" PropertiesTextEdit-ClientInstanceName="ChildNum"
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="30px" 
                                            FieldName="ChildNum">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataButtonEditColumn Caption="Codigo Producto" FieldName="Code"
                                            ShowInCustomizationForm="True" VisibleIndex="2" Width="300px">
                                            <PropertiesButtonEdit ClientInstanceName="bteCode">
                                                <Buttons>
                                                    <dx:EditButton ToolTip="Buscar Producto">
                                                    </dx:EditButton>
                                                </Buttons>
                                                <Style Font-Size="8pt">
                                                </Style>
                                                <ClientSideEvents ButtonClick="Show_ProductSearch2"  KeyPress="Key_Product"/>
                                            </PropertiesButtonEdit>
                                            <EditCellStyle Font-Size="8pt">
                                            </EditCellStyle>
                                            <CellStyle VerticalAlign="Middle" ForeColor="Black">
                                            </CellStyle>
                                        </dx:GridViewDataButtonEditColumn>
                                        <dx:GridViewDataTextColumn Caption="Nombre Producto" PropertiesTextEdit-ClientInstanceName="ItemName"
                                            ShowInCustomizationForm="True" VisibleIndex="3" Width="90px" 
                                            FieldName="ItemName">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cantidad" PropertiesTextEdit-ClientInstanceName="Quantity2"
                                            ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" 
                                            FieldName="Quantity2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Unidad de Medida" PropertiesTextEdit-ClientInstanceName="InvntryUom"
                                            ShowInCustomizationForm="True" VisibleIndex="5" Width="90px" 
                                            FieldName="InvntryUom">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Almacen" PropertiesTextEdit-ClientInstanceName="Warehouse"
                                            ShowInCustomizationForm="True" VisibleIndex="6" Width="90px" 
                                            FieldName="Warehouse">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>

                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
                <SettingsItemHelpTexts Position="Bottom"></SettingsItemHelpTexts>
            </dx:LayoutGroup> 
        </Items>
    </dx:ASPxFormLayout>
     
    <dx:ASPxPopupControl ID="ppcProductSearch" runat="server" 
        ClientInstanceName="ppcProductSearch" FooterText=" " HeaderText="Buscar Kits" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="400px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="pccProductSearch" runat="server" SupportsDisabledAttribute="True">
                <table border="0"  style="width:100%">
                    <tr>
                        <td>
                            <table class="tablespace" style="width:100%">
                                <tr>
                                    <td id="ProductParCaption" style="width:105px">
                                        Código:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtParProduct" runat="server" Width="100%" 
                                            ClientInstanceName="txtParProduct">
                                            <ClientSideEvents KeyPress="Get_Product1" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProductSearch" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnProductSearch" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Product" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:50px">
                                        <dx:ASPxCheckBox ID="chkKit" runat="server" CheckState="Unchecked" 
                                            ClientInstanceName="chkKit" Text="Kit:" TextAlign="Left" Visible="false">
                                            <ClientSideEvents CheckedChanged="Set_Kit" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td style="width:200px">
                                        <dx:ASPxTextBox ID="txtQuantityKit" runat="server" Width="100%" Visible="false"
                                            ClientInstanceName="txtQuantityKit" DisplayFormatString="f0">
                                            <MaskSettings Mask="&lt;0..99999999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                                <ErrorFrameStyle>
                                                    <Paddings Padding="0px" />
                                                    <Border BorderWidth="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="Prd" style="width:105px">
                                        Descripción:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtdescrip" runat="server" Width="300px" 
                                            ClientInstanceName="txtdescrip">
                                            <ClientSideEvents KeyUp="Get_Product1"/>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="Pr" style="width:105px">
                                        Marca/Modelo:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtmarc" runat="server" Width="300px" 
                                            ClientInstanceName="txtmarc">
                                            <ClientSideEvents KeyUp="Get_Product1"/>
                                        </dx:ASPxTextBox>
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
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="340px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tipo ListaM" FieldName="TreeType" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Suprimir" FieldName="HideComp" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <%--<dx:GridViewDataTextColumn Caption="ItmsGrpCod" FieldName="ItmsGrpCod" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PrchseItem" FieldName="PrchseItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SellItem" FieldName="SellItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="InvntItem" FieldName="InvntItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BuyUnitMsr" FieldName="BuyUnitMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="6" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NumInBuy" FieldName="NumInBuy" 
                                        ShowInCustomizationForm="True" VisibleIndex="7" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalUnitMsr" FieldName="SalUnitMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="8" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NumInSale" FieldName="NumInSale" 
                                        ShowInCustomizationForm="True" VisibleIndex="9" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TreeType" FieldName="TreeType" 
                                        ShowInCustomizationForm="True" VisibleIndex="10" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PurPackMsr" FieldName="PurPackMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="11" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PurPackUn" FieldName="PurPackUn" 
                                        ShowInCustomizationForm="True" VisibleIndex="12" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalPackMsr" FieldName="SalPackMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="13" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalPackUn" FieldName="SalPackUn" 
                                        ShowInCustomizationForm="True" VisibleIndex="14" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="GLMethod" FieldName="GLMethod" 
                                        ShowInCustomizationForm="True" VisibleIndex="15" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="IssueMthd" FieldName="IssueMthd" 
                                        ShowInCustomizationForm="True" VisibleIndex="16" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ByWh" FieldName="ByWh" 
                                        ShowInCustomizationForm="True" VisibleIndex="17" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="MngMethod" FieldName="MngMethod" 
                                        ShowInCustomizationForm="True" VisibleIndex="18" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TaxCodeAP" FieldName="TaxCodeAP" 
                                        ShowInCustomizationForm="True" VisibleIndex="19" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TaxCodeAR" FieldName="TaxCodeAR" 
                                        ShowInCustomizationForm="True" VisibleIndex="20" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BPP_TIPEXIST" FieldName="U_BPP_TIPEXIST" 
                                        ShowInCustomizationForm="True" VisibleIndex="21" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ItemType" FieldName="ItemType" 
                                        ShowInCustomizationForm="True" VisibleIndex="22" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Active" FieldName="Active" 
                                        ShowInCustomizationForm="True" VisibleIndex="23" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ManBtchNum" FieldName="ManBtchNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="24" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ManSerNum" FieldName="ManSerNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="25" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ActivoC" FieldName="ActivoC" 
                                        ShowInCustomizationForm="True" VisibleIndex="26" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ActivoS" FieldName="ActivoS" 
                                        ShowInCustomizationForm="True" VisibleIndex="27" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>--%>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkProduct" EndCallback="EndProductSearch"/>
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
                                            <ClientSideEvents Click="OkProduct" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProductCancel" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProductCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProduct" />
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
    <dx:ASPxPopupControl ID="ppcProductSearch2" runat="server" 
        ClientInstanceName="ppcProductSearch2" FooterText=" " HeaderText="Buscar Producto Hijos" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="400px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                <table border="0"  style="width:100%">
                    <tr>
                        <td>
                            <table class="tablespace" style="width:100%">
                                <tr>
                                    <td id="ProductParCaption2" style="width:105px">
                                        Código:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtParProduct2" runat="server" Width="100%" 
                                            ClientInstanceName="txtParProduct2">
                                            <ClientSideEvents KeyUp="Get_Product22" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProductSearch2" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnProductSearch2" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Product2" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:50px">
                                        <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" CheckState="Unchecked" 
                                            ClientInstanceName="chkKit" Text="Kit:" TextAlign="Left" Visible="false">
                                            <ClientSideEvents CheckedChanged="Set_Kit" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td style="width:200px">
                                        <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="100%" Visible="false"
                                            ClientInstanceName="txtQuantityKit" DisplayFormatString="f0">
                                            <MaskSettings Mask="&lt;0..99999999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                                <ErrorFrameStyle>
                                                    <Paddings Padding="0px" />
                                                    <Border BorderWidth="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="Prd1" style="width:105px">
                                        Descripción:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtdescrip2" runat="server" Width="300px" 
                                            ClientInstanceName="txtdescrip2">
                                            <ClientSideEvents KeyUp="Get_Product22"/>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="Pr1" style="width:105px">
                                        Marca/Modelo:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtmarc2" runat="server" Width="300px" 
                                            ClientInstanceName="txtmarc2">
                                            <ClientSideEvents KeyUp="Get_Product22"/>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvProductSearch2" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvProductSearch2" 
                                KeyFieldName="ItemCode" OnCustomCallback="gdvProductSearch2_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvProductSearch2_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="ItemCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="60px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="340px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Quantity2" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Almacen" FieldName="WhsCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Unidad" FieldName="InvntryUom" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <%--<dx:GridViewDataTextColumn Caption="ItmsGrpCod" FieldName="ItmsGrpCod" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PrchseItem" FieldName="PrchseItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SellItem" FieldName="SellItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="InvntItem" FieldName="InvntItem" 
                                        ShowInCustomizationForm="True" VisibleIndex="5" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="BuyUnitMsr" FieldName="BuyUnitMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="6" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NumInBuy" FieldName="NumInBuy" 
                                        ShowInCustomizationForm="True" VisibleIndex="7" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalUnitMsr" FieldName="SalUnitMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="8" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="NumInSale" FieldName="NumInSale" 
                                        ShowInCustomizationForm="True" VisibleIndex="9" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TreeType" FieldName="TreeType" 
                                        ShowInCustomizationForm="True" VisibleIndex="10" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PurPackMsr" FieldName="PurPackMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="11" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PurPackUn" FieldName="PurPackUn" 
                                        ShowInCustomizationForm="True" VisibleIndex="12" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalPackMsr" FieldName="SalPackMsr" 
                                        ShowInCustomizationForm="True" VisibleIndex="13" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SalPackUn" FieldName="SalPackUn" 
                                        ShowInCustomizationForm="True" VisibleIndex="14" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="GLMethod" FieldName="GLMethod" 
                                        ShowInCustomizationForm="True" VisibleIndex="15" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="IssueMthd" FieldName="IssueMthd" 
                                        ShowInCustomizationForm="True" VisibleIndex="16" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ByWh" FieldName="ByWh" 
                                        ShowInCustomizationForm="True" VisibleIndex="17" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="MngMethod" FieldName="MngMethod" 
                                        ShowInCustomizationForm="True" VisibleIndex="18" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TaxCodeAP" FieldName="TaxCodeAP" 
                                        ShowInCustomizationForm="True" VisibleIndex="19" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TaxCodeAR" FieldName="TaxCodeAR" 
                                        ShowInCustomizationForm="True" VisibleIndex="20" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="U_BPP_TIPEXIST" FieldName="U_BPP_TIPEXIST" 
                                        ShowInCustomizationForm="True" VisibleIndex="21" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ItemType" FieldName="ItemType" 
                                        ShowInCustomizationForm="True" VisibleIndex="22" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Active" FieldName="Active" 
                                        ShowInCustomizationForm="True" VisibleIndex="23" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ManBtchNum" FieldName="ManBtchNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="24" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ManSerNum" FieldName="ManSerNum" 
                                        ShowInCustomizationForm="True" VisibleIndex="25" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ActivoC" FieldName="ActivoC" 
                                        ShowInCustomizationForm="True" VisibleIndex="26" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="ActivoS" FieldName="ActivoS" 
                                        ShowInCustomizationForm="True" VisibleIndex="27" Width="0px" Visible="false">
                                    </dx:GridViewDataTextColumn>--%>
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkProduct2" EndCallback="EndProductSearch2"/>
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
                                        <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProductOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkProduct2" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton3" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProductCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProduct2" />
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
    <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server" ClientInstanceName="hdfTemp">
    </dx:ASPxHiddenField>
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
    <dx:ASPxPopupControl ID="ppcProductSearch3" runat="server" 
        ClientInstanceName="ppcProductSearch3" FooterText=" " HeaderText="Buscar Producto Padre" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
        RenderMode="Lightweight" ShowFooter="True" Width="400px" Modal="true"
        AllowDragging="True" PopupAnimationType="Fade">
        <ContentStyle>
            <Paddings PaddingBottom="0px" />
        </ContentStyle>
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True">
                <table border="0"  style="width:100%">
                    <tr>
                        <td>
                            <table class="tablespace" style="width:100%">
                                <tr>
                                    <td id="ProductParCaption3" style="width:105px">
                                        Código:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtParProduct3" runat="server" Width="100%" 
                                            ClientInstanceName="txtParProduct3">
                                            <ClientSideEvents KeyUp="Get_Product33" />
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnProductSearch3" runat="server" Text="Buscar" Width="100%" 
                                            ClientInstanceName="btnProductSearch3" AutoPostBack="False">
                                            <ClientSideEvents Click="Get_Product3" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width:5px">
                                    </td>
                                    <td style="width:50px">
                                        <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" CheckState="Unchecked" 
                                            ClientInstanceName="chkKit" Text="Kit:" TextAlign="Left" Visible="false">
                                            <ClientSideEvents CheckedChanged="Set_Kit" />
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td style="width:200px">
                                        <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="100%" Visible="false"
                                            ClientInstanceName="txtQuantityKit" DisplayFormatString="f0">
                                            <MaskSettings Mask="&lt;0..99999999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None">
                                                <ErrorFrameStyle>
                                                    <Paddings Padding="0px" />
                                                    <Border BorderWidth="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                 <tr>
                                    <td id="Prd2" style="width:105px">
                                        Descripción:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtdescrip3" runat="server" Width="300px" 
                                            ClientInstanceName="txtdescrip3">
                                            <ClientSideEvents KeyUp="Get_Product33" />
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td id="Pr2" style="width:105px">
                                        Marca/Modelo:</td>
                                    <td style="width:300px">
                                        <dx:ASPxTextBox ID="txtmarc3" runat="server" Width="300px" 
                                            ClientInstanceName="txtmarc3">
                                            <ClientSideEvents KeyUp="Get_Product33"/>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="gdvProductSearch3" runat="server" Width="100%" 
                                AutoGenerateColumns="False" ClientInstanceName="gdvProductSearch3" 
                                KeyFieldName="ItemCode" OnCustomCallback="gdvProductSearch3_CustomCallback" 
                                KeyboardSupport="True" OnDataBinding="gdvProductSearch3_DataBinding">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="ItemCode" 
                                        ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" 
                                        VisibleIndex="0" Width="60px">
                                        <Settings AllowSort="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descripción" FieldName="ItemName" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="340px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Quantity2" 
                                        ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Almacen" FieldName="WhsCode" 
                                        ShowInCustomizationForm="True" VisibleIndex="3" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Unidad" FieldName="InvntryUom" 
                                        ShowInCustomizationForm="True" VisibleIndex="4" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    
                                </Columns>
                                <SettingsBehavior AllowSelectByRowClick="True" 
                                    AllowSelectSingleRowOnly="True" />
                                <ClientSideEvents RowDblClick="OkProduct3" EndCallback="EndProductSearch3"/>
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
                                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Ok" Width="100%" 
                                            ClientInstanceName="btnProductOk" AutoPostBack="False">
                                            <ClientSideEvents Click="OkProduct3" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Cancelar" Width="100%" 
                                            ClientInstanceName="btnProductCancel" AutoPostBack="False">
                                            <ClientSideEvents Click="CancelProduct3" />
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

