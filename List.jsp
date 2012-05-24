<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html:html>

    <head>
        <title>Handheld Device</title>
        <meta name="generator" content="">
        <meta name="description" content="">
        <meta name="keywords" content="">
      
    </head>
    <body bgcolor="#FFFFFF" text="#000000" link="#0000FF" vlink="#800080" alink="#FF0000" onload="initform();">
        <table border="0" width="320" align="center">
            <tr>
                <td align="left"><img src="images/logo.GIF"/></td>
                <td align="right"><a href="logoff.jsp"><img border="0" src="images/logout.png" alt="Single Signout"></a></td>
            </tr>
        </table>
        <br><br>
        <html:errors/>
    
            
        <table border="0" width="320" align="left" BGCOLOR="#cccccc">
            <tr height="5">
                <td width="51" align="RIGHT"><b>BU:</td>
                <td width="77" align="left"><%= session.getAttribute("bu") %></td>
                <td width="72" align="RIGHT"><b>Item ID:</td>
                <td width="102" align="left"><%= session.getAttribute("item_id") %></td>
            </tr>
            <tr height="5">
                <td align="left"><a href="/HHD/Search.jsp"><img height="20" width=25  border="0" src="images/search_icon.gif"></a></td>
                <td colspan=3 align="CENTER"><%= session.getAttribute("item_desc") %></td>			
            </tr>
        </table>
        <br><br><br><br>
         
        <table border="0"  width="320" align="left">
            <html:form action="/Select">
         
                <% 
                    int listCount=Integer.parseInt(request.getAttribute("listCount").toString());
                    if (listCount>3){%>
                <tr>
                    <td>
                        <table border="0" valign="top" width="320" align="center">
                            <div id='contPresentTop'> <tr height="20" valign="bottom" >
                                <td width="40%" align="center" colspan=7>
                                    <html:submit property="submit" styleId="btnsubmit3"><bean:message key="button.condeassociate"/></html:submit>&nbsp;
                                    <html:submit property="submit" styleId="btnsubmit1"><bean:message key="button.consplit"/></html:submit>&nbsp;
                                    <html:submit property="submit" styleId="btnsubmit2"><bean:message key="button.contransfer"/></html:submit><br>
                                </td>
                            </tr></div>
                            <div id='contAbsentTop'><tr height="20" valign="bottom" >
                                <td width="40%" align="center" colspan=7>
                                    <html:submit property="submit" styleId="btnsubmit4"><bean:message key="button.associate"/></html:submit>&nbsp;
                                    <html:submit property="submit" styleId="btnsubmit5"><bean:message key="button.transfer"/></html:submit>
                                </td>
                            </tr></div>
                        </table>
                                
                    </td>
                </tr>
            
                <%}
                    else{%>
                <tr><td><input type=hidden id="btnsubmit1" name="phantomb1">
                <input type=hidden id="btnsubmit2" name="phantomb2">
                <input type=hidden id="btnsubmit3" name="phantomb3">
                <input type=hidden id="btnsubmit4" name="phantomb4">
                <input type=hidden id="btnsubmit5" name="phantomb5"></td></tr>
                <%}%>
            
            
           
                <br>
             
         
                <!---Column Header Start-->
                <tr>
                    <td>
                        <table border="0" height="40" valign="top" id="tab<c:out value='${status.count}'/>"  width="320" align="left" BGCOLOR="#000000">
                            <div id='divrad'> <tr height="10" >
                                <td width=2%></td>
                                <td width=53% align="center"><FONT COLOR="#FFFFFF"><b>Container</font></td>
                                <td width=45% align="center" ><FONT COLOR="#FFFFFF"><b>Storage Location</font></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td align="center"><FONT COLOR="#FFFFFF"><b>Quantity</font></td>
                                <td align="center"><FONT COLOR="#FFFFFF"><b>Available Quantity</font></td>
                            </tr>
                        </table>
                        </div>
                        <br><br>
                    </td>
                </tr>
                
                <!---Column Header End-->
                <c:forEach var="output"  items="${ListForm.results}" varStatus="status">
                    <tr>
                        <td>
                            <div id="d<c:out value='${status.count}'/>" onclick="javascript:document.getElementById('group<c:out value='${status.count}'/>').click();" onmouseover="this.style.cursor='hand';" >
                                <table border="0" cellpadding=1 height="40" valign="top" id="tab<c:out value='${status.count}'/>"  width="320" align="left" BGCOLOR="#cccccc">
                                    <div id='divrad'> <tr height="10" >
                                        <td width=12%><input type="radio"  style="visibility:hidden"  
                                        value="<c:if test="${output.container_id !=null}">${output.container_id}</c:if><c:if test="${output.container_id ==null}"> </c:if>|<bean:write name='output' property='storage_area'/>|<bean:write name='output' property='stor_level_1'/>|<bean:write name='output' property='stor_level_2'/>|<bean:write name='output' property='stor_level_3'/>|<bean:write name='output' property='qty'/>|<bean:write name='output' property='qty_avail'/>|<bean:write name='output' property='uom'/>"
                                        id="group<c:out value='${status.count}'/>" 
                                        name="radgroup" 
                                        onClick="javascript:extracheck('tab<c:out value='${status.count}'/>','${output.container_id}')"></td></div>
                                        <td width=32% ALIGN="left"><c:if test="${output.container_id ==null}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--</c:if><c:if test="${output.container_id !=null}">${output.container_id}</c:if></td>
                                        <td width=16% align="center"><bean:write name="output" property="storage_area"/></td>
                                        <td width=10% align="center"><bean:write name="output" property="stor_level_1"/></td>
                                        <td width=10% align="center"><bean:write name="output" property="stor_level_2"/></td>
                                        <td width=10% align="center"><bean:write name="output" property="stor_level_3"/></td>
                                    </tr>
                                    <tr>
                                        <td><c:if test="${output.container_id !=null}"><html:submit property="submit" styleId="btnflag" onmouseover="this.style.cursor='default';"><bean:message key="button.flag"/></html:submit></c:if></td>
                                        <td ALIGN="center"><bean:write name="output" property="qty"/>&nbsp;<bean:write name="output" property="uom"/></td>
                                        <td ALIGN="center" colspan="4"><bean:write name="output" property="qty_avail"/>&nbsp;<bean:write name="output" property="uom"/></td>
                                    </tr>
                                </table>
                            </div>
                            <br><br>
                        </td>
                    </tr>
                    

                </c:forEach>
                <tr>
                    <td>
                        <table border="0" valign="top" width="320" align="center">
                            <div id='contPresentBot'> <tr height="20" valign="bottom">
                                <td width="40%" align="center" colspan=7>
                                    <html:submit property="submit" styleId="btnsubmit31"><bean:message key="button.condeassociate"/></html:submit>&nbsp;
                                    <html:submit property="submit" styleId="btnsubmit11"><bean:message key="button.consplit"/></html:submit>&nbsp;
                                    <html:submit property="submit" styleId="btnsubmit21"><bean:message key="button.contransfer"/></html:submit><br>
                                </td>
                            </tr></div>
                            <div id='contAbsentBot'><tr height="20" valign="bottom" >
                                <td width="40%" align="center" colspan=7>
                            
                                    <html:submit property="submit" styleId="btnsubmit41"><bean:message key="button.associate"/></html:submit>&nbsp;
                                    <html:submit property="submit" styleId="btnsubmit51"><bean:message key="button.transfer"/></html:submit>
                                </td>
                            </tr></div>
                        </table>
                                
                    </td>
                </tr>
                
            </html:form>
        </table> 
    </body>

