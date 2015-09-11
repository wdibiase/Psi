Option Explicit On

Public MustInherit Class Usuario
    Private _nombreUsuario As String
    Public Property nombreUsuario As String
        Get
            Return _nombreUsuario
        End Get
        Set(value As String)
            _nombreUsuario = value
        End Set
    End Property

    Private _tipoDoc As String
    Public Property tipoDoc As String
        Get
            Return _tipoDoc
        End Get
        Set(value As String)
            _tipoDoc = value
        End Set
    End Property

    Private _numDoc As Int32
    Public Property numDoc As Int32
        Get
            Return _numDoc
        End Get
        Set(value As Int32)
            _numDoc = value
        End Set
    End Property

    Private _apellido As String
    Public Property apellido As String
        Get
            Return _apellido
        End Get
        Set(value As String)
            _apellido = value
        End Set
    End Property

    Private _nombre As String
    Public Property nombre As String
        Get
            Return _nombre
        End Get
        Set(value As String)
            _nombre = value
        End Set
    End Property

    Private _estado As String
    Public Property estado As String
        Get
            Return _estado
        End Get
        Set(value As String)
            _estado = value
        End Set
    End Property

    Private _idioma As String
    Public Property idioma As String
        Get
            Return _idioma
        End Get
        Set(value As String)
            If Len(value) > 0 Then _idioma = value
        End Set
    End Property

    Private _cliente As String
    Public Property cliente As String
        Get
            Return _cliente
        End Get
        Set(value As String)
            _cliente = value
        End Set
    End Property

    Private _pwd As String
    Public Property pwd As String
        Get
            Return _pwd
        End Get
        Set(value As String)
            _pwd = value
        End Set
    End Property

    Private _email As String
    Public Property email As String
        Get
            Return _email
        End Get
        Set(value As String)
            _email = value
        End Set
    End Property

    Private _perfil As String
    Public Property perfil As String
        Get
            Return _perfil
        End Get
        Set(value As String)
            _perfil = value
        End Set
    End Property
End Class
