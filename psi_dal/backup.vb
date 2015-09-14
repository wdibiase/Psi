Public Class backup
    Public Function ListarBackupDB() As List(Of psi_el.backup)
        Dim backs As New List(Of psi_el.backup)
        Dim a As New Acceso
        Dim dt As New DataTable
        Dim da As New SqlClient.SqlDataAdapter
        Try
            da.SelectCommand = New SqlClient.SqlCommand
            da.SelectCommand.Connection = New SqlClient.SqlConnection(My.Resources.connStr)
            da.SelectCommand.CommandType = CommandType.Text
            da.SelectCommand.CommandText = "select * from uvw_backups"
            da.Fill(dt)
            Dim bk As psi_el.backup
            For Each fila As DataRow In dt.Rows
                bk = New psi_el.backup
                bk.id = fila("backup_set_id").ToString
                bk.nombreBK = fila("name").ToString
                bk.descripcion = fila("description").ToString
                bk.nombreDB = fila("database_name").ToString
                bk.nombreUsuario = fila("user_name").ToString
                bk.fechaCreacionDB = fila("database_creation_date").ToString
                bk.fechaInicioBK = fila("backup_start_date").ToString
                bk.fechaFinBK = fila("backup_finish_date").ToString
                bk.tamañoBK = fila("backup_size").ToString
                bk.modeloRecup = fila("recovery_model").ToString
                bk.dispLog = fila("logical_device_name").ToString
                bk.dispFis = fila("physical_device_name").ToString
                backs.Add(bk)
            Next
        Catch
            MsgBox(Err.Description)
        End Try
        Return backs
    End Function

    Public Function Crear(path As String, bkName As String) As Boolean
        Dim acc As New Acceso
        Dim params(1) As SqlClient.SqlParameter
        params(0) = acc.BuildParam("@path", path)
        params(1) = acc.BuildParam("@nombreBK", bkName)
        Return acc.Grabar("usp_databaseBackup", params)
    End Function
End Class
