package com.jasonv94;

public class Schedule {

	private int id;
	private String semester;
	private String courseName;
	private String time;

	public Schedule(String semester, String courseName, String time) {
		this.semester = semester;
		this.courseName = courseName;
		this.time = time;
	}

	public Schedule(int id, String semester, String courseName, String time) {
		this.id = id;
		this.semester = semester;
		this.courseName = courseName;
		this.time = time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getsemester() {
		return semester;
	}

	public void setsemester(String semester) {
		this.semester = semester;
	}

	public String getcourseName() {
		return courseName;
	}

	public void setcourseName(String courseName) {
		this.courseName = courseName;
	}

	public String gettime() {
		return time;
	}

	public void settime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Schedule [id=" + id + ", semester=" + semester + ", courseName=" + courseName + ", time=" + time + "]";
	}	

}
