Public Class databases
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            panelBackup.Visible = True
            panelDV.Visible = False
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
        conexion.RestaurarBackup("C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER\MSSQL\Backup\", txtBackupName.Text, lstBackups.SelectedRow.Cells(1).Text)
    End Sub

    Protected Sub lnkDrop_Click(sender As Object, e As EventArgs) Handles lnkDrop.Click
        MsgBox("hola mundo")
    End Sub

    Protected Sub lnkBackup_Click(sender As Object, e As EventArgs) Handles lnkBackup.Click
        panelDV.Visible = False
        CargarBackups
        panelBackup.Visible = True
    End Sub

    Private Sub lstBackups_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles lstBackups.PageIndexChanging
        Dim BDs As List(Of psi_el.backup)
        Dim unBackup As New psi_bll.backup
        BDs = unBackup.ListarBackups
        lstBackups.DataSource = BDs
        lstBackups.PageIndex = e.NewPageIndex
        lstBackups.DataBind()
    End Sub

    Private Sub lstBackups_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles lstBackups.RowCommand
        Try
            If e.CommandName = "Select" Then
                Dim index As Integer = Convert.ToInt32(e.CommandArgument)
                Dim selectedRow As GridViewRow
                selectedRow = lstBackups.Rows(index)
            End If
        Catch ex As Exception
            Master.MensajeError = Err.Description
        End Try
    End Sub

    Private Sub lstBackups_SelectedIndexChanged(sender As Object, e As EventArgs)
        'Dim row As GridViewRow = lstBackups.SelectedRow
    End Sub

    Private Sub lstBackups_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles lstBackups.RowDataBound
        With e.Row
            If .RowType = DataControlRowType.Header Then
                .Cells(0).Text = ""
                .Cells(1).Text = "Id Backup"
                .Cells(2).Text = "Nombre"
                .Cells(3).Text = "Usuario"
                .Cells(4).Text = "Inicio BackUp"
                .Cells(5).Text = "Fin BackUp"
            End If
        End With
    End Sub

    Protected Sub lnkLogs_Click(sender As Object, e As EventArgs) Handles lnkLogs.Click
        panelBackup.Visible = False
        Dim bd As New psi_bll.backup
        gridDV.DataSource = bd.VerLogs
        gridDV.DataBind()
        panelDV.Visible = True
    End Sub

    Private Sub gridDV_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gridDV.PageIndexChanging
        Dim bd As New psi_bll.backup
        gridDV.DataSource = bd.VerLogs
        gridDV.PageIndex = e.NewPageIndex
        gridDV.DataBind()
    End Sub

    Private Sub btnCrearBackup_Click(sender As Object, e As EventArgs) Handles btnCrearBackup.Click
        Dim conexion As New psi_bll.backup
        conexion.CrearBackup("C:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER\MSSQL\Backup\", txtBackupName.Text)
    End Sub

    Protected Sub lnkDVH_Click(sender As Object, e As EventArgs)
        panelBackup.Visible = False
        Dim bd As New psi_bll.backup
        gridDV.DataSource = bd.VerDVH
        gridDV.DataBind()
        panelDV.Visible = True
    End Sub

    Protected Sub lnkDVV_Click(sender As Object, e As EventArgs)
        panelBackup.Visible = False
        Dim bd As New psi_bll.backup
        gridDV.DataSource = bd.VerDVV
        gridDV.DataBind()
        panelDV.Visible = True
    End Sub
End Class