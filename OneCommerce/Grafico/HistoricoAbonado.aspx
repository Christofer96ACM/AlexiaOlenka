<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HistoricoAbonado.aspx.cs" Inherits="OneCommerce.Grafico.ConsumoAbonado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Trafico en vivo!</title>
    <script type="text/javascript" src="../Scripts/Jquerys/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 

  
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input type="text" runat="server" name="txtIP" id="txtIP" value="190.116.50.218" />
        <input type="text" runat="server" name="txtUSERNAME" id="txtUSERNAME" value="soporte" />
        <input type="text" runat="server" name="txtPASSWORD" id="txtPASSWORD" value="odex2020" />
        <input type="text" runat="server" name="txtABONADO" id="txtABONADO" value="<pppoe-0045>" />

    </div>
    </form>
    <script type="text/javascript" src="highchart/js/highcharts.js"></script>
    <script type="text/javascript" src="highchart/js/themes/gray.js"></script>
    <script type="text/javascript" src="../Scripts/Tools/JSConsumoAbonado.js"></script>

	<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
    <div id="trafico"></div>
</body>
</html>
