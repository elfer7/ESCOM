<%@taglib uri="/WEB-INF/struts-html.dtd" prefix="html" %>
<!--
    URI: Identificador de recursos único.
        URL: Recursos accesibles vía red
        URN: No son accesibles vía red

    TLD: Tag Library Descriptor => Permite hacer mapeos (etiquetas personalizadas)
-->

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <html:base/>
    </head>
    <body>
        <html:form action="Subir" method="POST" enctype="multipart/form-data">
            <html:file property="archivo"></html:file>
            <html:submit value="Subir"></html:submit>
        </html:form>
    </body>
</html:html>
