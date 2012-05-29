<%@include file="includes/header.jsp"%>
<html:errors/>
         
	<html:form action="/Select">
 	
	<% 
		int listCount=Integer.parseInt(request.getAttribute("listCount").toString());
		if (listCount>3){
	%>
	<!--
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
	-->
	<%
		}
		else
		{
	%>
		<input type=hidden id="btnsubmit1" name="phantomb1">
		<input type=hidden id="btnsubmit2" name="phantomb2">
		<input type=hidden id="btnsubmit3" name="phantomb3">
		<input type=hidden id="btnsubmit4" name="phantomb4">
		<input type=hidden id="btnsubmit5" name="phantomb5">
	<%}%>
	
	<br>
		<!---Column Header Start-->

		
		
		<div data-role="content">
      <div data-role="collapsible-set" data-theme="b" data-content-theme="c">
          <div data-role="collapsible" data-collapsed="" id="showHideCollapsible">
              <h3>
                  <div>
										<li><b>BU:</b> <%= session.getAttribute("bu") %> </li>
										<li><b>Item ID:</b> <%= session.getAttribute("item_id") %> </li>
										<li><%= session.getAttribute("item_desc") %></li>
									</div>
              </h3>
              <div data-role="fieldcontain">
                  <fieldset data-role="controlgroup" data-type="vertical">
                  	
                   <c:forEach var="output"  items="${ListForm.results}" varStatus="status">

										<div id="d<c:out value='${status.count}'/>" >
							
												<input type="radio" 
												value="<c:if test='${output.container_id !=null}' > ${output.container_id}</c:if><c:if test='${output.container_id ==null}'> </c:if>|<bean:write name='output' property='storage_area'/>|<bean:write name='output' property='stor_level_1'/>|<bean:write name='output' property='stor_level_2'/>|<bean:write name='output' property='stor_level_3'/>|<bean:write name='output' property='qty'/>|<bean:write name='output' property='qty_avail'/>|<bean:write name='output' property='uom'/>"
												id="group<c:out value='${status.count}'/>" 
												name="radgroup" />
												<label for="group<c:out value='${status.count}'/>">
														<c:if test="${output.container_id ==null}">&nbsp;&nbsp;&nbsp;&nbsp;--</c:if><c:if test="${output.container_id !=null}">${output.container_id}</c:if>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="output" property="storage_area"/>
														&nbsp;&nbsp;&nbsp;<bean:write name="output" property="stor_level_1"/>
														&nbsp;&nbsp;&nbsp;<bean:write name="output" property="stor_level_2"/>
														&nbsp;&nbsp;&nbsp;<bean:write name="output" property="stor_level_3"/>
														<br>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;<c:if test="${output.container_id !=null}"><html:submit property="submit" styleId="btnflag" onmouseover="this.style.cursor='default';"><bean:message key="button.flag"/></html:submit></c:if>
														&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="output" property="qty"/>&nbsp;<bean:write name="output" property="uom"/>
														&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="output" property="qty_avail"/>&nbsp;<bean:write name="output" property="uom"/>	
												</label>
								
							
										</div>

									</c:forEach>
                  </fieldset>
              </div>
          </div>
      </div>
		
		<!---Column Header End-->
		
				<div id='contPresent'> 
									<html:submit property="submit" styleId="btnsubmit3"><bean:message key="button.condeassociate"/></html:submit>&nbsp;
									<html:submit property="submit" styleId="btnsubmit1"><bean:message key="button.consplit"/></html:submit>&nbsp;
									<html:submit property="submit" styleId="btnsubmit2"><bean:message key="button.contransfer"/></html:submit><br>
				</div>
				<div id='contAbsent'>
									<html:submit property="submit" styleId="btnsubmit4"><bean:message key="button.associate"/></html:submit>&nbsp;
									<html:submit property="submit" styleId="btnsubmit5"><bean:message key="button.transfer"/></html:submit>
				</div>
		</div>
		
		<!--
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
		-->
	</html:form>


<SCRIPT type="text/javascript">
	$(document).ready(function(){
   	$("#contPresent").hide();
		$("#contAbsent").hide();
	});
	
	$("input[name='radgroup']").change(function(){
		var rad = $("input[name='radgroup']:checked").val();
		var arrayOfEle = rad.split("|");
		var container = arrayOfEle[0];
		if (container & container != ""){
				$('#showHideCollapsible').trigger('collapse');
				$("#contPresent").show("slow");
				$("#contAbsent").hide("slow");
		}
		else{
				$('#showHideCollapsible').trigger('collapse');
				$("#contPresent").hide("slow");
				$("#contAbsent").show("slow");
		}
	});

</SCRIPT>
<%@include file="includes/footer.jsp"%>

