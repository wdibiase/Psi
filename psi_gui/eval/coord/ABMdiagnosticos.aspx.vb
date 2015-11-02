Public Class ABMdiagnosticos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Not IsNothing(UsuarioLogueado) Then CargarEvals(UsuarioLogueado.cliente, UsuarioLogueado.nombreUsuario)
        End If
    End Sub

    Private Sub CargarEvals(descCliente As String, excepto As String)
        Dim usuarios As List(Of psi_el.Usuario)
        Dim unUsuario As New psi_bll.Usuario
        usuarios = unUsuario.Listar(descCliente, excepto)
        cboEvals.DataSource = usuarios
        cboEvals.DataValueField = "numDoc"
        cboEvals.DataTextField = "DisplayName"
        cboEvals.DataBind()
    End Sub

    Private Sub CargarPacientes(evaluador As Integer)
        Dim pacientes As List(Of psi_el.Paciente)
        Dim unPaciente As New psi_bll.paciente
        pacientes = unPaciente.Listar(evaluador)
        cboPacientes.DataSource = pacientes
        cboPacientes.DataValueField = "DNI"
        cboPacientes.DataTextField = "DisplayName"
        cboPacientes.DataBind()
    End Sub

    Protected Sub btnSelEval_Click(sender As Object, e As EventArgs)
        CargarPacientes(cboEvals.SelectedValue)
    End Sub

    Protected Sub btnSelPac_Click(sender As Object, e As EventArgs)
        CargarHC(cboPacientes.SelectedValue)
    End Sub

    Private Sub CargarHC(paciente As Integer)
        Dim items As List(Of psi_el.Historial)
        Dim item As New psi_bll.historial
        items = item.Listar(paciente)
        lstHC.DataSource = items
        lstHC.DataBind()
    End Sub
End Class