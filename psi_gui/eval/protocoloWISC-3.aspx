<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="protocoloWISC-3.aspx.vb" Inherits="psi_gui.protocoloWISC_3" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="ISO-8859-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="../../favicon.ico" />

    <title>Proyecto Psi</title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/wdb.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/socialwidgets.css" />
    <style type="text/css"></style>
</head>
<body>
    <form runat="server" id="protocoloWISC3">
        <asp:Label runat="server" Text="WISC-III" Font-Bold="true" Font-Size="Larger" /><br />
        <asp:Label runat="server" Text="Test de inteligencia para niños" Font-Bold="true" Font-Size="Medium" /><br />
        <asp:Label runat="server" Text="Wechsler - Tercera edición" Font-Bold="true" Font-Size="Medium" /><br /><br />
        <div style="float:left">
            <asp:Label ID="lblNombreCompleto" runat="server" Text="Nombre: " /><asp:Label ID="txtNombreCompleto" runat="server" />
            <asp:Label ID="lblSexo" runat="server" Text="Sexo: " /><asp:Label ID="txtSexo" runat="server" /><br />
            <asp:Label ID="lblEscuela" runat="server" Text="Escuela o Centro: " /><asp:Label ID="txtEscuela" runat="server" />
            <asp:Label ID="lblGrado" runat="server" Text="Grado/Año: " /><asp:Label ID="txtGrado" runat="server" /><br />
            <asp:Label ID="lblExaminador" runat="server" Text="Examinador: " /><asp:Label ID="txtExaminador" runat="server" />
            <asp:Label ID="lblLateralidad" runat="server" Text="Lateralidad: " /><asp:Label ID="txtLateralidad" runat="server" /><br /><br />
        </div>
        <div style="float:left">
            <asp:Label ID="lblFechaTest" runat="server" Text="Fecha del test: " /><asp:Label ID="txtFechaTest" runat="server" /><br />
            <asp:Label ID="lblFechaNac" runat="server" Text="Fecha de nac.: " /><asp:Label ID="txtFechaNac" runat="server" /><br />
            <asp:Label ID="lblEdad" runat="server" Text="Edad: " /><asp:Label ID="txtEdad" runat="server" /><br /><br />
        </div>
        <div style="display:table; clear:both;"> 
            <div style="display:table-row">
                <div style="display:table-cell; position:center; width:400px;">
                    <asp:Table ID="tblResultado" runat="server" BorderStyle="Solid" BorderColor="Black" CellPadding="9"
                        BorderWidth="1px" Font-Size="X-Small" Font-Names="Tahoma" Height="400px">
                        <asp:TableHeaderRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableHeaderCell runat="server" ID="subtests" Text="Subtests" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableHeaderCell runat="server" ID="pb" Text="Puntajes brutos" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableHeaderCell runat="server" ID="pe" Text="Puntajes equivalentes" ColumnSpan="6" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                        </asp:TableHeaderRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="cfi" Text="Completamiento de figuras" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pb1" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" BackColor="Black" />
                            <asp:TableCell runat="server" ID="pe1" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="op1" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="inf" Text="Información" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pb2" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="pe2" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="cv1" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="cla" Text="Claves" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pb3" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="pe3" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="vp1" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="ana" Text="Analogías" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pb4" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pe4" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black" />
                            <asp:TableCell runat="server" ID="cv2" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="ohi" Text="Ordenamiento de historias" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pb5" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black" />
                            <asp:TableCell runat="server" ID="pe5" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="op2" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="ari" Text="Aritmética" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pb6" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pe6" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="ad1" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="ccu" Text="Construcción con cubos" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pb7" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black" />
                            <asp:TableCell runat="server" ID="pe7" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="op3" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="voc" Text="Vocabulario" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pb8" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pe8" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="cv3" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="cob" Text="Composición de objetos" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="pb9" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="pe9" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="op4" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="com" Text="Comprensión" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="pb10" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="pe10" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="cv4" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="bsi" Text="(Búsqueda de símbolos)" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="pb11" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="pe11" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="vp2" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="rdi" Text="(Retención de dígitos)" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="pb12" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pe12" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="ad2"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="lsb" Text="(Laberintos)" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="pb13" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" ID="pe13" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                            <asp:TableCell runat="server" BackColor="Black"/>
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" Text="Suma de puntajes equivalentes" ColumnSpan="2" RowSpan="2" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="pVe" />
                            <asp:TableCell runat="server" ID="pEj" />
                            <asp:TableCell runat="server" ID="pCV" />
                            <asp:TableCell runat="server" ID="pOP" />
                            <asp:TableCell runat="server" ID="pAD" />
                            <asp:TableCell runat="server" ID="pVP" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" ID="verbal" Text="Verbal" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="ejec" Text="Ejec" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="cv" Text ="CV" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="op" Text="OP" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="ad" Text="AD" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableCell runat="server" ID="vp" Text="VP" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                        </asp:TableRow>
                    </asp:Table>
                </div>
                <div style="display:table-cell; position:center; width:400px;">
                    <asp:Table ID="tblPInd" runat="server" BorderStyle="Solid" BorderColor="Black"
                        BorderWidth="1px" Font-Size="X-Small" Font-Names="Tahoma" Height="400px">
                        <asp:TableHeaderRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableHeaderCell runat="server" ID="escalas" Text="" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableHeaderCell runat="server" ID="puntaje" Text="Puntaje" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableHeaderCell runat="server" ID="CIIndice" Text="CI / Indice" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableHeaderCell runat="server" ID="perc" Text="Percentil" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                            <asp:TableHeaderCell runat="server" ID="intcon" Text="Intervalo de confianza " HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                        </asp:TableHeaderRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" Text="Verbal" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="ciVerbal" />
                            <asp:TableCell runat="server" ID="indVerbal" />
                            <asp:TableCell runat="server" ID="perVerbal" />
                            <asp:TableCell runat="server" ID="icVerbal" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" Text="Ejecución" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="ciEjec" />
                            <asp:TableCell runat="server" ID="indEjec" />
                            <asp:TableCell runat="server" ID="perEjec" />
                            <asp:TableCell runat="server" ID="icEjec" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" Text="Escala completa" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="ciEC" />
                            <asp:TableCell runat="server" ID="indEC" />
                            <asp:TableCell runat="server" ID="perEC" />
                            <asp:TableCell runat="server" ID="icEC" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" Text="CV" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="ciCV" />
                            <asp:TableCell runat="server" ID="indCV" />
                            <asp:TableCell runat="server" ID="perCV" />
                            <asp:TableCell runat="server" ID="icCV" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" Text="OP" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="ciOP" />
                            <asp:TableCell runat="server" ID="indOP" />
                            <asp:TableCell runat="server" ID="perOP" />
                            <asp:TableCell runat="server" ID="icOP" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" Text="AD" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="ciAD" />
                            <asp:TableCell runat="server" ID="indAD" />
                            <asp:TableCell runat="server" ID="perAD" />
                            <asp:TableCell runat="server" ID="icAD" />
                        </asp:TableRow>
                        <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                            <asp:TableCell runat="server" Text="VP" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                            <asp:TableCell runat="server" ID="ciVP" />
                            <asp:TableCell runat="server" ID="indVP" />
                            <asp:TableCell runat="server" ID="perVP" />
                            <asp:TableCell runat="server" ID="icVP" />
                        </asp:TableRow>
                    </asp:Table>
                </div>
            </div>
            <div style="display:table-row">
                <div style="display:table-cell; border:none;">
                    <ajaxToolkit:LineChart ID="graph1" runat="server" BorderWidth="0" BorderColor="White" />
                </div>
                <div style="display:table-cell; border:none;">
                    <ajaxToolkit:LineChart ID="graph2" runat="server" BorderWidth="0" BorderColor="White" />
                </div>
            </div>
        </div>
        <asp:ScriptManager runat="server" />
    </form>
 </body>
</html>
