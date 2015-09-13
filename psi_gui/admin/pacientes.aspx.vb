Public Class pacientes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargarDocs()
            CargarPacientes()
        End If
    End Sub

    Protected Sub gridPacientes_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim row As GridViewRow = gridPacientes.SelectedRow
    End Sub

    Protected Sub btnGuardarNuevo_Click(sender As Object, e As EventArgs)
        Dim paciente As New psi_el.Paciente
        Dim dato As New psi_bll.paciente
        paciente.tipoDoc = cboDocumento.SelectedIndex
        paciente.DNI = txtNroDoc.Text
        paciente.nombre = txtNombre.Text
        paciente.apellido = txtApellido.Text
        paciente.sexo = cboSexo.SelectedIndex
        paciente.fechaNacimiento = txtFechaNac.Text
        paciente.escuela = txtEscuela.Text
        paciente.año = txtAño.Text
        paciente.lateralidad = cboLateralidad.SelectedIndex
        dato.Nuevo(paciente)
        Response.Redirect("pacientes.aspx")
    End Sub

    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs)
        LimpiarPantalla()
        'btnGuardar.Visible = False
        'btnGuardarNuevo.Visible = True
        txtNroDoc.Focus()
    End Sub

    Protected Sub btnEditar_Click(sender As Object, e As EventArgs)
        'btnEditar.Visible = False
        'btnGuardar.Visible = True
        'btnNuevo.Enabled = False
        'btnEstado.Visible = False
        'btnCancelar.Visible = True

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
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
        dato.Guardar(p)
        dato = Nothing
        p = Nothing
        Response.Redirect("pacientes.aspx")
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs)

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
        pacientes = paciente.Listar()
        gridPacientes.DataSource = pacientes
        gridPacientes.DataBind()
        pacientes = Nothing
        paciente = Nothing
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
    End Sub

    Private Sub gridPacientes_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gridPacientes.RowCommand
        Try
            If e.CommandName = "Select" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                'btnEditar.Enabled = True
                'btnEstado.Enabled = True

                Dim selectedRow As GridViewRow = gridPacientes.Rows(index)

                cboDocumento.ClearSelection()
                cboLateralidad.ClearSelection()
                cboSexo.ClearSelection()
                txtNroDoc.Text = selectedRow.Cells(1).Text
                cboDocumento.Items.FindByText(selectedRow.Cells(2).Text).Selected = True
                txtFechaNac.Text = selectedRow.Cells(3).Text
                txtNombre.Text = selectedRow.Cells(4).Text
                txtApellido.Text = selectedRow.Cells(5).Text
                cboSexo.Items.FindByText(selectedRow.Cells(6).Text).Selected = True
                txtEscuela.Text = selectedRow.Cells(7).Text
                txtAño.Text = selectedRow.Cells(8).Text
                cboLateralidad.Items.FindByText(selectedRow.Cells(9).Text).Selected = True
            End If
        Catch ex As Exception
            MsgBox(Err.Description)
            Response.Redirect("error.aspx")
        End Try
    End Sub
End Class