<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<title>Course</title>
	
	<link type="text/css" rel="stylesheet" href="css/style.css">
	<link type="text/css" rel="stylesheet" href="css/add-course-style.css">	
	
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Courses Schedule</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">
			<table border =1>
			
				<tr>
					<th>Semester</th>
					<th>Course</th>
					<th>Time</th>
					<th>Update</th>
					<th>Remove</th>
				</tr>
				
				<c:forEach var="tempStudent" items="${STUDENT_LIST}">
		
					<c:url var="tempLink" value="StudentControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="courseId" value="${tempStudent.id}" />
					</c:url>
		
					<c:url var="deleteLink" value="StudentControllerServlet">
						<c:param name="command" value="LOADD" />
						<c:param name="courseId" value="${tempStudent.id}" />
					</c:url>
																		
					<tr>
						<td> ${tempStudent.semester} </td>
						<td> ${tempStudent.courseName} </td>
						<td> ${tempStudent.time} </td>
						<td> <a href="${tempLink}">Update</a>  </td>
						<td><a href="${deleteLink}">Delete</a>	</td>
						
					</tr>
				
				</c:forEach>
				
			</table>
		
		</div>
	<input type="button" value="Add Course" 
				   onclick="window.location.href='add-course-form.jsp';"
				 
			/>
	</div>
</body>

<img src="ufvlogo.jpg" alt="Logo UFV" style="width:500px;height:300px;">
<%--Property of UFV logo used from https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiAzvD3mp
bmAhX_IDQIHVIcD6AQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.ufv.ca%2F&psig=AOvVaw0eQ0iphN0vPBgVMLHqf0gp&ust=1575350195393935 --%>

</html>






