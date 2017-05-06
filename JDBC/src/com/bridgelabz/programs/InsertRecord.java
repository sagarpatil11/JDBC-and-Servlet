package com.bridgelabz.programs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class InsertRecord {

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_info","root","root");
			Statement statement=connection.createStatement();
			//int rs=statement.executeUpdate("insert into student values(102,'alkesh','betawad')");
	
			//	int rs=statement.executeUpdate("update  student set name='yogesh' where id=102");
		
			int rs=statement.executeUpdate("delete from student where id=102");

			System.out.println(rs+" row affected");
			
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
