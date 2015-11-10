<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ABMevaluadores.aspx.vb" Inherits="psi_gui.ABMevaluadores"
    MasterPageFile="~/eval/coord/Coord.Master" %>
<%@ MasterType VirtualPath="~/eval/coord/Coord.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="pagina">
    <div class="col-md-12" id="MenuOpciones" role="tabpanel">
        <ul class="nav nav-tabs" id="abm" role="tablist">
            <li id="liLista" class="active"><asp:LinkButton runat="server" ID="Lista" Text="Lista" OnClick="Lista_Click" CausesValidation="false" /></li>
            <li id="liDetalle"><asp:LinkButton runat="server" ID="Detalle" Text="Detalle" OnClick="Detalle_Click" CausesValidation="false" /></li>
            <li id="l3"><asp:LinkButton runat="server" ID="lnkNuevo" Text="Nuevo" OnClick="lnkNuevo_Click" CausesValidation="false" /></li>
        </ul>
        <asp:Button ID="submit" runat="server" Visible="false" OnClick="Detalle_Click" />
        <asp:Panel runat="server" ID="panelLista" Visible="true">
            <div class="container-fluid" role="tabpanel">
                <asp:GridView ID="lstUsuarios" runat="server" CssClass="table-hover table-responsive" 
                        AllowPaging="True" PageSize="5">
                    <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:ButtonField ButtonType="Image" ImageUrl="~/Images/bullet.png" 
                            InsertVisible="False" Text="Botón" CommandName="Select" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="|&lt; " LastPageText=" &gt;|" Mode="NextPreviousFirstLast" 
                        PageButtonCount="5" NextPageText="&gt; " PreviousPageText="&lt; " />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="btn-info" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" id="panelDetalle" Visible="true">
            <asp:Button ID="btnEditar" runat="server" CssClass="btn-toolbar" Text="Editar" Enabled="false" OnClick="btnEditar_Click" CausesValidation="false" />
            <asp:Button ID="btnEstado" runat="server" CssClass="btn-toolbar" Text="Cambiar Estado" Enabled="false" />
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn-toolbar" Text="Guardar" Visible="false" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnGuardarNuevo" runat="server" cssclass="btn-toolbar" Text="Guardar" Visible="false" OnClick="btnGuardarNuevo_Click" />
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn-toolbar" Text="Cancelar" Visible="false" CausesValidation="false" />
            <br />
            <div class="table">
                <div class="row">
                    <div class="col-lg-8">
                        <asp:Label runat="server" ID="lblUsuario" Text="Nombre de usuario " />
                        <asp:TextBox runat="server" ID="txtUsuario" Enabled="true" />
                        <asp:Label runat="server" ID="lblEstado" Text="Estado " />
                        <asp:DropDownList runat="server" ID="cboEstado" Enabled="true" />
                        <br />
                    </div>
                    <div class="col-lg-8">
                        <asp:Label runat="server" ID="lblTipoDoc" Text="Tipo de Doc. " />
                        <asp:DropDownList runat="server" ID="cboDoc" AutoPostBack="true" />
                        <asp:Label runat="server" ID="lblNroDoc" Text="Nro de Doc. " />
                        <asp:TextBox runat="server" ID="txtDoc" />
                        <br />
                    </div>
                    <div class="col-lg-8">
                        <asp:Label runat="server" ID="lblEmail" Text="Email " />
                        <asp:TextBox runat="server" ID="txtEmail" />
                        <asp:Label runat="server" ID="lblNombre" Text="Nombre " />
                        <asp:TextBox runat="server" ID="txtNombre" />
                        <asp:Label runat="server" ID="lblApellido" Text="Apellido " />
                        <asp:TextBox runat="server" ID="txtApellido" />
                        <br />
                    </div>
                    <div class="col-lg-8">
                        <asp:Label runat="server" ID="lblIdioma" Text="Idioma " />
                        <asp:DropDownList runat="server" ID="cboIdioma" AutoPostBack="true" />
                        <asp:Label runat="server" ID="Label1" Text="Perfil " />
                        <asp:DropDownList runat="server" ID="lstPerfiles" />
                    </div>
                    <div style="position:inherit; left:20px">
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" CssClass="alert-warning" ErrorMessage="Falta el nombre de usuario" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Falta el e-mail" CssClass="alert-warning" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Falta el nombre" CssClass="alert-warning" />
                        <asp:RequiredFieldValidator ID="rfvNroDoc" runat="server" ControlToValidate="txtDoc" ErrorMessage="Falta el documento" CssClass="alert-warning" />
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
