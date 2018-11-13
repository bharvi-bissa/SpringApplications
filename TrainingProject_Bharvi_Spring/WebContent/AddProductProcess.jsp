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
	String fileName1;
	String fileName2;
	String fileName3;
	String fileName4;
	String fileName5;
	String fileName[] = new String[5];
	ArrayList<Part> part = new ArrayList<Part>();
	
%>

<%
	String vendor_id = (String)session.getAttribute("vendor_id");
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver class found and loaded");
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
		
		stmt = con.createStatement();
		
		product_name = request.getParameter("product_name");
		product_price = request.getParameter("product_price");
		product_quantity = request.getParameter("product_quantity");
		product_description = request.getParameter("product_description");
		
		
		
	  	
		image1 = request.getPart("product_image1");
		image2 = request.getPart("product_image2");
		image3 = request.getPart("product_image3");
		image4 = request.getPart("product_image4");
		image5 = request.getPart("product_image5");
		
	 	
		/* Image Upload */
		
		ArrayList<Part> images = new ArrayList<Part>();
		images.add(image1);
		images.add(image2);
		images.add(image3);
		images.add(image4);
		images.add(image5);
		
		int i=0;
		
		for(Part part :images){
			if(part.getSize() != 0 ) {
				Random rand = new Random();
				Integer n =rand.nextInt(100000000)+1;
				String partHeader = part.getHeader("content-disposition");
							
			    for (String content : part.getHeader("content-disposition").split(";")) {
			    	
			        if (content.trim().startsWith("filename")) {
			        	
			            fileName[i] = n.toString()+content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			            System.out.println(fileName[i]);
			            
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
			}
			i++;
		}
		for(int k=0;k<5;k++){
			if(fileName[k]==null){
				fileName[k]="default-img.png";
			}
		}
		String sql_insert_product = "INSERT INTO product_information(vendor_id,product_name,product_price,product_quantity,product_description,product_image1,product_image2,product_image3,product_image4,product_image5) VALUES('"+(String)session.getAttribute("vendor_id")+"','"+product_name+"','"+product_price+"','"+product_quantity+"','"+product_description+"','"+fileName[0]+"','"+fileName[1]+"','"+fileName[2]+"','"+fileName[3]+"','"+fileName[4]+"')";
		int ifInserted = stmt.executeUpdate(sql_insert_product);
		if(ifInserted !=0){
			response.sendRedirect("ProductList.jsp");
		}else{
			String error_insert_product = "Something went wrong";
			session.setAttribute("error_insert_product",error_insert_product);
			response.sendRedirect("AddNewProductForm.jsp");
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