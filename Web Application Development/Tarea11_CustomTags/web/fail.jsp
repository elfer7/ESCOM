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
        <div>
            Wrong Username or Password<br>
            <br><html:link forward="login"> Login </html:link>
        </div>
    </body>
</html>
