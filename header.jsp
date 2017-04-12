<%--
	Document: aboutl.jsp
	Created On: Feb 4, 2016
	Authors: Deepak Rohan, Abhishek

 --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%-- title of the Page--%>
       
        <title>Researchers Exchange Participations</title>
        <%-- importing CSS stylesheet --%>
        <link rel="stylesheet" href="styles/main.css">
        <script type="text/javascript" src="js/jquery-1.12.0.min.js"></script>
        <script type="text/javascript" src="js/main.js"></script>
        <!-- Attributes for Facebook -->
        <meta property="og:url"           content="http://openshiftdemo-sakthisaranya.rhcloud.com/Spandana_Sakthi_Assignment4_1" />
        <meta property="og:type"          content="website" />
        <meta property="og:title"         content="Researchers Exchange Participations" />
        <meta property="og:description"   content="Researchers Exchange Participations is a platform for researchers to exchange participation." />
    <!--  <meta property="og:image"         content="http://openshiftdemo-sakthisaranya.rhcloud.com/Spandana_Sakthi_Assignment4_1/images/home_image.png" />  --!>
        
        <!-- BootStrap -->
        
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" 
        integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"> -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        
        <script type="text/javascript">
        </script>
    </head>
    <body>
        <%-- Code to specify Header section of the page--%>
        <div id="header">
            <nav id="header_menu">
                <ul  class="left" >
                    <c:if test="${param.user == null}">
                    <a href="home.jsp"> <li>Researchers Exchange Participations</li></a>
                        </c:if>
                   
                    <c:if test="${param.user == 'theUser'}">
                    <a href="home.jsp?user=theUser"> <li>Researchers Exchange Participations</li></a>
                        </c:if>
                    
                     <c:if test="${param.user == 'theAdmin'}">
                    <a href="home.jsp?user=theAdmin"> <li>Researchers Exchange Participations</li></a>
                        </c:if>
                    
                </ul>
                <ul class="right">
                    <c:if test="${param.user == null}">
                        <li><a href="about.jsp">About Us</a></li>
                        <li><a href="how.jsp">How it Works</a></li>
                        <li><a href="login.jsp">Login</a></li>
                        </c:if>
                        <c:if test="${param.user == 'theUser'}">
                        <li><a href="UserController?action=about&user=theUser">About Us</a></li>
                        <li><a href="UserController?action=how&user=theUser">How it Works</a></li>
                        <li> <c:if test="${not empty theUser.email}">
                Hello,${theUser.email}
            </c:if>
            <c:if test="${empty theUser}">
                <a href="login.jsp">Login</a>&nbsp;
            </c:if></li>
                        <li><c:if test="${not empty theUser.email}">
                                <a href="home.jsp">Logout</a>
                            </c:if></li>
                        </c:if>
                        <c:if test="${param.user == 'theAdmin'}">
                        <li><a href="aboutl.jsp?user=theAdmin">About Us</a></li>
                        <li><a href="admin.jsp?user=theAdmin">How it Works</a></li>
                        <li>Hello, Admin</li>
                        <li><c:if test="${not empty theAdmin.email}">
                                <a href="home.jsp">Logout</a>
                            </c:if></li>
                        </c:if>
                </ul>

            </nav>



        </div>

