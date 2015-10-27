Friend Class Acceso
    Public Function Grabar(sp As String, params() As Data.SqlClient.SqlParameter) As Integer
        Dim cmd As New Data.SqlClient.SqlCommand
        Dim con As New Data.SqlClient.SqlConnection(My.Resources.connStr)
        con.Open()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sp
        cmd.Parameters.AddRange(params)
        Dim Resp As String = cmd.ExecuteNonQuery()  'Retorna rows affected
        con.Close()
        Return Resp
    End Function

    Public Function Leer(sp As String, Optional Param() As Data.SqlClient.SqlParameter = Nothing) As DataTable
        Dim dt As New DataTable
        Dim da As New SqlClient.SqlDataAdapter
        da.SelectCommand = New SqlClient.SqlCommand
        da.SelectCommand.Connection = New SqlClient.SqlConnection(My.Resources.connStr)
        da.SelectCommand.CommandType = CommandType.StoredProcedure
        da.SelectCommand.CommandText = sp
        If Not Param Is Nothing Then
            da.SelectCommand.Parameters.AddRange(Param)
        End If
        da.Fill(dt)
        Return dt
    End Function

    Public Function GrabarConId(sp As String, params() As Data.SqlClient.SqlParameter, Optional paramSalida As String = vbNullString) As Long
        Dim cmd As New Data.SqlClient.SqlCommand
        Dim con As New Data.SqlClient.SqlConnection(My.Resources.connStr)
        con.Open()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = sp
        cmd.Parameters.AddRange(params)
        'cmd.Parameters(paramSalida).Direction = ParameterDirection.Output
        'cmd.Parameters(salida).Value.ToString
        Dim salida As Long = cmd.ExecuteScalar  'Retorna id
        con.Close()
        Return salida
    End Function

    'Public Function Ejecutar(sql As String) As Long
    '    Dim cmd As New Data.SqlClient.SqlCommand
    '    Dim conn As New Data.SqlClient.SqlConnection(My.Resources.connStr)
    '    cmd.CommandType = CommandType.Text
    '    cmd.CommandText = sql
    '    conn.Open()
    '    cmd.Connection = conn
    '    Return cmd.ExecuteScalar
    'End Function

    Public Function Ejecutar(sql As String) As DataTable
        Dim dt As New DataTable
        Dim da As New SqlClient.SqlDataAdapter
        da.SelectCommand = New SqlClient.SqlCommand
        da.SelectCommand.Connection = New SqlClient.SqlConnection(My.Resources.connStr)
        da.SelectCommand.CommandType = CommandType.Text
        da.SelectCommand.CommandText = sql
        da.Fill(dt)
        Return dt
    End Function

#Region "Builder"
    Public Function BuildParam(nombre As String, valor As String) As Data.SqlClient.SqlParameter
        Dim p As New SqlClient.SqlParameter
        p.DbType = SqlDbType.VarChar
        p.ParameterName = nombre
        p.Value = valor
        Return p
    End Function
    Public Function BuildParam(nombre As String, valor As Int16?) As Data.SqlClient.SqlParameter
        Dim p As New SqlClient.SqlParameter
        p.DbType = SqlDbType.SmallInt
        p.ParameterName = nombre
        p.Value = valor
        Return p
    End Function
    Public Function BuildParam(nombre As String, valor As Single?) As Data.SqlClient.SqlParameter
        Dim p As New SqlClient.SqlParameter
        p.DbType = SqlDbType.Float
        p.ParameterName = nombre
        p.Value = valor
        Return p
    End Function
    Public Function BuildParam(nombre As String, valor As Int32?) As Data.SqlClient.SqlParameter
        Dim p As New SqlClient.SqlParameter
        p.DbType = SqlDbType.Int
        p.ParameterName = nombre
        p.Value = valor
        Return p
    End Function
    Public Function BuildParam(nombre As String, valor As Int64?) As Data.SqlClient.SqlParameter
        Dim p As New SqlClient.SqlParameter
        p.DbType = SqlDbType.BigInt
        p.ParameterName = nombre
        p.Value = valor
        Return p
    End Function
    Public Function BuildParam(nombre As String, valor As Boolean?) As Data.SqlClient.SqlParameter
        Dim p As New SqlClient.SqlParameter
        p.DbType = SqlDbType.Bit
        p.ParameterName = nombre
        p.Value = valor
        Return p
    End Function
    'Public Function BuildParam(nombre As String, valor As DateTime) As Data.SqlClient.SqlParameter
    '    Dim p As New SqlClient.SqlParameter
    '    p.DbType = SqlDbType.DateTime
    '    p.ParameterName = nombre
    '    p.Value = FormatDateTime(valor, DateFormat.GeneralDate)
    '    Return p
    'End Function
    Public Function Output(nombre As String) As Data.SqlClient.SqlParameter
        Dim p As New SqlClient.SqlParameter
        p.DbType = DbType.Int64
        p.ParameterName = nombre
        p.Direction = ParameterDirection.Output
        Return p
    End Function
#End Region

End Class
