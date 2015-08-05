<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.title"/></title>
        <style>
            div{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                width: 50%;
                color:  #11776e;
            }
            body{
                background-color:   #ebebeb;
            }
        </style>
        <html:base/>
    </head>
    <body>
        <div>
            <html:link forward="upload">Upload a file</html:link>               
            <html:link forward="bind">Bind files</html:link>
        </div>
        <div>
        Operation succes
        <html:link forward="welcome">HOME</html:link>
        </div>
    </body>
</html:html>
