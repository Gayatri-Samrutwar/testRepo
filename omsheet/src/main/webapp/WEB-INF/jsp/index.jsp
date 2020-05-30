<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
  <title>OM Sheet</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="/view">All Tickets</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/add">Add Ticket</a>
    </li>
  </ul>
</nav>

<div class="container">    
      <c:choose>
         
         <c:when test = "${mode == 'TICKET_VIEW'}">
           <table class="table table-striped">
   				<thead>
   					<tr>
   					  	<th>Ticket Id</th>
    					<th>Ticket Discription
    					<th>User Name</th>
     					<th>No Of Hrs</th>
     					<th>Start Date</th>
     					<th>End Date</th>
     					<th>Edit</th>
     					<th>Delete</th>
   					</tr>
 				</thead>
 				<tbody>
 					<c:forEach var="ticket" items = "${tickets}">
    				<tr>
						<td>${ticket.ticketId}</td>
    					<td>${ticket.ticketDesc}</td>
     					<td>${ticket.userName}</td>
     					<td>${ticket.hrsSpent}</td>
     					<td>${ticket.startDate}</td>
     					<td>${ticket.endDate}</td>
     					<td>
     						<a href="edit?id=${ticket.id}">
          						 <svg class="bi bi-pencil" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd" d="M11.293 1.293a1 1 0 0 1 1.414 0l2 2a1 1 0 0 1 0 1.414l-9 9a1 1 0 0 1-.39.242l-3 1a1 1 0 0 1-1.266-1.265l1-3a1 1 0 0 1 .242-.391l9-9zM12 2l2 2-9 9-3 1 1-3 9-9z"></path>
  								<path fill-rule="evenodd" d="M12.146 6.354l-2.5-2.5.708-.708 2.5 2.5-.707.708zM3 10v.5a.5.5 0 0 0 .5.5H4v.5a.5.5 0 0 0 .5.5H5v.5a.5.5 0 0 0 .5.5H6v-1.5a.5.5 0 0 0-.5-.5H5v-.5a.5.5 0 0 0-.5-.5H3z"></path>
								</svg>
        					</a>
        				</td>
        				<td>
        					<a href="delete?id=${ticket.id}">
        						<svg class="bi bi-trash-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  								<path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
								</svg>
        					</a>
        				</td>
   					</tr>
 					</c:forEach>
 				</tbody>
			</table>
         </c:when>
         
         <c:when test = "${mode == 'TICKET_EDIT'}">
             <form action="save" method="POST">
             	<input type="hidden" class="form-control" value="${ticket.id}"  id="id" name="id">
  				<div class="form-group">
    	  			<label for="email">Ticket Id :</label>
      				<input type="text" class="form-control" value="${ticket.ticketId}"  id="ticketId" name="ticketId" readonly>
    			</div>
    			<div class="form-group">
    	  			<label for="ticketDesc">Ticket Details :</label>
      				<input type="text" class="form-control" value="${ticket.ticketDesc}" id="ticketDesc" name="ticketDesc">
    			</div>
    			<div class="form-group">
    	  			<label for="userName">User :</label>
      				<input type="text" class="form-control" value="${ticket.userName}" id="userName" name="userName">
    			</div>
    			<div class="form-group">
    	  			<label for="hrsSpent">No of Hrs :</label>
      				<input type="number" class="form-control" value="${ticket.hrsSpent}" id="hrsSpent" name="hrsSpent">
    			</div>

				<div class="form-group">
    	  			<label for="startDate">Start Date :</label>
      				<input type="date" data-date-format="DD MMMM YYYY" value="${ticket.startDate}" id="startDate" name="startDate">
    			</div>
    			<div class="form-group">
    	  			<label for="endDate">End Date :</label>
      				<input type="date" class="form-control" data-date-format="DD MMMM YYYY" value="${ticket.endDate}" id="endDate" name="endDate">
    			</div>
    			
    			<button type="submit" class="btn btn-primary">Submit</button>
  			</form>
         </c:when>
         
         <c:when test = "${mode == 'TICKET_ADD'}">
             <form action="save" method="POST">
  				<div class="form-group">
    	  			<label for="email">Ticket Id :</label>
      				<input type="text" class="form-control" id="ticketId" name="ticketId">
    			</div>
    			<div class="form-group">
    	  			<label for="ticketDesc">Ticket Details :</label>
      				<input type="text" class="form-control" id="ticketDesc" name="ticketDesc">
    			</div>
    			<div class="form-group">
    	  			<label for="userName">User :</label>
      				<input type="text" class="form-control" id="userName" name="userName">
    			</div>
    			
    			<div class="form-group">
    	  			<label for="startDate">Start Date :</label>
      				<input type="date" data-date-format="DD MMMM YYYY" id="startDate" name="startDate">
    			</div>
    			
    			<div class="form-group">
    	  			<label for="endDate">End Date :</label>
      				<input type="date" class="form-control" data-date-format="DD MMMM YYYY" id="endDate" name="endDate">
    			</div>
    			
    			<div class="form-group">
    	  			<label for="hrsSpent">No of Hrs :</label>
      				<input type="number" class="form-control" id="hrsSpent" name="hrsSpent">
    			</div>
    			
    			<button type="submit" class="btn btn-primary">Submit</button>
  			</form>
         </c:when>
         
      </c:choose>
       
  
</div>
</body>
</html>