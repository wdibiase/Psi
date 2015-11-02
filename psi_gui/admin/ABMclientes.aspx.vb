Option Explicit On
Public Class ABMclientes
    Inherits System.Web.UI.Page

    Protected Sub Lista_Click(sender As Object, e As EventArgs) Handles Lista.Click
        verLista()
    End Sub

    Private Sub verLista()
        panelLista.Visible = True
        panelDetalle.Visible = False
    End Sub

    Sub Detalle_Click(sender As Object, e As EventArgs) Handles Detalle.Click
        verDetalle()
    End Sub

    Private Sub verDetalle()
        panelLista.Visible = False
        panelDetalle.Visible = True
    End Sub

    Private Sub estadoInicial()
        txtIdCliente.Enabled = False
        cboSuscripcion.Enabled = False
        cboProvincias.Enabled = False
        cboPartido.Enabled = False
        cboLocalidad.Enabled = False
        txtCalle.Enabled = False
        txtNumero.Enabled = False
        txtPiso.Enabled = False
        txtDpto.Enabled = False
        cboEstado.Enabled = False
        txtCUIT.Enabled = False
        txtRazonSocial.Enabled = False

        lnkNuevo.Enabled = True
        btnEditar.Enabled = True
        btnEstado.Enabled = True
        btnGuardar.Visible = False
        btnGuardarNuevo.Visible = False
        btnCancelar.Visible = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargarDatosClientes()
            CargarSuscripciones()
            CargarProvincias()
            CargarPartidos(1)
            CargarLocalidades(1)
            CargarEstados()
            estadoInicial()
            verLista()
            Traducir(Me)
        End If
    End Sub

    Private Sub CargarSuscripciones()
        Dim susc As List(Of psi_el.suscripcion)
        Dim cliente As New psi_bll.Cliente
        susc = cliente.ListarSuscripciones
        cboSuscripcion.DataSource = susc
        cboSuscripcion.DataTextField = "desc"
        cboSuscripcion.DataValueField = "id"
        cboSuscripcion.DataBind()
    End Sub

    Private Sub CargarProvincias()
        Dim pcias As List(Of psi_el.provincia)
        Dim cliente As New psi_bll.Cliente

        pcias = cliente.ListarProvincias
        cboProvincias.DataSource = pcias
        cboProvincias.DataTextField = "desc"
        cboProvincias.DataValueField = "id"
        cboProvincias.DataBind()
    End Sub

    Private Sub CargarPartidos(idProv As Int16)
        Dim pdos As List(Of psi_el.partido)
        Dim cliente As New psi_bll.Cliente
        pdos = cliente.ListarPartidos(idProv)
        cboPartido.DataSource = pdos
        cboPartido.DataTextField = "desc"
        cboPartido.DataValueField = "id"
        cboPartido.DataBind()
    End Sub

    Private Sub CargarLocalidades(idPartido As Int32)
        Dim locs As List(Of psi_el.localidad)
        Dim cliente As New psi_bll.Cliente
        locs = cliente.ListarLocalidades(idPartido)
        cboLocalidad.DataSource = locs
        cboLocalidad.DataTextField = "desc"
        cboLocalidad.DataValueField = "id"
        cboLocalidad.DataBind()
    End Sub

    Private Sub CargarDatosClientes()
        Dim misClientes As List(Of psi_el.Cliente)
        Dim unCliente As New psi_bll.Cliente

        misClientes = unCliente.ListarClientes()
        gridClientes.DataSource = misClientes
        gridClientes.DataBind()
    End Sub

    Private Sub CargarEstados()
        Dim estados As List(Of psi_el.estado)
        Dim estado As New psi_bll.Cliente

        estados = estado.ListarEstados()
        cboEstado.DataSource = estados
        cboEstado.DataTextField = "desc"
        cboEstado.DataValueField = "id"
        cboEstado.DataBind()
    End Sub

    Protected Sub gridClientes_SelectedIndexChanged(sender As Object, e As EventArgs)
        'Dim row As GridViewRow = gridClientes.SelectedRow
    End Sub

    Private Sub gridClientes_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gridClientes.PageIndexChanging
        Dim clientes As List(Of psi_el.Cliente)
        Dim unCliente As New psi_bll.Cliente
        clientes = unCliente.ListarClientes
        gridClientes.DataSource = clientes
        gridClientes.PageIndex = e.NewPageIndex
        gridClientes.DataBind()
    End Sub

    Private Sub gridClientes_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gridClientes.RowCommand
        Try
            If e.CommandName = "Select" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                btnEditar.Enabled = True
                btnEstado.Enabled = True

                Dim selectedRow As GridViewRow = gridClientes.Rows(index)

                txtIdCliente.Text = selectedRow.Cells(1).Text
                cboSuscripcion.ClearSelection()
                cboProvincias.ClearSelection()
                cboPartido.ClearSelection()
                cboLocalidad.ClearSelection()
                cboEstado.ClearSelection()

                cboSuscripcion.Items.FindByText(selectedRow.Cells(2).Text).Selected = True
                txtCalle.Text = HttpUtility.HtmlDecode(selectedRow.Cells(3).Text)
                txtNumero.Text = selectedRow.Cells(4).Text
                txtPiso.Text = Replace(selectedRow.Cells(5).Text, "&nbsp;", "")
                txtDpto.Text = HttpUtility.HtmlDecode(selectedRow.Cells(6).Text)
                cboProvincias.Items.FindByText(selectedRow.Cells(7).Text).Selected = True
                CargarPartidos(cboProvincias.SelectedValue)
                cboPartido.Items.FindByText(HttpUtility.HtmlDecode(selectedRow.Cells(8).Text)).Selected = True
                CargarLocalidades(cboPartido.SelectedValue)
                cboLocalidad.Items.FindByText(HttpUtility.HtmlDecode(selectedRow.Cells(9).Text)).Selected = True
                cboEstado.Items.FindByText(HttpUtility.HtmlDecode(selectedRow.Cells(10).Text)).Selected = True
                txtCUIT.Text = selectedRow.Cells(13).Text
                txtRazonSocial.Text = HttpUtility.HtmlDecode(selectedRow.Cells(14).Text)

                verDetalle()
            End If
        Catch ex As Exception

            Response.Redirect("error.aspx")
        End Try
    End Sub

    Protected Sub cboProvincias_SelectedIndexChanged(sender As Object, e As EventArgs)
        CargarPartidos(cboProvincias.SelectedItem.Value)
        CargarLocalidades(cboPartido.SelectedItem.Value)
    End Sub

    Protected Sub cboPartido_SelectedIndexChanged(sender As Object, e As EventArgs)
        CargarLocalidades(cboPartido.SelectedItem.Value)
    End Sub

    Protected Sub cboEstado_SelectedIndexChanged(sender As Object, e As EventArgs)
        'CargarEstados()
    End Sub

    Private Sub LimpiarPantalla()
        txtIdCliente.Text = String.Empty
        txtCalle.Text = String.Empty
        txtCUIT.Text = String.Empty
        txtNumero.Text = String.Empty
        txtPiso.Text = String.Empty
        txtDpto.Text = String.Empty
        txtRazonSocial.Text = String.Empty
        cboEstado.SelectedIndex = 0
        cboProvincias.SelectedIndex = 0
        cboSuscripcion.SelectedIndex = 0
    End Sub

    Private Sub Nuevo()
        Dim c As New psi_el.Cliente
        Dim dato As New psi_bll.Cliente
        c.calle = txtCalle.Text
        c.cuit = txtCUIT.Text
        c.dpto = txtDpto.Text
        c.estado = CInt(cboEstado.SelectedValue.ToString)
        c.localidad = cboLocalidad.SelectedValue.ToString
        c.nro = txtNumero.Text
        c.partido = cboPartido.SelectedValue.ToString
        If IsNumeric(txtPiso.Text) Then c.piso = txtPiso.Text
        c.provincia = cboProvincias.SelectedValue.ToString
        c.razonSocial = txtRazonSocial.Text
        c.suscripcion = cboSuscripcion.SelectedValue.ToString
        c.estado = cboEstado.SelectedValue.ToString
        dato.Nuevo(c)
        dato = Nothing
        c = Nothing
        Response.Redirect("ABMclientes.aspx")
    End Sub

    Protected Sub btnGuardarNuevo_Click(sender As Object, e As EventArgs) Handles btnGuardarNuevo.Click
        estadoInicial()
        Nuevo()
    End Sub

    Protected Sub btnEditar_Click(sender As Object, e As EventArgs) Handles btnEditar.Click
        btnEditar.Visible = False
        btnGuardar.Visible = True
        lnkNuevo.Enabled = False
        btnEstado.Visible = False
        btnCancelar.Visible = True

        cboSuscripcion.Enabled = True
        txtCalle.Enabled = True
        txtNumero.Enabled = True
        txtDpto.Enabled = True
        txtPiso.Enabled = True
        cboProvincias.Enabled = True
        cboPartido.Enabled = True
        cboLocalidad.Enabled = True
        cboEstado.Enabled = True
        txtRazonSocial.Enabled = True
        txtCUIT.Enabled = True
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim c As New psi_el.Cliente
        Dim dato As New psi_bll.Cliente
        c.id = CInt(txtIdCliente.Text)
        c.calle = txtCalle.Text
        c.cuit = txtCUIT.Text
        c.dpto = txtDpto.Text
        c.estado = CInt(cboEstado.SelectedValue.ToString)
        c.localidad = cboLocalidad.SelectedValue.ToString
        If IsNumeric(txtNumero.Text) Then
            c.nro = txtNumero.Text
        End If
        c.partido = cboPartido.SelectedValue.ToString
        If IsNumeric(txtPiso.Text) Then
            c.piso = txtPiso.Text
        End If
        c.provincia = cboProvincias.SelectedValue.ToString
        c.razonSocial = txtRazonSocial.Text
        c.suscripcion = cboSuscripcion.SelectedValue.ToString
        c.estado = cboEstado.SelectedValue.ToString
        dato.Guardar(c)
        dato = Nothing
        c = Nothing
        Response.Redirect("ABMclientes.aspx")
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        estadoInicial()
        lnkNuevo.Visible = True
        btnEditar.Visible = True
        btnEstado.Visible = True
    End Sub

    Protected Sub btnEstado_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub gridClientes_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gridClientes.RowDataBound
        With e.Row
            If .RowType = DataControlRowType.Header Then
                .Cells(0).Text = ""
                .Cells(1).Text = "Id Cliente"
                .Cells(2).Text = "Suscripción"
                .Cells(3).Text = "Calle"
                .Cells(4).Text = "Nº"
                .Cells(5).Text = "Piso"
                .Cells(6).Text = "Dpto"
                .Cells(7).Text = "Provincia"
                .Cells(8).Text = "Partido"
                .Cells(9).Text = "Localidad"
                .Cells(10).Text = "Estado"
                .Cells(11).Text = "Fecha de Alta"
                .Cells(12).Visible = False
                .Cells(13).Text = "CUIT"
                .Cells(14).Text = "Razón Social"
            End If
            If .RowType = DataControlRowType.DataRow Then
                .Cells(12).Visible = False
            End If
        End With
    End Sub

    Protected Sub lnkNuevo_Click(sender As Object, e As EventArgs)
        LimpiarPantalla()

        cboSuscripcion.Enabled = True
        cboProvincias.Enabled = True
        cboPartido.Enabled = True
        cboLocalidad.Enabled = True
        txtCalle.Enabled = True
        txtNumero.Enabled = True
        txtPiso.Enabled = True
        txtDpto.Enabled = True
        cboEstado.Enabled = True
        txtCUIT.Enabled = True
        txtRazonSocial.Enabled = True

        lnkNuevo.Visible = False
        btnEditar.Visible = False
        btnEstado.Visible = False
        btnGuardar.Visible = False
        btnGuardarNuevo.Visible = True
        btnCancelar.Visible = True
    End Sub

End Class