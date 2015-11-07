Public Class ABMdiagnosticos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack And Not UsuarioLogueado Is Nothing Then
            CargarEvals(UsuarioLogueado.cliente, UsuarioLogueado.nombreUsuario)
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

    Private Sub lstHC_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles lstHC.RowCommand
        Try
            If e.CommandName = "Select" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                Session("regHC") = index
                If lstHC.Rows(index).Cells(7).Text <> "2" Then  ' 2 = Aprobado no editable
                    Edit()
                End If
            End If
        Catch ex As Exception
            Master.MensajeError = Err.Description
        End Try
    End Sub

    Private Sub Edit()
        Dim regHC As New psi_el.Historial
        regHC.idHito = lstHC.Rows(Session("regHC").ToString).Cells(2).Text
        regHC.fecha = lstHC.Rows(Session("regHC").ToString).Cells(3).Text
        regHC.paciente = lstHC.Rows(Session("regHC").ToString).Cells(4).Text
        regHC.tipoNota = lstHC.Rows(Session("regHC").ToString).Cells(5).Text
        regHC.observaciones = lstHC.Rows(Session("regHC").ToString).Cells(6).Text
        regHC.aprobado = lstHC.Rows(Session("regHC").ToString).Cells(7).Text
        regHC.test = lstHC.Rows(Session("regHC").ToString).Cells(9).Text

        If regHC.tipoNota = 1 Then
            'Nota
            'lblNota.Visible = True
            'txtNota.Visible = True
            'btnGuardarNota.Visible = True
            'btnCancelarNota.Visible = True
            'txtNota.Focus()
        Else
            'Test
            Response.Redirect("..\wisc3.aspx?idHC=" + regHC.idHito.ToString + "&idTest=" + regHC.test.ToString + "&idSubtest=1", False)
        End If
    End Sub

    Protected Sub btnReHc_Click(sender As Object, e As EventArgs)
        RevisarHC(0)
    End Sub

    Protected Sub btnOkHc_Click(sender As Object, e As EventArgs)
        RevisarHC(2)
    End Sub

    Private Sub RevisarHC(estado As Integer)
        Dim hc As New psi_bll.historial
        Dim notas As String
        If estado = 2 Then
            notas = txtNota1.Text
        Else
            notas = txtNota2.Text
        End If
        For Each fila As GridViewRow In lstHC.Rows
            If fila.RowType = DataControlRowType.DataRow Then
                Dim chkRow As CheckBox = TryCast(fila.Cells(1).FindControl("chkHC"), CheckBox)
                If chkRow.Checked Then
                    hc.EvaluarDiag(CLng(fila.Cells(2).Text), estado, notas, UsuarioLogueado.numDoc)
                End If
            End If
        Next
    End Sub
End Class