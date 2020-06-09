<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="Register.aspx.cs" Inherits="OneCommerce.Register" %>

<asp:content id="ClientArea" contentplaceholderid="MainContent" runat="server">
    <div class="accountHeader">
    <h2>
        Crear una Nueva Cuenta</h2>
    <p>Utilice el siguiente formulario para crear una nueva cuenta.</p>
    <p>Las contraseñas deben tener un mínimo de <%= Membership.MinRequiredPasswordLength %> caracteres de longitud.</p>
</div>
    <dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="tbUserName" Text="Nombre de usuario:" />
	<div class="form-field">
	    <dx:ASPxTextBox ID="tbUserName" runat="server" Width="200px">
	        <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
	            <RequiredField ErrorText="Se requiere nombre de usuario." IsRequired="true" />
	        </ValidationSettings>
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="lblEmail" runat="server" AssociatedControlID="tbEmail" Text="E-mail:" />
    <div class="form-field">
		<dx:ASPxTextBox ID="tbEmail" runat="server" Width="200px">
	        <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
	            <RequiredField ErrorText="Se requiere E-mail." IsRequired="true" />
	            <RegularExpression ErrorText="Email validation failed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
	        </ValidationSettings>
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Contraseña:" />
    <div class="form-field">
		<dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server"
	        Width="200px">
	        <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
	            <RequiredField ErrorText="Se requiere contraseña." IsRequired="true" />
	        </ValidationSettings>
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxLabel ID="lblConfirmPassword" runat="server" AssociatedControlID="tbConfirmPassword"
        Text="Confirmar contraseña:" />
	<div class="form-field">
	    <dx:ASPxTextBox ID="tbConfirmPassword" Password="true" runat="server" Width="200px">
	        <ValidationSettings ValidationGroup="RegisterUserValidationGroup">
	            <RequiredField ErrorText="Se requiere confirmación de contraseña." IsRequired="true" />
	        </ValidationSettings>
	        <ClientSideEvents Validation="function(s, e) {
				var originalPasswd = Password.GetText();
				var currentPasswd = s.GetText();
				e.isValid = (originalPasswd  == currentPasswd );
				e.errorText = 'La contraseña y la confirmación de la contraseña debe coincidir.';
			}" />
	    </dx:ASPxTextBox>
    </div>
    <dx:ASPxButton ID="btnCreateUser" runat="server" Text="Crear Usuario" ValidationGroup="RegisterUserValidationGroup"
        OnClick="btnCreateUser_Click">
    </dx:ASPxButton>
</asp:content>