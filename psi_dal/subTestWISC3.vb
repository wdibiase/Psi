Imports Microsoft.Reporting.WebForms

Public Class subTestWISC3
    Public Function CalcPuntEquiv(subtest As Integer, edadEnDias As Long, puntajeBruto As Integer) As Integer
        Dim sp As String = String.Empty
        Select Case subtest
            Case 1  'Completamiento de figuras
                sp = "usp_stW3ComplFigurasSelect"
            Case 2  'Información
                sp = "usp_stW3InformacionSelect"
            Case 3  'Claves
                sp = "usp_stW3ClavesSelect"
            Case 4  'Analogías
                sp = "usp_stW3AnalogiasSelect"
            Case 5  'Ordenamiento de historias
                sp = "usp_stW3OrdHistoriasSelect"
            Case 6  'Aritmética
                sp = "usp_stW3AritmeticaSelect"
            Case 7  'Construcción con cubos
                sp = "usp_stW3ConstCubosSelect"
            Case 8  'Vocabulario
                sp = "usp_stW3VocabularioSelect"
            Case 9  'Composición de objetos
                sp = "usp_stW3CompObjetosSelect"
            Case 10 'Comprensión
                sp = "usp_stW3ComprensionSelect"
            Case 11 'Búsqueda de símbolos
                sp = "usp_stW3BusqSimbolosSelect"
            Case 12 'Retención de dígitos
                sp = "usp_stW3RetDigitosSelect"
            Case 13 'Laberintos
                sp = "usp_stW3LaberintosSelect"
        End Select

        Dim PE As Integer
        Dim a As New Acceso
        Dim params(1) As SqlClient.SqlParameter
        params(0) = a.BuildParam("@edad", edadEnDias)
        params(1) = a.BuildParam("@puntBruto", puntajeBruto)
        Dim dt As DataTable = a.Leer(sp, params)
        Dim resultado As DataRow = dt.Rows(0)
        If Not resultado Is Nothing Then
            PE = resultado(0).ToString
        Else
            PE = -1
        End If
        Return PE
    End Function

    Public Function BuscarRango(edadEnDias As Int16, subtest As Int16) As List(Of Long)
        Dim bd As New Acceso
        Dim sql As String
        sql = "select distinct edad from " + BuscarTabla(subtest)
        Dim lista As New List(Of Long)
        Dim dt As DataTable = bd.Ejecutar(sql)
        Dim l As Long
        For Each fila As DataRow In dt.Rows
            l = New Long
            l = fila("edad").ToString
            lista.Add(l)
        Next
        Return lista
    End Function

    Private Function BuscarTabla(subtest As Int16) As String
        Dim tabla As String = String.Empty
        Select Case subtest
            Case 1  'Completamiento de figuras
                tabla = "stW3ComplFiguras"
            Case 2  'Información
                tabla = "stW3Informacion"
            Case 3  'Claves
                tabla = "stW3Claves"
            Case 4  'Analogías
                tabla = "stW3Analogias"
            Case 5  'Ordenamiento de historias
                tabla = "stW3OrdHistorias"
            Case 6  'Aritmética
                tabla = "stW3Aritmetica"
            Case 7  'Construcción con cubos
                tabla = "stW3ConstCubos"
            Case 8  'Vocabulario
                tabla = "stW3Vocabulario"
            Case 9  'Composición de objetos
                tabla = "stW3CompObjetos"
            Case 10 'Comprensión
                tabla = "stW3Comprension"
            Case 11 'Búsqueda de símbolos
                tabla = "stW3BusqSimbolos"
            Case 12 'Retención de dígitos
                tabla = "stW3RetDigitos"
            Case 13 'Laberintos
                tabla = "stW3Laberintos"
        End Select
        Return tabla
    End Function

    Public Function ObtenerPuntajesBrutos(idHC As Long) As List(Of Integer)
        Dim bd As New Acceso
        Dim sql As String
        sql = "select puntajeObtenido from consignas where idHito = " + idHC.ToString
        Dim lista As New List(Of Integer)
        Dim dt As DataTable = bd.Ejecutar(sql)
        Dim l As Long
        For Each fila As DataRow In dt.Rows
            If fila("puntajeObtenido").ToString <> "" Then
                l = New Long
                l = fila("puntajeObtenido").ToString
                lista.Add(l)
            End If
        Next
        Return lista
    End Function

    Public Function VerPuntajeBruto(idHC As Long, idSubtest As Integer) As String
        Dim bd As New Acceso
        Dim sql As String
        sql = "select sum(puntajeObtenido) from consignas where idHito = " + idHC.ToString + " and idSubtest = " + idSubtest.ToString
        Dim dt As DataTable = bd.Ejecutar(sql)
        Dim r As String = Nothing
        If dt.Rows(0).Item(0).ToString <> "" Then
            r = dt.Rows(0).Item(0).ToString
        End If
        Return r
    End Function


    Public Function DS(idHC As Long) As ReportDataSource
        Dim bd As New Acceso
        Dim sql As String
        sql = "select idSubtest, puntajeObtenido from consignas where idHito = " + idHC.ToString
        Dim lista As New List(Of Integer)
        Dim dt As DataTable = bd.Ejecutar(sql)

        Dim rd As New ReportDataSource
        rd.Value = dt
        rd.Name = "dsWISC3"

        Return rd
    End Function


End Class
