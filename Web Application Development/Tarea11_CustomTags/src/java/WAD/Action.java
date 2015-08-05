package WAD;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class Action extends org.apache.struts.action.Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        AF values = (AF)form;
        dbConnection conn = new dbConnection();
        String pass = values.getPass();
        String name = values.getName();
        String password = conn.getValue("users", "password", "name", name);
        
        if(password == null)
            return mapping.findForward("signup");
        else if(!pass.equals(password))
            return mapping.findForward("fail");
        else {
            HttpSession session = request.getSession();
            session.setAttribute("id", name);
            return mapping.findForward("succes");
            
        }
    }
}
