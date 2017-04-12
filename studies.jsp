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
    <div id="fb-root"></div>
<script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
<%-- Code to display Page Name --%>
<h3 id="page_name">My Studies</h3>
 <%-- Code to add new study   --%>
<h3 id="add_new_study"><a href="newstudy.jsp?user=theUser" >Add a new study</a></h3>
 <%-- Code to go Back to the Main Page  --%>
<a href="main.jsp?user=theUser" id="back_to_page">&laquo;Back to the Main Page</a>
<%-- Section to display studies details --%> 
<%-- Clicking on Start, Stop to Participate in that study and  Edit button to display edit page and edit study details in it--%>
<section >

<div class="table-responsive">
     
    <table class="table" >
        
               <c:if test="${newStudy !=null}">
               
                    
                    <tr class="table_participate">
                    <th><b> Study Name</b></th>   
                    <th><b> Requested participants</b></th> 
                    <th><b> Participations</b></th> 
                    <th><b> Status </b></th>
                    <th><b> Action</b></th> 
            </tr>
               
        <%--
                List<Study> list = (ArrayList<Study>) request.getAttribute("newStudy");              
                for(Study study : list) {
              --%>
           
            <c:forEach var="study" items="${newStudy}">
            <tr>
                 <td><b><c:out value="${study.getStudyName()}"></c:out> </b></td> 
                 <td><b><c:out value="${study.getRequestedParticipants()}"></c:out> <b></b></td>
                <td><b><c:out value="${study.getNumofParticipants()}"></c:out> </b></td>
                <td>
                    
                   <form action="StudyController">
                   <c:if test="${study.getStatus()=='start'}">
                       <input name="action" type="submit" value ="stop">
                       
                   </c:if>
                   <c:if test="${study.getStatus()=='stop'}">
                       <input name="action" type="submit" value ="start">
                       
                   </c:if>
                   <input type="hidden" name="studyCode" value="<c:out value="${study.getStudyID()}"></c:out>">     
                </form>
                </td>
                 <td>
                     <form action="StudyController">
                         <input type="hidden" name="studyCode" value="<c:out value="${study.getStudyID()}"></c:out>">
                        <input name ="action" type="submit" class="btn btn-primary" name="action" value="edit">
                     </form>
                </td>
                <td>
                     
                     <div class="fb-share-button" data-href="http://openshiftdemo-sakthisaranya.rhcloud.com/Spandana_Sakthi_Assignment4_1/StudyController?action=participatedStudy&studyCode="<c:out value="${study.getStudyID()}"/>/>data-layout="button"></div>    
           
                     </div> </td>
                        

             </tr>
               
        </c:forEach>
                
                <c:if test = "${newStudy== null}">     
                 <h3> no entries found </h3> 
                </c:if>
    </c:if>  
    </table>
     </form>
</div>
</section>
<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>