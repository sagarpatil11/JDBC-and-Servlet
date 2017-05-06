<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Registration</title>

<style type="text/css">
.form_bg {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
    margin:100px 400px 200px 400px
}


</style>


<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" 
crossorigin="anonymous">



</head>
<body>
	
	<div class="container">
	<div class="form_bg">
 	 <h2>User Registration</h2>
  	<form action="UserRegistration" method="post">
    
    <div class="form-group">
      <input type="text" class="form-control" id="empname" placeholder="Employee Name" name="empname" style="width: 300px">
    </div>
    
    <div class="form-group">
      <input type="email" class="form-control" id="empemail" placeholder="Employee Email" name="empemail" style="width: 300px">
    </div>
    
    <div class="form-group">
      <textarea rows="3" cols="35" placeholder="Address" name="address" class="form-control" id="address"></textarea>
    </div>
    
    <div class="form-group">
      <input type="text" class="form-control" id="cmpname" placeholder="Company Name" name="companyname" style="width: 300px">
    </div>
    
    <div class="form-group">
      <input type="text" class="form-control" id="age" placeholder="Age" name="age" style="width: 300px">
    </div>
   
   	
   	<div class="form-group">
      <input type="text" class="form-control" id="salary" placeholder="Salary" name="salary" style="width: 300px">
    </div>
    
 
   
    <label class="row">Gender</label>
    <label class="radio-inline">
      <input type="radio" name="gender" value="male">Male
    </label>
    <label class="radio-inline">
      <input type="radio" name="gender" value="female" style="">Female
    </label>
    </div>
    
    
           
    
 	<div class="form-group">
    	<label>Specialized</label>
   		<input type="checkbox" class="form-control" id="specialized" name="specialized" value="java">Java
   		<input type="checkbox" class="form-control" id="specialized" name="specialized" value=".net">.Net
   		<input type="checkbox" class="form-control" id="specialized" name="specialized" value="Android">Android
   		<input type="checkbox" class="form-control" id="specialized" name="specialized" value=Angular">Angular
		</div>
 	
 	<div class="form-group">
    	<label>Languages Known</label>
   		<input type="checkbox" class="form-control" id="languages" name="languages" value="english">English
   		<input type="checkbox" class="form-control" id="languages" name="languages" value="marathi">Marathi
   		<input type="checkbox" class="form-control" id="languages" name="languages" value="hindi">Hindi
   		</div>
   	
   	
 	 <button type="submit" class="btn btn-primary btn-block">Submit</button><br>
    <button type="reset" class="btn btn-primary btn-block">Reset</button><br>
    
  	</form>
 	</div>
	</div>

</body>
</html>