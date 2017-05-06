package com.bridgelabz.programs;
import java.sql.*;

public class ScrollebleRset {

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_info","root","root");
			
			Statement statement=connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			ResultSet rs=statement.executeQuery("select * from student");
			
			rs.absolute(2);
			
				System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
			
			connection.close();
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
