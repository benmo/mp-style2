<%@ page language="C#" masterpagefile="~/MPMasterPage.master" autoeventwireup="false" inherits="a_CampaignsAndOrders_GRPMonitor, App_Web_li0sctrd" theme="General" title="GRP Monitor" enableviewstate="false" %>
<%@ Register TagPrefix="atb" TagName="ActionToolBar" Src="~/AppCtlx/ActionToolBar.ascx" %>
<%@ Register TagPrefix="ucd" TagName="EasyDateInput" Src="~/AppCtlx/EasyDateInputGRP.ascx" %>
<%@ Register TagPrefix="ucc" TagName="Callback" Src="~/AppCtlx/EasyCallback.ascx" %>
<%@ Register TagPrefix="ucl" TagName="ListView" Src="~/AppCtlx/EasyListView.ascx" %>
<%@ Register TagPrefix="uco" Src="~/AppCtlx/EasyLoader.ascx" TagName="Loader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MediaProContent" Runat="Server">
    <asp:HiddenField id="guidPageID" runat="server" />

<!-- standard js files are in masterpage //-->
<script type="text/javascript" src="../js/CampaignsAndOrders/GRPMonitor.js?<%=Globals.MediaProVersion()%>"></script>
<script type="text/javascript" language="javascript">
    var currentOrderID = -1;
    var currentCampaignID = -1;
    var objRunDate;
    var defaultDate = new Date();
    var currentOrderID=-1;
    var currentChannelID;
    var currentChannelGroupID;
    var btnSubmit;
    var btnRebook;
    var objCallback_ClientID;
    var defaultDate = new Date();
    var lstGRPMonitor;    
    var objWaitwindowLoad;
    var btnBook;
    this.onload = function () {
        
        objCallbackID        = "<%= callback1.ClientID %>";
        lstGRPMonitor                      = document.getElementById("<%= lstGRPMonitor.ClientID %>");
        ddlDescription_SearchCondition      = document.getElementById("<%=ddlDescription_SearchCondition.ClientID %>");
        txtDescription                      = document.getElementById("<%=txtDescription.ClientID %>");
        ddlAdvertiser_SearchCondition       = document.getElementById("<%=ddlAdvertiser_SearchCondition.ClientID %>");
        txtAdvertiser                       = document.getElementById("<%=txtAdvertiser.ClientID %>");
        ddlProduct_SearchCondition          = document.getElementById("<%=ddlProduct_SearchCondition.ClientID %>");
        txtProduct                          = document.getElementById("<%=txtProduct.ClientID %>");
        ddlPlanner_SearchCondition          = document.getElementById("<%=ddlPlanner_SearchCondition.ClientID %>");
        txtPlanner                          = document.getElementById("<%=txtPlanner.ClientID %>");
        ddlAgency_SearchCondition           = document.getElementById("<%=ddlAgency_SearchCondition.ClientID %>");
        txtAgency                           = document.getElementById("<%=txtAgency.ClientID %>");
        ddlContactPerson_SearchCondition    = document.getElementById("<%=ddlContactPerson_SearchCondition.ClientID %>");
        txtContactPerson                    = document.getElementById("<%=txtContactPerson.ClientID %>");
        ddlAccountManager_SearchCondition   = document.getElementById("<%=ddlAccountManager_SearchCondition.ClientID %>");
        txtAccountManager                   = document.getElementById("<%=txtAccountManager.ClientID %>");
        ddlChannel_SearchCondition          = document.getElementById("<%=ddlChannel_SearchCondition.ClientID %>");
        txtChannel                          = document.getElementById("<%=txtChannel.ClientID %>");
        butSearch                           = document.getElementById("butSearch");
        btnRebook                           =  document.getElementById("btnRebook");
        btnBook = document.getElementById("<%=btnRebook.ClientID%>");
        txtOrderID                          = document.getElementById("<%=txtOrderID.ClientID %>");
        txtOrderID.value                    = <%= RequestOrder > 0 ? RequestOrder.ToString() : "''"%>;
        txtYear                             = document.getElementById("<%=txtYear.ClientID %>");
        ddlMediaTypes                       = document.getElementById("<%=ddlMediaTypes.ClientID %>"); 
        objRunDate                          = document.getElementById("<%=dateRunDate.ClientID %>");  
        defaultDate                         = objRunDate.GetDate();
        objWaitwindowLoad = document.getElementById("divWaitwindowLoad");            

    }

   

