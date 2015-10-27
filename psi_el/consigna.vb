Public Class consigna
    Private _idHito As Long
    Private _pregunta As Pregunta
    Private _respuestaDada As String
    Private _puntajeObtenido As Integer?

    Public Property idHito As Long
        Get
            Return _idHito
        End Get
        Set(value As Long)
            _idHito = value
        End Set
    End Property

    Public Property pregunta As Pregunta
        Get
            Return _pregunta
        End Get
        Set(value As Pregunta)
            _pregunta = value
        End Set
    End Property

    Public ReadOnly Property idPregunta() As Integer
        Get
            Return _pregunta.idPregunta
        End Get
    End Property

    Public ReadOnly Property descPregunta() As String
        Get
            Return _pregunta.descPregunta
        End Get
    End Property

    Public Property respuestaDada As String
        Get
            Return _respuestaDada
        End Get
        Set(value As String)
            _respuestaDada = value
        End Set
    End Property

    Public Property puntajeObtenido As Integer?
        Get
            Return _puntajeObtenido
        End Get
        Set(value As Integer?)
            _puntajeObtenido = value
        End Set
    End Property

    Public Sub New()
        Me.pregunta = New Pregunta
    End Sub
End Class
