Public Class historial
    Public Function Nuevo(historia As psi_el.Historial, idUsuario As Integer) As Long
        Dim item As New psi_dal.historial
        Return item.Nuevo(historia, idUsuario)
    End Function

    Public Function Actualizar(historia As psi_el.Historial, idUsuario As Integer) As Integer
        Dim item As New psi_dal.historial
        Return item.Actualizar(historia, idUsuario)
    End Function

    Public Function Listar(paciente As Integer) As List(Of psi_el.Historial)
        Dim items As New psi_dal.historial
        Return items.Listar(paciente)
    End Function

    Public Function TestSinCompletar(paciente As Integer) As Long
        Dim bd As New psi_dal.historial
        Return bd.TestSinCompletar(paciente)
    End Function
End Class
