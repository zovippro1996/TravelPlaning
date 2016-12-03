/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Control;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;




/**
 *
 * @author Steven
 */


/**
 *
 * @author Steven
 */
@MultipartConfig
public class ImageController extends HttpServlet {
    
    // Dropbox access token
     private static final String ACCESS_TOKEN = "cKh3tEi-r1AAAAAAAAAKCWzcDYB7Sm2XAJaYkzxhdvq-viW81Uk22j7hgL3-6rFU";
     
       // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "/LocImage";
    
    
     // upload settings
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
    
    // Logger
      private final static Logger LOGGER =
            Logger.getLogger(ImageController.class.getCanonicalName());

     
    // Chunk size for network performance
//    private static final long CHUNKED_UPLOAD_CHUNK_SIZE = 8L << 20; // 8MiB
//    private static final int CHUNKED_UPLOAD_MAX_ATTEMPTS = 5;

    

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        // checks if the request actually contains upload file
        final PrintWriter writer = response.getWriter();
        
          final Part filePart = request.getPart("file");
            final String fileName = getFileName(filePart);
            
            
            OutputStream out = null;
    InputStream filecontent = null;
   
    
    
 try {
        out = new FileOutputStream(new File(UPLOAD_DIRECTORY + File.separator
                + fileName));
        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        writer.println("New file " + fileName + " created at " + UPLOAD_DIRECTORY);
        LOGGER.log(Level.INFO, "File{0}being uploaded to {1}",
                new Object[]{fileName, UPLOAD_DIRECTORY});
    } catch (FileNotFoundException fne) {
        writer.println("You either did not specify a file to upload or are "
                + "trying to upload a file to a protected or nonexistent "
                + "location.");
        writer.println("<br/> ERROR: " + fne.getMessage());

        LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                new Object[]{fne.getMessage()});
    } finally {
        if (out != null) {
            out.close();
        }
        if (filecontent != null) {
            filecontent.close();
        }
        if (writer != null) {
            writer.close();
        }
    }

    }
    

    
     /**
     * Utility method to get file name from HTTP header content-disposition
     */
  
 
    
    private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
    LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}
    
    
    
    
    
// Dropbox file upload method
//    private static void uploadFile(DbxClientV2 dbxClient, File localFile, String dropboxPath) {
//        try (InputStream in = new FileInputStream(localFile)) {
//            FileMetadata metadata = dbxClient.files().uploadBuilder(dropboxPath)
//                .withMode(WriteMode.ADD)
//                .withClientModified(new Date(localFile.lastModified()))
//                .uploadAndFinish(in);
//
//            System.out.println(metadata.toStringMultiline());
//        } catch (UploadErrorException ex) {
//            System.err.println("Error uploading to Dropbox: " + ex.getMessage());
//            System.exit(1);
//        } catch (DbxException ex) {
//            System.err.println("Error uploading to Dropbox: " + ex.getMessage());
//            System.exit(1);
//        } catch (IOException ex) {
//            System.err.println("Error reading from file \"" + localFile + "\": " + ex.getMessage());
//            System.exit(1);
//        }
//    }

}