</script>
    <div id="divWaitwindowLoad" style="display:none;position:absolute;left:42%;top:250px;background-color:White;color:Black;padding:30px;border:1px solid black;font-weight:bold; z-index:100;">
        <table>
            <tr>
                <td><img src="../images/Loading.gif" alt="Loading"/></td>
                <td></td>
            </tr>
        </table>
    </div>
	


    <table>
        <tr>
            <td>
                <asp:Panel BackColor="whiteSmoke" GroupingText="Order" ID="pnlFilter"  width ="1000px" runat="server">
                                    <table>
            <tr>
                <td >
                    <asp:Label ID="labOrderID" runat="server" Text="Order ID"></asp:Label>
                </td>
                <td style="width: 100px">
                </td>
                <td style="width: 100px">
                    <input type="text" id="txtOrderID" runat="server" />                    
                </td>
                <td >&nbsp;</td>
                
                <td style="width: 100px">
                    <asp:Label ID="labAgency" runat="server" Text="Agency" ></asp:Label>
                </td>
                         <td style="width: 100px">
                    <select id="ddlAgency_SearchCondition" runat="server">
	                            <option value="-1" selected="selected">Select one</option>
	                            <option value="1">Equals</option>
	                            <option value="2">Starts with</option>
	                            <option value="3">Ends with</option>
	                            <option value="4">Contains</option>
                    </select>
                </td>
                <td style="width: 100px">
                    <input type="text" id="txtAgency"  runat="server" onfocus="ddlAgency_SearchCondition.value='4'"  />
                </td>
            
            </tr>
            <tr>
                <td >
                    <asp:Label ID="labDescription" runat="server" Text="Description" ></asp:Label>
                </td>
                <td style="width: 100px">
                    <select id="ddlDescription_SearchCondition" runat="server">
	                            <option value="-1" selected="selected">Select one</option>
	                            <option value="1">Equals</option>
	                            <option value="2">Starts with</option>
	                            <option value="3">Ends with</option>
	                            <option value="4">Contains</option>
                    </select>
                </td>
                <td style="width: 100px">
                    <input type="text" runat="server" id="txtDescription" onfocus="ddlDescription_SearchCondition.value='4'" />
                </td>
                                 
            <td >&nbsp;</td>
                <td style="width: 100px">
                    <asp:Label ID="labContactPerson" runat="server" Text="Contact Person"></asp:Label>
                </td>
                <td style="width: 100px">
                     <select id="ddlContactPerson_SearchCondition" runat="server">
	                            <option value="-1" selected="selected">Select one</option>
	                            <option value="1">Equals</option>
	                            <option value="2">Starts with</option>
	                            <option value="3">Ends with</option>
	                            <option value="4">Contains</option>
                    </select>
                </td>
                <td style="width: 100px">
                    <input type="text" id="txtContactPerson"  runat="server" onfocus="ddlContactPerson_SearchCondition.value='4'"/>
                </td>
            
            </tr>
            <tr>
                <td >
                    <asp:Label ID="labAdvertiser" runat="server" Text="Advertiser"></asp:Label>
                </td>
                <td style="width: 100px">
                    <select id="ddlAdvertiser_SearchCondition" runat="server">
	                            <option value="-1" selected="selected">Select one</option>
	                            <option value="1">Equals</option>
	                            <option value="2">Starts with</option>
	                            <option value="3">Ends with</option>
	                            <option value="4">Contains</option>
                    </select>
                </td>
                <td style="width: 100px">
                    <input type="text" id="txtAdvertiser"  runat="server" onfocus="ddlAdvertiser_SearchCondition.value='4'" />
                </td>
                 <td >&nbsp;</td>
                <td style="width: 100px">
                    <asp:Label ID="labAccountManager" runat="server" Text="Account Manager"></asp:Label>
                </td>
                <td style="width: 100px">
                    <select id="ddlAccountManager_SearchCondition" runat="server">
	                            <option value="-1" selected="selected">Select one</option>
	                            <option value="1">Equals</option>
	                            <option value="2">Starts with</option>
	                            <option value="3">Ends with</option>
	                            <option value="4">Contains</option>
                    </select>
                </td>
                <td style="width: 100px">
                    <input type="text" id="txtAccountManager"  runat="server" onfocus="ddlAccountManager_SearchCondition.value='4'" />
                </td>
            
            </tr>
            <tr>
                <td >
                    <asp:Label ID="labProduct" runat="server" Text="Product"></asp:Label>
                </td>
                <td style="width: 100px">
                    <select id="ddlProduct_SearchCondition" runat="server">
	                            <option value="-1" selected="selected">Select one</option>
	                            <option value="1">Equals</option>
	                            <option value="2">Starts with</option>
	                            <option value="3">Ends with</option>
	                            <option value="4">Contains</option>
                    </select>
                </td>
                <td >
                    <input type="text" id="txtProduct"  runat="server"  onfocus="ddlProduct_SearchCondition.value='4'"/>
                </td>
                 <td >&nbsp;</td>
                <td style="width: 100px">
                    <asp:Label ID="labChannel" runat="server" Text="Channel"></asp:Label>
                </td>
                <td style="width: 100px">
                     <select id="ddlChannel_SearchCondition" runat="server">
	                            <option value="-1" selected="selected">Select one</option>
	                            <option value="1">Equals</option>
	                            <option value="2">Starts with</option>
	                            <option value="3">Ends with</option>
	                            <option value="4">Contains</option>
                    </select>
                </td>
                <td style="width: 100px">
                    <input type="text" id="txtChannel"  runat="server" onfocus="ddlChannel_SearchCondition.value='4'" />
                </td>
            
            </tr>
            <tr>
                <td >
                    <asp:Label ID="labPlanner" runat="server" Text="Planner"></asp:Label>
                </td>
                <td style="width: 100px">
                     <select id="ddlPlanner_SearchCondition" runat="server">
	                            <option value="-1" selected="selected">Select one</option>
	                            <option value="1">Equals</option>
	                            <option value="2">Starts with</option>
	                            <option value="3">Ends with</option>
	                            <option value="4">Contains</option>
                    </select>
                </td>
                <td style="width: 100px">
                    <input type="text" id="txtPlanner" runat="server" onfocus="ddlPlanner_SearchCondition.value='4'" />
                </td>
            <td >&nbsp;</td>
                <td style="width: 100px">
                    <asp:Label ID="lblMediaType" runat="server" Text="Media Type"></asp:Label>
                </td>
                <td style="width: 100px">
                     <asp:DropDownList id="ddlMediaTypes" runat="server">
                    </asp:DropDownList>
                </td>
                <td style="width: 100px">
                    
                </td>
            </tr>            
            <tr>
                <td style="width: 100px; height: 26px;">
                    <asp:Label ID="lblYear" runat="server" Text="Year"></asp:Label>
                </td>
                <td style="width: 100px; height: 26px;">
                    <input type="text" id="txtYear" maxlength="4" size="12" runat="server" />
                </td>
                                            <td >
                                            </td>
                                            <td >
                                            </td>
                                            <td >
                                                <asp:Label ID="lblRunDate" runat="server" Text ="RunDate"/>
                                            </td>
                                            <td >
                                                <ucd:EasyDateInput id="dateRunDate" runat="server" />
                                            </td>
                                            <td >
                                            </td>
                                            <td >
                                            </td>

                <td style="width: 100px; height: 26px;">
                    <input type="button" 
                        id="butSearch"
                        class="button" 
                        value="Search Orders"
                        onclick="doSearch();" />
            <br />
                                      
                    <input type="button" 
                        id="btnRebook"
                        class="button" 
                        value="Perform controlling"
                        onclick="Rebook();" runat="server"/>
                </td>
                                        </tr>

                                 
 
                                 

        </table> 
    </asp:Panel> 

            </td>
        </tr>
 
    </table>
    
        <!-- Listview control -->
          
	<ucl:listview id="lstGRPMonitor"  runat="Server" height="500px" width="99.5%" PageSize="300" enablepaging="true" onselect="onSelectList"  >
     
        <listviewcolumn datafield="RowType" width="0px"/>
        <listviewcolumn datafield="OrderID" width="0px"/>
        <listviewcolumn datafield="ChannelID" width="0px"/>
        <listviewcolumn datafield="ChannelGroupID" width="0px"/>
        <listviewcolumn datafield="Agency" text="Agency" Sortable="false"/>
		<listviewcolumn datafield="Advertiser" text="Advertiser" Sortable="false"/>
		<listviewcolumn datafield="Order" text="Order" Sortable="false"/>
		<listviewcolumn datafield="Targetgroup" text="Target group" Sortable="false"/>
        <listviewcolumn datafield="ChannelGroup" text="Channel Group" Sortable="false"/>
        <listviewcolumn datafield="Channel" text="Channel" Sortable="false"/>
        <listviewcolumn datafield="GRP GuaranteePerc" text="GRP Guarantee (%)" Format="#,##0.00" Sortable="false"/>
		<listviewcolumn datafield="GRP Forecast" text="GRP Forecast" Format="0.00" Sortable="false"/>
        <listviewcolumn datafield="MediaPrice" text="MediaPrice" Format="0.00" Sortable="false"/>
		<listviewcolumn datafield="GRP Score" text="GRP Score" Format="0.00" Sortable="false"/>
        <listviewcolumn datafield="GRP Guaranteed" text="GRP Guaranteed" Format="0.00" Sortable="false"/>
	    <listviewcolumn datafield="CPP planned" text="CPP planned" Format="0.00" Sortable="false"/>
		<listviewcolumn datafield="UnderDeliveredGRP" text="under delivered GRP (before)" Format="0.00" Sortable="false" />
        <listviewcolumn datafield="Compensation GRP" text="Compensation GRP" Format="0.00" Sortable="false"/>
	    <listviewcolumn datafield="UnderdeliveredGRPFinal" text="Under delivered GRP (final)" Format="0.00" Sortable="false" />
		<listviewcolumn datafield="CreditGross" text="Credit Volume gross" Format="0.00"  Sortable="false"/>
        <listviewcolumn datafield="CompensatedCount" text="Amount Compensated" Format="0" Sortable="false"/>

        <rowmarkers>
            <rowmarker id ="rmID4" runat="server" datafield="rowType"  color="#ce91ff" value='0'/>               
            <rowmarker id ="rmID5" runat="server" datafield="rowType"  color="#FFFFFF" value='1'/> 
        </rowmarkers>	
	   </ucl:listview> 


	    	<!--Loader control-->
    <uco:loader id="Loader" runat="server" type="Loader" />


       <!--Popup windows-->
    <dx:ASPxLoadingPanel ID="lpLoading" runat="server" ClientInstanceName="lpLoading" Modal="true" ViewStateMode="Disabled">
        <LoadingDivStyle Opacity="50" />
    </dx:ASPxLoadingPanel>
    <dx:ASPxPopupControl ID="pcWindows" ClientInstanceName="pcWindows" runat="server" 
        CloseAction="CloseButton" Modal="true" AllowDragging="true" ContentStyle-Paddings-Padding="0"
        PopupAnimationType="None" EnableViewState="False" PopupElementID="body" ViewStateMode="Disabled"
        PopupHorizontalOffset="50" PopupVerticalOffset="50" PopupAlignCorrection="Disabled">
        <ClientSideEvents Shown="function(s,e) { if(e.window.name!='winSearchPrograms') { DxPopupShown(s,e); s.RefreshWindowContentUrl(e.window); } }" />
        <Windows>
             <dx:PopupWindow Name="winEmptyActuals" HeaderText="Empty Actuals" ContentUrl="EmptyActuals.aspx" Width="810" Height="600" Modal="true" />
        </Windows>
    </dx:ASPxPopupControl>
   
    <ucc:Callback id="callback1" runat="server"/>
</asp:Content>

