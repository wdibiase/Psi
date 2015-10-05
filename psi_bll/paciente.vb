Public Class paciente
    Public Function Listar() As List(Of psi_el.Paciente)
        Dim pac As New psi_dal.paciente
        Return pac.Listar()
    End Function

    Public Function Listar(evaluador As Integer) As List(Of psi_el.Paciente)
        Dim pac As New psi_dal.paciente
        Return pac.Listar(evaluador)
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

    Public Function ListarDocs() As List(Of psi_el.documento)
        Dim bd As New psi_dal.paciente
        Return bd.ListarDocs
    End Function

    Public Function ListarSexos() As List(Of psi_el.sexo)
        Dim bd As New psi_dal.paciente
        Return bd.ListarSexos
    End Function

    Public Function ListarLateralidades() As List(Of psi_el.lateralidad)
        Dim bd As New psi_dal.paciente
        Return bd.ListarLateralidades
    End Function

    Public Function edadEnDias(fechaNac As Date) As Integer
        Dim dias As Integer
        dias = DateDiff(DateInterval.Day, fechaNac, Today.Date)
        Return dias
    End Function

    Public Function edadEnAMD(fechaNac As Date) As String
        Dim añoActual As Int16, añoInicio As Int16, años As Int16
        Dim mesActual As Int16, mesInicio As Int16, meses As Int16
        Dim diaActual As Int16, diaInicio As Int16, dias As Int16
        Dim edad As String

        diaActual = DatePart(DateInterval.Day, Now.Date)
        mesActual = DatePart(DateInterval.Month, Now.Date)
        añoActual = DatePart(DateInterval.Year, Now.Date)
        diaInicio = DatePart(DateInterval.Day, fechaNac)
        mesInicio = DatePart(DateInterval.Month, fechaNac)
        añoInicio = DatePart(DateInterval.Year, fechaNac)

        Dim B As Int16
        If (mesInicio = 2) Then
            If ((añoActual / 4 = 0 And añoActual / 100.0! = 0) Or añoActual / 400 = 0) Then 'Año bisiesto
                B = 29
            Else
                B = 28
            End If
        ElseIf (mesInicio <= 7) Then
            If (mesInicio = 0) Then
                B = 31
            ElseIf (mesInicio / 2 = 0) Then
                B = 30
            Else
                B = 31
            End If
        ElseIf (mesInicio > 7) Then
            If (mesInicio / 2 = 0) Then
                B = 31
            Else
                B = 30
            End If
        End If

        If (mesInicio <= mesActual) Then
            años = añoActual - añoInicio
            If (diaInicio <= diaActual) Then
                meses = mesActual - mesInicio
                dias = diaActual - diaInicio
            Else
                If (mesActual = mesInicio) Then
                    años = años - 1
                    meses = (mesActual - mesInicio) + 11
                Else
                    meses = (mesActual - mesInicio)
                End If
                dias = B - (diaInicio - diaActual)
            End If
        Else
            años = añoActual - añoInicio - 1

            If (diaInicio > diaActual) Then
                meses = mesActual - mesInicio - 1 + 12
                dias = B - (diaInicio - diaActual)
            Else
                meses = mesActual - mesInicio + 12
                dias = diaActual - diaInicio
            End If
        End If

        edad = años & " años, " & meses & " meses, " & dias & " días"
        Return edad
    End Function
End Class
