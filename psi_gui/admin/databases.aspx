<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="databases.aspx.vb" Inherits="psi.databases" 
    MasterPageFile="~/admin/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="barraHerramientas">
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="pagina">

    <div class="container" id="MenuLateral" style="display:block; float:left; width:20%; max-width:30%;">
        <div class="container-fluid">
            <div id="accordion" class="sidebar-nav">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <asp:LinkButton runat="server" ID="Menu1" data-toggle="collapse" data-parent="#accordion"
                                    href="#collapseOne">
                                <span class="glyphicon glyphicon-credit-card"></span>
                                Copia de Seguridad
                            </asp:LinkButton>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="nav nav-sidebar">
                                <li><asp:linkButton runat="server" ID="lnkBackup" Text="Backup" /></li>
                                <li><asp:LinkButton runat="server" ID="lnkRestore" Text="Restore" /></li>
                                <li><asp:LinkButton runat="server" ID="lnkDrop" Text="Drop" /></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <asp:LinkButton runat="server" ID="Menu2" data-toggle="collapse" data-parent="#accordion"
                                    href="#collapseTwo" Text="Integridad">
                                <span class="glyphicon glyphicon-credit-card"></span>
                            </asp:LinkButton>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="nav nav-sidebar">
                                <li><asp:LinkButton runat="server" ID="lnkLogs" PostBackUrl="#" Text="Ver Logs" /></li>
                                <li><asp:LinkButton runat="server" ID="lnkDVH" PostBackUrl="#" Text="Verif DH" /></li>
                                <li><asp:LinkButton runat="server" ID="lnkDVV" PostBackUrl="#" Text="Verif DV" /></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="display:block; float:left; width:70%; max-width:80%;" id="MenuOpciones" role="tabpanel">
        <asp:Panel runat="server" ID="panelLista" Visible="true">
            <div class="container-fluid" role="tabpanel">
                <asp:GridView ID="lstBackups" runat="server" CssClass="table-hover table-responsive" 
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
            <asp:Label runat="server" ID="lblBackupName" Text="Nombre del backup: " />
            <asp:TextBox runat="server" ID="txtBackupName"></asp:TextBox>
        </asp:Panel>
    </div>
</asp:Content>
