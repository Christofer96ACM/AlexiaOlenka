<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Recoverer.aspx.cs" Inherits="OneCommerce.Account.Recoverer" %>
<asp:Content ID="cttMain" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq.js"></script>
<script type="text/javascript" src="../Scripts/Linq/linq-min.js"></script>
<script type="text/javascript" src="../Scripts/Login/Recoverer.js"></script>
<!-- Custom Theme files -->
<link href="../Content/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- font-awesome icons -->
<link href="../Content/font-awesome.css" rel="stylesheet"  type="text/css"> 
<!-- //font-awesome icons -->
<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">


    <dx:ASPxFormLayout runat="server" ID="frlMain" 
        RequiredMarkDisplayMode="None" EnableViewState="False" EnableTabScrolling="true">
        <Items>
            <dx:LayoutGroup Caption="ALEXIA CLOUD"  GroupBoxStyle-Caption-Font-Size="X-Large" ShowCaption="False"
                SettingsItemHelpTexts-Position="Bottom" 
                GroupBoxDecoration="HeadingLine">
                <Items>
                    <dx:LayoutItem Caption="Alexia Cloud" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer ID="licMain" runat="server" 
                                SupportsDisabledAttribute="True">
                                <div class="signin-form reset-password" style="width:300px ; height:280px; background-color:#BFDBFF;" >
						            <h3 style="font-weight:bold;">Cambiar Contraseña</h3>
                                        <dx:ASPxTextBox ID="UserName" runat="server" CssClass="input100" ClientInstanceName="tbUserName" Native="true" placeholder="Nombre Usuario">
                                            <ValidationSettings  Display="None" ValidationGroup="LoginUserValidationGroup"  >
                                                <RequiredField ErrorText="Se requiere nombre de usuario." IsRequired="true"   />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
							            <dx:ASPxTextBox ID="Password" CssClass="input100" runat="server" Password="True" placeholder="Contraseña Nueva" Native="true"
                                            ClientInstanceName="tbPassword">
                                            <ValidationSettings Display="None" ValidationGroup="LoginUserValidationGroup" >
                                                <RequiredField ErrorText="Se requiere contraseña."  IsRequired="true" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
							            <dx:ASPxTextBox ID="tbPasswordConfirm" CssClass="input100" runat="server" Password="True" placeholder="Confirmar Contraseña" Native="true"
                                            ClientInstanceName="tbPasswordConfirm">
                                            <ValidationSettings Display="None" ValidationGroup="LoginUserValidationGroup" >
                                                <RequiredField ErrorText="Se requiere contraseña."  IsRequired="true" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
							            <dx:ASPxButton ID="Button" runat="server" CssClass="send" Text="Actualizar" Native="true" >
                                            <ClientSideEvents Click="Init_Session" />
							            </dx:ASPxButton>

					            </div>
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
                                    DataSourceID="XmlDataSourceFooter" ClientInstanceName="mnuOper" Visible="false"
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
    <dx:ASPxLoadingPanel ID="ldpLoading" runat="server" 
        ClientInstanceName="ldpLoading" Modal="True" 
        Text="CARGANDO&amp;hellip;">
    </dx:ASPxLoadingPanel>
    <dx:ASPxHiddenField ID="hdfTemp" runat="server" ClientInstanceName="hdfTemp">
    </dx:ASPxHiddenField>
    <dx:ASPxCallback ID="clbSession" runat="server" ClientInstanceName="clbSession" 
        oncallback="clbSession_Callback">
        <ClientSideEvents CallbackComplete="CallbackComplete"/>
    </dx:ASPxCallback>
<link type="text/css" rel="stylesheet" href="../Content/EstilosChristofer.css">
</asp:Content>

