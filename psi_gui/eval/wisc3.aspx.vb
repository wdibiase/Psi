Imports System.Windows.Forms

Public Class wisc3
    Inherits System.Web.UI.Page
    Protected tab As HtmlControls.HtmlInputHidden

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hidValue.Value = 1    'Primer tab
            CargaInicial()
        End If
    End Sub

    Protected Sub okCompFig_Click(sender As Object, e As EventArgs) Handles okCompFig.Click
        'Verificar datos válidos

        'Grabar y aprobar (para que no levante de forma automática)
        Dim bd As New psi_bll.historial
        Dim h As New psi_el.Historial
        h.idHito = Session("idHC").ToString
        h.fecha = Now
        h.observaciones = txtObservaciones.Text
        h.aprobado = 1
        bd.Actualizar(h, UsuarioLogueado.numDoc)
    End Sub

    Private Function CargarPuntaje(valores As String) As List(Of Integer)
        Dim puntajes As List(Of Integer)
        Dim conv As New psi_bll.pregunta
        puntajes = conv.PuntajePorSubtest(valores)
        Return puntajes
    End Function

    Private Sub CargaInicial()
        Dim id As Long
        If Not Session("idHC") Is Nothing Then
            id = Session("idHC").ToString
        Else
            id = 0
        End If
        CargarTest(id)
    End Sub

    Public Sub CompletarTest(idHC As Long)
        Dim dato As New psi_bll.consigna
        dato.Leer(idHC, 1, 1)
        dato.Leer(idHC, 1, 2)
        dato.Leer(idHC, 1, 3)
        dato.Leer(idHC, 1, 4)
        dato.Leer(idHC, 1, 5)
        dato.Leer(idHC, 1, 6)
        dato.Leer(idHC, 1, 7)
        dato.Leer(idHC, 1, 8)
        dato.Leer(idHC, 1, 9)
        dato.Leer(idHC, 1, 10)
        dato.Leer(idHC, 1, 11)
        dato.Leer(idHC, 1, 12)
        dato.Leer(idHC, 1, 13)
    End Sub

    Private Sub CargarTest(id As Long)
        Dim question As New psi_bll.consigna
        lst01.DataSource = question.Leer(id, 1, 1)
        lst02.DataSource = question.Leer(id, 1, 2)
        lst03.DataSource = question.Leer(id, 1, 3)
        lst04.DataSource = question.Leer(id, 1, 4)
        lst05.DataSource = question.Leer(id, 1, 5)
        lst06.DataSource = question.Leer(id, 1, 6)
        lst07.DataSource = question.Leer(id, 1, 7)
        lst08.DataSource = question.Leer(id, 1, 8)
        lst09.DataSource = question.Leer(id, 1, 9)
        lst10.DataSource = question.Leer(id, 1, 10)
        lst11.DataSource = question.Leer(id, 1, 11)
        lst12.DataSource = question.Leer(id, 1, 12)
        lst13.DataSource = question.Leer(id, 1, 13)
        lst01.DataBind()
        lst02.DataBind()
        lst03.DataBind()
        lst04.DataBind()
        lst05.DataBind()
        lst06.DataBind()
        lst07.DataBind()
        lst08.DataBind()
        lst09.DataBind()
        lst10.DataBind()
        lst11.DataBind()
        lst12.DataBind()
        lst13.DataBind()
    End Sub

    Protected Sub RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        GrabarHC(sender, e)
    End Sub

    Private Sub GrabarHC(sender As Object, e As GridViewUpdateEventArgs)
        Dim c As New psi_el.consigna
        Dim bd As New psi_bll.consigna
        Dim r As System.Web.UI.WebControls.TextBox = _
            DirectCast(lst01.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
        Dim p As System.Web.UI.WebControls.TextBox = _
            DirectCast(lst01.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
        c.idHito = Session("idHC").ToString
        c.pregunta.idTest = Session("idTest").ToString
        c.pregunta.idSubtest = Session("idSubtest").ToString
        c.pregunta.idPregunta = e.RowIndex + 1
        c.respuestaDada = r.Text
        c.puntajeObtenido = p.Text
        bd.Grabar(c)
        lst01.EditIndex = -1
        CargaInicial()
    End Sub

    Protected Sub RowEditing(sender As Object, e As GridViewEditEventArgs)
        lst01.EditIndex = e.NewEditIndex
        CargaInicial()
    End Sub

    Protected Sub RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        lst01.EditIndex = -1
        CargaInicial()
    End Sub

    Protected Sub btnVolver_Click(sender As Object, e As EventArgs)
        Response.Redirect("pacientes.aspx")
    End Sub
End Class


