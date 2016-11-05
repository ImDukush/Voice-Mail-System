<%@ page import="java.io.*" %>
<%!
    public String uploadFile(String folderToSave, String prefix, HttpServletRequest request) throws Exception {
        String fname = "";
        String content_Type = request.getContentType();
        if ((content_Type != null) && (content_Type.indexOf("multipart/form-data") >= 0)) {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                totalBytesRead += byteRead;
            }
            String file = new String(dataBytes);
            fname = file.substring(file.indexOf("filename=\"") + 10);
            fname = fname.substring(0, fname.indexOf("\n"));
            fname = fname.substring(fname.lastIndexOf("\\") + 1, fname.indexOf("\""));
            int lastIndex = content_Type.lastIndexOf("=");
            String boundary = content_Type.substring(lastIndex + 1, content_Type.length());
            int pos;

            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

            File f = new File(folderToSave);
            if (!f.exists()) {
                f.mkdir();
            }

            FileOutputStream fileOut = new FileOutputStream(folderToSave + "/" + prefix + fname);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();

        }
        return prefix + fname;
    }

    public void fileCopy(String ScrFolder, String FileName, String folderToSave) throws Exception {
        FileInputStream fis = new FileInputStream(ScrFolder + "/" + FileName);

        File f = new File(folderToSave);
        if (!f.exists()) {
            f.mkdir();
        }
        FileOutputStream fos = new FileOutputStream(folderToSave + "/" + FileName);
        while (fis.available() > 0) {
            fos.write(fis.read());
        }

        fos.close();
        fis.close();


    }
%>
