Public Class Log_In
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub BT_Login_Click(sender As Object, e As EventArgs) Handles BT_Login.Click
        Dim Login_data As DataView = DirectCast(SDS_Log_In.Select(DataSourceSelectArguments.Empty), DataView)
        If Login_data IsNot Nothing Then
            For Each drv As DataRowView In Login_data
                If drv("Active_Flag").ToString() = "True" Then
                    Session("Role") = drv("User_Role").ToString()
                    Response.Redirect("ROOMS.aspx")
                End If
            Next

        End If
        TB_User.Text = ""
        TB_Password.Text = ""
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage",
                            "alert('Invalid username or password!');", True)
    End Sub

End Class