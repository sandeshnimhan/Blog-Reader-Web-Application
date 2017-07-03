<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<!-- For HTML 5 -->

<!-- Using HTML 5 so following specification is not needed -->
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<!-- Encoding information for browser while rendering/displaying page -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Makes page responsive to device width, viewport is browser 
specific keyword used while rendering/displaying page  -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/style.css" rel="stylesheet" type="text/css" />

<title>Blog Reader Web Application</title>
</head>
<body>

	<ul class="sidenav">
		<li><a href="#" id="home">Home</a></li>
		<li><a href="#" id="contact">Contact</a></li>
		<li><a href="#" id="about">About</a></li>
	</ul>

	<!-- <div class="content">
		<div class="divider"></div>
		<h2>Posts Home Page</h2>
		<p>Read More. Write More. Create Your Own Opus!!!</p>
	</div>  -->
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
	
	</script>
	<script>
		/* Home */
		 $('#home')
				.click(
						function() {
							$('#contact').removeClass('active');
							$('#about').removeClass('active');
							$(this).addClass('active');
							$('#postsTable').show();
							$('#entrydata tbody').empty();
							//$('#tbodyId').empty();
							var entries = [];
							var dmJSON = "https://jsonplaceholder.typicode.com/posts";
							$.getJSON(dmJSON, function(data) {
								$.each(data, function(i, f) {
									var tblRow = "<tr>" + "<td>" + f.userId
											+ "</td>" + "<td>" + f.id + "</td>"
											+ "<td>" + f.title + "</td>"
											+ "<td> " + f.body + "</td>"
											+ "</tr>";
											
									$(tblRow).appendTo("#entrydata tbody:eq(0)");
								});

							});

						}); 
		</script>
	<script>

		/* About */
		 $('#about')
				.click(
						function() {
							$('#home').removeClass('active');
							$('#contact').removeClass('active');
							$(this).addClass('active');
							$('#postsTable').show();
							$('#entrydata tbody').empty();
							//var entries = [];
							var dmJSON = "https://jsonplaceholder.typicode.com/posts?callback=?";
							$.getJSON(dmJSON, function(data) {
								var i; 
								for(i=0;i<4;i++) {
								var f = data[Math.floor(Math.random()*data.length)];
									var tblRow = "<tr>" + "<td>" + f.userId
											+ "</td>" + "<td>" + f.id + "</td>"
											+ "<td>" + f.title + "</td>"
											+ "<td> " + f.body + "</td>"
											+ "</tr>" ;
										//tblRow = "<a href=" + """ + "#" + """ + ">" + tblRow + "</a>";  
									$(tblRow).appendTo("#entrydata tbody:eq(0)");
								}

							});

						});
		 </script>
	<script>
		
		/* Contact */
		$('#contact')
				.click(
						function() {
							$('#home').removeClass('active');
							$('#about').removeClass('active');
							$(this).addClass('active');
							$('#postsTable').hide();
							$('#entrydata tbody').empty();				

						});

		</script>
	<script>
		/* Nav-bar color change */
		/* $('#parent_element_of_links a').click(function(e) {
			e.preventDefault();
			$('#parent_element_of_links a').removeClass('active');
			$(this).addClass('active');
		}); */
	</script>
	<div class="divider"></div>
	<div class="content" hidden="true" id="postsTable">

		<div>
			<table id="entrydata" border="1">
			<thead>
				<tr>
					<th>userId</th>
					<th>id</th>
					<th>title</th>
					<th>body</th>
				</tr>
				</thead>
				<tbody id="tbodyId">

				</tbody>
			</table>

		</div>
	</div>
</body>
</html>