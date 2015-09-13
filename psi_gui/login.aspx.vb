Imports Microsoft.Owin.Security
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.Owin
Imports Microsoft.AspNet.Identity.EntityFramework
Imports System.Web
Imports System.Web.UI

Partial Public Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'RegisterHyperLink.NavigateUrl = "Register"
        'OpenAuthLogin.ReturnUrl = Request.QueryString("ReturnUrl")
        'Dim returnUrl = HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))
        'If Not [String].IsNullOrEmpty(returnUrl) Then
        '    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" & returnUrl
        'End If

        If Not IsPostBack Then
            If (Not (Request.Cookies("UserName")) Is Nothing) _
                        AndAlso (Not (Request.Cookies("Password")) Is Nothing) Then
                txtUsermail.Text = Request.Cookies("UserName").Value
                txtPassword.Attributes("value") = Request.Cookies("Password").Value
            End If
        End If

        '
        'Dim anchor As System.Web.UI.HtmlControls.HtmlAnchor

        'anchor = CType(Master.FindControl("lnkLogin"), HtmlAnchor)
        'If Not anchor Is Nothing Then
        '    MsgBox(anchor.ID)
        'End If


        'anchor.ID = "txt"
        'anchor.InnerText = "click here"
        'anchor.HRef = "http://www.google.com"
        'Page.Header.Controls.Add(anchor)
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
                    If String.IsNullOrEmpty(strRedirect) Then strRedirect = "~/admin/home.aspx"
                Case Else
                    strRedirect = "~/default.aspx"
            End Select
            'If String.IsNullOrEmpty(strRedirect) Then
            '    strRedirect = "~/home.aspx"
            '    End If
            Response.Redirect(strRedirect)
        Else
            Me.lblLoginError.Text = "Usuario no válido o Contraseña incorrecta"
            lblLoginError.Visible = True
        End If

    End Sub
End Class
