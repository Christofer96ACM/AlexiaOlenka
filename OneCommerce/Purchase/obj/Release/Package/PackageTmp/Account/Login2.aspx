<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="OneCommerce.Account.Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../Content/loginstyle/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Content/loginstyle/vendor/bootstrap/css/bootstrap.min.css">


<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Content/loginstyle/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Content/loginstyle/vendor/animate/animate.css">


<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../Content/loginstyle/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Content/loginstyle/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../Content/loginstyle/css/util.css">
	<link rel="stylesheet" type="text/css" href="../Content/loginstyle/css/main.css">
<!--===============================================================================================-->

</head>
<body>


    	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="../Content/loginstyle/images/login.jpg" alt="IMG" />
				</div>

				<form class="login100-form validate-form" runat="server">
                   <script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.js"></script>
                <script type="text/javascript" src="../Scripts/Jquerys/jquery-1.10.2.min.js"></script>
                <script type="text/javascript" src="../Scripts/Login/Login.js"></script>



 

   

 
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




					<span class="login100-form-title">
						Iniciar Sesión
					</span>
                   <dx:ASPxLabel ID="lblSocied" runat="server" AssociatedControlID="cbbSocied" Text="Sociedad:" Visible="false"  />
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">


                         <dx:ASPxTextBox ID="txtruc" runat="server" CssClass="input100"  placeholder="RUC" ClientInstanceName="txtruc" Native="true">
                             <ClientSideEvents TextChanged="cargarLocales"/>
       
                        </dx:ASPxTextBox>


						
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-university" aria-hidden="true"></i>
						</span>
					</div>


					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
					

                            <dx:ASPxLabel ID="lblProject" runat="server" AssociatedControlID="cbbProject" Text="Local:" Visible="false" />
                                <div class="form-field">
                                    <dx:ASPxComboBox ID="cbbProject" runat="server" CssClass="input100" Border-BorderWidth="0" EnableSynchronization="False" Native="true"
                                        ClientInstanceName="cbbProject" OnCallback="cbbProject_Callback">
                                        
                                        <ClientSideEvents SelectedIndexChanged="Sel_Project"/>
                                    </dx:ASPxComboBox>
                                </div>



						


						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-university" aria-hidden="true"></i>
						</span>
					</div>


                    <dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="UserName" Text="Nombre de usuario:" Visible="false"  />
                           
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                                <dx:ASPxTextBox ID="UserName" runat="server" CssClass="input100" ClientInstanceName="tbUserName" Native="true" placeholder="Nombre Usuario">
                                    <ValidationSettings  Display="None" ValidationGroup="LoginUserValidationGroup"  >
                                        <RequiredField ErrorText="Se requiere nombre de usuario." IsRequired="true"   />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                          


						
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>
                            <dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="Password" Text="Contraseña:" Visible="false"  ClientInstanceName="lblPassword" />

					<div class="wrap-input100 validate-input" data-validate = "Password is required">


                           
                                <dx:ASPxTextBox ID="Password" CssClass="input100" runat="server" Password="True" placeholder="Contraseña" Native="true"
                                    ClientInstanceName="tbPassword">
                                    <ValidationSettings Display="None" ValidationGroup="LoginUserValidationGroup" >
                                        <RequiredField ErrorText="Se requiere contraseña."  IsRequired="true" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                           

						
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">

                           <dx:ASPxButton ID="LoginButton" runat="server"  CssClass="login100-form-btn" Text="Iniciar Sesion" Native="true"
                                ValidationGroup="LoginUserValidationGroup" AutoPostBack="False">
                                <ClientSideEvents Click="Init_Session" />
                            </dx:ASPxButton>

						
					</div>

				</form>
			</div>
		</div>
	</div>
	
	

	






   
</body>
</html>
