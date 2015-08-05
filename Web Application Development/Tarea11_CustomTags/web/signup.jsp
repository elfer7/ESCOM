<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
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
        <div >
            <% 
                String id = ""+(String) session.getAttribute("id");
                if(id.equals("null"))
                    out.println("The user dosen't exist");
            %>
        </div>
        <div>
            <form action="register.jsp" method="post">
                <fieldset style="width: 300px">
                    <legend style="color: #51a8cc; font-weight: bold;">Signup</legend>
                    <br>Username <input type="text" name="name" />
                    <br>Password <input type="password" name="pass" />
                    <br><input type="submit" value="Send" />
                </fieldset>
                <br><html:link forward="succes" style="color:#557f8e">Home</html:link>
            </form>
        </div>
    </body>
</html>
