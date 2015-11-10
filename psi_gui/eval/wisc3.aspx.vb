Public Class wisc3
    Inherits System.Web.UI.Page
    Dim c As New psi_el.consigna

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idHC As Long, idTest As Integer, idSubtest As Integer
        Dim HC As New psi_bll.historial
        Dim miPaciente As psi_el.Paciente
        lblErrorLocal.Text = String.Empty
        If Not Page.IsPostBack And Not UsuarioLogueado Is Nothing Then
            idHC = Request.QueryString("idHC")
            idTest = Request.QueryString("idTest")
            idSubtest = Request.QueryString("idSubtest")
            Session("prevPage") = Request.UrlReferrer.ToString()
            CargarTest(idHC, idTest)
            miPaciente = HC.ObtenerPaciente(idHC)
            DatosPersonales(miPaciente)
            If UsuarioLogueado.numDoc = miPaciente.evaluador Then   'Si el examinador es el usuario logueado verifica si puede editar
                HabilitarEdicion(HC.Editable(idHC))
            Else
                HabilitarEdicion(False)     'Si el que ve el test es el coordinador, este no puede editar el contenido de su supervisado
            End If
        End If
    End Sub

    Private Sub HabilitarEdicion(valor As Boolean)
        lst01.Columns(5).Visible = valor
        lst02.Columns(5).Visible = valor
        lst03.Columns(5).Visible = valor
        lst04.Columns(5).Visible = valor
        lst05.Columns(5).Visible = valor
        lst06.Columns(5).Visible = valor
        lst07.Columns(5).Visible = valor
        lst08.Columns(5).Visible = valor
        lst09.Columns(5).Visible = valor
        lst10.Columns(5).Visible = valor
        lst11.Columns(5).Visible = valor
        lst12.Columns(5).Visible = valor
        lst13.Columns(5).Visible = valor
    End Sub

    Protected Sub okCompFig_Click(sender As Object, e As EventArgs) Handles okCompFig.Click
        lblErrorLocal.Text = String.Empty
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
        lblErrorLocal.Text = GrabarHC(sender, e)
    End Sub

    Private Function GrabarHC(sender As Object, e As GridViewUpdateEventArgs) As String
        lblErrorLocal.Text = String.Empty
        Dim bd As New psi_bll.consigna
        Dim tabActivo As Integer
        Dim MensajeError As String = String.Empty
        tabActivo = tabWisc.ActiveTabIndex + 1
        Select Case tabActivo  'Contiene el nro. de tab activo.
            Case 1
                MensajeError = ValidarEntrada(lst01, e)
            Case 2
                MensajeError = ValidarEntrada(lst02, e)
            Case 3
                MensajeError = ValidarEntrada(lst03, e)
            Case 4
                MensajeError = ValidarEntrada(lst04, e)
            Case 5
                MensajeError = ValidarEntrada(lst05, e)
            Case 6
                MensajeError = ValidarEntrada(lst06, e)
            Case 7
                MensajeError = ValidarEntrada(lst07, e)
            Case 8
                MensajeError = ValidarEntrada(lst08, e)
            Case 9
                MensajeError = ValidarEntrada(lst09, e)
            Case 10
                MensajeError = ValidarEntrada(lst10, e)
            Case 11
                MensajeError = ValidarEntrada(lst11, e)
            Case 12
                MensajeError = ValidarEntrada(lst12, e)
            Case 13
                MensajeError = ValidarEntrada(lst13, e)
        End Select

        c.idHito = Request.QueryString("idHC")
        c.pregunta.idTest = Request.QueryString("idTest")
        c.pregunta.idSubtest = tabActivo
        If MensajeError = String.Empty Then
            c.pregunta.idPregunta = e.RowIndex + 1
            bd.Grabar(c)
        End If
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
        Return MensajeError
    End Function

    Private Function ValidarEntrada(listado As GridView, e As GridViewUpdateEventArgs) As String
        Dim rango As String
        Dim MensajeError As String = String.Empty
        Dim r As System.Web.UI.WebControls.TextBox = _
            DirectCast(listado.Rows(e.RowIndex).FindControl("txtResp"), System.Web.UI.WebControls.TextBox)
        Dim p As System.Web.UI.WebControls.TextBox = _
            DirectCast(listado.Rows(e.RowIndex).FindControl("txtPuntaje"), System.Web.UI.WebControls.TextBox)
        Dim v As System.Web.UI.WebControls.Label = _
            DirectCast(listado.Rows(e.RowIndex).FindControl("lblRango"), System.Web.UI.WebControls.Label)
        rango = v.Text
        c.respuestaDada = r.Text
        If IsNumeric(p.Text) Or p.Text = String.Empty Then
            c.puntajeObtenido = p.Text
        Else
            MensajeError = "Valor inválido"
        End If

        If InStr(rango, c.puntajeObtenido.ToString) = 0 Then
            If InStr(rango, "Máx") = 0 Then
                MensajeError = "Los valores posibles son: " & rango
            Else
                If c.puntajeObtenido > rango.Substring(InStr(rango, "=")) Then
                    MensajeError = "Los valores posibles son: " & rango
                End If
            End If
        End If
        Return MensajeError
    End Function

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
        Response.Redirect(Session("prevPage").ToString)
    End Sub

    Protected Sub tabWisc_ActiveTabChanged(sender As Object, e As EventArgs) Handles tabWisc.ActiveTabChanged
        lblErrorLocal.Text = String.Empty
        CargarTest(Request.QueryString("idHC"), Request.QueryString("idTest"))
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

    Protected Sub btnVerificar_Click(sender As Object, e As EventArgs)
        VerificarWisc()
    End Sub

    Private Sub VerificarWisc()
        Dim ok As Integer
        Dim bd As New psi_bll.subTestWISC3
        Dim miPaciente As psi_el.Paciente
        Dim hc As New psi_bll.historial
        Dim hito As String = Request.QueryString("idHC").ToString
        miPaciente = hc.ObtenerPaciente(hito)

        Dim verPaciente As New psi_bll.paciente
        Dim edad As Integer
        edad = verPaciente.edadEnDias(miPaciente.fechaNacimiento)

        Dim puntBruto As Integer
        Dim i As Integer = 1
        While ok <> -1 And i < 14
            puntBruto = bd.MostrarPB(hito, i)
            ok = bd.CalcularPE(i, edad, puntBruto)
            If puntBruto = 0 And i < 11 Then ok = -1
            i = i + 1
        End While
        If puntBruto = 0 Then
            Master.MensajeError = "No se completaron los tests obligatorios"
        ElseIf i < 14 Then
            Master.MensajeError = "No existe tabla de equivalencia para la edad del paciente, en el subtest: " & (i - 1)
        Else
            Master.MensajeError = "Test verificado"
        End If
    End Sub

    Private Sub DatosPersonales(miPaciente As psi_el.Paciente)
        Dim paciente As New psi_bll.paciente
        Dim edad As Integer
        edad = paciente.edadEnDias(miPaciente.fechaNacimiento)
        txtNombreCompleto.Text = miPaciente.DisplayName
        txtSexo.Text = miPaciente.sexo
        txtEscuela.Text = miPaciente.escuela
        txtGrado.Text = miPaciente.año
    End Sub
End Class
