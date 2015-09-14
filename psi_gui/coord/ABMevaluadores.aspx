<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ABMevaluadores.aspx.vb" Inherits="psi.ABMevaluadores"
    MasterPageFile="~/admin/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="pagina">
    <div class="col-md-12" id="MenuOpciones">
        <ul class="nav nav-tabs" id="abm">
            <li id="liLista" class="active"><asp:LinkButton runat="server" ID="Lista" Text="Lista" OnClick="Lista_Click" /></li>
            <li id="liDetalle"><asp:LinkButton runat="server" ID="Detalle" Text="Detalle" OnClick="Detalle_Click" /></li>
            <li id="l3"><asp:LinkButton runat="server" ID="Asignar" Text="Asignar" OnClick="Asignar_Click" /></li>
        </ul>
        <asp:Panel runat="server" ID="panelLista" Visible="true">
            <div class="container-fluid" role="tabpanel">
                <asp:GridView ID="gridEvals" runat="server" CssClass="table-hover table-responsive"
                        AllowPaging="True" AllowSorting="True"
                        OnSelectedIndexChanged="gridEvals_SelectedIndexChanged" EnableSortingAndPagingCallbacks="True"
                        PagerSettings-Mode="NextPreviousFirstLast" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        PageSize="5" >
                    <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:ButtonField ButtonType="Image" ImageUrl="~/Images/bullet.png" InsertVisible="False" Text="Botón" CommandName="Select"/>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView><br />
            </div>
        </asp:Panel>
        <asp:Panel runat="server" id="panelDetalle" Visible="true">
            <asp:Button ID="btnNuevo" runat="server" CssClass="btn-toolbar" Text="Nuevo" OnClick="btnNuevo_Click"/>
            <asp:Button ID="btnEditar" runat="server" CssClass="btn-toolbar" Text="Editar" OnClick="btnEditar_Click" />
            <asp:Button ID="btnEstado" runat="server" CssClass="btn-toolbar" Text="Cambiar Estado" OnClick="btnEstado_Click" />
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn-toolbar" Text="Guardar" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnGuardarNuevo" runat="server" cssclass="btn-toolbar" Text="Guardar" OnClick="btnGuardarNuevo_Click" />
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn-toolbar" Text="Cancelar" OnClick="btnCancelar_Click" />
            <div class="table">
                <div class="row">
                    <div class="col-lg-8">
                        <asp:Label runat="server" ID="lblIdCliente" Text="Id Cliente "></asp:Label><asp:TextBox runat="server" ID="txtIdCliente" ReadOnly="true" Enabled="false"></asp:TextBox><br />
                        <asp:Label runat="server" ID="lblSuscripcion" Text="Suscripción "></asp:Label><asp:DropDownList runat="server" ID="cboSuscripcion"></asp:DropDownList><br />
                        <asp:Label runat="server" ID="lblPcia" Text="Provincia "></asp:Label><asp:DropDownList runat="server" ID="cboProvincias" OnSelectedIndexChanged="cboProvincias_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList><br />
                        <asp:Label runat="server" ID="lblPartido" Text="Partido "></asp:Label><asp:DropDownList runat="server" ID="cboPartido" OnSelectedIndexChanged="cboPartido_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList><br />
                        <asp:Label runat="server" ID="lblLocalidad" Text="Localidad "></asp:Label><asp:DropDownList runat="server" ID="cboLocalidad"></asp:DropDownList><br />
                        <asp:Label runat="server" ID="lblCalle" Text="Calle "></asp:Label><asp:TextBox runat="server" ID="txtCalle"></asp:TextBox>
                        <asp:Label runat="server" ID="lblNumero" Text="Nro "></asp:Label><asp:TextBox runat="server" ID="txtNumero"></asp:TextBox>
                        <asp:Label runat="server" ID="lblPiso" Text="Piso "></asp:Label><asp:TextBox runat="server" ID="txtPiso"></asp:TextBox>
                        <asp:Label runat="server" ID="lnlDpto" Text="Depto "></asp:Label><asp:TextBox runat="server" ID="txtDpto"></asp:TextBox>
                        <asp:Label runat="server" ID="lblEstado" Text="Estado "></asp:Label><asp:DropDownList runat="server" ID="cboEstado" OnSelectedIndexChanged="cboEstado_SelectedIndexChanged"></asp:DropDownList><br />
                        <asp:Label runat="server" ID="lblCUIT" Text ="CUIT "></asp:Label><asp:TextBox runat="server" ID="txtCUIT"></asp:TextBox><br />
                        <asp:Label runat="server" ID="lblRazonSocial" Text="Razón Social "></asp:Label><asp:TextBox runat="server" ID="txtRazonSocial"></asp:TextBox><br />
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
