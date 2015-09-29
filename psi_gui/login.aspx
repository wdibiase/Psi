<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb"  Inherits="psi.login" MasterPageFile="~/Main.Master" Title="Psi Login" %>
<%@ MasterType VirtualPath="~/Main.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="cuerpo">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="../../favicon.ico" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/signin.css" rel="stylesheet" />

    <script type="text/javascript" src="js/ie-emulation-modes-warning.js"></script>
    <script type="text/javascript" src="js/wdb.js"></script>
    <style type="text/css"></style><style type="text/css"></style>
    <link rel="stylesheet" type="text/css" href="css/socialwidgets.css" />

    <div class="container" style="position: relative; top: 60px; z-index:10;">
        <div class="form-signin" runat="server">
            <h2 class="form-signin-heading">Iniciar sesión</h2>
            <asp:textbox ID="txtUsermail" CssClass="input-group form-control" runat="server" AutoCompleteType="Email" Placeholder="Usuario o email" />
            <asp:textbox ID="txtPassword" Placeholder="Contraseña" CssClass="input-group form-control" TextMode="Password" runat="server" Text="Contraseña"></asp:textbox>
            <label>
                <asp:checkbox ID="chkRem" CssClass="checkbox-inline" runat="server" Text="Recuérdame" Checked="true"></asp:checkbox>
            </label>
            <asp:Button ID="btnLogin" CssClass="btn btn-lg btn-primary btn-block" runat="server" 
                    Text="Iniciar Sesión" OnClick="btnLogin_Click" />
            <asp:Label ID="lblLoginError" runat="server" Visible="false" />
        </div>
    </div> 
    <script src="js/ie10-viewport-bug-workaround.js" type="text/javascript"></script>
</asp:Content>