<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminTools.aspx.vb" Inherits="psi.adminTools" MasterPageFile="~/Admin.Master" %>

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
                                    <li><a href="ABMclientes.aspx">Clientes</a></li>
                                    <li><a href="ABMusuarios.aspx">Usuarios</a></li>
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
        <h1>prueba</h1>
    </div>
</asp:Content>