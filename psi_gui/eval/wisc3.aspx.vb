Public Class wisc3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idHC As Long, idTest As Integer, idSubtest As Integer
        If Not Page.IsPostBack Then
            idHC = Request.QueryString("idHC")
            idTest = Request.QueryString("idTest")
            idSubtest = Request.QueryString("idSubtest")
            'PrimeraCarga(idHC, idTest)
            CargarTest(idHC, idTest)
        End If
    End Sub

    Protected Sub okCompFig_Click(sender As Object, e As EventArgs) Handles okCompFig.Click
        'Verificar datos válidos

        'Grabar y aprobar (para que no levante de forma automática)
        Dim bd As New psi_bll.historial
        Dim h As New psi_el.Historial
        h.idHito = Request.QueryString("idHC")
        h.fecha = Now
        h.observaciones = txtObservaciones.Text
        h.aprobado = 1
        bd.Actualizar(h, UsuarioLogueado.numDoc)
    End Sub

    Private Sub CargarTest(id As Long, test As Integer)
        Dim question As New psi_bll.consigna
        Dim tabActivo As Integer
        tabActivo = tabWisc.ActiveTabIndex + 1
        Select Case tabActivo
            Case 1
                lst01.DataSource = question.Leer(id, test, 1)
                lst01.DataBind()
            Case 2
                lst02.DataSource = question.Leer(id, test, 2)
                lst02.DataBind()
            Case 3
                lst03.DataSource = question.Leer(id, test, 3)
                lst03.DataBind()
            Case 4
                lst04.DataSource = question.Leer(id, test, 4)
                lst04.DataBind()
            Case 5
                lst05.DataSource = question.Leer(id, test, 5)
                lst05.DataBind()
            Case 6
                lst06.DataSource = question.Leer(id, test, 6)
                lst06.DataBind()
            Case 7
                lst07.DataSource = question.Leer(id, test, 7)
                lst07.DataBind()
            Case 8
                lst08.DataSource = question.Leer(id, test, 8)
                lst08.DataBind()
            Case 9
                lst09.DataSource = question.Leer(id, test, 9)
                lst09.DataBind()
            Case 10
                lst10.DataSource = question.Leer(id, test, 10)
                lst10.DataBind()
            Case 11
                lst11.DataSource = question.Leer(id, test, 11)
                lst11.DataBind()
            Case 12
                lst12.DataSource = question.Leer(id, test, 12)
                lst12.DataBind()
            Case 13
                lst13.DataSource = question.Leer(id, test, 13)
                lst13.DataBind()
        End Select
    End Sub

    Protected Sub RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        GrabarHC(sender, e)
    End Sub

    Private Sub GrabarHC(sender As Object, e As GridViewUpdateEventArgs)
        Dim c As New psi_el.consigna
        Dim bd As New psi_bll.consigna
        Dim tabActivo As Integer
        tabActivo = tabWisc.ActiveTabIndex + 1
        Select Case tabActivo  'Contiene el nro. de tab activo.
            Case 1
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst01.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst01.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 2
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst02.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst02.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 3
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst03.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst03.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 4
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst04.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst04.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 5
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst05.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst05.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 6
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst06.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst06.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 7
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst07.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst07.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 8
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst08.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst08.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 9
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst09.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst09.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 10
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst10.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst10.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 11
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst11.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst11.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 12
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst12.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst12.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
            Case 13
                Dim r As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst13.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
                Dim p As System.Web.UI.WebControls.TextBox = _
                    DirectCast(lst13.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
                c.respuestaDada = r.Text
                c.puntajeObtenido = p.Text
        End Select

        c.idHito = Request.QueryString("idHC")
        c.pregunta.idTest = Request.QueryString("idTest")
        c.pregunta.idSubtest = tabActivo
        c.pregunta.idPregunta = e.RowIndex + 1
        bd.Grabar(c)

        Select Case tabActivo
            Case 1
                lst01.EditIndex = -1
            Case 2
                lst02.EditIndex = -1
            Case 3
                lst03.EditIndex = -1
            Case 4
                lst04.EditIndex = -1
            Case 5
                lst05.EditIndex = -1
            Case 6
                lst06.EditIndex = -1
            Case 7
                lst07.EditIndex = -1
            Case 8
                lst08.EditIndex = -1
            Case 9
                lst09.EditIndex = -1
            Case 10
                lst10.EditIndex = -1
            Case 11
                lst11.EditIndex = -1
            Case 12
                lst12.EditIndex = -1
            Case 13
                lst13.EditIndex = -1
        End Select
        CargarTest(c.idHito, c.pregunta.idTest)
    End Sub

    Protected Sub RowEditing(sender As Object, e As GridViewEditEventArgs)
        Dim tabActivo As Integer
        tabActivo = tabWisc.ActiveTabIndex + 1
        Select Case tabActivo
            Case 1
                lst01.EditIndex = e.NewEditIndex
            Case 2
                lst02.EditIndex = e.NewEditIndex
            Case 3
                lst03.EditIndex = e.NewEditIndex
            Case 4
                lst04.EditIndex = e.NewEditIndex
            Case 5
                lst05.EditIndex = e.NewEditIndex
            Case 6
                lst06.EditIndex = e.NewEditIndex
            Case 7
                lst07.EditIndex = e.NewEditIndex
            Case 8
                lst08.EditIndex = e.NewEditIndex
            Case 9
                lst09.EditIndex = e.NewEditIndex
            Case 10
                lst10.EditIndex = e.NewEditIndex
            Case 11
                lst11.EditIndex = e.NewEditIndex
            Case 12
                lst12.EditIndex = e.NewEditIndex
            Case 13
                lst13.EditIndex = e.NewEditIndex
        End Select
        CargarTest(Request.QueryString("idHC"), Request.QueryString("idTest"))
    End Sub

    Protected Sub RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        Dim tabActivo As Integer
        tabActivo = tabWisc.ActiveTabIndex + 1
        Select Case tabActivo
            Case 1
                lst01.EditIndex = -1
            Case 2
                lst02.EditIndex = -1
            Case 3
                lst03.EditIndex = -1
            Case 4
                lst04.EditIndex = -1
            Case 5
                lst05.EditIndex = -1
            Case 6
                lst06.EditIndex = -1
            Case 7
                lst07.EditIndex = -1
            Case 8
                lst08.EditIndex = -1
            Case 9
                lst09.EditIndex = -1
            Case 10
                lst10.EditIndex = -1
            Case 11
                lst11.EditIndex = -1
            Case 12
                lst12.EditIndex = -1
            Case 13
                lst13.EditIndex = -1
        End Select
        CargarTest(Request.QueryString("idHC"), Request.QueryString("idTest"))
    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs)
        Response.Redirect("pacientes.aspx")
    End Sub

    Protected Sub tabWisc_ActiveTabChanged(sender As Object, e As EventArgs) Handles tabWisc.ActiveTabChanged
        CargarTest(Request.QueryString("idHC"), Request.QueryString("idTest"))
    End Sub

    Protected Sub btnCalcular_Click(sender As Object, e As EventArgs)
        Dim bd As New psi_bll.subTestWISC3
        Dim idHC As Long = Request.QueryString("idHC").ToString
        Dim miPaciente As New psi_el.Paciente
        txtCI.Text = bd.CalcularCI(idHC)
    End Sub

    Private Function obtenerPaciente(idHC As Long) As psi_el.Paciente
        Dim paciente As psi_el.Paciente
        Dim bd As New psi_bll.historial
        paciente = bd.ObtenerPaciente(idHC)
        Return paciente
    End Function

    Private Sub mostrarProtocolo()
        Response.Redirect("protocoloWISC-3.aspx?idHC=" & Request.QueryString("idHC").ToString)
    End Sub

    Protected Sub btnImprimir_Click(sender As Object, e As EventArgs)
        mostrarProtocolo()
    End Sub
End Class
