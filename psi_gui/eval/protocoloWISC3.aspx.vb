Imports Microsoft.Reporting.WebForms

Public Class protocoloWISC3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim datos As New psi_bll.subTestWISC3

            With rptWISC3.LocalReport
                .DataSources.Clear()
                .DataSources.Add(datos.DS(Request.QueryString("idHC").ToString))
                .ReportEmbeddedResource = "protocoloWISC3.rdlc"
                .ReportPath = "eval\protocoloWISC3.rdlc"
                .Refresh()
            End With

        End If
    End Sub

End Class