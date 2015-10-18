<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wisc3.aspx.vb" Inherits="psi.wisc3"
     MasterPageFile="~/eval/Eval.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="pagina">
    <div id="Tabs" role="tabpanel" style="position:relative; display:block;">
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><asp:LinkButton href="#compfig" runat="server" ID="lnkCompFig" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Completamiento de figuras" /></li>
        <li><asp:LinkButton href="#info" runat="server" ID="lnkInformacion" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Información" /></li>
        <li><asp:LinkButton href="#claves" runat="server" ID="lnkClaves" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Claves" /></li>
        <li><asp:LinkButton href="#analogias" runat="server" ID="lnkAnalogias" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Analogías" /></li>
        <li><asp:LinkButton href="#ordhist" runat="server" ID="lnkOrdHist" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Ordenamiento de historias" /></li>
        <li><asp:LinkButton href="#arit" runat="server" ID="lnkAritmetica" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Aritmética" /></li>
        <li><asp:LinkButton href="#conscub" runat="server" ID="lnkContCubos" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Construcción con cubos" /></li>
        <li><asp:LinkButton href="#vocab" runat="server" ID="lnkVocabulario" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Vocabulario" /></li>
        <li><asp:LinkButton href="#compobj" runat="server" ID="lnkCompObj" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Composición de objetos" /></li>
        <li><asp:LinkButton href="#comprension" runat="server" ID="lnkComprension" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Comprensión" /></li>
        <li><asp:LinkButton href="#busqsim" runat="server" ID="lnkSimbolos" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Búsqueda de símbolos" /></li>
        <li><asp:LinkButton href="#retdig" runat="server" ID="lnkDigitos" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Retención de dígitos" /></li>
        <li><asp:LinkButton href="#lab" runat="server" ID="lnkLab" 
                aria-controls="personal" role="tab" data-toggle="tab" Text="Laberintos" /></li>
    </ul>
    <div class="tab-content" style="padding-top: 20px">
        <div role="tabpanel" class="tab-pane active" id="compfig">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st1" Text="Completamiento de figuras" />
                        <br />
                        <asp:GridView ID="lst01" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                        <br />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="info">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st2" Text="Información" />
                        <br />
                        <asp:GridView ID="lst02" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="claves">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st3" Text="Claves" />
                        <br />
                        <asp:GridView ID="lst03" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="analogias">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st4" Text="Analogías" />
                        <br />
                        <asp:GridView ID="lst04" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="ordhist">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st5" Text="Ordenamiento de historias" />
                        <br />
                        <asp:GridView ID="lst05" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="arit">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st6" Text="Aritmética" />
                        <br />
                        <asp:GridView ID="lst06" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="conscub">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st7" Text="Construcción con cubos" />
                        <br />
                        <asp:GridView ID="lst07" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="vocab">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st8" Text="Vocabulario" />
                        <br />
                        <asp:GridView ID="lst08" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="compobj">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st9" Text="Composición de objetos" />
                        <br />
                        <asp:GridView ID="lst09" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="comprension">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st10" Text="Comprensión" />
                        <br />
                        <asp:GridView ID="lst10" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="busqsim">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st11" Text="Búsqueda de símbolos (opcional)" />
                        <br />
                        <asp:GridView ID="lst11" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="retdig">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st12" Text="Retención de dígitos (opcional)" />
                        <br />
                        <asp:GridView ID="lst12" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div role="tabpanel" class="tab-pane" id="lab">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="container-fluid" role="tabpanel">
                        <asp:Label runat="server" ID="st13" Text="Laberintos (opcional)" />
                        <br />
                        <asp:GridView ID="lst13" runat="server" CssClass="table-hover table-responsive" 
                                AllowPaging="True" PageSize="50" CellPadding="4" 
                                ForeColor="#333333" GridLines="None" AutoGenerateColumns="false"
                                OnRowEditing="RowEditing" OnRowCancelingEdit="RowCancelingEdit"
                                OnRowUpdating="RowUpdating" ShowFooter="true">
                            <AlternatingRowStyle CssClass="table" BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                                <asp:TemplateField HeaderText="Nro.">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("idPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Consigna">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("descPregunta")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Respuesta">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblResp" Text='<%# Eval("respuestaDada")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtResp" Text='<%# Eval("respuestaDada")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtResp" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Puntaje">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" ID="txtPuntaje" Text='<%# Eval("puntajeObtenido")%>' />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPuntaje" runat="server" Visible="false" />
                                    </FooterTemplate>                                     
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="false" ShowInsertButton="false" /> 
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</div>
    <div style="position:relative; display:block;">
        <br />
        <asp:Label runat="server" ID="lblObservaciones" Text="Observaciones: " />
        <asp:TextBox runat="server" ID="txtObservaciones" />
        <asp:Button runat="server" ID="okCompFig" Text="Ok" OnClick="okCompFig_Click" />
        <asp:Button runat="server" ID="btnVolver" Text="Cerrar" OnClick="btnVolver_Click" />
        <input id="hidValue" type="hidden" runat="server" />
    </div>

    <script src="../js/jquery-2.1.4.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".nav-tabs a").click(function () {
                $(this).tab('show');
            });
            $('.nav-tabs a').on('shown.bs.tab', function (event) {
                var x = $(event.target).text();         // active tab
                var hiddenControl = '<%= hidValue.ClientID%>';
                document.getElementById(hiddenControl).value = x;
            });
        });
    </script>

</asp:Content>
