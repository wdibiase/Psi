﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pacientes.aspx.vb" Inherits="psi.pacientes"
    MasterPageFile="~/Admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="barraNavegacion">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Conmutar la navegación</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Default.aspx">Proyecto Psi</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
            <li><a href="noticias.aspx">Noticias</a></li>
            <li><a href="nosotros.aspx">Nosotros</a></li>
            <li><a href="contactese.aspx">Contáctese</a></li>
            <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Servicios<span class="caret"></span></a>
            <ul class="dropdown-menu">
            <li><a href="#">Presencia en la Web</a></li>
            <li><a href="tests.aspx">Psicodiagnóstico</a></li>
            <li><a href="#">Asistente virtual</a></li>
            </ul>
            </li>
            <li><a class="btn btn-default btn-sm" href="login.aspx" id="lblPerfil" title="Perfil"></a></li>
            </ul>
            <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Buscar..." data-translatable-string="Search..." />
            </form>
            </div>
        </div>
    </nav>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="barraHerramientas">
    <div class="container" id="MenuOpciones">
        <div class="container-fluid">
            <div class="col-sm-3 col-md-3" style="position: fixed; left: 0px; max-width:180px">
                <div id="accordion" class="sidebar-nav">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <span class="glyphicon glyphicon-credit-card"></span>
                                    Clientes
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <ul class="nav nav-sidebar">
                                    <li><a href="#">Suscripciones</a></li>
                                    <li><a href="clientes.aspx">Clientes</a></li>
                                    <li><a href="usuarios.aspx">Usuarios</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                    <span class="glyphicon glyphicon-user">
                                    </span>
                                    Psicodiagnosis
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="nav nav-sidebar">
                                    <li><a href="ABMevaluadores.aspx">Evaluadores</a></li>
                                    <li><a href="coordinadores.aspx">Coordinadores</a></li>
                                    <li><a href="pacientes.aspx">Pacientes</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-stats"></span>Tests</a> </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="nav nav-sidebar">
                                    <li><a href="#">Consignas</a></li>
                                    <li><a href="protocoloWisc3.rdlc">Preguntas</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="pagina">
    <div class="container-fluid " style="position:relative; left:170px;">
        <form runat="server">
            <h1>Lista de pacientes</h1><br />
            <asp:Button ID="btnNuevo" runat="server" CssClass="btn-toolbar" Text="Nuevo" OnClick="btnNuevo_Click" />
            <asp:Button ID="btnEditar" runat="server" CssClass="btn-toolbar" Text="Editar" Enabled="false" OnClick="btnEditar_Click" />
            <asp:Button ID="btnEstado" runat="server" CssClass="btn-toolbar" Text="Cambiar Estado" Enabled="false" />
            <asp:Button ID="btnGuardar" runat="server" CssClass="btn-toolbar" Text="Guardar" Visible="false" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnGuardarNuevo" runat="server" cssclass="btn-toolbar" Text="Guardar" Visible="false" OnClick="btnGuardarNuevo_Click" />
            <asp:Button ID="btnCancelar" runat="server" CssClass="btn-toolbar" Text="Cancelar" Visible="false" OnClick="btnCancelar_Click" />
            <asp:GridView ID="gridPacientes" runat="server" CssClass="table-hover table-responsive"
                    AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" 
                    OnSelectedIndexChanged="gridPacientes_SelectedIndexChanged" EnableSortingAndPagingCallbacks="true"
                    PagerSettings-Mode="NextPreviousFirstLast" PageSize="10"
                    >
                <AlternatingRowStyle CssClass="table" />
                <Columns>
                    <asp:ButtonField ButtonType="Image" ImageUrl="~/Images/bullet.png" InsertVisible="False" Text="Botón" CommandName="Select"/>
                </Columns>
            </asp:GridView><br />
            <asp:Label runat="server" ID="lblTipoDoc" Text="Tipo de documento "></asp:Label><asp:DropDownList runat="server" ID="cboDocumento"></asp:DropDownList><br />
            <asp:Label runat="server" ID="lblNroDoc" Text="Nro de documento"></asp:Label><asp:TextBox runat="server" id="txtNroDoc"></asp:TextBox>
            <asp:Label runat="server" ID="lblFechaNac" Text="Fecha de Nacimiento "></asp:Label><asp:TextBox runat="server" ID="txtFechaNac" TextMode="Date"></asp:TextBox>
            <asp:Label runat="server" ID="lblApellido" Text="Apellido "></asp:Label>&nbsp; &nbsp;<asp:TextBox runat="server" ID="txtApellido" TextMode="Date"></asp:TextBox><br />
            <asp:Label runat="server" ID="lblNombre" Text="Nombre "></asp:Label>&nbsp &nbsp &nbsp&nbsp;<asp:TextBox runat="server" ID="txtNombre" TextMode="Date"></asp:TextBox><br />
            <asp:Label runat="server" ID="lblSexo" Text="Sexo "></asp:Label>&nbsp &nbsp<asp:DropDownList runat="server" ID="cboSexo">
            <asp:ListItem Value="1">Hombre</asp:ListItem>
            <asp:ListItem Value="2">Mujer</asp:ListItem>
            </asp:DropDownList><br />
            <asp:Label runat="server" ID="lblEscuela" Text="Escuela " /><asp:TextBox runat="server" ID="txtEscuela" TextMode="Date"></asp:TextBox><br />
            <asp:Label runat="server" ID="lblAño" Text="Año " /><asp:TextBox runat="server" ID="txtAño" TextMode="Date"></asp:TextBox><br />
            <asp:Label runat="server" ID="lblLateralidad" Text="Lateralidad " /><asp:DropDownList runat="server" ID="cboLateralidad" >
            <asp:ListItem Value="1">Diestro</asp:ListItem>
            <asp:ListItem Value="2">Zurdo</asp:ListItem>
            <asp:ListItem Value="3">Ambidiestro</asp:ListItem>
            </asp:DropDownList>
        </form>
    </div>
</asp:Content>

