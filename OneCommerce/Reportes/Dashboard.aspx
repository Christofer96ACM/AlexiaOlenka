<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OneCommerce.Reportes.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <dx:ASPxDashboardViewer runat="server" ID="dashboardViewer1" Width="100%" Height="100%" DashboardId="idTablero"
        RegisterJQuery="True" DashboardXmlFile="Config/Dashboard.xml" OnDashboardLoading="dashboardViewer1_DashboardLoading" OnDataLoading="dashboardViewer1_DataLoading" AllowExportDashboard="true" AllowExportDashboardItems="True">
    </dx:ASPxDashboardViewer>

    <dx:ASPxPopupControl ID="PopupControl" runat="server" CloseAction="OuterMouseClick" LoadContentViaCallback="OnFirstShow"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" AllowDragging="True"
        ShowFooter="True" Width="500px" Height="300px" HeaderText="Filtros de fechas" ClientInstanceName="ClientPopupControl">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
                <div style="vertical-align: middle">
                    <dx:ASPxFormLayout ID="formLayout" runat="server">
                        <Items>
                            <dx:LayoutGroup GroupBoxDecoration="None">
                                <Items>
                                    <dx:LayoutItem Caption="Seleccionar Sede">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="navigateComboBox" runat="server" EnableSynchronization="False" 
                                                    TextField="PrjName" ValueField="PrjCode">
                                                    <Items>
                                                        <dx:ListEditItem Value="-" Text="<Seleccionar>" />
                                                    </Items>
                                                </dx:ASPxComboBox>

                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:LayoutGroup>
                            <dx:LayoutGroup Caption="Seleccione fecha inicio y fecha fin" ColCount="2" SettingsItemCaptions-Location="Top">
                                <Items>
                                    <dx:LayoutItem Caption="Inicio">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxCalendar runat="server" ID="caleInicio" ShowClearButton="false" ShowHeader="true"
                                                    ShowTodayButton="false" ShowWeekNumbers="false" HighlightToday="true" Width="100%">
                                                </dx:ASPxCalendar>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Fin">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer>
                                                <dx:ASPxCalendar runat="server" ID="caleFin" ShowClearButton="false" ShowHeader="true"
                                                    ShowTodayButton="false" ShowWeekNumbers="false" HighlightToday="true" Width="100%">
                                                </dx:ASPxCalendar>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>


                                </Items>
                            </dx:LayoutGroup>
                        </Items>
                    </dx:ASPxFormLayout>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <FooterTemplate>
            <div style="float: right; margin: 3px;">
                <dx:ASPxButton ID="UpdateButton" runat="server" Text="Actualizar Dashboard" AutoPostBack="true" OnClick="UpdateButton_Click"
                     >
                 
                </dx:ASPxButton>
            </div>
        </FooterTemplate>
    </dx:ASPxPopupControl>
   
    <asp:HiddenField ID="hffechaInicio" runat="server" />
     <asp:HiddenField ID="hffechaFin" runat="server" />
    <style>
        .dx-theme-desktop .widget-viewer-container .cardItem .mainValue
        {
            font-weight: bold;
            font-size: 30px !important;
        }

        .filter
        {
            background-image: url(Config/Action_Filter_32x32.png) !important;
        }
    </style>

    <script>
      
        var Escucha = setInterval('MostrarFiltro()', 3000);

        function sleep(milliseconds) {
            const date = Date.now();
            let currentDate = null;
            do {
                currentDate = Date.now();
            } while (currentDate - date < milliseconds);
        }

        function MostrarFiltro(){
            if ($('.dx-dashboard-loading').length) {
                return;
            } else {
               // sleep(2000);
                $(".dx-dashboard-export").parent().append("<div class='dx-dashboard-export filter' title='Filter' id='btnFilterDashBoard'></div>")
                clearInterval(Escucha);
                //sleep(1000);

                $('#btnFilterDashBoard').click(function (){
                    ClientPopupControl.Show();
                });

                $('.dx-dashboard-title-text').html($('.dx-dashboard-title-text').html().replace('II/II/IIII',$('#ctl00_ctl00_ASPxSplitter1_Content_ContentSplitter_MainContent_hffechaInicio').val()).replace('FF/FF/FFFF',$('#ctl00_ctl00_ASPxSplitter1_Content_ContentSplitter_MainContent_hffechaFin').val()));
                $('.axis-elements text tspan').each(function(i, obj) {
                    obj.innerHTML=obj.innerHTML.capitalizeParagraph();
                    if(!isNaN(obj.innerHTML.substring(0,1)))
                    {    
                        var ultimoDigito = obj.innerHTML.substring(obj.innerHTML.length - 1, obj.innerHTML.length);
                        if(ultimoDigito.toUpperCase()=='K'){
                            obj.innerHTML = obj.innerHTML.replace(ultimoDigito,'')*1000;
                        }
                        if(ultimoDigito.toUpperCase()=='M'){
                            obj.innerHTML = obj.innerHTML.replace(ultimoDigito,'')*1000000;
                        }
                        if(ultimoDigito.toUpperCase()=='B'){
                            obj.innerHTML = obj.innerHTML.replace(ultimoDigito,'')*1000000000;
                        }
                    }
                });
            }
        }

        String.prototype.trim = function () {
            return this.replace(/^\s+/, '').replace(/\s+$/, '');
        };
    
        String.prototype.capitalizeParagraph = function() {
            var res = "";
            var paragraphs = this.split(".");
            for(var i = 0; i < paragraphs.length ; i++) {
                var temp = paragraphs[i].trim();
                res += "." + temp.charAt(0).toUpperCase() + temp.slice(1).toLowerCase();
            }
            return res.slice(1);
        };

    </script>
</asp:Content>
