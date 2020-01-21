<!DOCTYPE html>
<html>

<head>
	<title>Add Course</title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-course-style.css">	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>UFV SCHEDULE</h2>
		</div>
	</div>
	
	<div id="container">
		<h3>Course</h3>
		
		<form action="StudentControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="ADD" />
			
			<table>
			
					<tr>
						<td><label>Semester:</label></td>
						<td><input type="text" name="semester" /></td>
					</tr>

					<tr>
						<td><label>Course:</label></td>
						<td><input type="text" name="courseName" /></td>
					</tr>

					<tr>
						<td><label>Time:</label></td>
						<td><input type="text" name="time" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit"style="min-width: 150px;" value="Add" class="save" /></td>
					</tr>
					
			</table>
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="StudentControllerServlet">Back to Course List</a>
		</p>
	</div>
</body>

</html>



