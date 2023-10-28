package servlet;

import dao.EmployeeDAO;
import entity.Employee;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({
        "/employee/index",
        "/employee/create",
        "/employee/list",
        "/employee/update",
        "/employee/delete",
        "/employee/reset",
        "/employee/edit/*",
        "/employee/delete/*",

})
public class employeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public employeeServlet(){
    }
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String url = request.getRequestURL().toString();
        request.setCharacterEncoding("utf-8");
        Employee employee = null;
        if (url.contains(("delete"))) {
            EmployeeDAO dao = new EmployeeDAO();
            if ((request.getRequestDispatcher("id"))!=null){
                dao.remove(Integer.parseInt((request.getParameter("id"))));
                request.setAttribute("message", "Delete success!");
            }
            employee = new Employee();
            request.setAttribute("employee", employee);
        } else if (url.contains("edit")) {
            EmployeeDAO dao = new EmployeeDAO();
            if (request.getParameter("id")!= null){
                employee = dao.findById(Integer.parseInt((request.getParameter("id"))));
                request.setAttribute("employee", employee);
            }
        } else if (url.contains("reset")) {
            employee = new Employee();
            request.getRequestDispatcher("/views/employee.jsp").forward(request,response);

        }
        findAll(request,response);
        request.getRequestDispatcher("/views/employee.jsp").forward(request,response);
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            EmployeeDAO dao = new EmployeeDAO();
            List<Employee> list = dao.findAll();
            request.setAttribute("employees", list);
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error","Error: "+ e.getMessage() );
        }
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String url = request.getRequestURL().toString();
        request.setCharacterEncoding("utf-8");
        Employee employee = new Employee();
        if (url.contains("create")){
            create(request, response);
        } else if (url.contains("update")) {
            update(request, response);
        } else if (url.contains("delete")) {
            delete(request, response);
        } else if (url.contains("reset")) {
            request.setAttribute("employee", new Employee());
        }
        findAll(request, response);
        request.getRequestDispatcher("/views/employee.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        try {
            Employee employee = new Employee();
            BeanUtils.populate(employee, request.getParameterMap());
            EmployeeDAO dao = new EmployeeDAO();
            if (employee.getId()!=0)
                dao.remove(employee.getId());
            request.setAttribute("message", "Delete success!");
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        try {
            Employee employee = new Employee();
            BeanUtils.populate(employee, request.getParameterMap());
            EmployeeDAO dao = new EmployeeDAO();
            dao.update(employee);
            request.setAttribute("message", "Update success!");
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {

        try {
            Employee employee = new Employee();
            BeanUtils.populate(employee, request.getParameterMap());
            EmployeeDAO dao = new EmployeeDAO();
            dao.create(employee);
            request.setAttribute("message", "Create success!");

        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
    }
}
