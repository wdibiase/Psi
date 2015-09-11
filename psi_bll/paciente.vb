Public Class paciente
    Public Function Listar() As List(Of psi_el.Paciente)
        Dim pac As New psi_dal.paciente
        Return pac.Listar
    End Function

    Public Function Guardar(paciente As psi_el.Paciente)
        Dim bd As New psi_dal.paciente
        bd.Guardar(paciente)
        Return Err.Number
    End Function

    Public Function Nuevo(paciente As psi_el.Paciente)
        Dim bd As New psi_dal.paciente
        Return bd.Nuevo(paciente)
    End Function

    Public Function ListarDocs()
        Dim bd As New psi_dal.paciente
        Return bd.ListarDocs
    End Function
End Class
