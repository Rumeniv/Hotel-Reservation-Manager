<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Users_Manager.aspx.vb" Inherits="Hotel_Reservation_Manager.Users_Manager" MasterPageFile="~/Site.Master"%>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
           <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="Scripts/jquery-1.12.4.min.js"></script>
 <%--   <script src="Scripts/jquery-ui-timepicker-addon.js"></script>--%>
    <script src="Scripts/Bootstrap-3-3-6.min.js"></script>
   <%-- <script src="jquery-latest.min.js"> </script>--%>
    <link rel="stylesheet" href="CSS/Bootstrap.css" />
 <link rel="stylesheet" href="Content/themes/base/jquery-ui.css">

    <link rel="stylesheet" href="CSS/credit.check.css" />
    <script src="Scripts/jquery-1.12.0-ui.js"></script> 
    
    

    <asp:SqlDataSource ID="SdS_All_Users_Grid" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="select * from [dbo].[H_UL]" SelectCommandType="Text"
        InsertCommand="Insert into [dbo].[H_UL] (
        [UserName]
      ,[Password]
      ,[First_name]
      ,[Middle_Name]
      ,[Family_name]
      ,[PID]
      ,[Telephone_Number]
      ,[E_mail_Address]     
      ,[User_Role]) values (
            @TB_UserName,
            @TB_Password,
            @TB_First_name,
            @TB_Middle_Name,
            @TB_Family_name,
            @TB_PID,
            @TB_Telephone_Number,
            @TB_E_mail_Address,
            @TB_User_Role
            )"
        Deletecommand="Delete From [dbo].[H_UL] where ID = @ID"
        UpdateCommand="Update [dbo].[H_UL] set [Active_Flag] = 0,[Out_Of_Work_Date] = getdate() where ID=@ID ">   
       
        <InsertParameters>
            <asp:ControlParameter ControlID="TB_UserName" Name="TB_UserName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Password" Name="TB_Password" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_First_name" Name="TB_First_name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Middle_Name" Name="TB_Middle_Name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_Family_name" Name="TB_Family_name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_PID" Name="TB_PID" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Telephone_Number" Name="TB_Telephone_Number" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_E_mail_Address" Name="TB_E_mail_Address" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_User_Role" Name="TB_User_Role" PropertyName="Text" Type="String" />              
        </InsertParameters>
     </asp:SqlDataSource>
    

    <asp:SqlDataSource ID="SDS_Search_With_Param" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="Search_By_Param" SelectCommandType="StoredProcedure" > 
        <SelectParameters>
            <asp:ControlParameter ControlID="DD_Search" Name="DD_Search" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TB_Search" Name="TB_Search" PropertyName="Text" Type="String" />
        </SelectParameters>
     </asp:SqlDataSource>

   
     <asp:Panel ID="Panel1" runat="server" class="panel panel-default" BorderStyle="Solid">
          <div class="panel-heading col-sm-12">
                <asp:Label ID="Label2" runat="server" Style="float:left;margin-left:50px"  Text="Users"  ForeColor="#FFFFCC"></asp:Label> 
                    <asp:Label ID="LB_Search" runat="server" Text="Search_By:" Style="margin-left:50%"></asp:Label>
                    <asp:DropDownList ID="DD_Search" Style="text-align: center" runat="server" Height="30px" Width="120px"  >
                         <asp:ListItem Value="UserName" Text="UserName"></asp:ListItem>
                         <asp:ListItem Value="First_name" Text="First_name"></asp:ListItem>
                         <asp:ListItem Value="Middle_Name" Text="Middle_Name"></asp:ListItem>
                         <asp:ListItem Value="Family_name" Text="Family_name"></asp:ListItem>
                         <asp:ListItem Value="E_mail_Address" Text="E_mail_Address"></asp:ListItem>
                    </asp:DropDownList> 
                    <asp:Label ID="LB_Search2" runat="server" Text="Value:" ></asp:Label>
                    <asp:TextBox ID="TB_Search" Style="text-align: center" runat="server" Height="30px" Width="120px"  ></asp:TextBox>
                    <asp:Button ID="BT_Search" runat="server" Text="Search" />
                    <asp:Button ID="BT_All" runat="server" Text="Show All" BackColor="#99CCFF" />
                <asp:Button ID="BT_Navigi" Style="float:right" runat="server" Text="Go To" />
              
            </div>    
            <div class="panel-body">
                <asp:TextBox ID="TB_UserName" runat="server" Visible="true" ToolTip="Username"></asp:TextBox>
                <asp:TextBox ID="TB_Password" runat="server" Visible="true" ToolTip="Password"></asp:TextBox>
                <asp:TextBox ID="TB_First_name" runat="server" Visible="true" ToolTip="FirstName"></asp:TextBox>  
                <asp:TextBox ID="TB_Middle_Name" runat="server" Visible="true" ToolTip="Middle_Name"></asp:TextBox>  
                <asp:TextBox ID="TB_Family_name" runat="server" Visible="true" ToolTip="Family_name"></asp:TextBox>  
                <asp:TextBox ID="TB_PID" runat="server" Visible="true" ToolTip="PID"></asp:TextBox>  
                <asp:TextBox ID="TB_Telephone_Number" runat="server" Visible="true" ToolTip="Telephone_Number"></asp:TextBox>  
                <asp:TextBox ID="TB_E_mail_Address" runat="server" Visible="true" ToolTip="E_mail_Address"></asp:TextBox>  
                <asp:TextBox ID="TB_User_Role" runat="server" Visible="true" ToolTip="User_Role"></asp:TextBox>               
                <asp:Button ID="BT_Insert" runat="server" Text="INSERT" class="btn btn-primary btn-sm" /> 
                
        <div class="row"></div>
             <div class="row">
        <asp:GridView ID="GV_Users" runat="server" DataKeyNames="ID" DataSourceID="SdS_All_Users_Grid" AllowPaging="true" PageSize="10" class="aspNetDisabled" AutoGenerateColumns="false" AutoGenerateDeleteButton="true">
            <Columns>
                   <asp:CommandField ShowEditButton="true" EditText="Fire" UpdateText="Ok" CancelText="Cancel"> <ControlStyle ForeColor="white" Font-Bold="false" CssClass="btn btn-danger btn-xs"   />
                                </asp:CommandField>
                <asp:TemplateField>
                    <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                   </ItemTemplate>
                    <EditItemTemplate>
                    <asp:Label runat="server" ID="ID_Grid" Text= '<%# Eval("ID") %>'></asp:Label>
                    </EditItemTemplate>
                </asp:TemplateField>
         <%--        <asp:BoundField DataField="ID" HeaderText="ID" Visible="true" />--%>
                 <asp:BoundField DataField="UserName" HeaderText="UserName" Visible="true" />
                 <asp:BoundField DataField="First_name" HeaderText="First_name" Visible="true" />
                 <asp:BoundField DataField="Middle_Name" HeaderText="Middle_Name" Visible="true" />
                 <asp:BoundField DataField="Family_name" HeaderText="Family_name" Visible="true" />
                 <asp:BoundField DataField="PID" HeaderText="PID" Visible="true" />
                 <asp:BoundField DataField="Telephone_Number" HeaderText="Telephone_Number" Visible="true" />
                 <asp:BoundField DataField="E_mail_Address" HeaderText="E_mail_Address" Visible="true" />
                 <asp:BoundField DataField="Start_Work_Date" HeaderText="Start_Work_Date" Visible="true" />
                 <asp:BoundField DataField="Active_Flag" HeaderText="Active_Flag" Visible="true" />
                 <asp:BoundField DataField="Out_Of_Work_Date" HeaderText="Out_Of_Work_Date" Visible="true" />
                 <asp:BoundField DataField="User_Role" HeaderText="User_Role" Visible="true" />               
            </Columns>
        </asp:GridView>
        </div>
        
                </div>
               
        </asp:Panel>

     <div class="modal fade" role="dialog" id="ModalNavigi">
               <div class="modal-dialog ">
                   <div class="modal-content ">
                      <div class="modal-header ">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Navigation </h4>
                      </div>
                      <div class="modal-body ">
                          <asp:Button ID="BT_Clients" runat="server" Text="To Clients" />
                          <asp:Button ID="BT_ROOMS" runat="server" Text="To Rooms" />   
                           <asp:Button ID="BT_Reservation" runat="server" Text="To Reservation" /> 
                      </div>
                       <div class="modal-footer">
                     
       
        <button type="button" class="btn btn-danger" data-dismiss="modal">Exit</button>
                      </div>
                </div>
            </div>
       </div>



    <script type="text/javascript">                         
           function openModal() {

               $('#ModalNavigi').modal('show');
        }
    </script>
    </asp:Content>
