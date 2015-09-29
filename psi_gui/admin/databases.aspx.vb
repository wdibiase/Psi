Public Class databases
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargarBackups()
            Traducir(Me)
        End If
    End Sub

    Private Sub CargarBackups()
        Dim backups As List(Of psi_el.backup)
        Dim conexion As New psi_bll.backup
        backups = conexion.ListarBackups
        lstBackups.DataSource = backups
        lstBackups.DataBind()
    End Sub

    Protected Sub lnkRestore_Click(sender As Object, e As EventArgs) Handles lnkRestore.Click
        Dim conexion As New psi_bll.backup
        conexion.RestaurarBackup("C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER\MSSQL\Backup\", txtBackupName.Text, lstBackups.SelectedRow.Cells(1).Text) ' selectedRow.Cells(1).Text)
    End Sub

    Protected Sub lnkDrop_Click(sender As Object, e As EventArgs) Handles lnkDrop.Click
        MsgBox("hola mundo")
    End Sub

    Protected Sub lnkBackup_Click(sender As Object, e As EventArgs) Handles lnkBackup.Click
        Dim conexion As New psi_bll.backup
        conexion.CrearBackup("C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER\MSSQL\Backup\", txtBackupName.Text)
    End Sub

    Private Sub lstBackups_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles lstBackups.RowCommand
        Try
            If e.CommandName = "Select" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                Dim selectedRow As GridViewRow
                selectedRow = lstBackups.Rows(index)
            End If
        Catch ex As Exception
            Response.Redirect("error.aspx")
        End Try
    End Sub
End Class