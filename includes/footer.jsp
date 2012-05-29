        <script>
            //App custom javascript
						var listDoPage;
						$(document).ready(function(){
							markSelectedItemInListView();
							
							$('#actions').on('pagebeforeshow', function(e,data){
								console.log('hey');
								var storageArea = $('.amr-selected #storage-area', data.prevPage).text().trim().replace(/\W+/g," ");
								console.log(storageArea);
								listDoPage = data.prevPage;
								console.log(listDoPage);
								$('#storage-location').val(storageArea);
							});
						});
						
						
						function markSelectedItemInListView(){
							$('ul[data-role="listview"]:first li').on('click', function(){
								console.log("done");
								$(this).addClass("amr-selected");
							});
						}
        </script>
    </body>
</html>