package project;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;
@MultipartConfig
public class regComp extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    String url = "jdbc:mysql://node421065-ianscd.j.layershift.co.uk:3306/db_project";
		String username="root";
		String password="RHHlqv55226";
	    Connection conn=null;
	    try {
			conn=DriverManager.getConnection(url, username, password);
			String q="INSERT INTO complaints VALUES(?,?,?)";
			PreparedStatement st=conn.prepareStatement(q);
			Random rnd = new Random();
		    int c_id = rnd.nextInt(99999);
		    String C_id="c"+c_id;
		    String type=request.getParameter("type");
		    String complaint=request.getParameter("complaint");
		    st.setString(1, C_id);
		    st.setString(2, type);
		    st.setString(3, complaint);
		    int i=st.executeUpdate();
		    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		response.sendRedirect("home.jsp");
	}

}
