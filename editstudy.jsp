<%--
	Document: aboutl.jsp
	Created On: Feb 4, 2016
	Authors: Deepak Rohan, Abhishek

 --%>
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
        //request.setAttribute("msg", "Session has ended.  Please login.");
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
<script type="text/javascript" src="js/editstudy.js">
</script>
<%-- Code to display Page Name --%>
<h3 id="page_name">Editing a study</h3>
<%-- Code to go back to Main page  --%>
<a href="UserController?action=main&user=theUser" id="back_to_page">&laquo;Back to the Main Page</a>
<%-- Section to input study details --%>
<section>
    <form class="form-horizontal" enctype="multipart/form-data" action="StudyController?user=theUser" method="post">
    
    	<div class="form-group">
        <label class="col-sm-4 control-label">Study Name *</label>
        <div class="col-sm-4">
            
            <input type="text" class="form-control" name="study_name" value="<c:out value="${study.getStudyName()}"></c:out>" required />
         </div>
            </div>
        
        <div class="form-group">
        <label class="col-sm-4 control-label">Question Text *</label>
        <div class="col-sm-4">
            <input type="text" class="form-control" name="question_text" value="<c:out value="${study.getQuestion()}"></c:out>" required/>
         </div>
            </div>
        
        
        <%-- Img tag is used to import image --%>
        <div class="form-group">
        <label class="col-sm-4 control-label">Image *</label>
        <div class="col-sm-4">
        <input type="file" name="image">
        
        </div>
        </div>
        
        
        <div class="form-group">
        <label class="col-sm-4 control-label"># Participants *</label>
         <div class="col-sm-4"> 
             <input type="text" class="form-control" name="participants" value="<c:out value="${study.getRequestedParticipants()}"></c:out>" required/>
         </div>
            </div>
        
        <div class="form-group">
        <label class="col-sm-4 control-label"># Answers *</label>
        <div class="col-sm-4">
        <select class="form-control" id="edit_study_answers">
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5" selected>5</option>
        </select> 
         </div>
            </div>
        
        
        <div id="TextBoxContainer1">
    <!--Textboxes will be added here -->
    <c:forEach var="answer" items="${study.getAllAnswers()}" varStatus="loopCount">
        <div>
        <div class="form-group">
            <label class="col-sm-4 control-label">Answer<c:out value="${loopCount.count}"></c:out> *</label>
            <div class="col-sm-4">
                <input name="DynamicTextBox" class="form-control" required="" value="${(answer!=null&&answer!="null") ?answer:""}" type="text">
            </div>
        </div>
    </div>
        
    </c:forEach>
    </div>
       
       
       <div class="form-group">
        <label class="col-sm-4 control-label">Description *</label>
         <div class="col-sm-4"> 
             <textarea name="desc" class="form-control" required><c:out value="${study.getDescription()}"></c:out></textarea>
         </div>
            </div>
        
        <div class="form-group">
        <div class="col-sm-offset-5 col-sm-4">
        <button type="submit"  class="btn btn-primary">Update</button>
        <input type="hidden" name="action" value="update"> 
        <input type="hidden" name="studyCode" value="<c:out value="${study.getStudyID()}"></c:out>">

         </div>
            </div>
            <br/><br/><br/>
    </form>
</section>
<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>