<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Hotel_Reservation_Manager._Default" %>

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
    <asp:Button ID="Button1" runat="server" Text="Button" />

     <script>
    function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
</script>

      <script type="text/javascript">
        $.datepicker.regional['bg'] =
                               {
                                   dateFormat: 'dd/m/yy',
                                   timeFormat: 'HH:mm',
                                   changeMonth: true,
                                   changeYear: true,
                                   showAnim: 'slideDown',
                                   timeText: 'Време',
                                   hourText: 'Час',
                                   firstDay: 1,
                                   minuteText: 'Минути',
                                   currentText: 'Сега',
                                   closeText: 'Затвори',
                                   altFieldTimeOnly: true,
                                   prevText: '<Пред',
                                   nextText: 'След>',
                                   monthNames: ['Януари', 'Февруари', 'Март', 'Април', 'Май', 'Юни','Юли', 'Август', 'Септември', 'Октомври', 'Ноември', 'Декември'],
                                   monthNamesShort: ['Янр', 'Фев', 'Мар', 'Апр', 'Май', 'Юни', 'Юли', 'Авг', 'Сеп', 'Окт', 'Ное', 'Дек'],
                                   dayNames: ['неделя', 'понеделник', 'вторник', 'сряда', 'четвъртък', 'петък', 'събота'],
                                   dayNamesShort: ['нед', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
                                   dayNamesMin: ['Нд', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
                                   showSecond: false,
                                   showMillisec: false,
                                   showMicrosec: false,
                                   timezoneText: 'Часова Зона',
                                   sliderAccessArgs: { touchonly: false }
                                   //timezone: 'BG'
                               };
        $.datepicker.setDefaults($.datepicker.regional['bg']);
        $(function (SelectDTM) {
                                <%--$('#<%= DirectCast(Me.FindControl("TB_Last_Month_Paid2"), TextBox).ClientID %>').datetimepicker($.datepicker.regional['bg']);--%>
                               <%--  $('#<%= DirectCast(Me.Panel_Expirian_Sole_2.FindControl("TB_Last_Month_Paid2"), TextBox).ClientID %>').datepicker($.datepicker.regional['bg']);
                                 $('#<%= DirectCast(Me.Panel_Ciela_4.FindControl("TB_Company_Reg_Date4"), TextBox).ClientID %>').datepicker($.datepicker.regional['bg']);--%>
                                
                             });
    </script>

     <asp:SqlDataSource ID="Transact_Bad_Subscriber_Comp" runat="server" ConnectionString="<%$ ConnectionStrings:Hotel_Manager_Connection %>" ProviderName="<%$ ConnectionStrings:Hotel_Manager_Connection.ProviderName %>"
        SelectCommand="SELECT &quot;EIK&quot;,&quot;ENTITY_NAME&quot;,&quot;NOTIFICATION&quot;,&quot;ADDED_BY&quot;,&quot;OBJECT&quot;,&quot;ADDED_DTM&quot; FROM &quot;BAD_SUBSCRIBERS&quot; where &quot;EIK&quot; = :BULSTAT and &quot;OBJECT&quot;='Company'">        
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_Search" Name="BULSTAT" PropertyName="Text" Type="String" />
        </SelectParameters>        
     </asp:SqlDataSource>
  

     <asp:Panel ID="Panel_Company1" runat="server" class="panel panel-default" BorderStyle="Solid" DefaultButton="BT_Search1">
            <div class="panel-heading col-sm-12">
                <asp:Label ID="LB_CompDetails1" runat="server" class="col-sm-6" Text="Company Details"  ForeColor="#FFFFCC"></asp:Label>
                <asp:TextBox ID="TB_Search" runat="server" Height="30px" class="col-sm-4" Enabled="True" onkeypress="return isNumber(event)"></asp:TextBox>
                <asp:Button ID="BT_Search1" runat="server" class="btn btn-primary btn-sm col-sm-2" Text="Search" Width="70px" Enabled="True" />
            </div>

            <div class="panel-body">
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Company1" runat="server" Text="Company:"></asp:Label>
                    <asp:TextBox ID="TB_CompanyName1" Style="text-align: center" runat="server" Height="30px" Width="429px" Enabled="True"></asp:TextBox>
                    <asp:Label ID="LB_VID1" runat="server" Text="Тype:"></asp:Label>                
                </div>
                
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Bulstat1" runat="server" Text="Bulstat:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TB_Bulstat1" runat="server" CssClass="auto-style3" Height="30px" Width="138px" Enabled="True"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_MOL_Phone1" runat="server" Text="MOL Phone:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_MOL_Phone1" Style="text-align: center" runat="server" Height="30px" Width="120px" Enabled="True"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_VAT_NUM1" runat="server" Text="VAT Num:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_VAT_NUM1" Style="text-align: center" runat="server" Height="30px" CssClass="auto-style3" Width="133px" Enabled="True"></asp:TextBox>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_MOL_Names1" runat="server" Text="MOL Names:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_MOL_Names1" Style="text-align: center" runat="server" Height="30px" Enabled="True"></asp:TextBox>
                    &nbsp;&nbsp;<asp:Label ID="LB_MOL_PID1" runat="server" Text="Mol PID:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;<asp:TextBox ID="TB_MOL_PID1" Style="text-align: center" runat="server" Height="30px" CssClass="auto-style3" Width="160px" Enabled="True"></asp:TextBox>                    
                </div>
                <div class="row col-sm-12">                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp<asp:Label ID="LM_MOL_Email1" runat="server" Text="MOL E-mail:" ></asp:Label>
                    <asp:TextBox ID="TB_MOL_MAIL1" runat="server" Style="text-align: center" Height="30px" Width="210px" Enabled="True" ></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_Court_reg_City1" runat="server" Text="Court reg. City:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Court_reg_City1" runat="server" Height="30px" Width="169px" Enabled="True"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_Segment1" runat="server" Text="Segment:"></asp:Label>                 
                </div>
             <%--   <div class="row col-sm-12">--%>
                    <asp:Label ID="LB_court_Reg_num1" runat="server" Text="Court reg. Number:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Court_reg_num1" Style="text-align: center" runat="server" Height="30px" Width="89px" Enabled="True"></asp:TextBox>
              <%--  </div>--%>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Important" runat="server" Text="Important:" ForeColor="Red" Font-Bold="True"></asp:Label>
                    <asp:TextBox ID="TB_Important1" runat="server" Height="30px" Width="566px" Enabled="True" BorderColor="#CC0000" BorderStyle="Dashed"></asp:TextBox>
                </div>
            </div>
            <div class="panel-footer col-sm-12 collapse" id="Panel_Comp_footer">
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Ciela_Company1" runat="server" Text="Company Name:"></asp:Label>
                    <asp:TextBox ID="TB_Ciela_Company1" runat="server" Height="25px" Width="520px" Enabled="True"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>
</asp:Content>
