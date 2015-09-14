Public Class backup
    Public Function ListarBackups() As List(Of psi_el.backup)
        Dim conexion As New psi_dal.backup
        Return conexion.ListarBackupDB
    End Function

    Public Function CrearBackup(ruta As String, nombreBackUp As String) As Boolean
        Dim conexion As New psi_dal.backup
        Return conexion.Crear(ruta, nombreBackUp)
    End Function
End Class
