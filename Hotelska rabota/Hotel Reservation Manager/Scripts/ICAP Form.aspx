<%@ Page Title="ICAP" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ICAP Form.aspx.vb" Inherits="CreditCheck.ICAP_Form" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>



<%--    <asp:SqlDataSource ID="SQL_EmployeesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ICAPConnectionString %>" SelectCommand="  SELECT NEW.UIC, NEW.TotalNumber , NEW.ReferenceDate 
FROM 
(     
	-- new
	SELECT *
	FROM ICAP.dbo.Employees
	WHERE CAST(right(ReferenceDate,4) +  substring(ReferenceDate,4,2) + LEFT(ReferenceDate,2) AS DATE) 
			=  (SELECT MAX(CAST(right(t.ReferenceDate,4) +  substring(t.ReferenceDate,4,2) + LEFT(t.ReferenceDate,2) AS DATE)) 
				FROM ICAP.dbo.Employees t 
						    WHERE (t.[UIC] = @UIC)
						   )
	
)NEW WHERE (NEW.[UIC] = @UIC)
">
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_Search" Name="UIC" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>--%>



    <asp:SqlDataSource ID="TransactDecision" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionTransact %>" ProviderName="<%$ ConnectionStrings:ConnectionTransact.ProviderName %>" SelectCommand="SELECT &quot;BULSTAT&quot;, &quot;VAT&quot;, &quot;CCDDATE&quot;, &quot;CCDCODE&quot;, &quot;USERNAME&quot;, &quot;CDECISID&quot;, &quot;SIMS&quot;, &quot;HANDSETS&quot;, &quot;ROAMHANDSETS&quot;, &quot;DEPOSIT&quot;, &quot;CCDREASON&quot;, &quot;DNAME&quot;, &quot;DCODE&quot;, &quot;S_REF_NUM&quot;, &quot;ORA_SEQ&quot;, &quot;AM&quot;, &quot;BUDGET&quot;, &quot;HELD&quot;, &quot;APPLICATION&quot;, &quot;ORDER_NUMBER&quot;, &quot;CALC_NUMBER&quot;, &quot;DOI_CNT&quot;, &quot;DOI_MNY&quot;, &quot;DOI_LIMIT&quot; FROM &quot;CREDIT_CDESISION&quot; WHERE (&quot;BULSTAT&quot; = :BULSTAT)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_Search" Name="BULSTAT" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="Transact_Customers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionTransact %>" ProviderName="<%$ ConnectionStrings:ConnectionTransact.ProviderName %>" SelectCommand="SELECT * FROM &quot;CREDIT_CUSTOMERS&quot; WHERE (&quot;BULSTAT&quot; = :BULSTAT)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_Search" Name="BULSTAT" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>



    <asp:SqlDataSource ID="ICAP_Company" runat="server" ConnectionString="<%$ ConnectionStrings:ICAPConnectionString %>" SelectCommand="SELECT * FROM [Company] WHERE ([UIC] = @UIC)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_Search" Name="UIC" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>



    <div class="col-sm-7">
        <asp:Panel ID="Panel_Company1" runat="server" class="panel panel-default" BorderStyle="Solid">
            <div class="panel-heading col-sm-12">             
                        <asp:Label ID="LB_CompDetails1" runat="server" class="col-sm-6" Text="* 1. Company Details"></asp:Label>                     
                        <asp:TextBox ID="TB_Search" runat="server"  Height= 30px class="col-sm-4" ></asp:TextBox>
                        <asp:Button ID="BT_Search1" runat="server" class=" btn-primary btn-sm col-sm-2" Text="Search" Width="60" />              
            </div>

            <div class="panel-body">
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Company1" runat="server"  Text="Company:"></asp:Label>
                    <asp:TextBox ID="TB_CompanyName1" runat="server" Height="25px" Width="429px" ></asp:TextBox>
                    <asp:Label ID="LB_VID1" runat="server" Text="Тype:"></asp:Label>
                    <asp:DropDownList ID="DropD_CompanyType1" runat="server"  Height="22px">
                        <asp:ListItem>ЕТ</asp:ListItem>
                        <asp:ListItem>СД</asp:ListItem>
                        <asp:ListItem>ЕООД</asp:ListItem>
                        <asp:ListItem>ООД</asp:ListItem>
                        <asp:ListItem>ЕАД</asp:ListItem>
                        <asp:ListItem>АД</asp:ListItem>
                        <asp:ListItem>Държавен</asp:ListItem>
                        <asp:ListItem>Друг</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Bulstat1" runat="server"  Text="Bulstat:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TB_Bulstat1" runat="server" CssClass="auto-style3" Height="25px" Width="138px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_MOL_PID1" runat="server" Text="Mol PID:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_MOL_PID1" runat="server"  Height="25px" CssClass="auto-style3" Width="140px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_VAT_NUM1" runat="server" Text="VAT Num:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_VAT_NUM1" runat="server"  Height="25px" CssClass="auto-style3" Width="139px"></asp:TextBox>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_MOL_Names1" runat="server" Text="MOL Names:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_MOL_Names1" runat="server"  Height="25px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_MOL_Phone1" runat="server"  Text="MOL Phone:"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TB_MOL_Phone1" runat="server"  Height="25px" Width="139px"></asp:TextBox>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_MOL_FAX1" runat="server" Text="MOL FAX:"></asp:Label>
                    &nbsp<asp:TextBox ID="TB_MOL_FAX1" runat="server" Height="25px" Width="109px"></asp:TextBox>
                    &nbsp;<span class="glyphicon glyphicon-envelope"></span>&nbsp<asp:Label ID="LM_MOL_Email1" runat="server" Text="MOL E-mail:"></asp:Label>
                    <asp:TextBox ID="TB_MOL_MAIL1" runat="server" Height="25px" Width="210px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_Segment1" runat="server" Text="Segment:"></asp:Label>
                    <asp:DropDownList ID="DropD_Segment1" runat="server" slyle="alighn:left">
                        <asp:ListItem>AM</asp:ListItem>
                        <asp:ListItem>Corp</asp:ListItem>
                        <asp:ListItem>NAM</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_court_Reg_num1" runat="server" Text="Court reg. Number:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Court_reg_num1" runat="server" Height="25px" Width="89px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_Court_reg_City1" runat="server" Text="Court reg. City:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Court_reg_City1" runat="server" Height="25px" Width="169px"></asp:TextBox>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Industry1" runat="server" Text="Industry:"></asp:Label>
                    <asp:TextBox ID="TB_Industry1" runat="server" Height="25px" Width="574px"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>
    </div>


    <div class="col-sm-5">
        <div class="row">
         <asp:Panel ID="Panel_Expirian_Sole_2" runat="server" class="panel panel-default" BorderStyle="Solid">
            <div class="panel-heading">
                <asp:Label ID="LB_Comp_Det2" runat="server" Text="* 2. Expirian Sole Trader"></asp:Label>
            </div>
            <div class="panel-body">
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Last_Month_Paid2" runat="server" Text="Last Month Paid:"></asp:Label>
                    <asp:TextBox ID="TB_Last_Month_Paid2" runat="server" Height="25px" Width="90px"></asp:TextBox>
                    <asp:Label ID="LB_Num_Mont_Paid2" runat="server" Text="Num. of Months Paid:"></asp:Label>
                    <asp:TextBox ID="TB_Num_Mont_Paid2" runat="server" Height="25px" Width="88px"></asp:TextBox>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_LastYear_Turnover2" runat="server" Text="Last Year Turnover:"></asp:Label>
                    <asp:TextBox ID="TB_LastYear_Turnover2" runat="server" Height="25px" Width="84px"></asp:TextBox>
                    <asp:Label ID="LB_Num_Of_Empl2" runat="server" Text="Num. of Employees:"></asp:Label>
                    <asp:TextBox ID="TB_Num_Of_empl2" runat="server" Height="25px" Width="84px"></asp:TextBox>
                </div>
            </div>        
        </asp:Panel>
       </div>
       <div class="row">                
         <asp:Panel ID="Panel1" runat="server" class="panel panel-default" BorderStyle="Solid">
            <div class="panel-heading">
                <asp:Label ID="LB_Prevoius_Mob_History3" runat="server" Text="* 3. Previous Mobile Hystory"></asp:Label>
            </div>
            <div class="panel-body">
                <div class="row col-sm-12">
                    <asp:Label ID="LB_PreviousComp3" runat="server" Text="Previous Mobile Company:"></asp:Label>
                    <asp:DropDownList ID="DropDPreviusMobile3" runat="server" >
                        <asp:ListItem>M-tel</asp:ListItem>
                        <asp:ListItem>Telenor</asp:ListItem>
                        <asp:ListItem>MAX</asp:ListItem>
                        <asp:ListItem>Not known</asp:ListItem>                        
                    </asp:DropDownList>
                     <asp:Label ID="LB_PreviousSims3" runat="server" Text="Previous SIMs:"></asp:Label>
                    <asp:TextBox ID="TB_PreviousSims3" runat="server" Height="25px" Width="69px"></asp:TextBox>
                </div>
                <div class="row col-sm-12">
                 <asp:Label ID="LB_Previous_ACG_Mon_Usage3" runat="server" Text="Prev. AVG Monthly Usage:"></asp:Label>
                 <asp:TextBox ID="TB_Previous_ACG_Mon_Usage3" runat="server" Height="25px" Width="76px"></asp:TextBox>
                  <asp:Label ID="LB_PreviousHandset3" runat="server" Text="Previous Handset:"></asp:Label>
                 <asp:TextBox ID="TBPreviousHandset3" runat="server" Height="25px" Width="65px"></asp:TextBox>
                </div>
            </div>
        </asp:Panel>
    </div>       
   </div> 
      <div class="col-sm-7">
        <asp:Panel ID="Panel_Ciela_4" runat="server" class="panel panel-default" BorderStyle="Solid">
            <div class="panel-heading">
                <asp:Label ID="LB_Ciela4" runat="server" Text="* 4. Ciela"></asp:Label>
            </div>
            <div class="panel-body">
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Tax_Debt4" runat="server" Text="Tax Debt:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Tax_Debt4" runat="server" Height="25px" Width="119px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_CompanyAge4" runat="server" Text="Company Age:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_CompanyAge4" runat="server" Height="25px" Width="88px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_Company_Reg_Date4" runat="server" Text="Company Reg. Date:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Company_Reg_Date4" runat="server" Height="25px" Width="110px"></asp:TextBox>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Num_of_Closed4" runat="server" Text="Num. Closed Comp:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Num_of_closed4" runat="server" Height="25px" Width="67px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_Share_Capital4" runat="server" Text="Share Capital:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_ShareCapital4" runat="server" Height="25px" Width="76px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LB_ParentComp4" runat="server" Text="Parent Comp Type:"></asp:Label>
                    <asp:DropDownList ID="DropD_ParentComp4" runat="server" >
                        <asp:ListItem>N/a</asp:ListItem>
                        <asp:ListItem>ЕООД</asp:ListItem>
                        <asp:ListItem>ООД</asp:ListItem>
                        <asp:ListItem>ЕАД</asp:ListItem>
                        <asp:ListItem>АД</asp:ListItem>
                        <asp:ListItem>Международна</asp:ListItem>
                        <asp:ListItem>Държавна</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="row col-sm-12">
                    <asp:Label ID="LB_Comment4" runat="server" Text="Comment:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Comment4" runat="server" Height="25px" Width="569px"></asp:TextBox>
                </div>
                  <div class="row col-sm-12">
                      <asp:textbox id="Message_Box_Comment4" form="Feedback_Form" CssClass="Contact_Input" maxlength="1200" lines="10" wrap="true" TextMode="MultiLine" runat="server" Width="643px"/>
                  </div>
            </div>
        </asp:Panel>
      </div>
   <div class="col-sm-5">
       <div class="row">
        <asp:Panel ID="PanelCreditDecision5" runat="server" class="panel panel-default" BorderStyle="Solid">
            <div class="panel-heading">
                <asp:Label ID="LB_CreditDecision5" runat="server" Text="* 5. Credit Decision"></asp:Label>
            </div>
            <div class="panel-body">
                <div class="row col-sm-12">
                     <asp:Label ID="LB_Num_of_linked5" runat="server" Text="Num. of Linked Comp:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TBNum_of_linked5" runat="server" Height="25px" Width="96px"></asp:TextBox>
                    <asp:Label ID="LB_Max_Credit5" runat="server" Text="Max Credit Limit:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Max_Credit5" runat="server" Height="25px" Width="96px"></asp:TextBox>
                </div>                        
                <div class="row col-sm-12">
                     <asp:Label ID="LB_Cur_Credit_Limit5" runat="server" Text="Current Credit Limit:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Cur_Credit_Limit5" runat="server" Height="25px" Width="108px"></asp:TextBox>
                     <asp:Label ID="LB_Roaming5" runat="server" Text="Roaming:"></asp:Label>
                     &nbsp;<asp:TextBox ID="TB_Roaming5" runat="server" Height="25px" Width="140px"></asp:TextBox>
                </div>
                <div class="row col-sm-12">
                     <asp:Label ID="LB_Behavioural_Score5" runat="server" Text="Behavioural Score:"></asp:Label>
                    &nbsp;<asp:TextBox ID="TB_Behavioural_Score5" runat="server" Height="25px" Width="70px"></asp:TextBox>
                     <asp:Label ID="LB_Availabale_Credit_Limit5" runat="server" Text="Availabale Credit Limit:"></asp:Label>
                     &nbsp;<asp:TextBox ID="TB_Availabale_Credit_Limit5" runat="server" Height="25px" Width="101px"></asp:TextBox>
                </div>
             </div>
        </asp:Panel>
       </div>
       <div class="row">
           <div style="float:left"> 
           <asp:Button ID="BT_Check_TAX5" runat="server" class="btn-warning btn-sm col-sm-12" Text="Check in TAX Department" />
           </div>           
           <div style="float:right">
           <asp:Button ID="BT_New_decision5" runat="server" class="btn-success btn-sm col-sm-12" Text="New Decision"/>
           </div>
       </div>
    </div>
    <div class="col-sm-7">
        <asp:Panel ID="Panel_Request" runat="server" class="panel panel-default" BorderStyle="Solid">
            <div class="panel-heading">
                <asp:Label ID="LB_RequestForm6" runat="server" Text="* 6. RequestForm"></asp:Label>
            </div>
        </asp:Panel>
    </div>


       
      <div class="col-sm-7">
          <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" DataSourceID="TransactDecision" BackColor="#DEBA84" BorderColor="#DEBA88" BorderStyle="Dashed" BorderWidth="1px" CellPadding="3" CellBorder="2" CellSpacing="2" HorizontalAlign="Center" RowStyle-BorderStyle="Dashed" PagerStyle-BorderStyle="Dashed" HeaderStyle-BorderStyle="Dashed" FooterStyle-BorderStyle="Dashed" EditRowStyle-BorderStyle="Dashed">
              <AlternatingRowStyle BorderWidth="1px" />
              <Columns>
                  <asp:BoundField DataField="BULSTAT" HeaderText="BULSTAT" SortExpression="BULSTAT" />
                  <asp:BoundField DataField="VAT" HeaderText="VAT" SortExpression="VAT" />
                  <asp:BoundField DataField="CCDDATE" HeaderText="CCDDATE" SortExpression="CCDDATE" />
                  <asp:BoundField DataField="CCDCODE" HeaderText="CCDCODE" SortExpression="CCDCODE" />
                  <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                  <asp:BoundField DataField="CDECISID" HeaderText="CDECISID" SortExpression="CDECISID" />
                  <asp:BoundField DataField="SIMS" HeaderText="SIMS" SortExpression="SIMS" />
                  <asp:BoundField DataField="HANDSETS" HeaderText="HANDSETS" SortExpression="HANDSETS" />
                  <asp:BoundField DataField="ROAMHANDSETS" HeaderText="ROAMHANDSETS" SortExpression="ROAMHANDSETS" />
                  <asp:BoundField DataField="DEPOSIT" HeaderText="DEPOSIT" SortExpression="DEPOSIT" />
                  <asp:BoundField DataField="CCDREASON" HeaderText="CCDREASON" SortExpression="CCDREASON" />
                  <asp:BoundField DataField="DNAME" HeaderText="DNAME" SortExpression="DNAME" />
                  <asp:BoundField DataField="DCODE" HeaderText="DCODE" SortExpression="DCODE" />
                  <asp:BoundField DataField="S_REF_NUM" HeaderText="S_REF_NUM" SortExpression="S_REF_NUM" />
                  <asp:BoundField DataField="ORA_SEQ" HeaderText="ORA_SEQ" SortExpression="ORA_SEQ" />
                  <asp:BoundField DataField="AM" HeaderText="AM" SortExpression="AM" />
                  <asp:BoundField DataField="BUDGET" HeaderText="BUDGET" SortExpression="BUDGET" />
                  <asp:BoundField DataField="HELD" HeaderText="HELD" SortExpression="HELD" />
                  <asp:BoundField DataField="APPLICATION" HeaderText="APPLICATION" SortExpression="APPLICATION" />
                  <asp:BoundField DataField="ORDER_NUMBER" HeaderText="ORDER_NUMBER" SortExpression="ORDER_NUMBER" />
                  <asp:BoundField DataField="CALC_NUMBER" HeaderText="CALC_NUMBER" SortExpression="CALC_NUMBER" />
                  <asp:BoundField DataField="DOI_CNT" HeaderText="DOI_CNT" SortExpression="DOI_CNT" />
                  <asp:BoundField DataField="DOI_MNY" HeaderText="DOI_MNY" SortExpression="DOI_MNY" />
                  <asp:BoundField DataField="DOI_LIMIT" HeaderText="DOI_LIMIT" SortExpression="DOI_LIMIT" />
              </Columns>

<EditRowStyle BorderStyle="Dashed"></EditRowStyle>

              <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
              <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" BorderWidth="2px" />
              <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
              <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
              <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#FFF1D4" />
              <SortedAscendingHeaderStyle BackColor="#B95C30" />
              <SortedDescendingCellStyle BackColor="#F1E5CE" />
              <SortedDescendingHeaderStyle BackColor="#93451F" />
          </asp:GridView>
      </div>
    <div class="col-6">

    </div>

</asp:Content>





<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style3 {
            left: 0px;
            top: 0px;
        }
        </style>
    </asp:Content>







