Public Class protocoloWISC_3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idHC As Long
        If Not Page.IsPostBack Then
            If Not Request.QueryString("idHC") Is Nothing Then
                idHC = Request.QueryString("idHC").ToString
                MostrarPE(idHC)
                DatosTest(idHC)
                CompletarCI()
                Graficar1()
                Graficar2()
            End If
        End If
    End Sub

    Private Sub DatosPersonales(paciente As psi_el.Paciente)
        Dim pac As New psi_bll.paciente
        txtNombreCompleto.Text = paciente.DisplayName
        txtSexo.Text = paciente.sexo
        txtEscuela.Text = paciente.escuela
        txtGrado.Text = paciente.año
        txtExaminador.Text = paciente.evaluador
        txtLateralidad.Text = paciente.lateralidad
        txtFechaNac.Text = paciente.fechaNacimiento
        txtEdad.Text = pac.edadEnAMD(paciente.fechaNacimiento)
    End Sub

    Private Sub DatosTest(idHC As Long)
        Dim hc As New psi_bll.historial
        Dim hito As psi_el.Historial
        hito = hc.Listar(idHC)
        txtFechaTest.Text = hito.fecha
    End Sub

    Private Sub MostrarPE(idHC As Long)
        On Error Resume Next
        Dim bd As New psi_bll.subTestWISC3
        Dim miPaciente As psi_el.Paciente
        Dim hc As New psi_bll.historial
        miPaciente = hc.ObtenerPaciente(idHC)
        Dim verPaciente As New psi_bll.paciente
        Dim edad As Integer
        edad = verPaciente.edadEnDias(miPaciente.fechaNacimiento)
        DatosPersonales(miPaciente)
        'Try
        pb1.Text = bd.MostrarPB(idHC, 1)
        pb2.Text = bd.MostrarPB(idHC, 2)
        pb3.Text = bd.MostrarPB(idHC, 3)
        pb4.Text = bd.MostrarPB(idHC, 4)
        pb5.Text = bd.MostrarPB(idHC, 5)
        pb6.Text = bd.MostrarPB(idHC, 6)
        pb7.Text = bd.MostrarPB(idHC, 7)
        pb8.Text = bd.MostrarPB(idHC, 8)
        pb9.Text = bd.MostrarPB(idHC, 9)
        pb10.Text = bd.MostrarPB(idHC, 10)
        pb11.Text = bd.MostrarPB(idHC, 11)
        pb12.Text = bd.MostrarPB(idHC, 12)
        pb13.Text = bd.MostrarPB(idHC, 13)

        pe1.Text = bd.CalcularPE(1, edad, pb1.Text)
        pe2.Text = bd.CalcularPE(2, edad, pb2.Text)
        pe3.Text = bd.CalcularPE(3, edad, pb3.Text)
        pe4.Text = bd.CalcularPE(4, edad, pb4.Text)
        pe5.Text = bd.CalcularPE(5, edad, pb5.Text)
        pe6.Text = bd.CalcularPE(6, edad, pb6.Text)
        pe7.Text = bd.CalcularPE(7, edad, pb7.Text)
        pe8.Text = bd.CalcularPE(8, edad, pb8.Text)
        pe9.Text = bd.CalcularPE(9, edad, pb9.Text)
        pe10.Text = bd.CalcularPE(10, edad, pb10.Text)
        pe11.Text = bd.CalcularPE(11, edad, pb11.Text)
        pe12.Text = bd.CalcularPE(12, edad, pb12.Text)
        pe13.Text = bd.CalcularPE(13, edad, pb13.Text)

        pVe.Text = CInt(pe2.Text) + CInt(pe4.Text) + CInt(pe6.Text) + CInt(pe8.Text) + CInt(pe10.Text)
        pEj.Text = CInt(pe1.Text) + CInt(pe3.Text) + CInt(pe5.Text) + CInt(pe7.Text) + CInt(pe9.Text)

        If IsNumeric(pe2.Text) Then cv1.Text = pe2.Text Else cv1.Text = "0"
        If IsNumeric(pe4.Text) Then cv2.Text = pe4.Text Else cv2.Text = "0"
        If IsNumeric(pe8.Text) Then cv3.Text = pe8.Text Else cv3.Text = "0"
        If IsNumeric(pe10.Text) Then cv4.Text = pe10.Text Else cv4.Text = "0"
        If IsNumeric(pe1.Text) Then op1.Text = pe1.Text Else op1.Text = "0"
        If IsNumeric(pe5.Text) Then op2.Text = pe5.Text Else op2.Text = "0"
        If IsNumeric(pe7.Text) Then op3.Text = pe7.Text Else op3.Text = "0"
        If IsNumeric(pe9.Text) Then op4.Text = pe9.Text Else op4.Text = "0"
        If IsNumeric(pe6.Text) Then ad1.Text = pe6.Text Else ad1.Text = "0"
        If IsNumeric(pe12.Text) Then ad2.Text = pe12.Text Else ad2.Text = "0"
        If IsNumeric(pe3.Text) Then vp1.Text = pe3.Text Else vp1.Text = "0"
        If IsNumeric(pe11.Text) Then vp2.Text = pe11.Text Else vp2.Text = "0"
        pCV.Text = CInt(cv1.Text) + CInt(cv2.Text) + CInt(cv3.Text) + CInt(cv4.Text)
        pOP.Text = CInt(op1.Text) + CInt(op2.Text) + CInt(op3.Text) + CInt(op4.Text)
        pAD.Text = CInt(ad1.Text) + CInt(ad2.Text)
        pVP.Text = CInt(vp1.Text) + CInt(vp2.Text)
        'Catch ex As Exception
        'MsgBox(Err.Description)
        'End Try
    End Sub

    Private Sub Graficar1()
        Dim x As Integer() = New Integer(5) {}
        Dim y As Decimal() = New Decimal(5) {}
        Try
            For i As Integer = 0 To 5
                x(i) = i
            Next
            y(0) = CInt(pe2.Text)
            y(1) = CInt(pe4.Text)
            y(2) = CInt(pe6.Text)
            y(3) = CInt(pe8.Text)
            y(4) = CInt(pe10.Text)
            y(5) = CInt(pe12.Text)
        Catch ex As Exception

        End Try
        graph1.BorderWidth = 0
        graph1.Series.Add(New AjaxControlToolkit.LineChartSeries() With {.Data = y})
        graph1.CategoriesAxis = "Inf, Ana, Ari, Voc, Com, RD"
        graph1.Visible = True
    End Sub

    Private Sub Graficar2()
        Dim x As Integer() = New Integer(6) {}
        Dim y As Decimal() = New Decimal(6) {}
        Try
            For i As Integer = 0 To 6
                x(i) = i
            Next
            y(0) = CInt(pe1.Text)
            y(1) = CInt(pe3.Text)
            y(2) = CInt(pe5.Text)
            y(3) = CInt(pe7.Text)
            y(4) = CInt(pe9.Text)
            y(5) = CInt(pe11.Text)
            y(6) = CInt(pe13.Text)
        Catch ex As Exception

        End Try
        graph2.BorderWidth = 0
        graph2.Series.Add(New AjaxControlToolkit.LineChartSeries() With {.Data = y})
        graph2.CategoriesAxis = "CF, Cla, OH, CC, CO, BS, Lab"
        graph2.Visible = True
    End Sub

    Private Sub CompletarCI()
        ciVerbal.Text = pVe.Text
        ciEjec.Text = pEj.Text
        ciEC.Text = CInt(ciVerbal.Text) + CInt(ciEjec.Text)
        ciCV.Text = pCV.Text
        ciOP.Text = pOP.Text
        ciAD.Text = pAD.Text
        ciVP.Text = pVP.Text
    End Sub
End Class