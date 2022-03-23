<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Iterator"%>
<%@page import="com.trianing.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.training.dao.UserDAOImpl"%>
<%@page import="com.training.dao.UserDAO"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="stylef.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href=" employee.css">
</head>
<body>
<%
	String username = (String) session.getAttribute("usernamem");
	String password = (String) session.getAttribute("passwordm");
	%>

<h1 align = center >Welcome <%= username %> To Your Manager home page</h1>
	
<div class="container">
    <div class="main-body">
    
          <!-- Breadcrumb -->
          <nav aria-label="breadcrumb" class="main-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href= "viewAllEmployees.jsp" style="color: #00BFFF;"">View All Employees</a> </li>
              <li class="breadcrumb-item"><a href= "allResolvedReq.jsp" style="color: #00BFFF;"> Resolved Reimbursement Request</a></li>
               <li class="breadcrumb-item"><a href="viewReimOfEmp.jsp" style="color: #00BFFF;">Search Reimbursements of a specific employee</a></li>
              <li class="breadcrumb-item"><a href= "displayAllPendForms.jsp"style="color: #00BFFF;"> Appending Reimbursement Request</a></li>
              <li class="breadcrumb-item"><a href="viewinfoM.jsp" style="color: #00BFFF;"> View Your Info</a></li>
              <li class="breadcrumb-item active" aria-current="page" style="color: #00BFFF;"></li>
            </ol>
          </nav>
          <!-- /Breadcrumb -->
    <%
	UserDAO userDAO = new UserDAOImpl();
	List<User> users = userDAO.viewUserM(username, password);
	Iterator<User> iterator = users.iterator();
	
	%>
	<%
		while (iterator.hasNext()) {
			User user = iterator.next();
		%>
      <div class="row gutters-sm" >
            <div class="col-md-4 mb-3">
              <div id="ABC" class="card" style="border-radius: 3rem">
                <div  id="ABC" class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <img src="heads.jpg" alt="Admin" class="rounded-circle" width="350">
                    <div class="mt-3">
                      <h4><%=user.getFull_name()%></h4>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-5">
              <div id="ABC"  class="card mb-3" style="border-radius: 3rem">
                <div class="card-body" >
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Full Name</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                    <%=user.getFull_name()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Gender</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getGender()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">D.O.B</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getDob()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Phone Number</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getPhonenumber()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row" >
                    <div class="col-sm-3">
                      <h6 class="mb-0">Email</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getEmail()%>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Qualifications</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <%=user.getQualification()%>
                    </div>
                  </div>
                  <%} %>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                      <a class="btn btn-info " target="__blank" href="https://www.bootdey.com/snippets/view/profile-edit-data-and-skills">Edit</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
        </div>
    </div>




 </br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>

<a href = "index.jsp">Logout</a>   


</body>
</html>