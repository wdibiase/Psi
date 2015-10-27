Imports Microsoft.Reporting.WebForms

Public Class subTestWISC3
    Public Function CalcularPE(subtest As Int16, edadEnDias As Int16, PB As Int16) As Integer
        Dim PE As New psi_dal.subTestWISC3
        Dim puntaje As Integer
        Dim rango As List(Of Long) = PE.BuscarRango(edadEnDias, subtest)
        Dim edad As Integer = EncontrarRango(edadEnDias, rango)
        puntaje = PE.CalcPuntEquiv(subtest, edad, PB)
        Return puntaje
    End Function

    Private Function EncontrarRango(edad As Integer, listado As List(Of Long)) As Integer
        Dim rango As Integer = -1
        Dim anterior As Long
        anterior = edad
        For Each fila As Long In listado
            If fila > edad Then
                rango = fila
                Exit For
            End If
            anterior = fila
        Next
        Return rango
    End Function

    Public Function CalcularCI(idHistCli As Long) As Integer
        Dim acceso As New psi_dal.subTestWISC3
        Dim puntajes As List(Of Integer) = acceso.ObtenerPuntajesBrutos(idHistCli)
        Dim CI As Integer = 0
        For Each puntaje As Integer In puntajes
            CI = CI + puntaje
        Next
        Return CI
    End Function

    Public Function DS(idHistCli As Long) As ReportDataSource
        Dim acc As New psi_dal.subTestWISC3
        Return acc.DS(idHistCli)
    End Function

    Public Function MostrarPB(idHC As Long, idSubtest As Integer) As String
        Dim bd As New psi_dal.subTestWISC3
        Return bd.VerPuntajeBruto(idHC, idSubtest)
    End Function
End Class
