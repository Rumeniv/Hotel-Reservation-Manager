<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ROOMS.aspx.vb" Inherits="Hotel_Reservation_Manager.ROOMS"  MasterPageFile="~/Site.Master"  %>

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
  



     <asp:SqlDataSource ID="SdS_All_ROOMS_Grid" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="select * from [dbo].H_ROOMS" SelectCommandType="Text"
        InsertCommand="Insert into [dbo].H_ROOMS (
       
	[Room_Number],
	[Capacity],
	[Type],	
	[Adult_Price],
	[Child_Price]) values (
            @TB_Room_Number,
            @TB_Capacity,
            @TB_Type,
            @TB_Adult_Price,
            @TB_Child_Price         
            )"


        Deletecommand="Delete From [dbo].H_ROOMS where ID = @ID"
        UpdateCommand="Update [dbo].H_ROOMS set [Room_Number] = @Room_Number,[Capacity] = @Capacity,[Type] = @Type, [Adult_Price] = @Adult_Price , Child_Price = @Child_Price, [Reserved] = @Reserved where ID=@ID ">   
       
        <InsertParameters>
            <asp:ControlParameter ControlID="TB_Room_Number" Name="TB_Room_Number" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Capacity" Name="TB_Capacity" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_Type" Name="TB_Type" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Adult_Price" Name="TB_Adult_Price" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_Child_Price" Name="TB_Child_Price" PropertyName="Text" Type="String" />            
        </InsertParameters>
     </asp:SqlDataSource>
    

   <asp:SqlDataSource ID="SDS_Search_With_Param" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="Search_By_Param_Room" SelectCommandType="StoredProcedure" > 
        <SelectParameters>
            <asp:ControlParameter ControlID="DD_Search" Name="DD_Search" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TB_Search" Name="TB_Search" PropertyName="Text" Type="String" />
        </SelectParameters>
     </asp:SqlDataSource>

   
     <asp:Panel ID="Panel1" runat="server" class="panel panel-default"  BorderStyle="Solid">
          <div class="panel-heading col-sm-12">
                <asp:Label ID="Label2" runat="server" Style="float:left;margin-left:50px"  Text="ROOMS"  ForeColor="#FFFFCC"></asp:Label>   
        
                    <asp:Label ID="LB_Search" runat="server" Text="Search_By:" Style="margin-left:50%"></asp:Label>
                    <asp:DropDownList ID="DD_Search" Style="text-align: center" runat="server" Height="30px" Width="120px"  >
                         <asp:ListItem Value="Capacity" Text="Capacity"></asp:ListItem>
                         <asp:ListItem Value="Type" Text="Type"></asp:ListItem>
                         <asp:ListItem Value="Reserved" Text="Reserved"></asp:ListItem>                        
                    </asp:DropDownList> 
                    <asp:Label ID="LB_Search2" runat="server" Text="Value:" ></asp:Label>
                    <asp:TextBox ID="TB_Search" Style="text-align: center" runat="server" Height="30px" Width="120px"  ></asp:TextBox>
                    <asp:Button ID="BT_Search" runat="server" Text="Search" />
                    <asp:Button ID="BT_All" runat="server" Text="Show All" BackColor="#99CCFF" /> 
                    <asp:Button ID="BT_Navigi" Style="float:right" runat="server" Text="Go To" />
            </div>    
            <div class="panel-body">
                <asp:TextBox ID="TB_Room_Number" runat="server" Visible="true" ToolTip="ROOM NUMBER"></asp:TextBox>
                <asp:TextBox ID="TB_Capacity" runat="server" Visible="true" ToolTip="CAPACITY"></asp:TextBox>
                <asp:TextBox ID="TB_Type" runat="server" Visible="true" ToolTip="TYPE"></asp:TextBox>                   
                <asp:TextBox ID="TB_Adult_Price" runat="server" Visible="true" ToolTip="ADULT PRICE"></asp:TextBox>  
                <asp:TextBox ID="TB_Child_Price" runat="server" Visible="true" ToolTip="CHILD PRICE"></asp:TextBox>  
                        
                <asp:Button ID="BT_Insert" runat="server" Text="INSERT" class="btn btn-primary btn-sm" /> 
                
        <div class="row"></div>
             <div class="row">
        <asp:GridView ID="GV_ROOMS" runat="server" DataKeyNames="ID" DataSourceID="SdS_All_ROOMS_Grid" AllowPaging="true" PageSize="10" class="aspNetDisabled" AutoGenerateColumns="false" AutoGenerateDeleteButton="true">
            <Columns>
                   <asp:CommandField ShowEditButton="true" EditText="Edit" UpdateText="Ok" CancelText="Cancel"> <ControlStyle ForeColor="white" Font-Bold="false" CssClass="btn btn-danger btn-xs"   />
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
                 <asp:BoundField DataField="Room_Number" HeaderText="Room Number" Visible="true" />
                 <asp:BoundField DataField="Capacity" HeaderText="Capacity" Visible="true" />
                 <asp:BoundField DataField="Type" HeaderText="Type" Visible="true" />
                 <asp:BoundField DataField="Reserved" HeaderText="Reserved" Visible="true" />
                 <asp:BoundField DataField="Adult_Price" HeaderText="Audit Price" Visible="true" />
                 <asp:BoundField DataField="Child_Price" HeaderText="Child Price" Visible="true" />                              
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
                          <asp:Button ID="BT_Users" runat="server" Text="To Users" />
                          <asp:Button ID="BT_Clients" runat="server" Text="To Clients" /> 
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

