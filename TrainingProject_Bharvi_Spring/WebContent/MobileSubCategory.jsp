<%@page import="com.techaspect.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.techaspect.dao.ProductDao"%>
<%@page import="com.techaspect.entity.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techaspect.entity.Customer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection,java.util.Iterator"%>
<% 	Customer customer = (Customer)session.getAttribute("CUSTOMERDATA");	 %>		
<%@ include file="HeaderCustomer.jsp" %>
<%
		if(customer == null){
			response.sendRedirect("index.jsp");
		}
	
		ProductDao productDao = ProductDao.getInstance();
		
		List<Product> productsList = productDao.getAllProducts();
		
		session.setAttribute("PRODUCTSLIST", productsList);
		
		


%>
<div id="content">
   <div class="container-fluid" style="min-height:750px">
      <div class="col-md-12 pt-3">
        <% if(session.getAttribute("success")!=null){ %>
      		<p class="alert alert-success"><%= session.getAttribute("success") %></p>
      	<% session.removeAttribute("success"); } %>
         <h3>Exclusive Offers</h3>
         <hr>
      </div>
      <div class="container">
		<div class="row">
            <div class="col-md-12">
               <div class="heading">
                  <h4>Exclusive Offers</h4>
               </div>
               <div class="row">
                  <img src="./Mobiles - Electronics_files/em1.jpg" style="width: 15em; margin-right: 5px; height: 250px;" class="rounded mx-auto d-block"> <img src="./Mobiles - Electronics_files/em2.jpg" style="width: 15em; margin-right: 5px; height: 250px;" class="rounded mx-auto d-block"> <img src="./Mobiles - Electronics_files/em3.jpg" style="width: 15em; margin-right: 5px; height: 250px;" class="rounded mx-auto d-block"> <img src="./Mobiles - Electronics_files/em4.jpg" style="width: 15em; margin-right: 5px; height: 250px;" class="rounded mx-auto d-block">
               </div>
               <br>
               <div class="row">
                  <img src="./Mobiles - Electronics_files/em5.jpg" style="width: 15em; margin-right: 5px; height: 250px;" class="rounded mx-auto d-block"> <img src="./Mobiles - Electronics_files/em6.jpg" style="width: 15em; margin-right: 5px; height: 250px;" class="rounded mx-auto d-block"> <img src="./Mobiles - Electronics_files/em7.jpg" style="width: 15em; margin-right: 5px; height: 250px;" class="rounded mx-auto d-block"> <img src="./Mobiles - Electronics_files/em8.jpg" style="width: 15em; margin-right: 5px; height: 250px;" class="rounded mx-auto d-block">
               </div>
               <br>
            </div>
         </div>
      </div>
      <br>
      <div class="row">
         <div class="col-md-12">
            <h3>Most Viewed</h3>
            <hr>
         </div>
      </div>
      <div id="demo" class="carousel slide" data-ride="carousel">
         <!-- THE SLIDESHOW -->
         <div class="carousel-inner">
            <!-- SLIDE 1 -->
            <div class="carousel-item active" id="menu">
               <div class="row mt-2">
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body p-1" style="height:200px">
                           <img src="images/oppoF9.jpg" alt="product2"  height="200px" width="250px">
                        </div>
                        <div class="p-2">
                           <h6 class="text-primary mt-2">Samsung S9</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/appleX.jpg" alt="product2"  height="200px" width="250px">
                        </div>
                        <div class="p-2">
                           <h6 class="text-primary mt-2">OppoF9</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/redmiNote5pro.jpg" alt="product2"  height="200px" width="250px">
                        </div>
                        <div class="p-2">
                           <h6 class="text-primary mt-2">Nokia 6</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/appleX.jpg" alt="product2"  height="200px" width="250px">
                        </div>
                        <div class="p-2">
                           <h6 class="text-primary mt-2">Apple X</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/oppoF9.jpg" alt="product2" height="200px" width="250px">
                        </div>
                        <div class="p-2">
                           <h6 class="text-primary mt-2">Redmi Note 5 Pro</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center" >
                        <div class="card-body" style="height:200px">
                           <img src="images/redmiNote5pro.jpg" class="img-responsive" alt="product2" height="200px" width="250px">
                        </div>
                        <div class="p-2">
                           <h6 class="text-primary mt-2">One plus 6</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- SLIDE 2 -->		
            <div class="carousel-item" id="menu">
               <div class="row mt-2">
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/appleX.jpg" alt="product2" height="200px" width="250px">
                        </div>
                        <div>
                           <h6 class="text-primary mt-2">Samsung S9</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/samsung.jpg" alt="product2" height="200px" width="250px">
                        </div>
                        <div>
                           <h6 class="text-primary mt-2">OppoF9</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/appleX.jpg" alt="product2" height="200px" width="250px">
                        </div>
                        <div>
                           <h6 class="text-primary mt-2">Nokia 6</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/nokia6.jpg" alt="product2" height="200px" width="250px">
                        </div>
                        <div>
                           <h6 class="text-primary mt-2">Apple X</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/samsung.jpg" alt="product2" height="200px" width="250px">
                        </div>
                        <div>
                           <h6 class="text-primary mt-2">Redmi Note 5 Pro</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-2">
                     <div class="card text-center">
                        <div class="card-body" style="height:200px">
                           <img src="images/samsung.jpg" class="img-responsive" alt="product2" height="200px" width="250px">
                        </div>
                        <div>
                           <h6 class="text-primary mt-2">One plus 6</h6>
                           <span id="mostViewed">3GB RAM | 128GB ROM</span>
                           <span id="mostViewed">16MP + 16MP Dual Rear Camera</span>
                           <span id="mostViewed">16 MP Front Camera</span>
                           <p class="text-muted mt-3" style="font-size:12px">Now at &#x20B9;4000</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="fa fa-chevron-left text-dark"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="fa fa-chevron-right text-dark"></span>
            </a>
         </div>
      </div>
      <!-- MOST VIEWED CAROUSEL ENDS -->
      <div class="row mt-2">
         <div class="col-md-3 mt-5">
            <div class="heading ">
               <h5>Refine By</h5>
               <hr>
            </div>
            <div class="card">
               <div id="headingFour" role="tab" class="card-header">
                  <h5 class="mb-0">
                     <a data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour">Brand</a>
                  </h5>
               </div>
               <div id="collapseFour" role="tabpanel" aria-labelledby="headingFour" data-parent="#accordionTwo" class="collapse show">
                  <div class="card-body">
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        Samsung </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        Vivo </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        Oppo </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        Motorola </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        Nokia </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        Mi </label>
                     </div>
                  </div>
               </div>
            </div>
            <div class="card">
               <div id="headingFive" role="tab" class="card-header">
                  <h5 class="mb-0">
                     <a data-toggle="collapse" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive" class="collapsed">Price</a>
                  </h5>
               </div>
               <div id="collapseFive" role="tabpanel" aria-labelledby="headingFive" data-parent="#accordionTwo" class="collapse">
                  <div class="card-body">
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        Under $1000 </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        $1000 - $5000 </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        $5000 - $10000 </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        $10000 - $15000 </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        $15000 - $20000 </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        Above $20000 </label>
                     </div>
                  </div>
               </div>
            </div>
            <div class="card">
               <div id="headingSix" role="tab" class="card-header">
                  <h5 class="mb-0">
                     <a data-toggle="collapse" href="http://172.16.0.114:8080/trainingproject/Mobiles.html#collapseSix" aria-expanded="false" aria-controls="collapseSix" class="collapsed">Customer Rating</a>
                  </h5>
               </div>
               <div id="collapseSix" role="tabpanel" aria-labelledby="headingSix" data-parent="#accordionTwo" class="collapse">
                  <div class="card-body">
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> &amp; Up
                        </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> &amp; Up
                        </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> &amp; Up
                        </label>
                     </div>
                     <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1">
                        <label class="form-check-label" for="exampleRadios1">
                        <i class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> <i class="fa fa-star-o" aria-hidden="true"></i> &amp; Up
                        </label>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <br>
         <br>
         <div class="col-md-9 mt-5">
            <div class="heading">
               <h5>Explore All Mobiles</h5>
               <hr>
            </div>
            <div class="row products products-big pt-5">
   <% 
		for(Product product : productsList) {
			if(product.getSubcategory().equals("mobiles")) {
	%>
               <div class="col-lg-4 col-md-6">
                  <div class="product text-center">
                     <a href="http://172.16.0.114:8080/trainingproject/Product_Detail.html">
                        <div class="image"><img src="images/uploads/<%= product.getImage1() %>" alt="" class="img-fluid image1" style="height: 250px;"></div>
                        <div class="text">
                           <h3 class="h52"><%= product.getName() %></h3>
                           <p class="price">&#x20B9;<%= product.getPrice() %></p>
                           <div> <a href="addtocart?pid=<%= product.getId() %>&jsp=Mobile" class="btn btn-primary" style="background-color: #4fbfa8;color:#fff;border:none;border-radius: 0px;"><i class="fas fa-cart-arrow-down"></i>&nbsp;Add To Cart</a> <a href="ProductDescription.jsp?id=<%= product.getId() %>" class="btn btn-primary" style="background-color: #4fbfa8;color:#fff;border:none;border-radius: 0px;">More Info</a></div>
                        </div>
                     </a>
                  </div>
               </div>
       <% 	}
		}
		%>
            </div>
            <div class="pages">
               <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                  <ul class="pagination">
                     <li class="page-item"><a href="http://172.16.0.114:8080/trainingproject/Mobiles.html#" class="page-link"> <i class="fa fa-angle-double-left"></i></a></li>
                     <li class="page-item active"><a href="http://172.16.0.114:8080/trainingproject/Mobiles.html#" class="page-link">1</a></li>
                     <li class="page-item"><a href="http://172.16.0.114:8080/trainingproject/Mobiles.html#" class="page-link">2</a></li>
                     <li class="page-item"><a href="http://172.16.0.114:8080/trainingproject/Mobiles.html#" class="page-link">3</a></li>
                     <li class="page-item"><a href="http://172.16.0.114:8080/trainingproject/Mobiles.html#" class="page-link">4</a></li>
                     <li class="page-item"><a href="http://172.16.0.114:8080/trainingproject/Mobiles.html#" class="page-link">5</a></li>
                     <li class="page-item"><a href="http://172.16.0.114:8080/trainingproject/Mobiles.html#" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
                  </ul>
               </nav>
            </div>
         </div>
      </div>
   </div>
</div>
<%@ include file="footer.html" %>