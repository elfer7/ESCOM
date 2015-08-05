package FILES;

import WAD.XMLRead;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;

public class Files {
    public ArrayList<String> getXMLFiles(String path){
        File dir = new File(path);
        ArrayList<String> names = new ArrayList<>();
        File[] files =dir.listFiles(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith(".xml");
            }
        });
        for (File file : files) {
            names.add(file.getName());
        }
    return names;
    }
    
    public ArrayList<String> getDTDFiles(String path){
        File dir = new File(path);
        ArrayList<String> names = new ArrayList<>();
        File[] files =dir.listFiles(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith(".dtd");
            }
        });
        for (File file : files) {
            names.add(file.getName());
        }
    return names;
    }
    
    public void BindFiles(String xml, String dtd, String dir){
        String path = dir +"\\"+xml;
        ArrayList<String> content = new ArrayList<>();
        File xmlFile = new File(path);
        
        try {
            BufferedReader BR = new BufferedReader(new FileReader(xmlFile));
            while(BR.ready()){
                content.add(BR.readLine());
            }
            BR.close();
        }catch(IOException  ex){}
        
        if(!content.get(1).startsWith("<!DOCTYPE")){
            try{
                xmlFile.delete();
                xmlFile.createNewFile();
                XMLRead reader = new XMLRead();
                String rootNode = reader.rootNode(path);
                BufferedWriter BW = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(xmlFile,true), "utf-8"));
                for(String line : content){
                    if(line.startsWith("<?")){
                        BW.write(line, 0, line.length());
                        BW.write("\n<!DOCTYPE "+rootNode+" SYSTEM \""+dir+"\\"+dtd+"\">\n");
                    }else BW.write(line, 0, line.length());
                    BW.flush();
                }
                BW.close();
            }catch(IOException ex){}
        }
    }
    public static void main(String []args ){
        Files f = new Files();
        f.BindFiles("dtdd.xml", "dtdd.dtd", "C:\\Users\\zack\\Documents\\NetBeansProjects\\XMLG");
    }
}
