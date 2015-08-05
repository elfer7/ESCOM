package EP;

import WAD.dbConnection;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import java.util.*;

public class Body extends BodyTagSupport
{
    dbConnection conn = new dbConnection();
    ArrayList<String> users = conn.getColumn("users", "name", "ID");
    
    @Override
    public int doEndTag() throws JspException
    {
       String bodyText = bodyContent.getString(); 
       StringBuffer tableOut = new StringBuffer();
       
       tableOut.append("<select name=\"userName\" id=\"users\" onchange=\""+bodyText+"\">");
       tableOut.append("\n");
       for(String name: users){
           tableOut.append("    <option>");
           tableOut.append(name);
           tableOut.append("</option>\n");
       }
      tableOut.append("</select>");

      try {
        pageContext.getOut().print(tableOut);
       }
       catch (Exception e) {
        throw new JspTagException(e.getMessage());
       }
       return EVAL_PAGE;
    }

}

