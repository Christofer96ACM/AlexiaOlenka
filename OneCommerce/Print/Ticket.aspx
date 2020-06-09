<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="OneCommerce.Print.Ticket" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Impresión Ticket Boleta</title>
    <script type="text/javascript" src="../Scripts/Print/Ticket.js"></script>
    <style type="text/css">
        body { font: 13px/1.3 verdana, arial, helvetica, sans-serif; }
        pre { font-size:medium; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 300px; height: auto">
        <dx:ASPxButton ID="sbtPrint" runat="server" AutoPostBack="False" 
            ClientInstanceName="sbtPrint" Text="Imprimir" UseSubmitBehavior="False">
            <ClientSideEvents Click="PrintTicket" />
        </dx:ASPxButton>
    </div>
    <div id="Area" 
        style="width: 300px; height: auto;">    
        <table id="tkt" cellspacing="0" colspan="0" 
            style="width: 100%; color: #000000;">
            <tr>
                <td id="CompanyName" align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td id="Ruc" align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td id="CompanyAddress" align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td id="Phone" align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td id="SerieMaqr" align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td id="NumAtCard">
                    &nbsp;</td>
            </tr>
            <tr>
                <td id="DocDate">
                    &nbsp;</td>
            </tr>
            <tr>
                <td id="CardName">
                    &nbsp;</td>
            </tr>
            </table>    
    </div>
    </form>
</body>
</html>
