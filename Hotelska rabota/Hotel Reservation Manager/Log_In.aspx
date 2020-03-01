<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Log_In.aspx.vb" Inherits="Hotel_Reservation_Manager.Log_In"  MasterPageFile="~/Site.Master"%>

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
    
      <asp:SqlDataSource ID="SDS_Log_In" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="Select Active_Flag, User_Role from [dbo].[H_UL] where UserName = @TB_User and Password=@TB_Password" SelectCommandType="Text">        
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_User" Name="TB_User" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Password" Name="TB_Password" PropertyName="Text" Type="String" />
        </SelectParameters>        
     </asp:SqlDataSource>   
    
    
   <%-- <asp:Panel ID="Panel_Login" runat="server" class="panel panel-default col-sm-5"  BorderStyle="Solid" style="margin-left:30%" >
            <div class="panel-heading col-sm-12">
                <asp:Label ID="LB_Title" runat="server" Text="Log In Form"  ForeColor="#FFFFCC"></asp:Label>        
            </div>

            <div class="panel-body">
                <div class="row col-sm-12">
                    <asp:Label ID="LB2" runat="server" Text="User:" Style="margin-left:40%"></asp:Label>
                    <asp:TextBox ID="TB_User" Style="text-align: center; margin-left:40px" runat="server" Height="30px" Width="120px"  ></asp:TextBox>      
                </div>
                
                <div class="row col-sm-12">        
                   <asp:Label ID="Label1" runat="server" Text="Password:" Style="margin-left:40%"></asp:Label>
                   <asp:TextBox ID="TB_Password" Style="text-align: center;margin-left:15px" runat="server" Height="30px" Width="120px" ></asp:TextBox>          
                </div>
               <div class="center">
                   <asp:Button ID="BT_Login" runat="server" Text="Log in" class="btn btn-primary btn-xs"/>
               </div>

        
                </div>
    </asp:Panel>--%>
    <div class="row justify-content-center">
       <asp:Panel ID="Panel1" runat="server" class="panel panel-default" Width="100%" BorderStyle="Solid" >
           <div class="panel-heading col-sm-12">
                <asp:Label ID="Label2" runat="server" Text="Log In Form"  ForeColor="#FFFFCC"></asp:Label>              
          </div>

           <div class="panel-body">
                  <div class="row col-sm-12">
                    <asp:Label ID="Label3" runat="server" Text="User:" Style="margin-left:40%"></asp:Label>
                    <asp:TextBox ID="TB_User" Style="text-align: center; margin-left:45px" runat="server" Height="30px" Width="120px"  ></asp:TextBox>      
               </div>
                
                <div class="row col-sm-12">       
                   <asp:Label ID="Label4" runat="server" Text="Password:" Style="margin-left:40%"></asp:Label>
                   <asp:TextBox ID="TB_Password" Style="text-align: center;margin-left:15px" runat="server" Height="30px" Width="120px" Type="password" ></asp:TextBox>          
                </div>
             <div  Style="float:right; margin-right:50%">
                   <asp:Button ID="BT_Login" runat="server" Text="Log in" class="btn btn-primary btn-xs"/>
               </div>

        
                </div>
   </asp:Panel>
   </div>
    <style>
         .center {
 
  margin: auto;
  position: relative;
  text-align: center;
  top: 50%;
  /*width: 20%;*/  
}

    </style>

    
    </asp:Content>