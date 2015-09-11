Imports System.Web
Imports System.Collections.Generic
Imports System.Linq
Imports Microsoft.AspNet.Identity
Imports Microsoft.Owin
Imports Microsoft.Owin.Security.Cookies
Imports Owin
Imports Microsoft.AspNet.Identity.EntityFramework
Imports System.Data.Common
Imports Microsoft.Owin.Security

Public Class IdentityASP
    Private _userStore As UserStore(Of IdentityUser)
    Private ReadOnly Property UserStore() As UserStore(Of IdentityUser)
        Get
            If _userStore Is Nothing Then
                UserStore = New UserStore(Of IdentityUser)()
            End If
            Return _userStore
        End Get
    End Property

    ''' <summary>
    ''' Propiedad que devuelve el manager de usuarios
    ''' </summary>
    Private _manager As UserManager(Of IdentityUser)
    Private Property Manager() As UserManager(Of IdentityUser)
        Get
            If _manager Is Nothing Then
                InitializeManager()
            End If
            Return _manager
        End Get
        Set(value As UserManager(Of IdentityUser))
            _manager = value
        End Set
    End Property

    ''' <summary>
    ''' Inizializa el manager UserManager
    ''' </summary>
    Private Sub InitializeManager()
        Manager = New UserManager(Of IdentityUser)(UserStore)

        Manager.UserValidator = New UserValidator(Of IdentityUser)(Manager) With { _
        .AllowOnlyAlphanumericUserNames = False _
    }
    End Sub

    Public Sub RegistrarUsuario(username As String, password As String)
        UserStore.Context.Database.Connection.Open()
        Using ts = UserStore.Context.Database.Connection.BeginTransaction()
            Try
                Dim result As IdentityResult = CreateIdentityUser(username, password, ts)
                If result.Succeeded Then
                    ts.Commit()
                Else
                    'Metodo Helper que lee los errores al crear un usuario y lanza la excepción con cada uno de estos errores en la propiedad Data de
                    'la excepción

                    'Throw Helpers.ExceptionsHelper.ReadIdentityResultErrorsAndReturnException(result.Errors)
                    MsgBox("error")
                End If
            Catch generatedExceptionName As Exception
                ts.Rollback()
                Throw New Exception("No se ha podido registrar al usuario")
            Finally
                'Cerramos la conexion
                UserStore.Context.Database.Connection.Close()
            End Try
        End Using
    End Sub

    Private Function CreateIdentityUser(username As String, password As String, ts As DbTransaction) As IdentityResult
        Dim user = New IdentityUser() With { _
            .UserName = username _
        }
        UserStore.Context.Database.UseTransaction(ts)
        Dim result As IdentityResult = Manager.Create(user, password)
        Return result
    End Function

    Public Function AutenticarUsuario(username As String, password As String, esPersistente As Boolean) As Boolean
        'Buscamos el 
        Dim usuario = Manager.Find(username, password)

        If usuario Is Nothing Then
            Return False
        End If

        CrearCookieIdentidadYSignIn(usuario, esPersistente)
        Return True
    End Function

    ''' <summary>
    ''' Método privado que pone en contexto al usuario que se firmará y lo firma.
    ''' </summary>
    ''' <param name="usuario"></param>
    ''' <param name="esPersistente"></param>
    Private Sub CrearCookieIdentidadYSignIn(usuario As IdentityUser, esPersistente As Boolean)
        Dim authenticationManager = HttpContext.Current.GetOwinContext().Authentication
        Dim userIdentity = Manager.CreateIdentity(usuario, DefaultAuthenticationTypes.ApplicationCookie)
        authenticationManager.SignIn(New AuthenticationProperties() With { _
            .IsPersistent = esPersistente _
        }, userIdentity)
    End Sub

End Class
