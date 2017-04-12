    <%--
    	Document: aboutl.jsp
    	Created On: Feb 4, 2016
    	Authors: Deepak Rohan, Abhishek

     --%>
    <%-- Include tag is used to import header page --%>
    <%@ include file="header.jsp" %>
    <%-- Code to display Page Name --%>
    <h3 id="page_name">Recommend to a friend</h3>
    <%-- Code to display Page Name --%>
   <a href="main.jsp?user=theUser" id="back_to_page">&laquo;Back to the Main Page</a>
    <%-- Section to input Contact details and Send Message --%>
    <section>
        <form id="recommend_form_id" class="col-sm-10 col-sm-offset-1 form-horizontal" action="UserController?user=theUser&action=recommendc" method="post">
        
        <div class="form-group">
            <label class="col-sm-4 control-label">Name *</label>
            <div class="col-sm-4">
            <input type="text" class="form-control" id="study_name" name="study_name" required />
            </div>
                </div>
            
            <div class="form-group">
            <label class="col-sm-4 control-label">Email *</label>
            <div class="col-sm-4">
            <input type="email" class="form-control" id="email" name="email" required/>
            </div>
                </div>
            
            <div class="form-group">
            <label class="col-sm-4 control-label">Friend's Email *</label>
            <div class="col-sm-4">
            <input type="email" class="form-control" id="friend_email" name="friend_email" required/>
            </div>
                </div>
            
            <div class="form-group">
            <label class="col-sm-4 control-label">Message *</label>
             <div class="col-sm-4"> 
            <textarea name="message" id="message" class="form-control" required></textarea>
            </div>
                </div>
            
            <div class="form-group">
            <div class="col-sm-offset-5 col-sm-4">
            <button id="recommend_form_button" type="submit"  class="btn btn-primary">Submit</button></div>
            </div>
        </form>
    </section> 
    <div class="col-sm-10 col-sm-offset-1">
    <p class="text-center">When your friend logs in and participates in one user study, you'll get 2 coins bonus</p>
    </div>
    <br><br><br><br>
    <%-- Include tag is used to import footer page --%>
    <%@ include file="footer.jsp" %>

