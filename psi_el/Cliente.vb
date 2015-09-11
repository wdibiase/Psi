Public Class Cliente
    Private _id As Int32
    Public Property id As Int32
        Get
            Return _id
        End Get
        Set(value As Int32)
            _id = value
        End Set
    End Property
    Private _suscripcion As String
    Public Property suscripcion As String
        Get
            Return _suscripcion
        End Get
        Set(value As String)
            _suscripcion = value
        End Set
    End Property

    Private _calle As String
    Public Property calle As String
        Get
            Return _calle
        End Get
        Set(value As String)
            _calle = value
        End Set
    End Property

    Private _nro As Int32
    Public Property nro As Int32
        Get
            Return _nro
        End Get
        Set(value As Int32)
            _nro = value
        End Set
    End Property

    Private _piso As Int16?
    Public Property piso As Int16?
        Get
            Return _piso
        End Get
        Set(value As Int16?)
            _piso = value
        End Set
    End Property

    Private _dpto As String
    Public Property dpto As String
        Get
            Return _dpto
        End Get
        Set(value As String)
            _dpto = value
        End Set
    End Property

    Private _pcia As String
    Public Property provincia As String
        Get
            Return _pcia
        End Get
        Set(value As String)
            _pcia = value
        End Set
    End Property

    Private _partido As String
    Public Property partido As String
        Get
            Return _partido
        End Get
        Set(value As String)
            _partido = value
        End Set
    End Property

    Private _localidad As String
    Public Property localidad As String
        Get
            Return _localidad
        End Get
        Set(value As String)
            _localidad = value
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

    Private _fechaAlta As Date
    Public Property fechaAlta As Date
        Get
            Return _fechaAlta
        End Get
        Set(value As Date)
            _fechaAlta = value
        End Set
    End Property

    Private _fechaBaja As Date?
    Public Property fechaBaja As Date?
        Get
            Return _fechaBaja
        End Get
        Set(value As Date?)
            _fechaBaja = value
            'If IsDate(value) Then
            '    _fechaBaja = value
            'Else
            '    _fechaBaja = vbNullString
            'End If
        End Set
    End Property

    Private _cuit As String
    Public Property cuit As String
        Get
            Return _cuit
        End Get
        Set(value As String)
            _cuit = value
        End Set
    End Property

    Private _razonSocial As String
    Public Property razonSocial As String
        Get
            Return _razonSocial
        End Get
        Set(value As String)
            _razonSocial = value
        End Set
    End Property
End Class
