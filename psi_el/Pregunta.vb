Public Class Pregunta
    Private _idTest As Int16
    Private _idSubtest As Int16
    Private _idPregunta As Int16
    Private _descPregunta As String
    Private _puntaje As Int16

    Public Property idTest As Int16
        Get
            Return _idTest
        End Get
        Set(value As Int16)
            _idTest = value
        End Set
    End Property

    Public Property idSubtest As Int16
        Get
            Return _idSubtest
        End Get
        Set(value As Int16)
            _idSubtest = value
        End Set
    End Property

    Public Property idPregunta As Int16
        Get
            Return _idPregunta
        End Get
        Set(value As Int16)
            _idPregunta = value
        End Set
    End Property

    Public Property descPregunta As String
        Get
            Return _descPregunta
        End Get
        Set(value As String)
            _descPregunta = value
        End Set
    End Property

    Public Property puntaje As String
        Get
            Return _puntaje
        End Get
        Set(value As String)
            _puntaje = value
        End Set
    End Property
End Class
