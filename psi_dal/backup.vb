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
            da.SelectCommand.CommandText = "select backup_set_id, name, user_name, backup_start_date, backup_finish_date from uvw_backups order by 1"
            da.Fill(dt)
            Dim bk As psi_el.backup
            For Each fila As DataRow In dt.Rows
                bk = New psi_el.backup
                bk.id = fila("backup_set_id").ToString
                bk.nombreBK = fila("name").ToString
                'bk.descripcion = fila("description").ToString
                'bk.nombreDB = fila("database_name").ToString
                bk.nombreUsuario = fila("user_name").ToString
                'bk.fechaCreacionDB = fila("database_creation_date").ToString
                bk.fechaInicioBK = fila("backup_start_date").ToString
                bk.fechaFinBK = fila("backup_finish_date").ToString
                'bk.tamañoBK = fila("backup_size").ToString
                'bk.modeloRecup = fila("recovery_model").ToString
                'bk.dispLog = fila("logical_device_name").ToString
                'bk.dispFis = fila("physical_device_name").ToString
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

    Public Function Restaurar(path As String, bkName As String, bkIx As Int16) As Boolean
        Dim acc As New Acceso
        Dim params(2) As SqlClient.SqlParameter
        params(0) = acc.BuildParam("@path", path)
        params(1) = acc.BuildParam("@nombreBK", bkName)
        params(2) = acc.BuildParam("@id", bkIx)
        Return acc.Grabar("master.dbo.usp_databaseRestore", params)
    End Function

    Public Function ListarLoginLog() As DataTable
        Dim dt As New DataTable
        Dim da As New SqlClient.SqlDataAdapter
        Try
            da.SelectCommand = New SqlClient.SqlCommand
            da.SelectCommand.Connection = New SqlClient.SqlConnection(My.Resources.connStr)
            da.SelectCommand.CommandType = CommandType.Text
            da.SelectCommand.CommandText = "select id, usuario, fecha, operacion, host from loginAudit order by 1"
            da.Fill(dt)
        Catch
            MsgBox(Err.Description)
        End Try
        Return dt
    End Function

    
    Public Function VerDVH() As DataTable
        Dim dt As New DataTable
        Dim da As New SqlClient.SqlDataAdapter
        Try
            da.SelectCommand = New SqlClient.SqlCommand
            da.SelectCommand.Connection = New SqlClient.SqlConnection(My.Resources.connStr)
            da.SelectCommand.CommandType = CommandType.StoredProcedure
            da.SelectCommand.CommandText = "usp_DVHSelect"
            da.Fill(dt)
        Catch
            MsgBox(Err.Description)
        End Try
        Return dt
    End Function

    Public Function VerDVV() As DataTable
        Dim dt As New DataTable
        Dim da As New SqlClient.SqlDataAdapter
        Try
            da.SelectCommand = New SqlClient.SqlCommand
            da.SelectCommand.Connection = New SqlClient.SqlConnection(My.Resources.connStr)
            da.SelectCommand.CommandType = CommandType.StoredProcedure
            da.SelectCommand.CommandText = "usp_DVVSelect"
            da.Fill(dt)
        Catch
            MsgBox(Err.Description)
        End Try
        Return dt
    End Function


End Class
