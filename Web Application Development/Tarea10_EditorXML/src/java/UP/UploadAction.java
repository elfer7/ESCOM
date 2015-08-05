package UP;

import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

public class UploadAction extends org.apache.struts.action.Action {
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        UploadForm action = (UploadForm) form;
        FormFile file = action.getTheFile();
        byte[] b = file.getFileData();
        String nameFile = file.getFileName();
        String path = request.getServletContext().getRealPath("/");
        FileOutputStream FOS = new FileOutputStream(new File(path+"\\"+nameFile));
        FOS.write(b, 0, b.length);
        FOS.flush();
        FOS.close();
        return mapping.findForward("done");
    }
}
