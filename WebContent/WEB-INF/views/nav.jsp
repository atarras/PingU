<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    
	    <link rel="stylesheet" href="<c:url value="/resources/css/nav.css"/>" />
	</head>
		<!-- Navigation bar static throughout all our pages, the search bar will probably be made bigger,
		need to add potentially bigger buttons, a hover effect, dynamic pill icon for notifications -->
	<header class="container m-0 p-0">
		<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
			<a class="navbar-brand" href="#">PingU</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item pr-2 active">
						<a class="nav-link" href="home"><i class="fas fa-home"></i></a>
					</li>
					<li class="nav-item pr-2 active">
						<a class="nav-link" href="${sessionScope.newUser.getUserId() }"><i class="fas fa-user"></i></a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="group"><i class="fas fa-users"></i></a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="#"><i class="far fa-envelope"></i></a>
					</li>
					<li class="nav-item active">
						<a class="nav-link" href="logOut"><i class="fas fa-sign-out-alt"></i></a>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0" action="searchUsers" method="POST">
				<div class="input-group mr-2">
					<c:choose>
						<c:when test="${not empty previousSearch}">
							<input class="form-control" type="search" placeholder="${previousSearch}" aria-label="Search" name="searchName">
						</c:when>
						<c:otherwise>
							<input class="form-control" type="search" placeholder="Search" aria-label="Search" name="searchName">
						</c:otherwise>
					</c:choose>
					<div class="input-group-append">
					
						<button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
						
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item" href="#">User Search</a>
							<a class="dropdown-item" href="#">Group Search</a>
						</div>
					</div>
				</div>
				<button class="btn btn-outline-success my-2	 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</nav>
	</header>
	<body>
		<!-- The message modal, to be editted later -->
		<div class="modal fade" id="message-modal" tabindex="-1" role="dialog" aria-labelledby="new-message" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="new-message">New Message</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						  <span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="reciever" class="col-form-label">To:</label>
								<input type="text" class="form-control" id="reciever" placeholder="jdoe">
							</div>
							<div class="form-group">
								<label for="message-body">Message:</label>
								<textarea type="text" class="form-control" id="message-body" placeholder="Your message here"></textarea>
						</div>
						</form>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Discard</button>
							<button type="button" class="btn btn-primary">Send</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>