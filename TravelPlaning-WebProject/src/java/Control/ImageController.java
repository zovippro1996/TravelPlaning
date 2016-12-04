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
import java.lang.invoke.MethodHandles.Lookup;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;



// Dropbox import
import com.dropbox.core.DbxAuthInfo;
import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.DbxWebAuth;
import com.dropbox.core.NetworkIOException;
import com.dropbox.core.RetryException;
import com.dropbox.core.json.JsonReader;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.DbxPathV2;
import com.dropbox.core.v2.files.CommitInfo;
import com.dropbox.core.v2.files.FileMetadata;
import com.dropbox.core.v2.files.UploadErrorException;
import com.dropbox.core.v2.files.UploadSessionCursor;
import com.dropbox.core.v2.files.UploadSessionFinishErrorException;
import com.dropbox.core.v2.files.UploadSessionLookupErrorException;
import com.dropbox.core.v2.files.UploadSessionOffsetError;
import com.dropbox.core.v2.files.WriteMode;
import java.io.FileInputStream;
import java.util.Date;
import javax.servlet.http.HttpSession;





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
        
        String command = request.getParameter("command");
        
         HttpSession session = request.getSession(true);
        
         DbxRequestConfig requestConfig = new DbxRequestConfig("tp-transfer-file");
        DbxClientV2 dbxClient = new DbxClientV2(requestConfig, ACCESS_TOKEN);
        
        if (command.equals("upload"))
        {
        // Temp upload directory
        String UPLOAD_DIRECTORY =  getServletContext().getRealPath("/") + "LocImage";
        
        
        
        // checks if the temp folder is created and create it if not
        
        File dir = new File(UPLOAD_DIRECTORY);
        
        if (!dir.exists())
        {
            dir.mkdir();
        }
        
        final PrintWriter writer = response.getWriter();
        
        
        final String locationName = request.getParameter("locname");
          final Part filePart = request.getPart("uploadFile");
            final String fileName = getFileName(filePart);
            
            
            System.out.println(getServletContext().getRealPath("/"));
            
            
 
            
            
            OutputStream out = null;
    InputStream filecontent = null;
    
   
    String fileType = FilenameUtils.getExtension(fileName);
    
    String tmpfilepath = UPLOAD_DIRECTORY + File.separator
               + locationName + "." + fileType;
    
 try {
        out = new FileOutputStream(new File(tmpfilepath));
        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out.write(bytes, 0, read);
        }
        writer.println("New file " + locationName + "." + fileType + " created at " + UPLOAD_DIRECTORY);
        LOGGER.log(Level.INFO, "File {0} being uploaded to {1}",
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
 
 
 
        // After upload image to temp directory, we upload it to dropbox
          // Create a DbxClientV2, which is what you use to make API calls.
       

        File tmpfile = new File(tmpfilepath);
        uploadFile(dbxClient,tmpfile, "/" + locationName + "." + fileType);
        
        }
        
        
        
        
        // For downloading image
        
        
        if (command.equals("download"))
        {
            String path = "/" + request.getParameter("Locname") + ".jpg";
            String imageurl = null;
            
            try {
                imageurl = GetTempLink(dbxClient, path);
            } catch (DbxException ex) {
                Logger.getLogger(ImageController.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            System.out.println(imageurl);
             session.setAttribute("imageurl", imageurl);
        request.getRequestDispatcher("/Location.jsp").forward(request, response);
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
    private static void uploadFile(DbxClientV2 dbxClient, File localFile, String dropboxPath) {
        try (InputStream in = new FileInputStream(localFile)) {
            FileMetadata metadata = dbxClient.files().uploadBuilder(dropboxPath)
                .withMode(WriteMode.ADD)
                .withClientModified(new Date(localFile.lastModified()))
                .uploadAndFinish(in);

            System.out.println(metadata.toStringMultiline());
        } catch (UploadErrorException ex) {
            System.err.println("Error uploading to Dropbox: " + ex.getMessage());
            System.exit(1);
        } catch (DbxException ex) {
            System.err.println("Error uploading to Dropbox: " + ex.getMessage());
            System.exit(1);
        } catch (IOException ex) {
            System.err.println("Error reading from file \"" + localFile + "\": " + ex.getMessage());
            System.exit(1);
        }
    }
    
    private static String GetTempLink (DbxClientV2 dbxClient, String dropboxPath) throws DbxException
    {
        
        
        String tmplink = dbxClient.files().getTemporaryLink(dropboxPath).getLink();
        
        
        return tmplink;
    }

}
