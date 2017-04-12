<%--
        Document: aboutl.jsp
        Created On: Feb 4, 2016
        Authors: Deepak Rohan, Abhishek

--%>
<%-- Include tag is used to import header page --%>
<%@ include file="header.jsp" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    //Study study = null;
    try {
//        if (request.getAttribute("study") != null) {
//            study = (Study) request.getAttribute("study");
//        }
        if (session.getAttribute("theUser") == null) {
            // request.setAttribute("msg", "Session has ended.  Please login.");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");

        } else if (session.getAttribute("theAdmin") == null) {
            //request.setAttribute("msg", "Session has ended.  Please login.");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
        } else {
            System.out.println("user logged in is::" + session.getAttribute("theUser").toString());
        }
    } catch (NullPointerException e) {

    }
%>
<%-- Code to display items in List --%>
<nav id="menu">
    <ul>
        <li>Coins<c:out value="(${theUser.numCoins})"></c:out> </li>
        <li>Participants (0) </li>
        <li>Participation<c:out value="(${theUser.numParticipation})"></c:out> </li>

        <li><br></li>
        <li><a href="UserController?action=main&user=theUser">Home</a></li>
        <li><a href="StudyController?action=participate&user=theUser">Participate</a></li>
        <li><a href="StudyController?action=studies&user=theUser">My Studies</a></li>
        <li><a href="recommend.jsp?user=theUser">Recommend</a></li>
        <li><a href="contact.jsp?user=theUser">Contact</a></li>
    </ul>
</nav>
<%-- Code to Display Question--%>
<section class="question_section">
    <h3><span class="label label-default" >Question</span></h3>
    <%-- Img tag to display image--%>
    <c:if test="${study != null}"> 
    <img src="images/small_tree.jpg" class="img-responsive" height="250" width="250" alt="Tree"/>

    <%--Code to rating the Question --%>
    <p><c:out value="${study.getQuestion()}"></c:out></p>

    <form action="StudyController?user=theUser" method="post">


        <c:if test="${study.getAnswer1() !=null && study.getAnswer1() !='null'}">
            <div class="radio">
                <input type="radio" name="number" value="<c:out value="${study.getAnswer1()}"></c:out>" required><c:out value="${study.getAnswer1()}"></c:out>
            </div>
        </c:if>
        <c:if test="${study.getAnswer2() !=null && study.getAnswer2() !='null'}">
            <div class="radio">
                <input type="radio" name="number" value="<c:out value="${study.getAnswer2()}"></c:out>"required><c:out value="${study.getAnswer2()}"></c:out>
            </div>
        </c:if>
        <c:if test="${study.getAnswer3() !=null && study.getAnswer3() !='null'}">
            <div class="radio">
                <input type="radio" name="number" value="<c:out value="${study.getAnswer3()}"></c:out>" required><c:out value="${study.getAnswer3()}"></c:out>
            </div>
        </c:if>
        <c:if test="${study.getAnswer4() !=null&& study.getAnswer4() !='null'}">
            <div class="radio">
                <input type="radio" name="number" value="<c:out value="${study.getAnswer4()}"></c:out>" required><c:out value="${study.getAnswer4()}"></c:out>
            </div>
        </c:if>
        <c:if test="${study.getAnswer5() !=null && study.getAnswer5() !='null'}">
            <div class="radio">
                <input type="radio" name="number" value="<c:out value="${study.getAnswer5()}"></c:out>" required><c:out value="${study.getAnswer5()}"></c:out>
            </div>
        </c:if>   
        <%-- Code to submit the Rating  --%>

        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-4">
                <span>
                    <input type="hidden" name="studycode" value="<c:out value="${study.getStudyCode()}"></c:out>"> 
                    <input type="hidden" name="questionID" value="<c:out value="${study.getQuestionID()}"></c:out>">
                    <input type="hidden" name="action" value="answer"> 

                    <input type="submit" value="Submit" name="submit" />

                </span>

            </div>
        </div>
        <br/><br/><br/>   
    </form>

    </c:if>
    </section>

<%-- Include tag is used to import footer page --%>
<%@ include file="footer.jsp" %>