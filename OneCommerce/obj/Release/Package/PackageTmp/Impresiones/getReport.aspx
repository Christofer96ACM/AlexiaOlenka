﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getReport.aspx.cs" Inherits="OneCommerce.Impresiones.getReport" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=14.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script lang="javaScript" type="text/javascript" src="../crystalreportviewers14/js/crviewer/crv.js"></script> 
</head>
<body>
    <form id="form1" runat="server" style="height:100%; width:100%;">
    <div >
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
    </div>
    </form>
</body>
</html>
