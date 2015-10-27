<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="protocoloWISC-3.aspx.vb" Inherits="psi.protocoloWISC_3" %>
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
    <link rel="stylesheet" type="text/css" href="css/socialwidgets.css" />
    <style type="text/css"></style>
</head>
<body>
    <form runat="server" id="protocoloWISC3">
        <div>
            <asp:Table ID="tblResultado" runat="server" BorderStyle="Inset" BorderColor="Black" BorderWidth="1px">
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
                    <asp:TableCell runat="server" />
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                </asp:TableRow>
                <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                    <asp:TableCell runat="server" ID="inf" Text="Información" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" ID="pb2" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                    <asp:TableCell runat="server" ID="pe2" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" />
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
                    <asp:TableCell runat="server" />
                </asp:TableRow>
                <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                    <asp:TableCell runat="server" ID="ana" Text="Analogías" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" ID="pb4" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" ID="pe4" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" BackColor="Black" />
                    <asp:TableCell runat="server" />
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
                    <asp:TableCell runat="server" />
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
                    <asp:TableCell runat="server" />
                    <asp:TableCell runat="server" BackColor="Black"/>
                </asp:TableRow>
                <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                    <asp:TableCell runat="server" ID="ccu" Text="Construcción con cubos" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" ID="pb7" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" BackColor="Black" />
                    <asp:TableCell runat="server" ID="pe7" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" />
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                </asp:TableRow>
                <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                    <asp:TableCell runat="server" ID="voc" Text="Vocabulario" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" ID="pb8" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" ID="pe8" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" />
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
                    <asp:TableCell runat="server" />
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                </asp:TableRow>
                <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                    <asp:TableCell runat="server" ID="com" Text="Comprensión" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                    <asp:TableCell runat="server" ID="pb10" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                    <asp:TableCell runat="server" ID="pe10" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" />
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
                    <asp:TableCell runat="server" />
                </asp:TableRow>
                <asp:TableRow runat="server" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px">
                    <asp:TableCell runat="server" ID="rdi" Text="(Retención de dígitos)" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px" />
                    <asp:TableCell runat="server" ID="pb12" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" ID="pe12" HorizontalAlign="Center" BorderStyle="Solid" BorderColor="Black" BorderWidth="1px"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" BackColor="Black"/>
                    <asp:TableCell runat="server" />
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
        <asp:ScriptManager runat="server" />
        <ajaxToolkit:LineChart ID="graphST" runat="server">
        </ajaxToolkit:LineChart>
    </form>
 </body>
</html>
