<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ABMpacientes.aspx.vb" Inherits="psi.ABMpacientes"
    MasterPageFile="~/coord/Coord.Master" %>
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
                    <asp:GridView ID="gridPacientes" runat="server" CssClass="table-hover table-responsive" 
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
                            <asp:Label runat="server" ID="lblTipoDoc" Text="Tipo de Doc. " />
                            <asp:DropDownList runat="server" ID="cboDocumento" AutoPostBack="true" />
                            <asp:Label runat="server" ID="lblNroDoc" Text="Nro de Doc. " />
                            <asp:TextBox runat="server" ID="txtNroDoc" />
                            <br />
                        </div>
                        <div class="col-lg-8">
                            <asp:Label runat="server" ID="lblNombre" Text="Nombre " />
                            <asp:TextBox runat="server" ID="txtNombre" />
                            <asp:Label runat="server" ID="lblApellido" Text="Apellido " />
                            <asp:TextBox runat="server" ID="txtApellido" />
                            <asp:Label runat="server" ID="lblSexo" Text="Sexo" />
                            <asp:DropDownList runat="server" ID="cboSexo" />
                            <br />
                        </div>
                        <<div class="col-lg-8">
                            <asp:Label runat="server" ID="lblFechaNac" Text="Fecha Nac. " />
                            <asp:TextBox runat="server" ID="txtFechaNac" TextMode="Date" />
                            <asp:Label runat="server" ID="lblEscuela" Text="Escuela " />
                            <asp:TextBox runat="server" ID="txtEscuela"  />
                            <asp:Label runat="server" ID="lblAño" Text="Año " />
                            <asp:TextBox runat="server" ID="txtAño" />
                            <asp:Label runat="server" ID="lblLateralidad" Text="Lateralidad" />
                            <asp:DropDownList runat="server" ID="cboLateralidad" />
                        </div>
                        <div style="position:inherit; left:20px">
                        </div>
                    </div>
                </div>
            </asp:Panel>
    </div>
</asp:Content>

