Public Class SiteMaster
    Inherits MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("Role") <> "User" And Session("Role") <> "Admin" Then
            LinkButton1.Text = "Log In"
        Else
            LinkButton1.Text = "Log Out"
        End If
    End Sub
End Class