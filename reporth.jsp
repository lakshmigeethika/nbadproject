<%-- 
    Document   : reporth
    Created on : Feb 5, 2016, 5:20:55 PM
    Author     : Sagi
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="murach.business.Report"%>
<%-- Include tag is used to import header page --%>
<%@ include file="header.jsp" %>
<%
response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);
try{
    if(session.getAttribute("theUser")==null )
    {
      //  request.setAttribute("msg", "Session has ended.  Please login.");
       RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
       
     }
    else if(session.getAttribute("theAdmin")==null)
    {
      //  request.setAttribute("msg", "Session has ended.  Please login.");
       RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
    }
    else
    {
        System.out.println("user logged in is::"+session.getAttribute("theUser").toString());
    }
}
    catch(NullPointerException e)
            {
            
            
            }
    %>
<%-- Code to go back to Main page  --%>
<br>
<a href="main.jsp?user=theUser" id="back_to_page">&laquo;Back to the Main Page</a>
<br>
 <div class="table-responsive">
<table class="table" >
        <%--Column Names --%>
        <tr>
            <th>Report Date</th>
            <th>Report Question</th>		
            <th>Report Status</th>
            
        </tr>
        <c:choose>  
            <c:when test="${reports==null || empty reports}">
            
                  <tr>
        
                      <td colspan="3"><c:out value="${msg}"></c:out></td>      
                </tr>  
            </c:when>
                
            <c:otherwise> 
                
                <c:forEach var="report" items="${reports}">
                
                <tr>
            
                    <td><c:out value="${report.getDatecreaed()}"></c:out></td>
                    <td><c:out value="${report.getQuestion()}"></c:out></td>
                    <td><c:out value="${report.getStatus()}"></c:out></td>      
                </tr>
                </c:forEach> 
        
            </c:otherwise>
        </c:choose>
        
    </table>
    </div>
<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>