Public Class ABMusuarios
    Inherits System.Web.UI.Page

    Protected Sub Lista_Click(sender As Object, e As EventArgs)
        verLista()
    End Sub

    Private Sub verLista()
        panelLista.Visible = True
        panelDetalle.Visible = False
    End Sub

    Sub Detalle_Click(sender As Object, e As EventArgs)
        verDetalle()
    End Sub

    Private Sub verDetalle()
        panelLista.Visible = False
        panelDetalle.Visible = True
    End Sub

    Private Sub estadoInicial()
        cboCliente.Enabled = False
        txtUsuario.Enabled = False
        cboEstado.Enabled = False
        cboDoc.Enabled = False
        txtDoc.Enabled = False
        txtEmail.Enabled = False
        txtNombre.Enabled = False
        txtApellido.Enabled = False
        'txtPass1.Enabled = False
        'txtPass2.Enabled = False
        cboIdioma.Enabled = False
        lstPerfiles.Enabled = False

        lnkNuevo.Enabled = True
        btnEditar.Enabled = True
        btnEstado.Enabled = True
        btnGuardar.Visible = False
        btnGuardarNuevo.Visible = False
        btnCancelar.Visible = False
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargarDocs()
            CargarIdiomas()
            CargarPerfiles()
            CargarEstados()
            CargarClientes()
            CargarUsuarios()
            estadoInicial()
            verLista()
            Traducir(Me)
        End If
    End Sub

    Private Sub CargarIdiomas()
        Dim idioma As List(Of psi_el.idioma)
        Dim usuario As New psi_bll.Usuario
        idioma = usuario.listarIdiomas
        cboIdioma.DataSource = idioma
        cboIdioma.DataTextField = "id"
        cboIdioma.DataValueField = "desc"
        cboIdioma.DataBind()
        usuario = Nothing
        idioma = Nothing
    End Sub

    Private Sub CargarDocs()
        Dim docs As List(Of psi_el.documento)
        Dim unDoc As New psi_bll.Usuario
        docs = unDoc.ListarDocs
        cboDoc.DataSource = docs
        cboDoc.DataTextField = "desc"
        cboDoc.DataValueField = "tipo"
        cboDoc.DataBind()
        unDoc = Nothing
        docs = Nothing
    End Sub

    Private Sub CargarPerfiles()
        Dim perfiles As List(Of psi_el.perfil)
        Dim lista As New psi_bll.Usuario
        perfiles = lista.listarPerfiles
        lstPerfiles.DataSource = perfiles
        lstPerfiles.DataValueField = "id"
        lstPerfiles.DataTextField = "desc"
        lstPerfiles.DataBind()
        lista = Nothing
        perfiles = Nothing
    End Sub

    Private Sub CargarClientes()
        Dim clientes As List(Of psi_el.Cliente)
        Dim unCliente As New psi_bll.Usuario
        clientes = unCliente.ListarClientes
        cboCliente.DataSource = clientes
        cboCliente.DataTextField = "razonSocial"
        cboCliente.DataValueField = "id"
        cboCliente.DataBind()
    End Sub

    Private Sub CargarUsuarios()
        Dim usuarios As List(Of psi_el.Usuario)
        Dim unUsuario As New psi_bll.Usuario
        usuarios = unUsuario.Listar
        lstUsuarios.DataSource = usuarios
        lstUsuarios.DataBind()
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

    Protected Sub btnGuardarNuevo_Click(sender As Object, e As EventArgs) Handles btnGuardarNuevo.Click
        estadoInicial()
        Nuevo()
    End Sub

    Private Sub Nuevo()
        Dim usu As New psi_el.seguridad
        Dim dato As New psi_bll.Usuario
        usu.apellido = txtApellido.Text
        usu.cliente = cboCliente.SelectedValue.ToString
        usu.tipoDoc = cboDoc.SelectedValue.ToString
        usu.email = txtEmail.Text
        usu.estado = cboEstado.SelectedValue.ToString
        usu.idioma = cboIdioma.SelectedItem.ToString
        usu.nombre = txtNombre.Text
        usu.nombreUsuario = txtUsuario.Text
        usu.numDoc = txtDoc.Text
        usu.perfil = lstPerfiles.SelectedValue.ToString
        usu.pwd = txtPass1.Text
        dato.Nuevo(usu)
        usu = Nothing
        dato = Nothing
        Response.Redirect("ABMusuarios.aspx")
    End Sub

    Private Sub lstUsuarios_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles lstUsuarios.PageIndexChanging
        Dim usuarios As List(Of psi_el.Usuario)
        Dim unUsuario As New psi_bll.Usuario
        usuarios = unUsuario.Listar
        lstUsuarios.DataSource = usuarios
        lstUsuarios.PageIndex = e.NewPageIndex
        lstUsuarios.DataBind()
    End Sub

    Protected Sub lstUsuarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstUsuarios.SelectedIndexChanging
        'Dim row As GridViewRow = lstUsuarios.SelectedRow
    End Sub

    Private Sub limpiarPantalla()
        cboCliente.SelectedIndex = 0
        txtUsuario.Text = String.Empty
        cboEstado.SelectedIndex = 0
        cboDoc.SelectedIndex = 0
        txtDoc.Text = String.Empty
        txtEmail.Text = String.Empty
        txtNombre.Text = String.Empty
        txtApellido.Text = String.Empty
        'txtPass1.Text = String.Empty
        'txtPass2.Text = String.Empty
        cboIdioma.SelectedIndex = 0
        lstPerfiles.SelectedIndex = 0
    End Sub

    Private Sub lstUsuarios_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles lstUsuarios.RowCommand
        'Dim pwd As String
        Try
            If e.CommandName = "Select" Then
                'Dim grid As GridView
                'grid = DirectCast(sender, GridView)

                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                btnEditar.Enabled = True
                btnEstado.Enabled = True

                Dim selectedRow As GridViewRow = lstUsuarios.Rows(index)

                cboCliente.ClearSelection()
                cboDoc.ClearSelection()
                cboEstado.ClearSelection()
                cboIdioma.ClearSelection()
                lstPerfiles.ClearSelection()

                txtUsuario.Text = selectedRow.Cells(1).Text
                cboDoc.Items.FindByText(selectedRow.Cells(2).Text).Selected = True
                txtDoc.Text = selectedRow.Cells(3).Text
                txtApellido.Text = HttpUtility.HtmlDecode(selectedRow.Cells(4).Text)
                txtNombre.Text = HttpUtility.HtmlDecode(selectedRow.Cells(5).Text)
                cboEstado.Items.FindByText(selectedRow.Cells(6).Text).Selected = True
                cboIdioma.Items.FindByText(selectedRow.Cells(7).Text).Selected = True
                cboCliente.Items.FindByText(HttpUtility.HtmlDecode(selectedRow.Cells(8).Text)).Selected = True
                'txtPass1.Text = selectedRow.Cells(9).Text
                'pwd = txtPass1.Text
                txtPass2.Text = txtPass1.Text
                txtEmail.Text = selectedRow.Cells(10).Text
                If Replace(selectedRow.Cells(11).Text, "&nbsp;", "") <> "" Then
                    lstPerfiles.Items.FindByText(selectedRow.Cells(11).Text).Selected = True
                End If
                verDetalle()
            End If
        Catch ex As Exception

            Response.Redirect("error.aspx")
        End Try
    End Sub

    Protected Sub btnEditar_Click(sender As Object, e As EventArgs) Handles btnEditar.Click
        btnEditar.Visible = False
        btnGuardar.Visible = True
        lnkNuevo.Enabled = False
        btnEstado.Visible = False
        btnCancelar.Visible = True

        cboCliente.Enabled = True
        cboEstado.Enabled = True
        cboDoc.Enabled = True
        txtDoc.Enabled = True
        txtEmail.Enabled = True
        txtNombre.Enabled = True
        txtApellido.Enabled = True
        cboIdioma.Enabled = True
        lstPerfiles.Enabled = True
        'txtPass1.Enabled = True
        'txtPass2.Enabled = True
    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim usu As New psi_el.seguridad
        Dim dato As New psi_bll.Usuario
        usu.apellido = txtApellido.Text
        usu.cliente = cboCliente.SelectedItem.ToString
        usu.tipoDoc = cboDoc.SelectedItem.ToString
        usu.email = txtEmail.Text
        usu.estado = cboEstado.SelectedItem.ToString
        usu.idioma = cboIdioma.SelectedItem.ToString
        usu.nombre = txtNombre.Text
        usu.nombreUsuario = txtUsuario.Text
        usu.numDoc = txtDoc.Text
        usu.perfil = lstPerfiles.SelectedValue.ToString
        dato.Guardar(usu)
        dato = Nothing
        usu = Nothing
        Response.Redirect("ABMusuarios.aspx")
    End Sub

    Private Sub lstUsuarios_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles lstUsuarios.RowDataBound
        With e.Row
            If .RowType = DataControlRowType.Header Then
                .Cells(0).Text = ""
                .Cells(1).Text = "Usuario"
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

    Private Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        estadoInicial()
        lnkNuevo.Visible = True
        btnEditar.Visible = True
        btnEstado.Visible = True
    End Sub


    Protected Sub lnkNuevo_Click(sender As Object, e As EventArgs)
        limpiarPantalla()

        cboCliente.Enabled = True
        txtUsuario.Enabled = True
        cboEstado.Enabled = True
        cboDoc.Enabled = True
        txtDoc.Enabled = True
        txtEmail.Enabled = True
        txtNombre.Enabled = True
        txtApellido.Enabled = True
        'txtPass1.Enabled = True
        'txtPass2.Enabled = True
        cboIdioma.Enabled = True
        lstPerfiles.Enabled = True

        lnkNuevo.Visible = False
        btnEditar.Visible = False
        btnEstado.Visible = False
        btnGuardar.Visible = False
        btnGuardarNuevo.Visible = True
        btnCancelar.Visible = True

        cboCliente.Focus()
    End Sub

End Class