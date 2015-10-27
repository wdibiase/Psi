Public Class protocoloWISC_3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim idHC As Long
        If Not Page.IsPostBack Then
            If Not Request.QueryString("idHC") Is Nothing Then
                idHC = Request.QueryString("idHC").ToString
                MostrarPE(idHC)
                Graficar()
            End If
        End If
    End Sub

    Private Sub MostrarPE(idHC As Long)
        Dim bd As New psi_bll.subTestWISC3
        Dim miPaciente As psi_el.Paciente
        Dim hc As New psi_bll.historial
        miPaciente = hc.ObtenerPaciente(idHC)
        Dim verPaciente As New psi_bll.paciente
        Dim edad As Integer
        edad = verPaciente.edadEnDias(miPaciente.fechaNacimiento)
        Try
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
        Catch ex As Exception
            'MsgBox(Err.Description)
        End Try
    End Sub

    Private Sub Graficar()
        Dim x As Integer() = New Integer(12) {}
        Dim y As Decimal() = New Decimal(13) {}
        Try
            For i As Integer = 0 To 12
                x(i) = i
            Next
            y(0) = CInt(pe2.Text)
            y(1) = CInt(pe4.Text)
            y(2) = CInt(pe6.Text)
            y(3) = CInt(pe8.Text)
            y(4) = CInt(pe10.Text)
            y(5) = CInt(pe12.Text)
            y(6) = CInt(pe1.Text)
            y(7) = CInt(pe3.Text)
            y(8) = CInt(pe5.Text)
            y(9) = CInt(pe7.Text)
            y(10) = CInt(pe9.Text)
            y(11) = CInt(pe11.Text)
            y(12) = CInt(pe13.Text)
            y(13) = 0
        Catch ex As Exception

        End Try

        graphST.Series.Add(New AjaxControlToolkit.LineChartSeries() With {.Data = y})
        graphST.CategoriesAxis = "Inf, Ana, Ari, Voc, Com, RD, CF, Cla, OH, CC, CO, BS, Lab"
        graphST.ChartTitle = "Puntajes de los subtests"
        If x.Length > 3 Then
            graphST.ChartWidth = (x.Length * 75).ToString()
        End If
        graphST.Visible = True

    End Sub
End Class