<SCRIPT type="text/javascript">
	
	//$(document).ready(function(){
		initform();
	//});
	
	function initform()
	{
		document.getElementById('divrad').style.visibility="hidden";
		document.getElementById('btnsubmit1').disabled=true;
		document.getElementById('btnsubmit2').disabled=true;
		document.getElementById('btnsubmit3').disabled=true;
		document.getElementById('btnsubmit4').disabled=true;
		document.getElementById('btnsubmit5').disabled=true;
		document.getElementById('btnsubmit11').disabled=true;
		document.getElementById('btnsubmit21').disabled=true;
		document.getElementById('btnsubmit31').disabled=true;
		document.getElementById('btnsubmit41').disabled=true;
		document.getElementById('btnsubmit51').disabled=true;
	}
	
	function extracheck(tabid,conid)
	{
		for (Count = 0; Count < document.forms[0].radgroup.length; Count++)
		{
			otab='tab'+(Count+1);
			document.getElementById(otab).style.backgroundColor='#cccccc';
			document.getElementById(otab).style.color='#000000';      
		} 
		 
		document.getElementById(tabid).style.backgroundColor='#000000';
		document.getElementById(tabid).style.color='#cccccc';      

		if((conid==null)||(conid=="")){
			document.getElementById('btnsubmit1').disabled=true;
			document.getElementById('btnsubmit2').disabled=true;
			document.getElementById('btnsubmit3').disabled=true;
			document.getElementById('btnsubmit4').disabled=false;
			document.getElementById('btnsubmit5').disabled=false;
			document.getElementById('btnsubmit11').disabled=true;
			document.getElementById('btnsubmit21').disabled=true;
			document.getElementById('btnsubmit31').disabled=true;
			document.getElementById('btnsubmit41').disabled=false;
			document.getElementById('btnsubmit51').disabled=false;
		}
		else{
			document.getElementById('btnsubmit1').disabled=false;
			document.getElementById('btnsubmit2').disabled=false;
			document.getElementById('btnsubmit3').disabled=false;
			document.getElementById('btnsubmit4').disabled=true;
			document.getElementById('btnsubmit5').disabled=true;
			document.getElementById('btnsubmit11').disabled=false;
			document.getElementById('btnsubmit21').disabled=false;
			document.getElementById('btnsubmit31').disabled=false;
			document.getElementById('btnsubmit41').disabled=true;
			document.getElementById('btnsubmit51').disabled=true;
		}
	}
</SCRIPT>

</html:html>

