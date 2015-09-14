Imports Microsoft.Owin.Security
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.Owin
Imports Microsoft.AspNet.Identity.EntityFramework
Imports System.Web
Imports System.Web.UI

Partial Public Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Not (Request.Cookies("UserName")) Is Nothing) _
                        AndAlso (Not (Request.Cookies("Password")) Is Nothing) Then
                txtUsermail.Text = Request.Cookies("UserName").Value
                txtPassword.Attributes("value") = Request.Cookies("Password").Value
            End If
        End If
    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim login As New psi_bll.Usuario
        lblLoginError.Visible = False
        'Recuerdame:
        If Me.chkRem.Checked Then
            Response.Cookies("UserName").Expires = DateTime.Now.AddDays(30)
            Response.Cookies("Password").Expires = DateTime.Now.AddDays(30)
        Else
            Response.Cookies("UserName").Expires = DateTime.Now.AddDays(-1)
            Response.Cookies("Password").Expires = DateTime.Now.AddDays(-1)
        End If
        Response.Cookies("UserName").Value = txtUsermail.Text.Trim
        Response.Cookies("Password").Value = txtPassword.Text.Trim

        If login.Validar(txtUsermail.Text.Trim, txtPassword.Text.Trim) Then
            Response.Cookies("LoggedIn").Value = txtUsermail.Text.Trim

            Dim usulog As New psi_el.seguridad
            Dim cn As New psi_bll.Usuario
            usulog = cn.Listar(txtUsermail.Text)
            Session.Add("rol", usulog.perfil)

            Dim strRedirect As String = Request.QueryString("ReturnUrl")
            Select Case usulog.perfil
                Case "Administrador"
                    If String.IsNullOrEmpty(strRedirect) Then strRedirect = "~/admin/homeAdmin.aspx"
                Case "Coordinador"
                    If String.IsNullOrEmpty(strRedirect) Then strRedirect = "~/coord/homeCoord.aspx"

                Case Else
                    strRedirect = "~/default.aspx"
            End Select
            Response.Redirect(strRedirect)
        Else
            Me.lblLoginError.Text = "Usuario no válido o Contraseña incorrecta"
            lblLoginError.Visible = True
        End If

    End Sub
End Class
