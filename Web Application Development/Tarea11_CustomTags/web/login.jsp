<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <title></title>
        <style>
            div{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                width: 25%;
                color: #e93446;
            }
            body{
                background-color: #efefef;
            }
        </style>
    </head>
    <body>
        <div>
            <%
            String id = ""+(String) session.getAttribute("id");
            if(!id.equals("null"))
                response.sendRedirect("succes.jsp");
            %>
            <html:form action="action.do">
                <fieldset style="width: 300px">
                    <legend style="color: #51a8cc; font-weight: bold;">Login</legend>
                    <br>Username <html:text property="name" />
                    <br>Password <html:password property="pass" />
                    <br><html:submit value="Send" />
                </fieldset>    
            </html:form>
        </div>
    </body>
</html:html>
