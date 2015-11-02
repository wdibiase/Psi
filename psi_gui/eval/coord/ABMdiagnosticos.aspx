<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ABMdiagnosticos.aspx.vb" Inherits="psi.ABMdiagnosticos" 
    MasterPageFile="~/eval/coord/Coord.Master" %>
<%@ MasterType VirtualPath="~/eval/coord/Coord.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="pagina">
    <div class="col-md-12" id="MenuOpciones" role="tabpanel">
        <ul class="nav nav-tabs" id="abm" role="tablist">
            <li id="liLista" class="active"><asp:LinkButton runat="server" ID="Lista" Text="Lista" CausesValidation="false" /></li>
            <li id="liDetalle"><asp:LinkButton runat="server" ID="Detalle" Text="Detalle" CausesValidation="false" /></li>
            <li id="l3"><asp:LinkButton runat="server" ID="lnkNuevo" Text="Nuevo" CausesValidation="false" /></li>
        </ul>
        <asp:Label runat="server" id="lblEvals" Text="Evaluadores" /><asp:DropDownList runat="server" ID="cboEvals" /><asp:Button runat="server" ID="btnSelEval" Text="Seleccionar" OnClick="btnSelEval_Click" /><br />
        <asp:Label runat="server" id="lblPacientes" Text="Pacientes" /><asp:DropDownList runat="server" ID="cboPacientes" /><asp:Button runat="server" ID="btnSelPac" Text="Seleccionar" OnClick="btnSelPac_Click" /><br />
        <asp:Label runat="server" id="Label2" Text="Historia Clínica" /> <br />
        <asp:GridView runat="server" ID="lstHC" /><br />
    </div>
</asp:Content>