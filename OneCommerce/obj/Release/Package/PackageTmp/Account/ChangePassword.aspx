<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="ChangePassword.aspx.cs" Inherits="OneCommerce.ChangePassword" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="accountHeader">
    <h2>
        Cambiar Contrase�a</h2>
    <p>Utilice el siguiente formulario para cambiar su contrase�a.</p>
    <p>La nueva contrase�a debe tener un m�nimo de <%= Membership.MinRequiredPasswordLength %> caracteres de longitud.</p>
</div>

<br />
<dx:ASPxLabel ID="lblCurrentPassword" runat="server" Text="Contrase�a antigua:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbCurrentPassword" runat="server" Password="true" Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Se requiere contrase�a antigua." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Contrase�a nueva:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server"
	    Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Se requiere contrase�a." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblConfirmPassword" runat="server" AssociatedControlID="tbConfirmPassword"
    Text="Confirmar contrase�a nueva:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbConfirmPassword" Password="true" runat="server" Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Se requiere confirmar contrase�a." IsRequired="true" />
	    </ValidationSettings>
	    <ClientSideEvents Validation="function(s, e) {
			var originalPasswd = Password.GetText();
			var currentPasswd = s.GetText();
			e.isValid = (originalPasswd  == currentPasswd );
			e.errorText = 'La contrase�a y la confirmaci�n de la contrase�a debe coincidir.';
		}" />
	</dx:ASPxTextBox>
</div>
<dx:ASPxButton ID="btnChangePassword" runat="server" Text="Cambiar Contrase�a" ValidationGroup="ChangeUserPasswordValidationGroup"
    OnClick="btnChangePassword_Click">
</dx:ASPxButton>
</asp:Content>