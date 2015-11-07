<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ABMdiagnosticos.aspx.vb" Inherits="psi_gui.ABMdiagnosticos" 
    MasterPageFile="~/eval/coord/Coord.Master" %>
<%@ MasterType VirtualPath="~/eval/coord/Coord.Master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="atk" %>
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
        <asp:GridView runat="server" ID="lstHC" CssClass="table-hover table-responsive" AllowPaging="True" PageSize="25">
            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:ButtonField ButtonType="Image" ImageUrl="~/Images/bullet.png" 
                    InsertVisible="False" Text="Botón" CommandName="Select" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox runat="server" ID="chkAllHC" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="chkHC" />
                    </ItemTemplate>                
                </asp:TemplateField>
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
        </asp:GridView><br />
        <asp:Button runat="server" ID="btnAprobar" Text="Aprobar" />
        <asp:Button runat="server" ID="btnRechazar" Text="Rechazar" />
        <atk:ModalPopupExtender ID="popupAprobar" runat="server" TargetControlID="btnAprobar" PopupControlID="pnlAprobar"
            EnableViewState="true" DropShadow="true" BackgroundCssClass="modalBackground" CancelControlID="btnCancel1" />
        <asp:Panel runat="server" ID="pnlAprobar" Width="400px" Height="100px" CssClass="modalPopup" Style="display:none" >
            <div>
                <asp:Label runat="server" ID="lblNota1" Text="Nota: " />
                <asp:TextBox runat="server" ID="txtNota1" /><br />
                <asp:Button runat="server" ID="btnOkHc" Text="Ok" OnClick="btnOkHc_Click"/>
                <asp:Button runat="server" ID="btnCancel1" Text="Cancelar" />
            </div>
        </asp:Panel>
        <atk:ModalPopupExtender ID="popupRechazar" runat="server" TargetControlID="btnRechazar" PopupControlID="pnlRechazar"
            EnableViewState="true" DropShadow="true" BackgroundCssClass="modalBackground" CancelControlID="btnCancel2" />
        <asp:Panel runat="server" ID="pnlRechazar" Width="400px" Height="100px" CssClass="modalPopup" Style="display:none" >
            <div>
                <asp:Label runat="server" ID="lblNota2" Text="Nota: " />
                <asp:TextBox runat="server" ID="txtNota2" /><br />
                <asp:Button runat="server" ID="btnReHc" Text="Ok" OnClick="btnReHc_Click"/>
                <asp:Button runat="server" ID="btnCancel2" Text="Cancelar" />
            </div>
        </asp:Panel>
    </div>
</asp:Content>