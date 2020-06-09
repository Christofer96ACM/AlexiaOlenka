<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="Login.aspx.cs" Inherits="OneCommerce.Login" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../Scripts/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../Scripts/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../Scripts/Login/Login.js"></script>
    <div class="accountHeader">
        <h2>
            Iniciar Sesión</h2>
        <p>
            Introduzca su nombre de usuario y contraseña. 
		    <%--<a href="Register.aspx">Registrar</a> si usted no tiene una cuenta.--%>
        </p>
    </div>
    <dx:ASPxLabel ID="lblSocied" runat="server" AssociatedControlID="cbbSocied" Text="Sociedad:" />
    <div class="form-field">
         <dx:ASPxTextBox ID="txtruc" runat="server" Width="200px" ClientInstanceName="txtruc">
             <ClientSideEvents TextChanged="cargarLocales"/>
             <%--<ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip"
                SetFocusOnError="True">
                <RequiredField ErrorText="Nro. Documento incorrecto." IsRequired="True" />
                <RegularExpression ErrorText="Nro. Documento incorrecto." ValidationExpression="[0-9]+(\.[0-9][0-9]?)?"></RegularExpression>
                <RequiredField IsRequired="True" ErrorText="Nro. Documento incorrecto."></RequiredField>
            </ValidationSettings>--%>
        </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="lblProject" runat="server" AssociatedControlID="cbbProject" Text="Local:" />
    <div class="form-field">
        <dx:ASPxComboBox ID="cbbProject" runat="server" EnableSynchronization="False"
            Width="200px" ClientInstanceName="cbbProject" OnCallback="cbbProject_Callback">
            <ClientSideEvents SelectedIndexChanged="Sel_Project"/>
        </dx:ASPxComboBox>
    </div>
    <dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="UserName" Text="Nombre de usuario:" />
    <div class="form-field">
        <dx:ASPxTextBox ID="UserName" runat="server" Width="200px" ClientInstanceName="tbUserName">
            <ValidationSettings ValidationGroup="LoginUserValidationGroup">
                <RequiredField ErrorText="Se requiere nombre de usuario." IsRequired="true" />
            </ValidationSettings>
        </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="Password" Text="Contraseña:" ClientInstanceName="lblPassword" />
    <div class="form-field">
        <dx:ASPxTextBox ID="Password" runat="server" Password="True" Width="200px" 
            ClientInstanceName="tbPassword">
            <ValidationSettings ValidationGroup="LoginUserValidationGroup">
                <RequiredField ErrorText="Se requiere contraseña." IsRequired="true" />
            </ValidationSettings>
        </dx:ASPxTextBox>
    </div>
    <dx:ASPxButton ID="LoginButton" runat="server" Text="Iniciar Sesión"
        ValidationGroup="LoginUserValidationGroup" AutoPostBack="False">
        <ClientSideEvents Click="Init_Session" />
    </dx:ASPxButton>
    <dx:ASPxCallback ID="clbSession" runat="server" ClientInstanceName="clbSession" 
        oncallback="clbSession_Callback">
        <ClientSideEvents CallbackComplete="CallbackComplete"/>
    </dx:ASPxCallback>
    <dx:ASPxHiddenField ID="hdfLocal" runat="server" ClientInstanceName="hdfLocal">
    </dx:ASPxHiddenField>
    <dx:ASPxLoadingPanel ID="ldpLoading" runat="server" 
        ClientInstanceName="ldpLoading" Modal="True" 
        Text="Iniciando Sesión&amp;hellip;">
    </dx:ASPxLoadingPanel>
</asp:Content>