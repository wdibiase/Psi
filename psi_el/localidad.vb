Public Class localidad
    Private _id As Int32
    Private _desc As String

    Public Property id As Int32
        Get
            Return _id
        End Get
        Set(value As Int32)
            _id = value
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
