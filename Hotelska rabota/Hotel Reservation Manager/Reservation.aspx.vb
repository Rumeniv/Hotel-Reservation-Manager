Public Class Reservation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role") <> "Admin" And Session("Role") <> "User" Then
            Response.Redirect("Log_In.aspx")
        End If
        If Session("Role") <> "Admin" Then

        End If
    End Sub

    Private Sub BT_Users_Click(sender As Object, e As EventArgs) Handles BT_Users.Click
        Response.Redirect("Users_Manager.aspx")
    End Sub

    Private Sub BT_Navigi_Click(sender As Object, e As EventArgs) Handles BT_Navigi.Click
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "openModal();", True)
    End Sub




    Private Sub BT_ROOMS_Click(sender As Object, e As EventArgs) Handles BT_ROOMS.Click
        Response.Redirect("ROOMS.aspx")
    End Sub

    Private Sub BT_Insert_Click(sender As Object, e As EventArgs) Handles BT_Insert.Click



    End Sub
End Class