Public Class Clients
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

    Private Sub GV_CLIETNS_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GV_CLIETNS.RowDataBound
        Try

        Catch
        End Try
    End Sub

    Private Sub BT_Search_Click(sender As Object, e As EventArgs) Handles BT_Search.Click
        GV_CLIETNS.DataSourceID = "SDS_Search_With_Param"
        GV_CLIETNS.DataBind()
    End Sub

    Private Sub BT_All_Click(sender As Object, e As EventArgs) Handles BT_All.Click
        GV_CLIETNS.DataSourceID = "SdS_All_CLIENTS_Grid"
        GV_CLIETNS.DataBind()
    End Sub

    Private Sub BT_Insert_Click(sender As Object, e As EventArgs) Handles BT_Insert.Click
        SdS_All_CLIENTS_Grid.Insert()
        GV_CLIETNS.DataBind()
    End Sub

    Private Sub BT_ROOMS_Click(sender As Object, e As EventArgs) Handles BT_ROOMS.Click
        Response.Redirect("ROOMS.aspx")
    End Sub

    Private Sub BT_Reservation_Click(sender As Object, e As EventArgs) Handles BT_Reservation.Click
        Response.Redirect("Reservation.aspx")
    End Sub
End Class