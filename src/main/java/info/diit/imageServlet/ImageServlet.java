package info.diit.imageServlet;

import info.diit.persistence.service.IUserService;

import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebServlet("/imageServlet")
public class ImageServlet extends HttpServlet{


	private static final long serialVersionUID = 338318547263436187L;
	
	@Autowired
	private IUserService iUserService;
	
	private DataSource dataSource;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	
	private WebApplicationContext springContext;

    @Override
    public void init(final ServletConfig config) throws ServletException {
        super.init(config);
        springContext = WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext());
        final AutowireCapableBeanFactory beanFactory = springContext.getAutowireCapableBeanFactory();
        beanFactory.autowireBean(this);
    }
    
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

			
			Long userId = iUserService.getUserId();
			
             System.out.println("Id in imageretirve="+userId);
            /*String connectionURL = "jdbc:mysql://localhost:3306/registration_02";
            String USER = "root";
            String PASS = "123";*/
            java.sql.Connection con=null;
            
            try{     
              Class.forName("com.mysql.jdbc.Driver");
             /* con = DriverManager.getConnection(connectionURL,USER,PASS); 
              Statement st1=con.createStatement();*/
              con = dataSource.getConnection();
              Statement st1=con.createStatement();
              ResultSet rs1 = st1.executeQuery("SELECT * FROM image where id='"+userId+"' ORDER BY id DESC LIMIT 1");
              System.out.println(rs1.toString());
              System.out.println("after query");
              String imgLen="";
              
              if(rs1.next()){
                System.out.println("in rs");
                imgLen = rs1.getString("thumbnail");
                System.out.println(imgLen.length());
              }else {
                  response.sendError(HttpServletResponse.SC_NOT_FOUND);
              }
              
              rs1 = st1.executeQuery("SELECT * FROM image where id='"+userId+"' ORDER BY id DESC LIMIT 1 ");
              if(rs1.next()){
                int len = imgLen.length();
                byte [] rb = new byte[len];
                InputStream readImg = rs1.getBinaryStream("thumbnail");
                
                int index=readImg.read(rb, 0, len); 
                System.out.println("index"+index);
                st1.close();
                 
                /*response.reset();*/
                response.setContentType("image/jpg");
                response.getOutputStream().write(rb,0,len);
                response.getOutputStream().flush();  
                }
            }
            
            
            
            catch (Exception e){
              e.printStackTrace();
            }
	}

}
