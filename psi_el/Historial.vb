Public Class Historial
    Private _idHito As Integer
    Public Property idHito As Integer
        Get
            Return _idHito
        End Get
        Set(value As Integer)
            _idHito = value
        End Set
    End Property

    Private _fecha As Date
    Public Property fecha As Date
        Get
            Return _fecha
        End Get
        Set(value As Date)
            _fecha = value
        End Set
    End Property

    Private _paciente As Integer
    Public Property paciente As Integer
        Get
            Return _paciente
        End Get
        Set(value As Integer)
            _paciente = value
        End Set
    End Property

    Private _tipoNota As Int16
    Public Property tipoNota As Int16
        Get
            Return _tipoNota
        End Get
        Set(value As Int16)
            _tipoNota = value
        End Set
    End Property

    Private _observaciones As String
    Public Property observaciones As String
        Get
            Return _observaciones
        End Get
        Set(value As String)
            _observaciones = value
        End Set
    End Property

    Private _aprobado As Short
    Public Property aprobado As Short
        Get
            Return _aprobado
        End Get
        Set(value As Short)
            _aprobado = value
        End Set
    End Property

    Private _dvh As Integer
    Public ReadOnly Property dvh As Integer
        Get
            Return _dvh
        End Get
    End Property

    Private _test As Int16
    Public Property test As Int16
        Get
            Return _test
        End Get
        Set(value As Int16)
            _test = value
        End Set
    End Property

    'Public Sub New()
    '    Me.test = New test
    'End Sub

End Class
