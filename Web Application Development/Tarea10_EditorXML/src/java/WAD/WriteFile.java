package WAD;

import java.io.*;

public class WriteFile {
    public void write(String path, String content, String ext){
        try {
            File f = new File(path+"."+ext);
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(f)));
            writer.write(content, 0, content.length());
            writer.flush();
            writer.close();
        }catch(IOException ex){}
    }
//    public static void main(String [ ]args){
//        WriteFile wr = new WriteFile();
//        wr.write("newfile", "content", "txt");
//    }
}
