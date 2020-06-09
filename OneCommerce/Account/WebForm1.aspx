<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="OneCommerce.Account.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Sales/permission.js"></script>

<div>
<h3>Control de Usurario</h3>
</div>
<div>
<table>
<tr>
<td>    
    &nbsp;</td>
</tr>
</table>
</div>
<div>  
<h5>Usuario :</h5>
    <br />
    <table style="width: 100%">
        <tr>
            <td style="width: 257px">
<dx:ASPxComboBox ID="cbouser" runat="server" 
        ClientInstanceName="cbouser" Height="16px" Width="246px">
    <ClientSideEvents SelectedIndexChanged="Get_Permisos" />
</dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" AutoPostBack="False" 
                    ClientInstanceName="btnBuscar">
                    <ClientSideEvents Click="Get_Permisos" />
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
<div>
<h5>Permisos :</h5>
<table>
<tr>
<td align="center">
    <dx:ASPxGridView ID="dgPermisos" runat="server" AutoGenerateColumns="False" KeyFieldName="PrjCode"
        Width="537px" ClientInstanceName="dgPermisos" 
        oncustomcallback="dgPermisos_CustomCallback" 
        ondatabinding="dgPermisos_DataBinding" 
        onrowupdating="dgPermisos_RowUpdating">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowInCustomizationForm="True">
                <EditButton Visible="True">
                </EditButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="PrjCode" VisibleIndex="1"  ShowInCustomizationForm="True"
                Caption="PrjCode" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PrjName" VisibleIndex="3"  ShowInCustomizationForm="True"
                Caption="Local" Width="150px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="alf_soci"  ShowInCustomizationForm="True"
                VisibleIndex="2" Caption="Sociedad">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Permiso" FieldName="Permition"  ShowInCustomizationForm="True"
                VisibleIndex="4">
                <PropertiesCheckEdit AllowGrayedByClick="False" EnableDefaultAppearance="true" 
                    ValueGrayed="True">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsBehavior AllowSort="False" />
        <SettingsPager Visible="False">
        </SettingsPager>
        <SettingsEditing Mode="Inline" NewItemRowPosition="Bottom" />
        <Settings HorizontalScrollBarMode="Auto" />
        <SettingsLoadingPanel Mode="Disabled" />
    </dx:ASPxGridView>
</td>
</tr>
</table>
</div>
<div>
    <dx:ASPxHiddenField ID="HiddenFieldPar" runat="server" 
        ClientInstanceName="HiddenFieldPar">
    </dx:ASPxHiddenField>   
</div>
</asp:Content>
