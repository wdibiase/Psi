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

    Public Function Listar(idHC As Long) As psi_el.Historial
        Dim items As New psi_dal.historial
        Return items.Listar(idHC)
    End Function

    Public Function TestSinCompletar(paciente As Integer) As Long
        Dim bd As New psi_dal.historial
        Return bd.TestSinCompletar(paciente)
    End Function

    Public Function ObtenerPaciente(idHistorial As Long) As psi_el.Paciente
        Dim miPaciente As psi_el.Paciente
        Dim acceso As New psi_dal.historial
        miPaciente = acceso.ObtenerDatosPaciente(idHistorial)
        Return miPaciente
    End Function

    Public Function Editable(hc As Long) As Boolean
        Dim a As New psi_dal.historial
        Return a.Editable(hc)
    End Function

    Public Function EvaluarDiag(hc As Long, diag As Short, observaciones As String, usuario As String)
        Dim a As New psi_dal.historial
        Return a.EvaluarDiag(hc, diag, observaciones, usuario)
    End Function
End Class
