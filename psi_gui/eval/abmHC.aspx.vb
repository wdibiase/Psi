Public Class abmHC
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Lista_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Detalle_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnSel_Click(sender As Object, e As EventArgs)
        MsgBox(Me.rbl.SelectedItem.Text)
    End Sub
End Class