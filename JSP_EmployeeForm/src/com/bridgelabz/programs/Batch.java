package com.bridgelabz.programs;
import java.sql.*;
public class Batch 
{

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_info","root","root");
			connection.setAutoCommit(false);
			
			Statement statement=connection.createStatement();
			statement.addBatch("insert into student values(105,'prince','thane')");
			statement.addBatch("insert into student values(106,'manoj','jharkhand')");
			
			statement.executeBatch();
			connection.commit();
			connection.close();
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
