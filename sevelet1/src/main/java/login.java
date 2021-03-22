import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("userName");
        String password = request.getParameter("Password");
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        if("name".equals(username) && "tam".equals(password)){
            response.sendRedirect("/person");
        }else {
            request.setAttribute("error", "Invalid Username or Password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.include(request,response);
        }
        writer.println("</html>");

    }

}
