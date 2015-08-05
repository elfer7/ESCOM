package UP;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

public class UploadForm extends org.apache.struts.action.ActionForm {
    private FormFile theFile;

    public FormFile getTheFile() {
        return theFile;
    }

    public void setTheFile(FormFile theFile) {
        this.theFile = theFile;
    }
    
}
