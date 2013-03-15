package kr.pe.infoshop.util;

import java.io.File;
import java.util.ArrayList;

public class XPathUtil {
	
	public ArrayList listInDir(String path, String extention) {
		File dir = new File(path);
        if (!dir.isDirectory()) return null;
        File[] allList = dir.listFiles();
        ArrayList list = new ArrayList();
        String name = null;
        String ext = null;
        int extLength = extention.length();
        for (int i = 0; i < allList.length; i++) {
            if (allList[i].isDirectory()){
                list.addAll(listInDir(allList[i].getPath(), extention));
            }
            name = allList[i].getName();
            if (name.length()<=extLength) continue;
            ext = name.substring(name.length() - extLength, name.length());
            if (ext.equalsIgnoreCase(extention)||extention=="*")
                list.add(allList[i]);
        }
        return list;
	}

}
