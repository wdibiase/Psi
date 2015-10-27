Public Class test
    Private _codigo As Int16
    Private _nombre As String
    Private _version As Single

    Public Property codigo As Int16
        Get
            Return _codigo
        End Get
        Set(value As Int16)
            _codigo = value
        End Set
    End Property

    Public Property nombre As String
        Get
            Return _nombre
        End Get
        Set(value As String)
            _nombre = value
        End Set
    End Property

    Public Property version As Single
        Get
            Return _version
        End Get
        Set(value As Single)
            _version = value
        End Set
    End Property

    Public ReadOnly Property test_version As String
        Get
            Return _nombre & " " & _version
        End Get
    End Property
End Class
