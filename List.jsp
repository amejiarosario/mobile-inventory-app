<%@include file="includes/header.jsp"%>
<!-- main-page -->
<div data-role="page" data-theme="b" id="main" style="background: url('http://t1.gstatic.com/images?q=tbn:ANd9GcTNV8CYXH4P5tW5tGMGhrxdTo-8UqFYQrs4FLjJ1s4Mkre6jHhNbNdlPOiL') repeat">
		<div data-theme="a" data-role="header">
				<h3>
						Vicor Inventory App
				</h3>
		</div>

		<!-- sub-header -->
		<div data-theme="b" data-role="header">
				<h3>
						Item Locations
				</h3>
				<a data-role="button" data-direction="reverse" data-rel="back" data-transition="fade" data-theme="b" href="/HHD/selectinv.do" data-icon="arrow-l" data-iconpos="left">
						Back
				</a>
		</div>
		<!-- /sub-header -->

		<!-- show errors -->
		<html:errors />

		<!-- show details  -->
		<div data-role="content">
				<div data-role="collapsible-set" data-theme="e" data-content-theme="d">
						<div data-role="collapsible" data-collapsed="true">
								<h3>
										Selected Item: <%= session.getAttribute("item_id") %> [<%= session.getAttribute("item_desc") %>]
								</h3>
								<div data-role="fieldcontain">
										<fieldset data-role="controlgroup" data-mini="true">
												<label for="textinput1">
														BU:
												</label>
												<input id="textinput1" value="<%= session.getAttribute("bu") %>" type="text" readonly="readonly" />
										</fieldset>
								</div>
								<div data-role="fieldcontain">
										<fieldset data-role="controlgroup">
												<label for="textinput2">
														Item ID:
												</label>
												<input id="textinput2" value="<%= session.getAttribute("item_id") %>" type="text" readonly="readonly" />
										</fieldset>
								</div>
								<div data-role="fieldcontain">
										<fieldset data-role="controlgroup">
												<label for="textinput3">
														Description:
												</label>
												<input id="textinput3" value='<%= session.getAttribute("item_desc") %>' type="text" readonly="readonly" size="80"/>
										</fieldset>
								</div>
						</div>
				</div>
				<ul data-role="listview" data-divider-theme="b" data-inset="true">
						<!-- Table Header -->
						<li data-role="list-divider" role="heading">
								<h1>
									<div>Location</div> 
									<div>Qty  | Available | Container</div>
								<h1>
						</li>
						
						<!-- Table rows -->
						<c:forEach var="output"  items="${ListForm.results}" varStatus="status">
						<li data-theme="c">
								<a href="#actions" data-transition="slide">
									<div>
										<bean:write name="output" property="storage_area"/>
										<bean:write name="output" property="stor_level_1"/>	
										<bean:write name="output" property="stor_level_2"/>	
										<bean:write name="output" property="stor_level_3"/>	
									</div>
									<div>
										<bean:write name="output" property="qty"/> <bean:write name="output" property="uom"/> |
										<bean:write name="output" property="qty_avail"/>
										<bean:write name="output" property="uom"/>	|
										<c:if test="${output.container_id ==null}">
											--
										</c:if>
										<c:if test="${output.container_id !=null}">
											${output.container_id}
										</c:if>
									</div>
								</a>
						</li>
						</c:forEach>
				</ul>
		</div>
</div>
<!-- /main-page  -->

<!-- actions -->
<div data-role="page" id="actions">
		<div data-theme="a" data-role="header">
				<h3>
						Vicor Inventory App
				</h3>
		</div>

		<!-- sub-header -->
		<div data-theme="b" data-role="header">
				<h3>
						Perform Action
				</h3>
				<a data-role="button" data-direction="reverse" data-rel="back" data-transition="fade" data-theme="b" href="/HHD/selectinv.do" data-icon="arrow-l" data-iconpos="left">
						Back
				</a>
		</div>
		<!-- /sub-header -->

		<!-- show errors -->
		<html:errors/>
		
		
		<div data-role="content">
				<div data-role="collapsible-set" data-theme="e" data-content-theme="d">
						<div data-role="collapsible" data-collapsed="true">
								<h3>
										Location Selected: ####
								</h3>
								<div data-role="fieldcontain">
										<fieldset data-role="controlgroup" data-mini="true">
												<label for="textinput1">
														Container Qty:
												</label>
												<input id="textinput1" placeholder="50000 EA" value="" type="text" />
										</fieldset>
								</div>
								<div data-role="fieldcontain">
										<fieldset data-role="controlgroup" data-mini="true">
												<label for="textinput2">
														Storage Location:
												</label>
												<input id="textinput2" placeholder="ARROW	01	AA	02" value="" type="text" />
										</fieldset>
								</div>
								<div data-role="fieldcontain">
										<fieldset data-role="controlgroup" data-mini="true">
												<label for="textinput3">
														Available Qty:
												</label>
												<input id="textinput3" placeholder="50000 EA" value="" type="text" />
										</fieldset>
								</div>
						</div>
				</div>
				<ul data-role="listview" data-divider-theme="b" data-inset="true">
						<li data-role="list-divider" role="heading">
								Actions
						</li>
						<li data-theme="c">
								<a href="#associate" data-transition="slide">
										Associate
								</a>
						</li>
						<li data-theme="c">
								<a href="#transfer" data-transition="slide">
										Transfer
								</a>
						</li>
						<li data-theme="c">
								<a href="#deassociate" data-transition="slide">
										Deassociate
								</a>
						</li>
						<li data-theme="c">
								<a href="#split" data-transition="slide">
										Split
								</a>
						</li>
						<li data-theme="c">
								<a href="#control-transfer" data-transition="slide">
										Control Transfer
								</a>
						</li>
				</ul>
		</div>
</div> <!-- /actions -->


<!-- associate -->
<div data-role="page" id="associate">
	nothing yet
</div>

<%@include file="includes/footer.jsp"%>

