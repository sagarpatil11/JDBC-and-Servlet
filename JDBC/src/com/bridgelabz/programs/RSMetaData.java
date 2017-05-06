package com.bridgelabz.programs;
import java.sql.*;

public class RSMetaData 
{

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_info","root", "root");
			PreparedStatement prstmt=connection.prepareStatement("select *from student");
			ResultSet rs=prstmt.executeQuery();
			
			ResultSetMetaData rsmetadata=rs.getMetaData();
			
			System.out.println("Total column count is "+rsmetadata.getColumnCount());
			System.out.println("First column name is "+rsmetadata.getColumnName(1));
			System.out.println("First column datatype is "+rsmetadata.getColumnTypeName(1));
			connection.close();
		} 
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
