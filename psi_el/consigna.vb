Public Class consigna
    Private _pregunta As String
    Private _respuesta As String
    Private _subtest As String
    Private _valorRespuesta As Int16

    Public Property pregunta As String
        Get
            Return _pregunta
        End Get
        Set(value As String)
            _pregunta = value
        End Set
    End Property

    Public Property respuesta As String
        Get
            Return _respuesta
        End Get
        Set(value As String)
            _respuesta = value
        End Set
    End Property

    Public Property subtest As String
        Get
            Return _subtest
        End Get
        Set(value As String)
            _subtest = value
        End Set
    End Property

    Public Property valorRespuesta As Int16
        Get
            Return _valorRespuesta
        End Get
        Set(value As Int16)
            _valorRespuesta = value
        End Set
    End Property
End Class
