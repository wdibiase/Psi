Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports Microsoft.AspNet.Identity
Imports Microsoft.Owin
Imports Microsoft.Owin.Security.Cookies
Imports Owin

<Assembly: OwinStartup(GetType(ASPNetPatterns.Startup))> 

Namespace ASPNetPatterns
    Public Class Startup
        Public Sub Configuration(app As IAppBuilder)
            app.UseCookieAuthentication(New CookieAuthenticationOptions With {
                .AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                .LoginPath = New PathString("/Default.aspx")
                })
        End Sub
    End Class
End Namespace
