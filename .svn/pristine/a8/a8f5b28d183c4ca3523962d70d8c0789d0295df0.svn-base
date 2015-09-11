Public Class Cliente
    Public Function Nuevo(Cliente As psi_el.Cliente) As Integer
        Dim a As New Acceso
        Dim params(11) As SqlClient.SqlParameter
        params(0) = a.BuildParam("@idSuscripcion", Cliente.suscripcion)
        params(1) = a.BuildParam("@calle", Cliente.calle)
        params(2) = a.BuildParam("@nro", Cliente.nro)
        params(3) = a.BuildParam("@piso", Cliente.piso)
        params(4) = a.BuildParam("@dpto", Cliente.dpto)
        params(5) = a.BuildParam("@idProvincia", Cliente.provincia)
        params(6) = a.BuildParam("@idPartido", Cliente.partido)
        params(7) = a.BuildParam("@idLocalidad", Cliente.localidad)
        params(8) = a.BuildParam("@cuit", Cliente.cuit)
        params(9) = a.BuildParam("@razonSocial", Cliente.razonSocial)
        params(10) = a.BuildParam("@idEstado", Cliente.estado)
        'params(11).Direction = ParameterDirection.Output
        params(11) = a.BuildParam("@idCliente", Cliente.id)
        Return a.GrabarConId("usp_clientesInsert", params, "@idCliente")
    End Function

    Public Function Guardar(Cliente As psi_el.Cliente) As Boolean
        Dim acc As New Acceso
        Dim params(11) As SqlClient.SqlParameter
        params(0) = acc.BuildParam("@idSuscripcion", Cliente.suscripcion)
        params(1) = acc.BuildParam("@calle", Cliente.calle)
        params(2) = acc.BuildParam("@nro", Cliente.nro)
        params(3) = acc.BuildParam("@piso", Cliente.piso)
        params(4) = acc.BuildParam("@dpto", Cliente.dpto)
        params(5) = acc.BuildParam("@idProvincia", Cliente.provincia)
        params(6) = acc.BuildParam("@idPartido", Cliente.partido)
        params(7) = acc.BuildParam("@idLocalidad", Cliente.localidad)
        params(8) = acc.BuildParam("@cuit", Cliente.cuit)
        params(9) = acc.BuildParam("@razonSocial", Cliente.razonSocial)
        params(10) = acc.BuildParam("@idCliente", Cliente.id)
        params(11) = acc.BuildParam("@idEstado", Cliente.estado)
        Return acc.Grabar("usp_clientesUpdate", params)
    End Function

    Public Function ListarClientes() As List(Of psi_el.Cliente)
        Dim clientes As New List(Of psi_el.Cliente)
        Dim a As New Acceso
        Dim dt As DataTable = a.Leer("dbo.usp_clientesSelect")
        Dim miCliente As psi_el.Cliente
        For Each fila As DataRow In dt.Rows
            miCliente = New psi_el.Cliente
            miCliente.id = fila("idCliente").ToString
            miCliente.razonSocial = fila("razonSocial").ToString
            miCliente.cuit = fila("cuit").ToString
            miCliente.provincia = fila("descProvincia").ToString
            miCliente.partido = fila("descPartido").ToString
            miCliente.localidad = fila("descLocalidad").ToString
            miCliente.calle = fila("calle").ToString
            miCliente.nro = fila("nro").ToString.Replace("&nbsp", "")
            miCliente.dpto = fila("dpto").ToString.Replace("&nbsp", "")
            miCliente.fechaAlta = fila("fechaAlta").ToString
            miCliente.suscripcion = fila("descSuscripcion").ToString
            miCliente.estado = fila("descEstado").ToString
            clientes.Add(miCliente)
        Next
        Return clientes
    End Function

    Public Function DetallarCliente(id As Integer) As psi_el.Cliente
        Dim a As New Acceso
        Dim par(0) As SqlClient.SqlParameter

        par(0) = a.BuildParam("@idCliente", id)
        Dim dt As DataTable = a.Leer("dbo.usp_clientesSelect", par)

        Dim miCliente As psi_el.Cliente
        miCliente = New psi_el.Cliente
        miCliente.id = dt.Rows("idCliente").ToString
        miCliente.razonSocial = dt.Rows("razonSocial").ToString
        miCliente.cuit = dt.Rows("cuit").ToString
        miCliente.provincia = dt.Rows("descProvincia").ToString
        miCliente.partido = dt.Rows("descPartido").ToString
        miCliente.localidad = dt.Rows("descLocalidad").ToString
        miCliente.calle = dt.Rows("calle").ToString
        miCliente.nro = dt.Rows("nro").ToString
        miCliente.dpto = dt.Rows("dpto").ToString
        miCliente.fechaAlta = dt.Rows("fechaAlta").ToString
        Return miCliente
    End Function

    Public Function ListarSuscripciones() As List(Of psi_el.suscripcion)
        Dim ss As New List(Of psi_el.suscripcion)
        Dim ac As New Acceso
        Dim dt As DataTable = ac.Leer("dbo.usp_suscripcionesSelect")
        Dim suscr As psi_el.suscripcion
        For Each fila As DataRow In dt.Rows
            suscr = New psi_el.suscripcion
            suscr.id = fila("idSuscripcion").ToString
            suscr.desc = fila("descSuscripcion").ToString
            ss.Add(suscr)
        Next
        Return ss
    End Function

    Public Function ListarProvincias() As List(Of psi_el.provincia)
        Dim pcias As New List(Of psi_el.provincia)
        Dim acceso As New Acceso
        Dim dt As DataTable = acceso.Leer("dbo.usp_provinciasSelect")
        Dim pcia As psi_el.provincia
        For Each fila As DataRow In dt.Rows
            pcia = New psi_el.provincia
            pcia.id = fila("idProvincia").ToString
            pcia.desc = fila("descProvincia").ToString
            pcias.Add(pcia)
        Next
        Return pcias
    End Function

    Public Function ListarPartidos(pcia As Int16) As List(Of psi_el.partido)
        Dim partidos As New List(Of psi_el.partido)
        Dim acceso As New Acceso
        Dim param(0) As SqlClient.SqlParameter
        param(0) = acceso.BuildParam("@idProvincia", pcia)
        Dim dt As DataTable = acceso.Leer("dbo.usp_partidosSelect", param)
        Dim partido As psi_el.partido
        For Each fila As DataRow In dt.Rows
            partido = New psi_el.partido
            partido.id = fila("idPartido").ToString
            partido.desc = fila("descPartido").ToString
            partidos.Add(partido)
        Next
        Return partidos
    End Function

    Public Function ListarLocalidades(partido As Int32) As List(Of psi_el.localidad)
        Dim locs As New List(Of psi_el.localidad)
        Dim a As New Acceso
        Dim param(0) As SqlClient.SqlParameter
        param(0) = a.BuildParam("@idPartido", partido)
        Dim dt As DataTable = a.Leer("dbo.usp_localidadesSelect", param)
        Dim loc As psi_el.localidad
        For Each fila As DataRow In dt.Rows
            loc = New psi_el.localidad
            loc.id = fila("idLocalidad").ToString
            loc.desc = fila("descLocalidad").ToString
            locs.Add(loc)
        Next
        Return locs
    End Function

    Public Function ListarEstados() As List(Of psi_el.estado)
        Dim estados As New List(Of psi_el.estado)
        Dim a As New Acceso
        Dim dt As DataTable = a.Leer("dbo.usp_estadosSelect")
        Dim estado As psi_el.estado
        For Each registro As DataRow In dt.Rows
            estado = New psi_el.estado
            estado.id = registro("idEstado").ToString
            estado.desc = registro("descEstado").ToString
            estados.Add(estado)
        Next
        Return estados
    End Function
End Class
