 <%--
	Document: aboutl.jsp
	Created On: Feb 4, 2016
	Authors: Deepak Rohan, Abhishek

 --%>
<%@page import="murach.business.Report"%>
<%@page import="java.util.List"%>
<%@page import="murach.business.Study"%>
<%@page import="java.util.ArrayList"%>
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
       // request.setAttribute("msg", "Session has ended.  Please login.");
       RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
       
     }
    else if(session.getAttribute("theAdmin")==null)
    {
       // request.setAttribute("msg", "Session has ended.  Please login.");
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
<h3><span id="studies">Reported Questions</span></h3><br/>
<a href="admin.jsp?user=theAdmin" id="back_to_page">&laquo;Back to the Main Page</a><br/>
<br/><br/><br/>


<!-- TODO: Add more code to get the table here.
  -->
  <div class="table-responsive">
  <table class="table" >
        <%--Column Names --%>
        <tr>
            <th>Question</th>
            <th>Action</th>		
        </tr>
        
            <%-- First study details --%>
            <%--<td>I enjoy outdoor activities.</td> --%>
           <%-- <%
                List<Report> list = (ArrayList<Report>) request.getAttribute("newStudy");              
                for(Report report : list) {
            %>   --%>
           
            <c:forEach var="report" items="${newStudy}">
            <tr>
                 
                <td><b><c:out value="${report.getQuestion()}"></c:out></b></td> 
                
            <td>
            <form method="post">
                <input type="submit" class="btn btn-primary" formaction="StudyController?user=theAdmin&action=approve&status=Removed&studyID=<c:out value="${report.getStudyID()}"></c:out>&questionID=<c:out value="${report.getQuestionID()}"></c:out>"  value="Approve">
            <input type="submit" class="btn btn-primary" formaction="StudyController?user=theAdmin&action=disapprove&status=Not%20Removed&studyID=<c:out value="${report.getStudyID()}"></c:out>&questionID=<c:out value="${report.getQuestionID()}"></c:out>"  value="Dispprove">
            </form>
            </td>
  

        </tr>
        </c:forEach>
        <!-- TODO Add one more for removal and not re -->
        
        <tr> 
            <%-- Second study details --%>
            <td></td>
            <td></td>

        </tr>
        </table>
        </div>
  
  
<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>