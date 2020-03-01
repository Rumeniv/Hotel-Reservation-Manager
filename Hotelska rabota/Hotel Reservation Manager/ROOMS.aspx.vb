Public Class ROOMS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role") <> "Admin" And Session("Role") <> "User" Then
            Response.Redirect("Log_In.aspx")
        End If
        If Session("Role") <> "Admin" Then
            TB_Room_Number.Visible = False
            TB_Capacity.Visible = False
            TB_Type.Visible = False
            TB_Adult_Price.Visible = False
            TB_Child_Price.Visible = False
            BT_Insert.Visible = False
        End If
    End Sub

    Private Sub BT_Users_Click(sender As Object, e As EventArgs) Handles BT_Users.Click
        Response.Redirect("Users_Manager.aspx")
    End Sub

    Private Sub BT_Navigi_Click(sender As Object, e As EventArgs) Handles BT_Navigi.Click
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "openModal();", True)
    End Sub

    Private Sub GV_ROOMS_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GV_ROOMS.RowDataBound
        Try
            If Session("Role") <> "Admin" Then
                e.Row.Cells(0).Visible = False
                e.Row.Cells(1).Visible = False
            End If
        Catch
        End Try
    End Sub

    Private Sub BT_Search_Click(sender As Object, e As EventArgs) Handles BT_Search.Click
        GV_ROOMS.DataSourceID = "SDS_Search_With_Param"
        GV_ROOMS.DataBind()
    End Sub

    Private Sub BT_All_Click(sender As Object, e As EventArgs) Handles BT_All.Click
        GV_ROOMS.DataSourceID = "SdS_All_ROOMS_Grid"
        GV_ROOMS.DataBind()
    End Sub

    Private Sub BT_Insert_Click(sender As Object, e As EventArgs) Handles BT_Insert.Click
        SdS_All_ROOMS_Grid.Insert()
        GV_ROOMS.DataBind()
    End Sub

    Private Sub BT_Clients_Click(sender As Object, e As EventArgs) Handles BT_Clients.Click
        Response.Redirect("Clients.aspx")
    End Sub

    Private Sub BT_Reservation_Click(sender As Object, e As EventArgs) Handles BT_Reservation.Click
        Response.Redirect("Reservation.aspx")
    End Sub
End Class