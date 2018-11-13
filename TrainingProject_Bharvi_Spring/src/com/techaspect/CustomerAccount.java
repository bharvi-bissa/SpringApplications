package com.techaspect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class CustomerAccount extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static boolean isStringEmpty(String input){
        if(input != null && input.length() == 0){
            return true;
        }
        return false;
    }
	
	 public void service(HttpServletRequest req,HttpServletResponse  res) throws ServletException,IOException{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		Connection con = null;
		Statement stmt_customer = null;
		Statement stmt_address = null;
		ResultSet rs_customer = null;
		ResultSet rs_address=null;
		
		String fname="";
		String lname = "";
		String contact = "";
		String email = "";
		String city = "";
		String gender = "";
		String zip = "";
		String country = "";
		String state = "";
		String address = "";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver class found and loaded");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
			
			stmt_customer = con.createStatement();
			stmt_address = con.createStatement();
			
			String sql = "SELECT * FROM customer_information WHERE cust_id=1";
			String addr_query = "SELECT * FROM address_information WHERE cust_id=1";
			
			rs_customer = stmt_customer.executeQuery(sql);
			rs_address = stmt_address.executeQuery(addr_query);
			
			rs_customer.next();
			
			
			
			 fname = rs_customer.getString("cust_fname");
			 lname = rs_customer.getString("cust_lname");
			 gender = rs_customer.getString("cust_gender");
			 email = rs_customer.getString("cust_email");
			 contact = rs_customer.getString("cust_contact");
			 
			if(isStringEmpty(contact)) {
				contact = "";
			}
			if(isStringEmpty(lname)) {
				lname = "";
			}
			 
			if (rs_address.next()) {
				country = rs_address.getString("add_country");
				city = rs_address.getString("add_city");
				zip = rs_address.getString("add_zip");
				state = rs_address.getString("add_state");
				address = rs_address.getString("add_address");
			}
			
			
		}catch(ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			try {
				if(rs_address !=null) {
					rs_address.close();
				}
				if(rs_customer !=null) {
					rs_customer.close();
				}
				if(stmt_customer !=null) {
					stmt_customer.close();
				}
				if(stmt_address !=null) {
					stmt_address.close();
				}
				if(con !=null) {
					con.close();
				}
			}catch(SQLException sqle) {
				sqle.printStackTrace();
			}
		}
		out.println("<!-- main-section starts -->\r\n" + 
				"	<div class=\"container\">\r\n" + 
				"		<div class=\"password_container\">\r\n" + 
				"		<h2 style=\"margin-top:2%;font-weight:initial;\">Change your personal details or password here.</h2>\r\n" + 
				"		<br><br>\r\n" + 
				"		<h3>CHANGE PASSWORD</h3>\r\n" + 
				"		<p>Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum</p>\r\n" + 
				"			<div class=\"row\">\r\n" + 
				"				<div class=\"col-md-9\">\r\n" + 
				"					<form action=\"ChangePassword\" method=\"post\">\r\n" + 
				"						<div class=\"row\">\r\n" + 
				"							<div class=\"col-md-4\">\r\n" + 
				"								<label for=\"pwd\">Old Password:</label>\r\n" + 
				"								<input type=\"password\" class=\"form-control\" id=\"pwd\" name=\"old_password\">\r\n" + 
				"							</div>\r\n" + 
				"						</div>	\r\n" + 
				"						<div class=\"row\">\r\n" + 
				"							<div class=\"col-md-4\">\r\n" + 
				"								<label for=\"pwd\">New Password:</label>\r\n" + 
				"								<input type=\"password\" class=\"form-control\" id=\"pwd\" name=\"\">\r\n" + 
				"							</div>\r\n" + 
				"						<div class=\"col-md-4\">\r\n" + 
				"							<label for=\"pwd\">Retype new Password:</label>\r\n" + 
				"							<input type=\"password\" class=\"form-control\" id=\"pwd\" name=\"new_password\">\r\n" + 
				"						</div>\r\n" + 
				"						</div>\r\n" + 
				"					<br>\r\n" + 
				"						<div class=\"row\">\r\n" + 
				"							<div class=\"col-md-3 center\">\r\n" + 
				"								<button type=\"submit\" class=\"btn btn-primary\"><i class=\"fas fa-user\"></i>&nbsp; SAVE NEW PASSWORD</button>\r\n" + 
				"							</div>\r\n" + 
				"						</div>\r\n" + 
				"					</form>\r\n" + 
				"					<hr>\r\n" + 
				"					<br><br>\r\n" + 
				"					<h2>PERSONAL DETAILS</h2>\r\n" + 
				"					<hr>\r\n" + 
				"					<form action=\"UpdateAccount\" method=\"post\">\r\n" + 
				"					<div class=\"row\">\r\n" + 
				"						<div class=\"col-md-4\">\r\n" + 
				"							<label for=\"firstname\">First Name</label>\r\n" + 
				"							<input type=\"text\" class=\"form-control\" id=\"\" name=\"fname\" value="+fname+">\r\n" + 
				"						</div>\r\n" + 
				"						<div class=\"col-md-5\">\r\n" + 
				"							<label for=\"lastname\">Last Name</label>\r\n" + 
				"							<input type=\"text\" class=\"form-control\" id=\"\" name=\"lname\" value="+lname+">\r\n" + 
				"						</div>\r\n" + 
				"					</div>\r\n" + 
				"					<br>\r\n" + 
				"					<div class=\"row\">\r\n" + 
				"						<div class=\"col-md-9\">\r\n" + 
				"							<label for=\"gender\">Gender:</label>\r\n" + 
				"							<div class=\"form-check\">\r\n" + 
				"							  <label class=\"form-check-label\">\r\n" + 
				"							    <input type=\"radio\" value=\"male\" class=\"form-check-input\" name=\"gender\">Male\r\n" + 
				"							  </label>\r\n" + 
				"							</div>\r\n" + 
				"							<div class=\"form-check\">\r\n" + 
				"							  <label class=\"form-check-label\">\r\n" + 
				"							    <input type=\"radio\" value=\"female\" class=\"form-check-input\" name=\"gender\">Female\r\n" + 
				"							  </label>\r\n" + 
				"							</div>\r\n" + 
				"							<div class=\"form-check\">\r\n" + 
				"							  <label class=\"form-check-label\">\r\n" + 
				"							    <input type=\"radio\" value=\"transgender\" class=\"form-check-input\" name=\"gender\">Transgender\r\n" + 
				"							  </label>\r\n" + 
				"							</div>\r\n" + 
				"						</div>\r\n" + 
				"					</div>\r\n" + 
				"					<br>\r\n" + 
				"					<div class=\"row\">\r\n" + 
				"						<div class=\"col-md-9\">\r\n" + 
				"							<label for=\"Address\">Address:</label>\r\n" + 
				"							<TextArea class=\"form-control\" name=\"address\" placeholder=>"+address+"</TextArea>\r\n" + 
				"						</div>\r\n" + 
				"					</div>\r\n" + 
				"					<br>\r\n" + 
				"					<div class=\"row\">\r\n" + 
				"						<div class=\"col-md-2\">\r\n" + 
				"							<label for=\"address\">City:</label>\r\n" + 
				"							<input type=\"text\" class=\"form-control\" id=\"\" name=\"city\" value="+city+">\r\n" + 
				"						</div>\r\n" + 
				"						<div class=\"col-md-2\">\r\n" + 
				"							<label for=\"address\">Zip:</label>\r\n" + 
				"							<input type=\"text\" class=\"form-control\" id=\"\" name=\"zip\" value="+zip+">\r\n" + 
				"						</div>\r\n" + 
				"						\r\n" + 
				"						<div class=\"col-md-3\">\r\n" + 
				"							<div class=\"form-group\">\r\n" + 
				"							  <label for=\"state\">State:</label>\r\n" + 
				"							  <select class=\"form-control\" id=\"\" name=\"state\" selected="+state+">\r\n" + 
				"							  	<option>Select State</option>\r\n" + 
				"							    <option>Rajasthan</option>\r\n" + 
				"							    <option>Gujarat</option>\r\n" + 
				"							    <option>Maharashtra</option>\r\n" + 
				"							    <option>Telangana</option>\r\n" + 
				"							  </select>\r\n" + 
				"							</div>\r\n" + 
				"						</div>\r\n" + 
				"						<div class=\"col-md-2.5\">\r\n" + 
				"							<div class=\"form-group\">\r\n" + 
				"							  <label for=\"state\">Country:</label>\r\n" + 
				"							  <select class=\"form-control\" id=\"\" name=\"country\" selected="+country+">\r\n" + 
				"							  	<option>Select Country</option>\r\n" + 
				"							    <option>India</option>\r\n" + 
				"							    <option>Europe</option>\r\n" + 
				"							    <option>Australia</option>\r\n" + 
				"							    <option>Africa</option>\r\n" + 
				"							  </select>\r\n" + 
				"							</div>\r\n" + 
				"						</div>\r\n" + 
				"					</div>\r\n" + 
				"					<div class=\"row\">\r\n" + 
				"						<div class=\"col-md-4\">\r\n" + 
				"							<label for=\"Contact\">Contact Number:</label>\r\n" + 
				"							<input type=\"text\" class=\"form-control\" id=\"\" name=\"contact\" value="+contact+">\r\n" + 
				"						</div>\r\n" + 
				"						<div class=\"col-md-5\">\r\n" + 
				"							<label for=\"email\">Email:</label>\r\n" + 
				"							<input type=\"text\" class=\"form-control\" id=\"\" name=\"email\" value="+email+">\r\n" + 
				"						</div>\r\n" + 
				"					</div>\r\n" + 
				"					<br>\r\n" + 
				"					<div class=\"row\">\r\n" + 
				"						<div class=\"col-md-9 center\">\r\n" + 
				"							<button type=\"submit\" class=\"btn btn-primary\" value=\"Send Message\"><i class=\"fas fa-user\"></i>&nbsp; SAVE CHANGES</button>\r\n" + 
				"						</div>\r\n" + 
				"					</div>\r\n" + 
				"					</form>\r\n" + 
				"				</div>\r\n" + 
				"				<div class=\"col-md-3 customer_section\">\r\n" + 
				"					<h4>CUSTOMER SECTION</h4>\r\n" + 
				"					<hr>\r\n" + 
				"					<ul>\r\n" + 
				"						<li><a href=\"\"><i class=\"fas fa-bars\"></i>&nbsp; My Orders</a></li>\r\n" + 
				"						<li><a href=\"\"><i class=\"fas fa-heart\"></i>&nbsp; My Wishlist</a></li>\r\n" + 
				"						<li><a href=\"\"><i class=\"fas fa-user\"></i>&nbsp; My Account</a></li>\r\n" + 
				"						<li><a href=\"\"><i class=\"fas fa-sign-out-alt\"></i>&nbsp; Logout</a></li>\r\n" + 
				"					</ul>\r\n" + 
				"				</div>\r\n" + 
				"			</div>		  \r\n" + 
				"		</div>\r\n" + 
				"	</div>\r\n" + 
				"	\r\n" + 
				"	<!-- main-section ends -->\r\n" + 
				"	\r\n" + 
				"	<!-- footer starts -->\r\n" + 
				"	<div class=\"footer\">\r\n" + 
				"		<div class=\"container\">\r\n" + 
				"			<div class=\"row\">\r\n" + 
				"				<div class=\"col-md-4\">\r\n" + 
				"					<h5>ABOUT US</h5>\r\n" + 
				"					<br>\r\n" + 
				"					<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</p>\r\n" + 
				"					<form class=\"form-inline\">\r\n" + 
				"						<input class=\"form-control form-control-sm\" type=\"search\"\r\n" + 
				"							placeholder=\"Search\" aria-label=\"Search\">\r\n" + 
				"						<button class=\"btn btn-success btn-sm\" type=\"submit\"><i class=\"fas fa-paper-plane\"></i></button>\r\n" + 
				"					</form>\r\n" + 
				"				</div>\r\n" + 
				"				<hr>\r\n" + 
				"				<div class=\"col-md-3 col-sm-4\">\r\n" + 
				"					<div class=\"blog-section\">\r\n" + 
				"						<h5>BLOG</h5>\r\n" + 
				"						<br>\r\n" + 
				"						<ul>\r\n" + 
				"							<li><a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/30x30\"></a> &nbsp Sample Link</li>\r\n" + 
				"							<br>\r\n" + 
				"							<li><a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/30x30\"></a> &nbsp Sample Link</li>\r\n" + 
				"							<br>\r\n" + 
				"							<li><a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/30x30\"></a> &nbsp Sample Link</li>\r\n" + 
				"						</ul>\r\n" + 
				"					</div>\r\n" + 
				"				</div>\r\n" + 
				"				<div class=\"col-md-3\">\r\n" + 
				"					<div class=\"contact-section\">\r\n" + 
				"						<h5>CONTACT</h5>\r\n" + 
				"						<br>\r\n" + 
				"						<ul>\r\n" + 
				"							<li>Sample Link</li>\r\n" + 
				"							<li>Sample Link</li>\r\n" + 
				"							<li>Sample Link</li>\r\n" + 
				"						</ul>\r\n" + 
				"						<button type=\"submit\" class=\"btn btn-primary btn-sm\">GO TO CONTACT PAGE</button>\r\n" + 
				"					</div>\r\n" + 
				"				</div>\r\n" + 
				"				<div class=\"col-md-2 col-sm-4\">\r\n" + 
				"					<div class=\"contact-section\">\r\n" + 
				"						<div class=\"row\" style=\"padding-bottom:2px;\">\r\n" + 
				"							<div class=\"col-md-4 col-sm-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"							<div class=\"col-md-4 col-sm-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"							<div class=\"col-md-4 col-sm-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"							<br>\r\n" + 
				"							<br>\r\n" + 
				"							<br>\r\n" + 
				"							<div class=\"col-md-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"							<div class=\"col-md-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"							<div class=\"col-md-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"							<br>\r\n" + 
				"							<br>\r\n" + 
				"							<br>\r\n" + 
				"							<div class=\"col-md-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"							<div class=\"col-md-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"							<div class=\"col-md-4\">\r\n" + 
				"								<a href=\"https://placeholder.com\"><img src=\"https://via.placeholder.com/50x50\"></a>\r\n" + 
				"							</div>\r\n" + 
				"						</div>\r\n" + 
				"					</div>\r\n" + 
				"				</div>\r\n" + 
				"			</div>\r\n" + 
				"		</div>\r\n" + 
				"	</div>\r\n" + 
				"	<div class=\"container-fluid\">\r\n" + 
				"		<div class=\"row\">\r\n" + 
				"			<div class=\"col-md-12 center\" style=\"background:#333333;color:#fff;height:auto;line-height:100px;\">\r\n" + 
				"				<p>copyright  &copy 2018 TechAspect Solutions Pvt. Ltd. </p>\r\n" + 
				"			</div>\r\n" + 
				"		</div>\r\n" + 
				"	</div>\r\n" + 
				"	<!-- footer ends -->\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"	<script src=\"js/jquery-3.3.1.js\"></script>\r\n" + 
				"	<script src=\"js/bootstrap.js\"></script>\r\n" + 
				"	\r\n" + 
				"</body>\r\n" + 
				"</html>");
		
		
		
	}
}
