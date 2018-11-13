<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page import="java.sql.*" %>

<%!
	String product_name = "";
	String product_price = "";
	String product_quantity="";
	String product_description = "";
	Connection con = null;
	Statement stmt = null;
	Part image1,image2,image3,image4,image5; 
	
	String id="";
	
	ArrayList<Part> part = new ArrayList<Part>();
	
	
%>

<%
	String vendor_id = (String)session.getAttribute("vendor_id");
	String fileName[] = new String[5];	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
		
		stmt = con.createStatement();
		
		product_name = request.getParameter("product_name");
		product_price = request.getParameter("product_price");
		product_quantity = request.getParameter("product_quantity");
		product_description = request.getParameter("product_description");
		
		String[] imageNames = new String[6];
		
		for(int i=0,k=1;i<5;i++,k++){
			imageNames[i]=request.getParameter("img"+k);
			System.out.println("Images from form "+imageNames[i]);
		}
		
		image1 = request.getPart("product_image1");
		image2 = request.getPart("product_image2");
		image3 = request.getPart("product_image3");
		image4 = request.getPart("product_image4");
		image5 = request.getPart("product_image5");
		
		
		
	 	 id = (String)request.getParameter("id");
		
	 	 /* Image Upload */
		
		ArrayList<Part> images = new ArrayList<Part>();
		images.add(image1);
		images.add(image2);
		images.add(image3);
		images.add(image4);
		images.add(image5);
				
		
		int i=0;
		Random rand = new Random();
		Integer n = rand.nextInt(100000000)+1;
		
		for(Part part :images){
			
			if(part.getSize() != 0) {
				
				String partHeader = part.getHeader("content-disposition");
							
			    for (String content : part.getHeader("content-disposition").split(";")) {
			    	
			        if (content.trim().startsWith("filename")) {
			        	
			            fileName[i] = n.toString()+content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			            System.out.println("FileName at index:"+i+""+fileName[i]);
			            
			        }
			    }
			    
			    
			    FileOutputStream fos = null;
			    InputStream is = null;
			   
			    try {
			    	File file = new File("D:\\EclipseWorkspace\\TrainingProject_Bharvi\\WebContent\\images\\uploads" + File.separator + fileName[i]);
			        fos = new FileOutputStream(file);
			        is = part.getInputStream();
			
			        int read = 0;
			        final byte[] bytes = new byte[1024];
			
			        while((read = is.read(bytes)) != -1) {
			            fos.write(bytes, 0, read);
			        }
			        
			    } catch (FileNotFoundException fnfe) {
			        fnfe.printStackTrace();
			    } finally {
			        if (fos != null) {
			            fos.close();
			        }
			        if (is != null) {
			        	is.close();
			        }
			    }
			}else{
				fileName[i]=imageNames[i];
			}
			i++;
		}
		
		String sql_update_product = "UPDATE product_information SET product_name='"+product_name+"',product_price='"+product_price+"',product_quantity='"+product_quantity+"',product_description='"+product_description+"',product_image1='"+fileName[0]+"',product_image2='"+fileName[1]+"',product_image3='"+fileName[2]+"',product_image4='"+fileName[3]+"',product_image5='"+fileName[4]+"' WHERE product_id='"+id+"'";
		
		int ifInserted = stmt.executeUpdate(sql_update_product);
		if(ifInserted !=0){
			String success = "Product Updated";
			session.setAttribute("success",success);
			response.sendRedirect("ProductListServlet");
		}else{
			String error_insert_product = "Something went wrong";
			session.setAttribute("error_insert_product",error_insert_product);
			response.sendRedirect("ProductListServlet");
			}
	}catch(ClassNotFoundException cnfe) {
		cnfe.printStackTrace();
	}catch(SQLException sqle) {
		sqle.printStackTrace();
	}finally {
		try {
			if(stmt !=null) {
				stmt.close();
			}
			if(con !=null) {
				con.close();
			}
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}
	}

%>