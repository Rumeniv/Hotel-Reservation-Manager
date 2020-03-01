<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Clients.aspx.vb" Inherits="Hotel_Reservation_Manager.Clients"  MasterPageFile="~/Site.Master"  %>

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
  



     <asp:SqlDataSource ID="SdS_All_CLIENTS_Grid" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="select * from [dbo].H_CLIENTS" SelectCommandType="Text"
        InsertCommand="Insert into [dbo].H_CLIENTS (
       
	[First_Name],
	[Family_Name],
	[Telephone_Number],	
	[Email_Address],
	[Adult]) values (
            @TB_First_Name,
            @TB_Family_Name,
            @TB_Telephone_Number,
            @TB_Email_Address,
            @TB_Adult         
            )"


        Deletecommand="Delete From [dbo].H_CLIENTS where ID = @ID"
        UpdateCommand="Update [dbo].H_CLIENTS set [First_Name] = @First_Name , [Family_Name] = @Family_Name,[Telephone_Number] = @Telephone_Number,[Email_Address] = @Email_Address,[Adult] = @Adult where ID=@ID ">   
    
       
        <InsertParameters>
            <asp:ControlParameter ControlID="TB_First_Name" Name="TB_First_Name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Family_Name" Name="TB_Family_Name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_Telephone_Number" Name="TB_Telephone_Number" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Email_Address" Name="TB_Email_Address" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_Adult" Name="TB_Adult" PropertyName="Text" Type="String" />            
        </InsertParameters>
     </asp:SqlDataSource>
    

   <asp:SqlDataSource ID="SDS_Search_With_Param" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="Search_By_Param_CLIENT" SelectCommandType="StoredProcedure" > 
        <SelectParameters>
            <asp:ControlParameter ControlID="DD_Search" Name="DD_Search" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TB_Search" Name="TB_Search" PropertyName="Text" Type="String" />
        </SelectParameters>
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
                <asp:TextBox ID="TB_First_Name" runat="server" Visible="true" ToolTip="First_Name"></asp:TextBox>
                <asp:TextBox ID="TB_Family_Name" runat="server" Visible="true" ToolTip="Family_Name"></asp:TextBox>
                <asp:TextBox ID="TB_Telephone_Number" runat="server" Visible="true" ToolTip="Telephone_Number"></asp:TextBox>                   
                <asp:TextBox ID="TB_Email_Address" runat="server" Visible="true" ToolTip="Email_Address"></asp:TextBox>  
                <asp:TextBox ID="TB_Adult" runat="server" Visible="true" ToolTip="Adult"></asp:TextBox>  
                        
                <asp:Button ID="BT_Insert" runat="server" Text="INSERT" class="btn btn-primary btn-sm" /> 
                
        <div class="row"></div>
             <div class="row">
        <asp:GridView ID="GV_CLIETNS" runat="server" DataKeyNames="ID" DataSourceID="SdS_All_CLIENTS_Grid" AllowPaging="true" PageSize="10" class="aspNetDisabled" AutoGenerateColumns="false" AutoGenerateDeleteButton="true">
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
                 <asp:BoundField DataField="First_Name" HeaderText="First_Name" Visible="true" />
                 <asp:BoundField DataField="Family_Name" HeaderText="Family_Name" Visible="true" />
                 <asp:BoundField DataField="Telephone_Number" HeaderText="Telephone_Number" Visible="true" />
                 <asp:BoundField DataField="Email_Address" HeaderText="Email_Address" Visible="true" />
                 <asp:BoundField DataField="Adult" HeaderText="Adult" Visible="true" />                                             
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

