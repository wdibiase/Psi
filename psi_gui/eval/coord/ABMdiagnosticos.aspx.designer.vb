'------------------------------------------------------------------------------
' <generado automáticamente>
'     Este código fue generado por una herramienta.
'
'     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
'     se vuelve a generar el código. 
' </generado automáticamente>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On


Partial Public Class ABMdiagnosticos

    '''<summary>
    '''Control Lista.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Lista As Global.System.Web.UI.WebControls.LinkButton

    '''<summary>
    '''Control Detalle.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Detalle As Global.System.Web.UI.WebControls.LinkButton

    '''<summary>
    '''Control lnkNuevo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lnkNuevo As Global.System.Web.UI.WebControls.LinkButton

    '''<summary>
    '''Control lblEvals.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblEvals As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control cboEvals.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cboEvals As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control btnSelEval.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnSelEval As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control lblPacientes.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblPacientes As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control cboPacientes.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents cboPacientes As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control btnSelPac.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnSelPac As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control Label2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents Label2 As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lstHC.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lstHC As Global.System.Web.UI.WebControls.GridView

    '''<summary>
    '''Control btnAprobar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnAprobar As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control btnRechazar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnRechazar As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control popupAprobar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents popupAprobar As Global.AjaxControlToolkit.ModalPopupExtender

    '''<summary>
    '''Control pnlAprobar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents pnlAprobar As Global.System.Web.UI.WebControls.Panel

    '''<summary>
    '''Control lblNota1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblNota1 As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control txtNota1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtNota1 As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control btnOkHc.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnOkHc As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control btnCancel1.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnCancel1 As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control popupRechazar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents popupRechazar As Global.AjaxControlToolkit.ModalPopupExtender

    '''<summary>
    '''Control pnlRechazar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents pnlRechazar As Global.System.Web.UI.WebControls.Panel

    '''<summary>
    '''Control lblNota2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblNota2 As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control txtNota2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtNota2 As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control btnReHc.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnReHc As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control btnCancel2.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnCancel2 As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Propiedad Master.
    '''</summary>
    '''<remarks>
    '''Propiedad generada automáticamente.
    '''</remarks>
    Public Shadows ReadOnly Property Master() As psi_gui.CoordMaster
        Get
            Return CType(MyBase.Master, psi_gui.CoordMaster)
        End Get
    End Property
End Class
