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
public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        Cookie name = new Cookie("username", request.getParameter("nameoremail"));
        Cookie pass = new Cookie("password", request.getParameter("password"));
        
        name.setMaxAge(60*60*24*7);
        pass.setMaxAge(60*60*24*7);

        response.addCookie(name);
        response.addCookie(pass);
        HttpSession session = request.getSession(true);
        session.setAttribute("username",request.getParameter("nameoremail") );
        response.sendRedirect("CheckLogin");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
