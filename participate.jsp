<%--
	Document: aboutl.jsp
	Created On: Feb 4, 2016
	Authors: Deepak Rohan, Abhishek

 --%>
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
     //   request.setAttribute("msg", "Session has ended.  Please login.");
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
<%-- Code to display items in List --%>
<nav id="menu">
    <ul>
        <li>Coins(<c:out value="${theUser.numCoins}"></c:out>) </li>
       <li>Participants (0) </li>
       <li>Participation(<c:out value="${theUser.numParticipation}"></c:out>) </li>
      <li><br></li>
       <li><a href="UserController?action=main&user=theUser">Home</a></li>
        <li><a href="StudyController?action=participate&user=theUser">Participate</a></li>
        <li><a href="StudyController?action=studies&user=theUser">My Studies</a></li>
        <li><a href="recommend.jsp?user=theUser">Recommend</a></li>
        <li><a href="contact.jsp?user=theUser">Contact</a></li>
    </ul>

</nav>
<%-- Section to display studies and participate in that study--%>
<div>
   
     <h3 class="text-left"><span class="label label-default " >Studies</span>
         <span ><a class="label label-default" href="StudyController?user=theUser&action=reporthistory">Report History</a></span></h3>
     </div>
     
    <%-- Display the studies in the table --%>
    <%-- Clicking on Participate button displays Question.jsp page where 
            you can rate the question--%>
    
    <div class="table-responsive">
          
    <c:if test = "${studies != null}">
              
    <table class="table" >
        <%--Column Names --%>
        <tr>
            <th>Study Name</th>
            <th>Image</th>      
            <th>Question</th>
            <th>Action</th>
            <th>Report</th>
        </tr>
        
        <%-- <%
            List<Study> list = (ArrayList<Study>) request.getAttribute("studies");

            for (Study study : list) {
        %>   --%>
        <c:forEach var="study" items="${studies}">
        <tr>
            
            <td class="td_participate_odd"><b><c:out value="${study.getStudyName()}"></c:out></b></td> 
                <td class="td_participate_odd" > <img src="images/small_tree.jpg" alt="tree" height="42" width="92"  ><b></b></td>
                <td class="td_participate_odd"><b><c:out value="${study.getQuestion()}"></c:out></b></td>
               <td class="td_participate_odd">
                   <form action="StudyController?user=theUser" method="post">
                       <input class="part_button" type="submit" name="action" value="Participate" />
                       <input type="hidden"  name="studycode" value="<c:out value="${study.getStudyCode()}>"></c:out>"/>
                       <input type="hidden"  name="ReporterEmail" value="<c:out value="${theUser.getEmail()}"></c:out>"/>
                   </form>
                   
                   <td class="td_participate_odd">
                       <form action="StudyController?user=theUser" method="post">
                       <input class="part_button" type="submit" name="action" value="Report" />
                       <input type="hidden"  name="studycode" value="<c:out value="${study.getStudyCode()}"></c:out>"/>
                       <input type="hidden"  name="ReporterEmail" value="<c:out value="${theUser.getEmail()}"></c:out>"/>
                       <input type="hidden"  name="QuestionID" value="<c:out value="${study.getQuestionID()}"></c:out>"/> 
                       <%--questionidln--%>
                       </form>                  
                
                </td>   
        </tr>
        </c:forEach>
        
        <c:if test = "${studies == null}">
        <h3> no entries found </h3>
        </c:if>  
        <tr>
            <td></td>
            <td></td>
            <td></td> 
            <td></td>
            <td></td> 
        </tr>
    </table>
    </c:if>
    </div>
    

<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>