<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeBehind="ChangePassword.aspx.cs" Inherits="OneCommerce.ChangePassword" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="accountHeader">
    <h2>
        Cambiar Contraseña</h2>
    <p>Utilice el siguiente formulario para cambiar su contraseña.</p>
    <p>La nueva contraseña debe tener un mínimo de <%= Membership.MinRequiredPasswordLength %> caracteres de longitud.</p>
</div>

<br />
<dx:ASPxLabel ID="lblCurrentPassword" runat="server" Text="Contraseña antigua:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbCurrentPassword" runat="server" Password="true" Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Se requiere contraseña antigua." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Contraseña nueva:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server"
	    Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Se requiere contraseña." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblConfirmPassword" runat="server" AssociatedControlID="tbConfirmPassword"
    Text="Confirmar contraseña nueva:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbConfirmPassword" Password="true" runat="server" Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Se requiere confirmar contraseña." IsRequired="true" />
	    </ValidationSettings>
	    <ClientSideEvents Validation="function(s, e) {
			var originalPasswd = Password.GetText();
			var currentPasswd = s.GetText();
			e.isValid = (originalPasswd  == currentPasswd );
			e.errorText = 'La contraseña y la confirmación de la contraseña debe coincidir.';
		}" />
	</dx:ASPxTextBox>
</div>
<dx:ASPxButton ID="btnChangePassword" runat="server" Text="Cambiar Contraseña" ValidationGroup="ChangeUserPasswordValidationGroup"
    OnClick="btnChangePassword_Click">
</dx:ASPxButton>
</asp:Content>