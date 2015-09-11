<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="noticias.aspx.vb" Inherits="psi.noticias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
    
    </div>
        <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
    </form>
</body>
</html>
