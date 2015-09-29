Public Class Control
    Private _Nombre As String
    Private _Text As String
    Private _TTT As String

    Public Property Nombre() As String
        Get
            Return _Nombre
        End Get
        Set(value As String)
            _Nombre = value
        End Set
    End Property

    Public Property Text() As String
        Get
            Return _Text
        End Get
        Set(value As String)
            _Text = value
        End Set
    End Property

    Public Property TTT() As String
        Get
            Return _TTT
        End Get
        Set(value As String)
            _TTT = value
        End Set
    End Property
End Class
