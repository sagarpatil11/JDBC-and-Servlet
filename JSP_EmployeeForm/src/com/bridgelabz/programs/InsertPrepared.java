package com.bridgelabz.programs;
import java.sql.*;
public class InsertPrepared 
{

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_info","root", "root");
			PreparedStatement prstmt=connection.prepareStatement("insert into student values(?,?,?)");
			prstmt.setInt(1, 104);
			prstmt.setString(2, "alkesh");
			prstmt.setString(3, "dhule");
			int rs=prstmt.executeUpdate();
			System.out.println(rs+" rows inserted");
		} 
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
