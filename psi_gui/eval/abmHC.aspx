<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="abmHC.aspx.vb" Inherits="psi.abmHC" MasterPageFile="~/eval/Eval.Master" %>
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
        <asp:Panel runat="server" id="panelDetalle" Visible="true">
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn-toolbar" Text="Cancelar" Visible="false" CausesValidation="false" />
        </asp:Panel>

        <atk:ModalPopupExtender ID="mpe" runat="server" TargetControlID="lnkNuevo" PopupControlID="pnlpopup" 
            EnableViewState="true" DropShadow="true" CancelControlID="btnCan"
            BackgroundCssClass="modalBackground"/>
        <asp:Panel ID="pnlpopup" runat="server" Width="250px" Height="120px" CssClass="modalPopup" >
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

