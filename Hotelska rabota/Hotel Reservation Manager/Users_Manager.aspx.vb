Public Class Users_Manager
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Role") <> "Admin" And Session("Role") <> "User" Then
            Response.Redirect("Log_In.aspx")
        End If
        If Session("Role") <> "Admin" Then
            TB_UserName.Visible = False
            TB_Password.Visible = False
            TB_First_name.Visible = False
            TB_Middle_Name.Visible = False
            TB_Family_name.Visible = False
            TB_PID.Visible = False
            TB_Telephone_Number.Visible = False
            TB_E_mail_Address.Visible = False
            TB_User_Role.Visible = False
            BT_Insert.Visible = False
        End If
    End Sub

    Private Sub BT_Insert_Click(sender As Object, e As EventArgs) Handles BT_Insert.Click
        SdS_All_Users_Grid.Insert()
        GV_Users.DataBind()
    End Sub

    Private Sub GV_Users_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GV_Users.RowDataBound
        Try
            If Session("Role") <> "Admin" Then
                e.Row.Cells(0).Visible = False
                e.Row.Cells(1).Visible = False
            End If
        Catch
        End Try

    End Sub

    Private Sub BT_Search_Click(sender As Object, e As EventArgs) Handles BT_Search.Click
        GV_Users.DataSourceID = "SDS_Search_With_Param"
        DataBind()
    End Sub

    Private Sub BT_All_Click(sender As Object, e As EventArgs) Handles BT_All.Click
        GV_Users.DataSourceID = "SdS_All_Users_Grid"
        GV_Users.DataBind()
    End Sub

    Private Sub GV_Userst_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GV_Users.PageIndexChanging
        GV_Users.PageIndex = e.NewPageIndex
    End Sub

    Private Sub GV_Users_Partners_RowUpdating(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs) Handles GV_Users.RowUpdating

        ' The GridView control does not automatically extract updated values 
        ' from TemplateField column fields. These values must be added manually 
        ' to the NewValues dictionary.

        ' Get the GridViewRow object that represents the row being edited
        ' from the Rows collection of the GridView control.
        Dim index As Integer = GV_Users.EditIndex
        Dim row As GridViewRow = GV_Users.Rows(index)

        ' Get the controls that contain the updated values. In this
        ' example, the updated values are contained in the TextBox 
        ' controls declared in the edit item templates of each TemplateField 
        ' column fields in the GridView control.
        SdS_All_Users_Grid.UpdateParameters.Add("ID", CType(row.FindControl("ID_Grid"), Label).Text)


        ' Add the updated values to the NewValues dictionary. Use the
        ' parameter names declared in the parameterized update query 
        ' string for the key names.

        SdS_All_Users_Grid.Update()

    End Sub


    Private Sub BT_Navigi_Click(sender As Object, e As EventArgs) Handles BT_Navigi.Click
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Pop", "openModal();", True)
    End Sub

    Private Sub BT_ROOMS_Click(sender As Object, e As EventArgs) Handles BT_ROOMS.Click
        Response.Redirect("ROOMS.aspx")
    End Sub

    Private Sub BT_Clients_Click(sender As Object, e As EventArgs) Handles BT_Clients.Click
        Response.Redirect("Clients.aspx")
    End Sub

    Private Sub BT_Reservation_Click(sender As Object, e As EventArgs) Handles BT_Reservation.Click
        Response.Redirect("Reservation.aspx")
    End Sub
End Class