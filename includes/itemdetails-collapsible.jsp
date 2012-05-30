<div data-role="collapsible-set" data-theme="c" data-content-theme="d">
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
								<label for="item-id">
										Item ID:
								</label>
								<input id="item-id" value="<%= session.getAttribute("item_id") %>" type="text" readonly="readonly" />
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