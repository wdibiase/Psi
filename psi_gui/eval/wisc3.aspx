﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wisc3.aspx.vb" Inherits="psi.wisc3"
     MasterPageFile="~/eval/Eval.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="pagina">
    <script type = "text/javascript">
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>
    <div style="position:relative; display:block; float:left; width:100%;">
        <asp:Label runat="server" ID="lblP" Text="Paciente: " /><asp:Label runat="server" ID="lblPaciente" />
        <br />
        <asp:Label runat="server" ID="lblObservaciones" Text="Observaciones: " />
        <asp:TextBox runat="server" ID="txtObservaciones" />
        <asp:Button runat="server" ID="okCompFig" Text="Ok" OnClick="okCompFig_Click" />
        <asp:Button runat="server" ID="btnVolver" Text="Cerrar" OnClick="btnVolver_Click" />
        <asp:Button ID="btnCalcular" runat="server" CssClass="btn-toolbar" Text="Calcular" OnClick="btnCalcular_Click" />
        <asp:Button ID="btnImprimir" runat="server" Text="Imprimir" OnClick="btnImprimir_Click" OnClientClick = "SetTarget();" />
        <div style="position:relative; float:right; text-align:right;">
            <asp:Label runat="server" ID="lblCI" Text="CI: " /><asp:Label runat="server" ID="txtCI" />
        </div>
    </div>
    <div style="clear:both; position:relative;">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <ajaxToolkit:TabContainer runat="server" AutoPostBack="true" ID="tabWisc" OnActiveTabChanged="tabWisc_ActiveTabChanged"
                    CssClass="ajax__tab_lightblue-theme" Height="400px" ScrollBars="Vertical">
                    <ajaxToolkit:TabPanel runat="server" HeaderText="1. Completamiento de figuras  " ID="tp01">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="2. Información  " ID="tp02">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="3. Claves  " ID="tp03">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="4. Analogías  " ID="tp04">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="5. Ordenamiento de historias  " ID="tp05">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="6. Aritmética  " ID="tp06">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="7. Construcción con cubos  " ID="tp07">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="8. Vocabulario  " ID="tp08">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="9. Composición de objetos  " ID="tp09">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="10. Comprensión  " ID="tp10">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="11. Búsqueda de símbolos  " ID="tp11">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="12. Retención de dígitos  " ID="tp12">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                    <ajaxToolkit:TabPanel runat="server" HeaderText="13. Laberintos  " id="tp13">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>
                </ajaxToolkit:TabContainer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
