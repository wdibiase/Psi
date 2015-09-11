Public Class documento
    Private _tipo As Short
    Private _desc As String

    Public Property tipo As Short
        Get
            Return _tipo
        End Get
        Set(value As Short)
            _tipo = value
        End Set
    End Property

    Public Property desc As String
        Get
            Return _desc
        End Get
        Set(value As String)
            _desc = value
        End Set
    End Property
End Class
