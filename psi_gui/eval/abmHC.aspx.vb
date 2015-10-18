Public Class abmHC
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            MostrarHistorial(Session.Item("paciente").ToString)
        End If
    End Sub

    Private Sub MostrarHistorial(paciente As Integer)
        Dim items As List(Of psi_el.Historial)
        Dim item As New psi_bll.historial
        items = item.Listar(paciente)
        lstHC.DataSource = items
        lstHC.DataBind()
    End Sub

    Protected Sub Lista_Click(sender As Object, e As EventArgs)
        MostrarHistorial(Session.Item("paciente").ToString)
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
            Dim dato As New psi_bll.historial
            Dim hito As Long
            test.aprobado = False
            test.fecha = Now
            test.paciente = Session.Item("paciente").ToString
            test.tipoNota = 1
            hito = dato.Nuevo(test, UsuarioLogueado.numDoc)
            CrearTest(hito)
            Response.Redirect("wisc3.aspx", False)
        End If
    End Sub

    Private Sub GuardarNota()
        Dim nota As New psi_el.Historial
        Dim dato As New psi_bll.historial

        nota.aprobado = False
        nota.fecha = Now
        nota.observaciones = txtNota.Text
        nota.paciente = Session.Item("paciente").ToString
        nota.tipoNota = 1

        dato.Nuevo(nota, UsuarioLogueado.numDoc)
        dato = Nothing
        nota = Nothing

        lblNota.Visible = False
        txtNota.Visible = False
        btnGuardarNota.Visible = False
        btnCancelarNota.Visible = False
        Response.Redirect("abmHC.aspx")
    End Sub

    Private Sub CrearTest(id As Long)
        Dim dato As New psi_bll.consigna
        dato.CrearTestBorrador(id, 1, 1)
    End Sub

    Protected Sub btnGuardarNota_Click(sender As Object, e As EventArgs)
        GuardarNota()
    End Sub

    Protected Sub btnCancelarNota_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Detalle_Click(sender As Object, e As EventArgs) Handles Detalle.Click

    End Sub
End Class