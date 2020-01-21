package com.jasonv94;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StudentDbUtil studentDbUtil;
	
	@Resource(name="jdbc/web_student_tracker")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();
		
		try {
			studentDbUtil = new StudentDbUtil(dataSource);
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
	//read command from jsp and calls the  appropriate function
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String theCommand = request.getParameter("command");
			
			if (theCommand == null) {
				theCommand = "LIST";
			}
			
			// route to the appropriate method
			switch (theCommand) {
			
			case "LIST":
				listSchedules(request, response);
				break;
				
			case "ADD":
				addSchedule(request, response);
				break;
				
			case "LOAD":
				loadSchedule(request, response);
				break;
			case "LOADD":
				loadScheduledelete(request,response);
				break;
				
			case "UPDATE":
				updateSchedule(request, response);
				break;
			
			case "DELETE":
				deleteSchedule(request, response);
				break;
				
			default:
				listSchedules(request, response);
			}
				
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
		
	}
	
	//delete from schedule and database
	private void deleteSchedule(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		
		
		String theScheduleId = request.getParameter("courseId");
		
		studentDbUtil.deleteSchedule(theScheduleId);
		
		listSchedules(request, response);
	}
	
	//update schedule on page and database
	private void updateSchedule(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		int id = Integer.parseInt(request.getParameter("courseId"));
		String semester = request.getParameter("semester");
		String courseName = request.getParameter("courseName");
		String time = request.getParameter("time");
		
		Schedule theSchedule = new Schedule(id, semester, courseName, time);
		
		studentDbUtil.updateSchedule(theSchedule);
		
		listSchedules(request, response);
		
	}

	//load the course schedule for the student
	private void loadSchedule(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

	
		String theScheduleId = request.getParameter("courseId");
		
		Schedule theSchedule = studentDbUtil.getSchedule(theScheduleId);
		
		request.setAttribute("THE_STUDENT", theSchedule);
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/update-student-form.jsp");
		dispatcher.forward(request, response);		
	}
	
	//load page for schedule to be deleted
	private void loadScheduledelete(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {

			// read student id from form data
			String theScheduleId = request.getParameter("courseId");
			
			// get student from database (db util)
			Schedule theSchedule = studentDbUtil.getSchedule(theScheduleId);
			
			// place student in the request attribute
			request.setAttribute("THE_STUDENT", theSchedule);
			
			// send to jsp page: update-student-form.jsp
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/delete.jsp");
			dispatcher.forward(request, response);		
		}

	//add courses to schedule and to the the database
	private void addSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {


		String semester = request.getParameter("semester");
		String courseName = request.getParameter("courseName");
		String time = request.getParameter("time");		
		
	
		Schedule theSchedule = new Schedule(semester, courseName, time);
		
		studentDbUtil.addSchedule(theSchedule);
				
		listSchedules(request, response);
	}

	///list courses
	private void listSchedules(HttpServletRequest request, HttpServletResponse response) 
		throws Exception {

		
		List<Schedule> schedules = studentDbUtil.getCourses();
		
		request.setAttribute("STUDENT_LIST", schedules);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-courses.jsp");
		dispatcher.forward(request, response);
	}

}













