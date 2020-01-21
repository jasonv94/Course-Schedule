<!DOCTYPE html>
<html>

<head>
	<title>Update schedule</title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-course-style.css">	
</head>

<body>

	<div id="container">
		<h3>Are you sure you want to remove this course</h3>
		
		<form action="StudentControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="DELETE" />
			<input type="hidden" name="command" value="LIST" />

			<input type="hidden" name="courseId" value="${THE_STUDENT.id}" />
			
			<table>
				<tbody>
					<tr>
						<td><label>Semester:</label></td>
						<td><input type="text" name="semester" 
								   value="${THE_STUDENT.semester}" /></td>
					</tr>

					<tr>
						<td><label>Course</label></td>
						<td><input type="text" name="courseName" 
								   value="${THE_STUDENT.courseName}" /></td>
					</tr>

					<tr>
						<td><label>Price:</label></td>
						<td><input type="text" name="time" 
								   value="${THE_STUDENT.time}" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Delete" class="save" /></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
		<div style="clear: both;"></div>
		
		<p>
			<a href="StudentControllerServlet">Back to List</a>
		</p>
	</div>
</body>

</html>











