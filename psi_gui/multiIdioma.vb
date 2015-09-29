Public Class multiIdioma
    Inherits System.Web.UI.Page

    Public Sub TraducirPagina(idioma As String, p As System.Web.UI.Page)
        Dim a As New System.Collections.ArrayList()
        Dim pageCtrl As System.Web.UI.Control = Nothing
        Dim traductor As New psi_bll.multiIdioma
        Dim controles As New List(Of psi_el.Control)

        controles = traductor.getControles(GetCurrentPageName(), idioma)
        a.AddRange(p.Controls)
        While a.Count > 0
            pageCtrl = DirectCast(a(0), System.Web.UI.Control)
            a.RemoveAt(0)
            Select Case True
                Case TypeOf (pageCtrl) Is Label
                    For Each e As psi_el.Control In controles
                        If pageCtrl.ID = e.Nombre Then
                            DirectCast(pageCtrl, Label).Text = e.Text
                        End If
                    Next

                Case TypeOf (pageCtrl) Is TextBox
                    For Each e As psi_el.Control In controles
                        If pageCtrl.ID = e.Nombre Then
                            DirectCast(pageCtrl, TextBox).Text = e.Text
                        End If
                    Next

                Case TypeOf (pageCtrl) Is LinkButton
                    For Each e As psi_el.Control In controles
                        If pageCtrl.ID = e.Nombre Then
                            DirectCast(pageCtrl, LinkButton).Text = e.Text
                        End If
                    Next

            End Select
            a.AddRange(pageCtrl.Controls)
        End While
    End Sub

    Public Sub TraducirMaster(idioma As String, p As System.Web.UI.MasterPage)
        Dim a As New System.Collections.ArrayList()
        Dim masterCtrl As System.Web.UI.Control = Nothing
        Dim traductor As New psi_bll.multiIdioma
        Dim controles As New List(Of psi_el.Control)

        controles = traductor.getControles(GetCurrentPageName(), idioma)
        a.AddRange(p.Controls)
        While a.Count > 0
            masterCtrl = DirectCast(a(0), System.Web.UI.Control)
            a.RemoveAt(0)
            Select Case True
                Case TypeOf (masterCtrl) Is Label
                    For Each e As psi_el.Control In controles
                        If masterCtrl.ID = e.Nombre Then
                            DirectCast(masterCtrl, Label).Text = e.Text
                        End If
                    Next

                Case TypeOf (masterCtrl) Is TextBox
                    For Each e As psi_el.Control In controles
                        If masterCtrl.ID = e.Nombre Then
                            DirectCast(masterCtrl, TextBox).Text = e.Text
                        End If
                    Next

                Case TypeOf (masterCtrl) Is LinkButton
                    For Each e As psi_el.Control In controles
                        If masterCtrl.ID = e.Nombre Then
                            DirectCast(masterCtrl, LinkButton).Text = e.Text
                        End If
                    Next

            End Select
            a.AddRange(masterCtrl.Controls)
        End While
    End Sub

    Private Function GetCurrentPageName() As String
        Dim sRet As String = Nothing
        Dim sPath As String
        Dim oInfo As System.IO.FileInfo
        Try
            sPath = Request.Url.AbsolutePath
            oInfo = New System.IO.FileInfo(sPath)
            sRet = oInfo.Name
        Catch ex As Exception
            Return Nothing
        End Try
        Return sRet
    End Function
End Class


