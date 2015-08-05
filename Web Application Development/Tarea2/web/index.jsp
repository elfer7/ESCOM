<!DOCTYPE html>
<!--
    NOTAS: DESHABILITAR JS FIREFOX: ABOUT:CONFIG => javascript.enabled
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarea 2</title>
        <link rel="stylesheet" type="text/css" href="estilos.css">
    </head>
    <body>
        <h1>Tarea 2: No cookies</h1>
        <script type="text/javascript">
            document.write('<a class="js-habilitado" href="Prueba1?js=1">Iniciar (JS: habilitado)</a>');
            
            /*
            NOTA: AL DESHABILITAR LAS COOKIES TAMBIÉN SE DESHABILITA WEBSTORAGE
    
            Añadiendo un poco de seguridad...
            if(typeof(Storage) === "undefined")
            {
                window.alert("Navegador no compatible con sessionStorage...");
            }
            else
            {
                var objetoSesion = localStorage; // La información no se pierde cuando el usuario cierra la ventana o pestaña del web browser
                
                // Los objetos de WebStorage (LocalStorage y SessionStorage) siempre se almacenan como cadenas
                
                if(objetoSesion.peticiones)
                {
                    objetoSesion.setItem("peticiones", Number(objetoSesion.peticiones)+1);
                }
                else
                {
                    objetoSesion.setItem("peticiones", 1);
                }
                
                document.write("<br/><strong>Has realizado "+objetoSesion.peticiones+" peticiones al servidor</strong>");
            }
            */
        </script>
        <noscript>
            <a class="js-deshabilitado" href="Prueba1?js=0">Iniciar (JS: deshabilitado)</a>
        </noscript>
    </body>
</html>
