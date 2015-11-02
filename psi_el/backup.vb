Public Class backup
    Private _id As Integer
    Private _nombreBK As String
    'Private _descripcion As String
    ' Private _nombreDB As String
    Private _nombreUsuario As String
    'Private _fechaCreacionDB As Date
    Private _fechaInicioBK As Date
    Private _fechaFinBK As Date
    'Private _tamañoBK As Long
    'Private _modeloRecup As String
    'Private _dispLog As String
    'Private _dispFis As String

    Public Property id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

    Public Property nombreBK As String
        Get
            Return _nombreBK
        End Get
        Set(value As String)
            _nombreBK = value
        End Set
    End Property

    'Public Property descripcion As String
    '    Get
    '        Return _descripcion
    '    End Get
    '    Set(value As String)
    '        _descripcion = value
    '    End Set
    'End Property

    'Public Property nombreDB As String
    '    Get
    '        Return _nombreDB
    '    End Get
    '    Set(value As String)
    '        _nombreDB = value
    '    End Set
    'End Property

    Public Property nombreUsuario As String
        Get
            Return _nombreUsuario
        End Get
        Set(value As String)
            _nombreUsuario = value
        End Set
    End Property

    'Public Property fechaCreacionDB As Date
    '    Get
    '        Return _fechaCreacionDB
    '    End Get
    '    Set(value As Date)
    '        _fechaCreacionDB = value
    '    End Set
    'End Property

    Public Property fechaInicioBK As Date
        Get
            Return _fechaInicioBK
        End Get
        Set(value As Date)
            _fechaInicioBK = value
        End Set
    End Property

    Public Property fechaFinBK As Date
        Get
            Return _fechaFinBK
        End Get
        Set(value As Date)
            _fechaFinBK = value
        End Set
    End Property

    'Public Property tamañoBK As Long
    '    Get
    '        Return _tamañoBK
    '    End Get
    '    Set(value As Long)
    '        _tamañoBK = value
    '    End Set
    'End Property

    'Public Property modeloRecup As String
    '    Get
    '        Return _modeloRecup
    '    End Get
    '    Set(value As String)
    '        _modeloRecup = value
    '    End Set
    'End Property

    'Public Property dispLog As String
    '    Get
    '        Return _dispLog
    '    End Get
    '    Set(value As String)
    '        _dispLog = value
    '    End Set
    'End Property

    'Public Property dispFis As String
    '    Get
    '        Return _dispFis
    '    End Get
    '    Set(value As String)
    '        _dispFis = value
    '    End Set
    'End Property
End Class
