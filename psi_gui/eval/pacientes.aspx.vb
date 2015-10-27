Public Class pacientes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack And Not UsuarioLogueado Is Nothing Then
            CargarDocs()
            CargarPacientes()
            CargarLateralidades()
            CargarSexos()
            CargarPsps()
            CargarTestDisponibles()
            Traducir(Me)
            estadoInicial()
            verLista()
        End If
    End Sub

    Private Sub CargarTestDisponibles()
        Dim tests As List(Of psi_el.test)
        Dim t As New psi_bll.test
        tests = t.Listar
        cboAvailTest.DataSource = tests
        cboAvailTest.DataTextField = "test_version"
        cboAvailTest.DataValueField = "codigo"
        cboAvailTest.DataBind()
    End Sub

    Protected Sub gridPacientes_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim row As GridViewRow = gridPacientes.SelectedRow
    End Sub

    Protected Sub btnGuardarNuevo_Click(sender As Object, e As EventArgs) Handles btnGuardarNuevo.Click
        Dim paciente As New psi_el.Paciente
        Dim dato As New psi_bll.paciente
        paciente.tipoDoc = cboDocumento.SelectedValue.ToString
        paciente.DNI = txtNroDoc.Text
        paciente.nombre = txtNombre.Text
        paciente.apellido = txtApellido.Text
        paciente.sexo = cboSexo.SelectedValue.ToString
        paciente.fechaNacimiento = txtFechaNac.Text
        paciente.escuela = txtEscuela.Text
        paciente.año = txtAño.Text
        paciente.lateralidad = cboLateralidad.SelectedValue.ToString
        paciente.evaluador = cboPsp.SelectedValue.ToString
        dato.Nuevo(paciente)
        Response.Redirect("ABMpacientes.aspx")
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim p As New psi_el.Paciente
        Dim dato As New psi_bll.paciente
        p.tipoDoc = cboDocumento.SelectedValue.ToString
        p.DNI = txtNroDoc.Text
        p.fechaNacimiento = txtFechaNac.Text
        p.apellido = txtApellido.Text
        p.nombre = txtNombre.Text
        p.sexo = cboSexo.SelectedValue.ToString
        p.escuela = txtEscuela.Text
        p.año = txtAño.Text
        p.lateralidad = cboLateralidad.SelectedValue.ToString
        p.evaluador = cboPsp.SelectedValue.ToString
        dato.Guardar(p)
        dato = Nothing
        p = Nothing
        Response.Redirect("ABMpacientes.aspx")
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs)
        estadoInicial()
        lnkNuevo.Visible = True
    End Sub

    Private Sub CargarDocs()
        Dim docs As List(Of psi_el.documento)
        Dim paciente As New psi_bll.paciente
        docs = paciente.ListarDocs
        cboDocumento.DataSource = docs
        cboDocumento.DataTextField = "desc"
        cboDocumento.DataValueField = "tipo"
        cboDocumento.DataBind()
    End Sub

    Private Sub CargarPacientes()
        Dim pacientes As List(Of psi_el.Paciente)
        Dim paciente As New psi_bll.paciente
        pacientes = paciente.Listar(UsuarioLogueado.numDoc)
        gridPacientes.DataSource = pacientes
        gridPacientes.DataBind()
        pacientes = Nothing
        paciente = Nothing
    End Sub

    Private Sub CargarSexos()
        Dim sx As List(Of psi_el.sexo)
        Dim p As New psi_bll.paciente
        sx = p.ListarSexos
        cboSexo.DataSource = sx
        cboSexo.DataTextField = "desc"
        cboSexo.DataValueField = "id"
        cboSexo.DataBind()
    End Sub

    Private Sub CargarLateralidades()
        Dim lats As List(Of psi_el.lateralidad)
        Dim l As New psi_bll.paciente
        lats = l.ListarLateralidades
        cboLateralidad.DataSource = lats
        cboLateralidad.DataTextField = "desc"
        cboLateralidad.DataValueField = "id"
        cboLateralidad.DataBind()
    End Sub

    Private Sub LimpiarPantalla()
        txtAño.Text = String.Empty
        txtApellido.Text = String.Empty
        txtEscuela.Text = String.Empty
        txtFechaNac.Text = String.Empty
        txtNombre.Text = String.Empty
        txtNroDoc.Text = String.Empty
        cboDocumento.SelectedIndex = 0
        cboLateralidad.SelectedIndex = 0
        cboSexo.SelectedIndex = 0
        cboPsp.SelectedIndex = 0
        cboAvailTest.SelectedIndex = 0
    End Sub

    Private Sub CargarPsps()
        If Not UsuarioLogueado Is Nothing Then
            Dim psps As List(Of psi_el.Usuario)
            Dim u As New psi_bll.Usuario
            psps = u.Listar(UsuarioLogueado.cliente, "")
            cboPsp.DataSource = psps
            cboPsp.DataTextField = "nombreUsuario"
            cboPsp.DataValueField = "numDoc"
            cboPsp.DataBind()
            cboPsp.Items.Add(" ")
        End If
    End Sub

    Private Sub gridPacientes_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gridPacientes.RowCommand
        Try
            If e.CommandName = "Select" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                'btnEditarHC.Enabled = True
                'btnEstado.Enabled = True

                Dim selectedRow As GridViewRow = gridPacientes.Rows(index)

                cboDocumento.ClearSelection()
                cboLateralidad.ClearSelection()
                cboSexo.ClearSelection()
                cboPsp.ClearSelection()
                txtNroDoc.Text = selectedRow.Cells(2).Text
                cboDocumento.Items.FindByText(selectedRow.Cells(1).Text).Selected = True
                txtFechaNac.Text = selectedRow.Cells(3).Text
                txtNombre.Text = selectedRow.Cells(4).Text
                txtApellido.Text = selectedRow.Cells(5).Text
                cboSexo.Items.FindByText(selectedRow.Cells(6).Text).Selected = True
                txtEscuela.Text = selectedRow.Cells(7).Text
                txtAño.Text = selectedRow.Cells(8).Text
                cboLateralidad.Items.FindByText(selectedRow.Cells(9).Text).Selected = True

                If Replace(selectedRow.Cells(10).Text, "&nbsp;", "") <> "" Then
                    cboPsp.Items.FindByValue(HttpUtility.HtmlDecode(selectedRow.Cells(10).Text)).Selected = True
                Else
                    cboPsp.ClearSelection()
                    cboPsp.Items(cboPsp.Items.Count - 1).Selected = True
                End If

                Dim p As New psi_bll.paciente
                lblEdadCalculada.Text = p.edadEnAMD(txtFechaNac.Text)
                p = Nothing

                verDetalle()
            End If
        Catch ex As Exception
            MsgBox(Err.Description)
            Response.Redirect("error.aspx")
        End Try
    End Sub

    Protected Sub Lista_Click(sender As Object, e As EventArgs)
        verLista()
    End Sub

    Protected Sub Detalle_Click(sender As Object, e As EventArgs)
        verDetalle()
    End Sub

    Protected Sub lnkNuevo_Click(sender As Object, e As EventArgs)
        LimpiarPantalla()

        cboDocumento.Enabled = True
        cboLateralidad.Enabled = True
        cboPsp.Enabled = True
        cboSexo.Enabled = True
        txtAño.Enabled = True
        txtApellido.Enabled = True
        txtEscuela.Enabled = True
        txtFechaNac.Enabled = True
        txtNombre.Enabled = True
        txtNroDoc.Enabled = True

        lnkNuevo.Visible = False
        btnGuardar.Visible = False
        btnGuardarNuevo.Visible = True
        btnCancelar.Visible = True

        verDetalle()
        txtNroDoc.Focus()
    End Sub

    Private Sub verLista()
        panelLista.Visible = True
        panelDetalle.Visible = False
        If txtNroDoc.Text <> String.Empty Then MostrarHistorial(txtNroDoc.Text)
    End Sub

    Private Sub verDetalle()
        panelLista.Visible = False
        panelDetalle.Visible = True
    End Sub

    Private Sub estadoInicial()
        cboDocumento.Enabled = False
        cboLateralidad.Enabled = False
        cboPsp.Enabled = False
        cboSexo.Enabled = False
        txtAño.Enabled = False
        txtApellido.Enabled = False
        txtEscuela.Enabled = False
        txtFechaNac.Enabled = False
        txtNombre.Enabled = False
        txtNroDoc.Enabled = False

        lnkNuevo.Enabled = True
        btnEvaluar.Enabled = True
        btnGuardar.Visible = False
        btnGuardarNuevo.Visible = False
        btnCancelar.Visible = False
    End Sub

    Private Sub gridPacientes_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gridPacientes.RowDataBound
        Dim aux As String = String.Empty
        With e.Row
            If .RowType = DataControlRowType.Header Then
                .Cells(0).Text = ""
                .Cells(2).Text = "Nro. de Doc."
                .Cells(1).Text = "Tipo de Doc."
                .Cells(3).Text = "Fecha de Nac."
                .Cells(4).Text = "Nombre"
                .Cells(5).Text = "Apellido"
                .Cells(6).Text = "Sexo"
                .Cells(7).Text = "Escuela"
                .Cells(8).Text = "Año"
                .Cells(9).Text = "Lateralidad"
                .Cells(10).Visible = False
            End If
            If .RowType = DataControlRowType.DataRow Then
                .Cells(10).Visible = False
                aux = .Cells(1).Text
                .Cells(1).Text = .Cells(2).Text
                .Cells(2).Text = aux
            End If
        End With
    End Sub

    Protected Sub btnVerHC_Click(sender As Object, e As EventArgs)
        'Session.Add("paciente", txtNroDoc.Text)
        'Response.Redirect("abmHC.aspx", False)
        lstHC.Visible = True
        MostrarHistorial(txtNroDoc.Text)
        If lstHC.Rows.Count = 0 Then
            'Sin HC
            MsgBox("No tiene HC")
        End If
    End Sub

    Private Sub MostrarHistorial(paciente As Integer)
        Dim items As List(Of psi_el.Historial)
        Dim item As New psi_bll.historial
        items = item.Listar(paciente)
        lstHC.DataSource = items
        lstHC.DataBind()
    End Sub

    Protected Sub btnSel_Click(sender As Object, e As EventArgs) 'Handles btnSel.Click
        If rbl.SelectedItem.Value = 1 Then
            'Nota
            lblNota.Visible = True
            txtNota.Visible = True
            btnGuardarNota.Visible = True
            btnCancelarNota.Visible = True
            txtNota.Focus()
        Else
            'Test
            Dim test As New psi_el.Historial

            Dim idHistorial As Long
            Dim dato As New psi_bll.historial
            test.aprobado = False
            test.fecha = Now
            test.paciente = txtNroDoc.Text
            test.tipoNota = 2
            test.test = cboAvailTest.SelectedItem.Value

            '1ro ver si tiene alguno sin completar.
            idHistorial = dato.TestSinCompletar(txtNroDoc.Text)
            If idHistorial = 0 Then
                idHistorial = dato.Nuevo(test, UsuarioLogueado.numDoc)
                CrearTest(idHistorial, test.test)
            End If
            Response.Redirect("wisc3.aspx?idHC=" + idHistorial.ToString + "&idTest=" + test.test.ToString + "&idSubtest=1", False)
        End If
    End Sub

    Private Sub GuardarNota()
        Dim nota As New psi_el.Historial
        Dim dato As New psi_bll.historial

        nota.aprobado = False
        nota.fecha = Now
        nota.observaciones = txtNota.Text
        nota.paciente = txtNroDoc.Text
        nota.tipoNota = 1
        nota.test = 0

        dato.Nuevo(nota, UsuarioLogueado.numDoc)
        dato = Nothing
        nota = Nothing

        lblNota.Visible = False
        txtNota.Visible = False
        btnGuardarNota.Visible = False
        btnCancelarNota.Visible = False
        Response.Redirect("pacientes.aspx")
    End Sub

    Protected Sub btnGuardarNota_Click(sender As Object, e As EventArgs)
        GuardarNota()
    End Sub

    Protected Sub btnCancelarNota_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub CrearTest(id As Long, tipoTest As Integer)
        Dim dato As New psi_bll.consigna
        Dim i As Integer
        For i = 1 To 13
            dato.CrearTestBorrador(id, tipoTest, i)
        Next
    End Sub

    Protected Sub btnEditarHC_Click(sender As Object, e As EventArgs) Handles btnEditarHC.Click
        Dim regHC As New psi_el.Historial
        regHC.idHito = lstHC.Rows(Session("regHC").ToString).Cells(1).Text
        regHC.fecha = lstHC.Rows(Session("regHC").ToString).Cells(2).Text
        regHC.paciente = lstHC.Rows(Session("regHC").ToString).Cells(3).Text
        regHC.tipoNota = lstHC.Rows(Session("regHC").ToString).Cells(4).Text
        regHC.observaciones = lstHC.Rows(Session("regHC").ToString).Cells(5).Text
        regHC.aprobado = lstHC.Rows(Session("regHC").ToString).Cells(6).Text
        regHC.test = lstHC.Rows(Session("regHC").ToString).Cells(8).Text

        If regHC.tipoNota = 1 Then
            'Nota
            lblNota.Visible = True
            txtNota.Visible = True
            btnGuardarNota.Visible = True
            btnCancelarNota.Visible = True
            txtNota.Focus()
        Else
            'Test
            Response.Redirect("wisc3.aspx?idHC=" + regHC.idHito.ToString + "&idTest=" + regHC.test.ToString + "&idSubtest=1", False)
        End If
    End Sub

    Private Sub lstHC_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles lstHC.RowCommand
        Try
            If e.CommandName = "Select" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                btnEditarHC.Enabled = True
                'btnEstado.Enabled = True
                Session("regHC") = index
            End If
        Catch ex As Exception
            MsgBox(Err.Description)
            Response.Redirect("error.aspx")
        End Try
    End Sub
End Class