/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CREAT10N
 */
public class CheckLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {    
         HttpSession session = request.getSession(true);
        Cookie[] cookies = request.getCookies();
        int check = 0;
        String username;
        for (Cookie c : cookies) {
            String name = c.getName();
            if (name.equals("username")) {
                username = c.getValue();
                 session.setAttribute("username",username );
                check++;
            } else if (name.equals("password")) {
                check++;
            }
        }
        if (check >= 1) {
            
            response.sendRedirect("sucess.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
