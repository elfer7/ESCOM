package WAD;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jdom2.Document;         // |
import org.jdom2.Element;          // |\ Librerías
import org.jdom2.JDOMException;    // |/ JDOM
import org.jdom2.input.SAXBuilder; // |

public class XMLRead {
    public ArrayList cargarXml(String path){
    File arch = new File(path);
    SAXBuilder builder = new SAXBuilder();
    ArrayList palabras = new ArrayList();
        try{
            
            //Se crea el documento a traves del archivo
            Document document = (Document) builder.build( arch );

            //Se obtiene la raiz 'names'
            Element rootNode = document.getRootElement();

            //Se obtiene la lista de hijos de la raiz 'names'
            List list = rootNode.getChildren( "tag" );
            //System.out.println(list.size());

            //Se recorre la lista de hijos de 'names'
            for ( int i = 0; i < list.size(); i++ )
            {
                Element tabla = (Element) list.get(i);
                String nombre = tabla.getTextTrim();
                palabras.add(nombre);
                //System.out.println(palabras);
            }
        //System.out.println(palabras);
            
        }catch ( IOException | JDOMException ex){}
    return palabras;
    }
    
    public String rootNode(String path){
    File arch = new File(path);
    SAXBuilder builder = new SAXBuilder();
    String root = "";
        try{
            Document document = (Document) builder.build( arch );
            Element rootNode = document.getRootElement();
            root = rootNode.getName();
        }catch ( IOException | JDOMException ex){}
        return root;
    }
    /*public static void main(String[] args) throws JDOMException, IOException {
        XMLRead reader=new XMLRead();
        System.out.println(reader.rootNode("C:\\Users\\zack\\Documents\\NetBeansProjects\\XMLG\\att.xml"));
    }*/
    
}
