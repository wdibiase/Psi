Public Class usuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    'Private Sub CargarDocs()
    '    Dim docs As List(Of psi_el.documento)
    '    Dim unDoc As New psi_bll.Usuario
    '    docs = unDoc.ListarDocs
    '    cboDoc.DataSource = docs
    '    cboDoc.DataTextField = "desc"
    '    cboDoc.DataValueField = "tipo"
    '    cboDoc.DataBind()
    'End Sub

    'Private Sub CargarPerfiles()
    '    Dim perfiles As List(Of psi_el.perfil)
    '    Dim lista As New psi_bll.Usuario
    '    perfiles = lista.listarPerfiles
    '    lstPerfiles.DataSource = perfiles
    '    lstPerfiles.DataValueField = "id"
    '    lstPerfiles.DataTextField = "desc"
    '    lstPerfiles.DataBind()
    '    lista = Nothing
    '    perfiles = Nothing
    'End Sub

    'Private Sub CargarClientes()
    '    Dim clientes As List(Of psi_el.Cliente)
    '    Dim unCliente As New psi_bll.Usuario
    '    clientes = unCliente.ListarClientes
    '    cboCliente.DataSource = clientes
    '    cboCliente.DataTextField = "razonSocial"
    '    cboCliente.DataValueField = "id"
    '    cboCliente.DataBind()
    'End Sub

    'Private Sub CargarUsuarios()
    '    Dim usuarios As List(Of psi_el.Usuario)
    '    Dim unUsuario As New psi_bll.Usuario
    '    usuarios = unUsuario.Listar
    '    lstUsuarios.DataSource = usuarios
    '    lstUsuarios.DataBind()
    'End Sub

    'Private Sub CargarEstados()
    '    Dim estados As List(Of psi_el.estado)
    '    Dim estado As New psi_bll.Cliente

    '    estados = estado.ListarEstados()
    '    cboEstado.DataSource = estados
    '    cboEstado.DataTextField = "desc"
    '    cboEstado.DataValueField = "id"
    '    cboEstado.DataBind()
    'End Sub

    Protected Sub btnGuardarNuevo_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub cboDoc_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub cboEstado_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub cboIdioma_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub cboCliente_SelectedIndexChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnNuevo_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub lstUsuarios_SelectedIndexChanged(sender As Object, e As EventArgs)
        'Dim row As GridViewRow = lstUsuarios.SelectedRow
    End Sub

    Protected Sub btnPerfil_Click(sender As Object, e As EventArgs)

        '        Dim conexion As New psi_bll.Usuario

        'conexion.AsignarPerfil(Me.txtUsuario.Text, lstPerfiles.SelectedValue.ToString)
    End Sub

    Private Sub lstUsuarios_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) 'Handles lstUsuarios.RowCancelingEdit

    End Sub

    Private Sub lstUsuarios_RowCommand(sender As Object, e As GridViewCommandEventArgs) 'Handles lstUsuarios.RowCommand
        Try
            If e.CommandName = "Select" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                'btnEditar.Enabled = True
                'btnEstado.Enabled = True
                'btnPerfil.Enabled = True

                '       Dim selectedRow As GridViewRow = lstUsuarios.Rows(index)

                'cboCliente.ClearSelection()
                'cboDoc.ClearSelection()
                'cboEstado.ClearSelection()
                'cboIdioma.ClearSelection()
                'lstPerfiles.ClearSelection()

                '                txtUsuario.Text = selectedRow.Cells(1).Text
                '                cboDoc.Items.FindByText(selectedRow.Cells(2).Text).Selected = True
                '                txtDoc.Text = selectedRow.Cells(3).Text
                '                txtApellido.Text = selectedRow.Cells(4).Text
                '                txtNombre.Text = selectedRow.Cells(5).Text
                '                cboEstado.Items.FindByText(selectedRow.Cells(6).Text).Selected = True
                '                'cboIdioma.Items.FindByText(selectedRow.Cells(7).Text).Selected = True
                '                cboCliente.Items.FindByText(selectedRow.Cells(8).Text).Selected = True
                '                txtEmail.Text = selectedRow.Cells(10).Text
                '                If Len(Replace(selectedRow.Cells(11).Text, "&nbsp;", "")) > 0 Then
                ' lstPerfiles.Items.FindByText(selectedRow.Cells(11).Text).Selected = True
                'End If
            End If
        Catch ex As Exception

            Response.Redirect("error.aspx")
        End Try
    End Sub

    Protected Sub btnEditar_Click(sender As Object, e As EventArgs)
        'btnEditar.Visible = False
        'btnGuardar.Visible = True
        'btnNuevo.Enabled = False
        'btnEstado.Visible = False
        'btnCancelar.Visible = True


    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs)
        Dim usu As New psi_el.seguridad
        Dim dato As New psi_bll.Usuario
        'usu.apellido = txtApellido.Text
        'usu.cliente = cboCliente.SelectedItem.ToString
        'usu.Doc = cboDoc.SelectedItem.ToString
        'usu.email = txtEmail.Text
        'usu.estado = cboEstado.SelectedItem.ToString
        'usu.idioma = "es"
        'usu.nombre = txtNombre.Text
        'usu.nombreUsuario = txtUsuario.Text
        'usu.numDoc = txtDoc.Text
        'usu.perfil = lstPerfiles.SelectedItem.ToString
        dato.Guardar(usu)
        dato = Nothing
        usu = Nothing
        Response.Redirect("usuarios.aspx")
    End Sub

    Private Sub lstUsuarios_RowDataBound(sender As Object, e As GridViewRowEventArgs) 'Handles lstUsuarios.RowDataBound
        With e.Row
            If .RowType = DataControlRowType.Header Then
                .Cells(0).Text = ""
                .Cells(1).Text = "Nombre de Usuario"
                .Cells(2).Text = "Tipo de Doc"
                .Cells(3).Text = "Nro de Doc"
                .Cells(4).Text = "Apellido"
                .Cells(5).Text = "Nombre"
                .Cells(6).Text = "Estado"
                .Cells(7).Text = "Idioma"
                .Cells(8).Text = "Cliente"
                .Cells(9).Visible = False
                .Cells(10).Text = "E-mail"
                .Cells(11).Text = "Perfil"
            End If
            If .RowType = DataControlRowType.DataRow Then
                .Cells(9).Visible = False
            End If
        End With
    End Sub

End Class