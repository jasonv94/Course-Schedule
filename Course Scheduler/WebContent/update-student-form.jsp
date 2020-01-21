<!DOCTYPE html>
<html>

<head>
	<title>Update Course</title>

	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-course-style.css">	
</head>

<body>
	<div id="wrapper">
	
	</div>
	
	
		<h3>Update Course</h3>
		
		<form action="StudentControllerServlet" method="GET">
		
			<input type="hidden" name="command" value="UPDATE" />

			<input type="hidden" name="courseId" value="${THE_STUDENT.id}" />
			
			<table>
				<tbody>
					<tr>
						<td><label>Semester:</label></td>
						<td><input type="text" name="semester" 
								   value="${THE_STUDENT.semester}" /></td>
					</tr>

					<tr>
						<td><label>Course Name:</label></td>
						<td><input type="text" name="courseName" 
								   value="${THE_STUDENT.courseName}" /></td>
					</tr>

					<tr>
						<td><label>Time:</label></td>
						<td><input type="text" name="time" 
								   value="${THE_STUDENT.time}" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		
		
		<p>
			<a href="StudentControllerServlet">Back to Courses</a>
		</p>

</body>

</html>











