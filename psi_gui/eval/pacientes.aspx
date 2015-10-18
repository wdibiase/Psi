<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pacientes.aspx.vb" Inherits="psi.pacientes" 
    MasterPageFile="~/eval/Eval.Master" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="atk" %>

<asp:Content runat="server" ContentPlaceHolderID="pagina">
    <div class="col-md-12" id="MenuOpciones" role="tabpanel">
        <ul class="nav nav-tabs" id="abm" role="tablist">
            <li id="liLista" class="active"><asp:LinkButton runat="server" ID="Lista" Text="Lista" OnClick="Lista_Click" CausesValidation="false" /></li>
            <li id="liDetalle"><asp:LinkButton runat="server" ID="Detalle" Text="Detalle" OnClick="Detalle_Click" CausesValidation="false" /></li>
            <li id="l3"><asp:LinkButton runat="server" ID="lnkNuevo" Text="Nuevo" CausesValidation="false" /></li>
        </ul>
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
            <asp:Button ID="btnEvaluar" runat="server" CssClass="btn-toolbar" Text="Evaluar" CausesValidation="false" />
            <asp:Button ID="btnVerHC" runat="server" CssClass="btn-toolbar" Text="Ver Historial" OnClick="btnVerHC_Click" />
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn-toolbar" Text="Guardar" Visible="false"  />
            <asp:Button ID="btnGuardarNuevo" runat="server" cssclass="btn-toolbar" Text="Guardar" Visible="false"  />
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn-toolbar" Text="Cancelar" Visible="false" CausesValidation="false" />
            <asp:Button ID="btnEditarHC" runat="server" CssClass="btn-toolbar" Text="Editar" OnClick="btnEditarHC_Click" />
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
                    <div class="col-lg-8">
                        <asp:Label runat="server" ID="lblFechaNac" Text="Fecha Nac. " />
                        <asp:TextBox runat="server" ID="txtFechaNac" TextMode="Date" />
                        <asp:Label runat="server" ID="lblEdad" Text="Edad: " />
                        <asp:Label runat="server" ID="lblEdadCalculada" Text="" />
                    </div>
                    <div class="col-lg-8">
                        <asp:Label ID="lblEscuela" runat="server" Text="Escuela " />
                        <asp:TextBox ID="txtEscuela" runat="server" />
                        <asp:Label ID="lblAño" runat="server" Text="Año " />
                        <asp:TextBox ID="txtAño" runat="server" />
                        <asp:Label ID="lblLateralidad" runat="server" Text="Lateralidad" />
                        <asp:DropDownList ID="cboLateralidad" runat="server" AutoPostBack="true" />
                    </div>
                    <div class="col-lg-8">
                        <asp:Label ID="lbPsp" runat="server" Text="Psp " />
                        <asp:DropDownList runat="server" ID="cboPsp" AutoPostBack="true" />
                    </div>
                </div>
            </div>
            <div class="container-fluid" role="tabpanel">
                <asp:GridView runat="server" ID="lstHC" CssClass="table-hover table-responsive" 
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
        <asp:Panel runat="server" id="panel2" Visible="true">
            <asp:Button ID="Button1" runat="server" CssClass="btn-toolbar" Text="Cancelar" Visible="false" CausesValidation="false" />
        </asp:Panel>

        <atk:ModalPopupExtender ID="mpe" runat="server" TargetControlID="btnEvaluar" PopupControlID="pnlpopup" 
            EnableViewState="true" DropShadow="true" CancelControlID="btnCan"
            BackgroundCssClass="modalBackground"/>
        <asp:Panel ID="pnlpopup" runat="server" Width="250px" Height="120px" CssClass="modalPopup" Style="display: none" >
            <asp:Label runat="server" ID="lblPregunta" Text="Seleccione tipo:" />
            <asp:RadioButtonList runat="server" RepeatDirection="Vertical" ID="rbl">
                <asp:ListItem Text="Nota" Value="1" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Test" Value="2"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button runat="server" ID="btnSel" Text="Aceptar" OnClick="btnSel_Click" />
            <asp:Button runat="server" ID="btnCan" Text="Cancelar" />
        </asp:Panel>
    </div>

    <asp:Label ID="lblNota" runat="server" Text="Nota: " Visible="false" />
    <asp:TextBox ID="txtNota" runat="server" Visible="false" TextMode="MultiLine" />
    <asp:Button ID="btnGuardarNota" runat="server" Visible="false" Text="Guardar" OnClick="btnGuardarNota_Click" />
    <asp:Button ID="btnCancelarNota" runat="server" Visible="false" Text="Cancelar" OnClick="btnCancelarNota_Click" />
</asp:Content>
