/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import static com.dropbox.core.v2.files.CreateFolderError.path;
import com.dropbox.core.v2.files.FileMetadata;
import com.dropbox.core.v2.files.Metadata;
import com.dropbox.core.v2.files.UploadErrorException;
import com.dropbox.core.v2.files.WriteMode;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author CREAT10N
 */
public class UploadImage extends HttpServlet {

    // Dropbox access token
    private static final String ACCESS_TOKEN = "cKh3tEi-r1AAAAAAAAAKCWzcDYB7Sm2XAJaYkzxhdvq-viW81Uk22j7hgL3-6rFU";

    // Logger
    private final static Logger LOGGER = Logger.getLogger(ImageController.class.getCanonicalName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        
        DbxRequestConfig requestConfig = new DbxRequestConfig("tp-transfer-file");
        DbxClientV2 dbxClient = new DbxClientV2(requestConfig, ACCESS_TOKEN);

        String UPLOAD_DIRECTORY = getServletContext().getRealPath("/") + "LocImage";
        // checks if the temp folder is created and create it if not
        
        File dir = new File(UPLOAD_DIRECTORY);

        if (!dir.exists()) {
            dir.mkdir();
        }

        final String locationID = request.getParameter("locationID");
        final Part filePart = request.getPart("uploadFile");
        final String fileType = "png";
        
        String url = "view_location.jsp?LocationID=" + locationID;
        
        OutputStream out = null;
        InputStream filecontent = null;

        String tmpfilepath = UPLOAD_DIRECTORY + File.separator + "Loc" + locationID + "." + fileType;

        try {
            out = new FileOutputStream(new File(tmpfilepath));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            LOGGER.log(Level.INFO, "File {0} being uploaded to {1}", new Object[]{fileType, UPLOAD_DIRECTORY});
        } catch (FileNotFoundException fne) {
            PrintWriter printOut = response.getWriter();
            response.setContentType("text/html");
            printOut.println("<script type=\"text/javascript\">");
            printOut.println("alert('Problems during file upload.');");
            printOut.println("location = '" + url + "'");
            printOut.println("</script>");
            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", new Object[]{fne.getMessage()});
        } finally {
            if (out != null) {
                out.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
        }

        File tmpfile = new File(tmpfilepath);
        // delete old location picture before upload new one
        try {
            Metadata metadata = dbxClient.files().delete("/Location/Loc" + locationID + "." + fileType);
        } catch (DbxException ex) {
            Logger.getLogger(UploadImage.class.getName()).log(Level.SEVERE, null, ex);
        }

        // upload new location picture
        uploadFile(dbxClient, tmpfile, "/Location/Loc" + locationID + "." + fileType);

        response.sendRedirect(url);

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

    private static String GetTempLink(DbxClientV2 dbxClient, String dropboxPath) throws DbxException {

        String tmplink = dbxClient.files().getTemporaryLink(dropboxPath).getLink();

        return tmplink;
    }
}
