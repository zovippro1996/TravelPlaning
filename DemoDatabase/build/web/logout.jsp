<%
   
    
session.setAttribute("username", null);
session.invalidate();
Cookie[] cookies=request.getCookies();

//if (cookies != null) {
//    
//     for (Cookie cookie : cookies) {
//         if (cookie.getName().equals("cookieLoginUser")) {
//           cookie.setMaxAge(0);
//           response.addCookie(cookie);
//       }
//       if (cookie.getName().equals("cookieRealUser")) {
//            cookie.setMaxAge(0);
//           response.addCookie(cookie);
//       }
response.sendRedirect("index.jsp");
%>