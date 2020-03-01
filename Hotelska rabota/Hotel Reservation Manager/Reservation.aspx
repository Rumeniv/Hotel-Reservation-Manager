<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Reservation.aspx.vb" Inherits="Hotel_Reservation_Manager.Reservation"  MasterPageFile="~/Site.Master"  %>

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



    

    <%-- <asp:SqlDataSource ID="Transact_Bad_Subscriber_Comp" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="SELECT &quot;EIK&quot;,&quot;ENTITY_NAME&quot;,&quot;NOTIFICATION&quot;,&quot;ADDED_BY&quot;,&quot;OBJECT&quot;,&quot;ADDED_DTM&quot; FROM &quot;BAD_SUBSCRIBERS&quot; where &quot;EIK&quot; = :BULSTAT and &quot;OBJECT&quot;='Company'">        
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_Search" Name="BULSTAT" PropertyName="Text" Type="String" />
        </SelectParameters>        
     </asp:SqlDataSource>--%>
  



   


     


    <asp:SqlDataSource ID="SDS_ROOM_Availa" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="Select Room_Number from [dbo].[H_ROOMS] where Reserved is null" SelectCommandType="Text" 
        UpdateCommand="Update [dbo].H_ROOMS set [Reserved] = 1 where [Room_Number] = @Room_Number" >
  
     </asp:SqlDataSource>

   
     <asp:Panel ID="Panel1" runat="server" class="panel panel-default" BorderStyle="Solid">
          <div class="panel-heading col-sm-12">
                <asp:Label ID="Label2" runat="server" Style="float:left;margin-left:50px"  Text="CLEITNS"  ForeColor="#FFFFCC"></asp:Label>        
                    <asp:Label ID="LB_Search" runat="server" Text="Search_By:" Style="margin-left:50%"></asp:Label>
                    <asp:DropDownList ID="DD_Search" Style="text-align: center" runat="server" Height="30px" Width="120px"  >
                         <asp:ListItem Value="First_Name" Text="First_Name"></asp:ListItem>
                         <asp:ListItem Value="Family_Name" Text="Family_Name"></asp:ListItem>                                            
                    </asp:DropDownList> 
                    <asp:Label ID="LB_Search2" runat="server" Text="Value:" ></asp:Label>
                    <asp:TextBox ID="TB_Search" Style="text-align: center" runat="server" Height="30px" Width="120px"  ></asp:TextBox>
                    <asp:Button ID="BT_Search" runat="server" Text="Search" />
                    <asp:Button ID="BT_All" runat="server" Text="Show All" BackColor="#99CCFF" /> 
                    <asp:Button ID="BT_Navigi" Style="float:right" runat="server" Text="Go To" />
            </div>    
            <div class="panel-body">
                <asp:DropDownList ID="dd_rOOM_aVAILABLE" runat="server" DataSourceID ="SDS_ROOM_Availa" DataValueField="Room_Number"></asp:DropDownList>
                
                <asp:TextBox ID="TB_Client2" runat="server" Visible="true" ToolTip="User Who Reserved"></asp:TextBox>
                <asp:TextBox ID="TB_Client3" runat="server" Visible="true" ToolTip="Guests"></asp:TextBox>                   
                <asp:TextBox ID="TB_DateOfReservation" runat="server" Visible="true" ToolTip="Date Of Reservation"></asp:TextBox>  
                <asp:TextBox ID="TB_DateOfLeaving" runat="server" Visible="true" ToolTip="Date Of Leaving"></asp:TextBox>  
                <asp:CheckBox ID="CB_Breakfast" runat="server" Visible="true" ToolTip="Breakfast"></asp:CheckBox>
                <asp:CheckBox ID="TCB_AllInclusive" runat="server" Visible="true" ToolTip="All Inclusive"></asp:CheckBox>  

           
                        
                <asp:Button ID="BT_Insert" runat="server" Text="CREATE RESERVATION" class="btn btn-primary btn-sm" /> 
                
        <div class="row"></div>
             <div class="row">
       
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
                          <asp:Button ID="BT_Users" runat="server" Text="To Users" />
                          <asp:Button ID="BT_ROOMS" runat="server" Text="To Rooms" />                          
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

