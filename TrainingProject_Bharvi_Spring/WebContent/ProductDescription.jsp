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
	int selectedProductId = Integer.parseInt(request.getParameter("id"));
    //List<Product> productsList = productDao.getAllProducts();
    
    List<Product> productsList = (List)session.getAttribute("PRODUCTSLIST");
    Product theProduct = new Product();
    for(Product product : productsList) {
		if(product.getId() == selectedProductId) {
			theProduct = product;
		}
	}
    
    
    
    
    %>
<div class="container">
    <div class="row">
        <div class="col-md-6 pt-5 text-center">
            <img alt="" src="images/uploads/<%= theProduct.getImage1() %>" height="100%" width="200px">
        </div>
        <div class="col-md-6 text-center pt-5">
            <hr class="mt-5">
            <h4><b>Available Colors</b></h4>
            <div class="form-group mt-2">
                <select name="subcategory" class=" form-control-sm">
                    <option value="mobiles" selected><b>Black</b></option>
                    <option value="mobiles">Mobiles</option>
                    <option value="healthcare">HealthCare & Appliances</option>
                    <option value="laptops">Laptops</option>
                    <option value="camera">Camera</option>
                    <option value="computer accessories">Computer Accessories</option>
                </select>
            </div>
            <h1 class="text-secondary">&#x20B9;25000</h1>
            <a href="addtocart?pid=<%= theProduct.getId() %>&jsp=Mobile" class="btn btn-primary mt-2" style="background:none ;color:#4fbfa8;border:1px solid #4fbfa8;"><i class="fas fa-cart-arrow-down"></i>&nbsp;Add To Cart</a>
            <hr class="mt-5">
            <a href=""><img alt="" src="images/uploads/<%= theProduct.getImage2() %>" height="100px" width="90px" class="mr-5 mt-5"></a>
            <a href=""><img alt="" src="images/uploads/<%= theProduct.getImage3() %>" height="100px" width="90px" class="mr-5 mt-5"></a>
            <a href=""><img alt="" src="images/uploads/<%= theProduct.getImage4() %>" height="100px" width="90px" class="mr-5 mt-5"></a>
            <a href=""><img alt="" src="images/uploads/<%= theProduct.getImage5() %>" height="100px" width="90px" class="mt-5"></a>
        </div>
    </div>
    <hr>
    <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle1() %></b></h5>
        <p><%= theProduct.getProdouctDescription1() %></p>
    </div >
   <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle2() %></b></h5>
        <p><%= theProduct.getProdouctDescription2() %></p>
    </div >
    <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle3() %></b></h5>
        <p><%= theProduct.getProdouctDescription3() %></p>
    </div >
   <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle4() %></b></h5>
        <p><%= theProduct.getProdouctDescription4() %></p>
    </div >
   <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle5() %></b></h5>
        <p><%= theProduct.getProdouctDescription5() %></p>
    </div >
   <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle6() %></b></h5>
        <p><%= theProduct.getProdouctDescription6() %></p>
    </div >
    <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle7() %></b></h5>
        <p><%= theProduct.getProdouctDescription7() %></p>
    </div >
      <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle8() %></b></h5>
        <p><%= theProduct.getProdouctDescription8() %></p>
    </div >
      <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle9() %></b></h5>
        <p><%= theProduct.getProdouctDescription9() %></p>
    </div >
      <div class="col-md-12 ">
        <h5><b><%= theProduct.getProductDescriptionTitle10() %></b></h5>
        <p><%= theProduct.getProdouctDescription10() %></p>
    </div >
    <hr>
    <div class="col-md-12 ">
        <h3 class=""><b>Specification</b></h3>
        <br>
        <h4>General</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">In The Box</th>
                    <td><%= theProduct.getBox() %></td>
                </tr>
                <tr>
                    <th scope="row">Model Number</th>
                    <td><%= theProduct.getModelNumber() %></td>
                </tr>
                <tr>
                    <th scope="row">Model Name</th>
                    <td><%= theProduct.getModelName() %></td>
                </tr>
                <tr>
                    <th scope="row">Color</th>
                    <td><%= theProduct.getModelColor() %></td>
                </tr>
                <tr>
                    <th scope="row">Browse Type</th>
                    <td><%= theProduct.getBrowseType() %></td>
                </tr>
                <tr>
                    <th scope="row">SIM Type</th>
                    <td><%= theProduct.getSimType() %></td>
                </tr>
                <tr>
                    <th scope="row">Touchscreen</th>
                    <td><%= theProduct.getTouchScreen()
                    %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- display features -->
    <div class="col-md-12 ">
        <h4 id="">Display Features</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Display Size</th>
                    <td><%= theProduct.getDisplaySize() %></td>
                </tr>
                <tr>
                    <th scope="row">Resolution</th>
                    <td><%= theProduct.getResolution() %></td>
                </tr>
                <tr>
                    <th scope="row">Resolution Type</th>
                    <td><%= theProduct.getResoType() %></td>
                <tr>
                    <th scope="row">Display Type</th>
                    <td><%= theProduct.getDisplayType() %></td>
                </tr>
                <tr>
                    <th scope="row">Display Colors</th>
                    <td><%= theProduct.getDisplayColors() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12 ">
        <h4 id="">OS & Processor Features</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Operating System</th>
                    <td><%= theProduct.getOs() %></td>
                </tr>
                <tr>
                    <th scope="row">Processor Type</th>
                    <td><%= theProduct.getProcessorType() %></td>
                </tr>
                <tr>
                    <th scope="row">Processor Core</th>
                    <td><%= theProduct.getProcessorCore() %></td>
                </tr>
                <tr>
                    <th scope="row">Primary Clock Speed</th>
                    <td><%= theProduct.getpClockspeed() %></td>
                </tr>
                <tr>
                    <th scope="row">Secondary Clock Speed</th>
                    <td><%= theProduct.getsClockspeed() %></td>
                </tr>
                <tr>
                    <th scope="row">Operating Frequency</th>
                    <td><%= theProduct.getOpFreq() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h4 id="subhead">Memory & Storage Features</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Internal Storage</th>
                    <td><%= theProduct.getInternalStorage() %></td>
                </tr>
                <tr>
                    <th scope="row">RAM</th>
                    <td><%= theProduct.getRam() %></td>
                </tr>
                <tr>
                    <th scope="row">Expandable Storage</th>
                    <td><%= theProduct.getExpStorage() %></td>
                </tr>
                <tr>
                    <th scope="row">Supported Memory Card Type</th>
                    <td><%= theProduct.getSuppMemCardType() %></td>
                </tr>
                <tr>
                    <th scope="row">Call Log Memory</th>
                    <td><%= theProduct.getCallLogMemory() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h4 id="subhead">Camera Features</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Primary Camera Available</th>
                    <td><%= theProduct.getpCameraAvailable() %></td>
                </tr>
                <tr>
                    <th scope="row">Primary Camera</th>
                    <td><%= theProduct.getpCamera() %></td>
                </tr>
                <tr>
                    <th scope="row">Primary Camera Features</th>
                    <td><%= theProduct.getpCameraFeatures() %></td>
                </tr>
                <tr>
                    <th scope="row">Secondary Camera Available</th>
                    <td><%= theProduct.getsCameraAvail() %></td>
                </tr>
                <tr>
                    <th scope="row">Secondary Camera Features</th>
                    <td><%= theProduct.getsCameraFeatures() %></td>
                </tr>
                <tr>
                    <th scope="row">Flash</th>
                    <td><%= theProduct.getFlash() %></td>
                </tr>
                <tr>
                    <th scope="row">HD Recording</th>
                    <td><%= theProduct.getHdRecording() %></td>
                </tr>
                <tr>
                    <th scope="row">Full HD Recording</th>
                    <td><%= theProduct.getFhdRecording() %></td>
                </tr>
                <tr>
                    <th scope="row">Video Recording</th>
                    <td><%= theProduct.getvRecording() %></td>
                </tr>
                <tr>
                    <th scope="row">Video Recording Resolution</th>
                    <td><%= theProduct.getVrResolution() %></td>
                </tr>
                <tr>
                    <th scope="row">Frame Rate</th>
                    <td><%= theProduct.getFrameRate() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h4 id="subhead">Call Features</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Phone Book</th>
                    <td><%= theProduct.getPhoneBook() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h4 id="subhead">Connectivity Features</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Network Type</th>
                    <td><%= theProduct.getNetworkType() %></td>
                </tr>
                <tr>
                    <th scope="row">Supported Network</th>
                    <td><%= theProduct.getSuppNetworks() %></td>
                </tr>
                <tr>
                    <th scope="row">Internet Connectivity</th>
                    <td><%= theProduct.getiConn() %></td>
                </tr>
                <tr>
                    <th scope="row">3G</th>
                    <td><%= theProduct.getThreeG() %></td>
                </tr>
                <tr>
                    <th scope="row">GPRS</th>
                    <td><%= theProduct.getGprs() %></td>
                </tr>
                <tr>
                    <th scope="row">Pre Installed Browser</th>
                    <td><%= theProduct.getPreInstalledBrowser() %></td>
                </tr>
                <tr>
                    <th scope="row">Bluetooth Support</th>
                    <td><%= theProduct.getBluetoothSupp() %></td>
                </tr>
                <tr>
                    <th scope="row">Bluetooth Version</th>
                    <td><%= theProduct.getBluetoothVer() %></td>
                </tr>
                <tr>
                    <th scope="row">Wi-Fi</th>
                    <td><%= theProduct.getWifi() %></td>
                </tr>
                <tr>
                    <th scope="row">Wi-Fi Version</th>
                    <td><%= theProduct.getWifiVer() %></td>
                </tr>
                <tr>
                    <th scope="row">NFC</th>
                    <td><%= theProduct.getNfc() %></td>
                </tr>
                <tr>
                    <th scope="row">USB Connectivity</th>
                    <td><%= theProduct.getUsbConn() %></td>
                </tr>
                <tr>
                    <th scope="row">Audio Jack</th>
                    <td><%= theProduct.getAudioJack() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h4 id="subhead">Other Details</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Smart Phone</th>
                    <td><%= theProduct.getSmartPhone() %></td>
                </tr>
                <tr>
                    <th scope="row">SIM Size</th>
                    <td><%= theProduct.getSimSize() %></td>
                </tr>
                <tr>
                    <th scope="row">Removable Battery</th>
                    <td><%= theProduct.getRemoBattery() %></td>
                </tr>
                <tr>
                    <th scope="row">SMS</th>
                    <td><%= theProduct.getSms() %></td>
                </tr>
                <tr>
                    <th scope="row">Sensors</th>
                    <td><%= theProduct.getSensors() %></td>
                </tr>
                <tr>
                    <th scope="row">Other Features</th>
                    <td><%= theProduct.getOtherFeatures() %></td>
                </tr>
                <tr>
                    <th scope="row">Important Apps</th>
                    <td><%= theProduct.getImpApps() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h4 id="subhead">Multimedia Features</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Audio Formats</th>
                    <td><%= theProduct.getAudioFormats() %></td>
                </tr>
                <tr>
                    <th scope="row">Video Formats</th>
                    <td><%= theProduct.getVideoFormats() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h4 id="subhead">Battery & Power Features</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Battery Capacity</th>
                    <td><%= theProduct.getBattCapacity() %></td>
                </tr>
                <tr>
                    <th scope="row">Battery Type</th>
                    <td><%= theProduct.getBattType() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h4 id="subhead">Dimensions</h4>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Width</th>
                    <td><%= theProduct.getWidth() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)</td>
                </tr>
                <tr>
                    <th scope="row">Height</th>
                    <td><%= theProduct.getHeight() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)</td>
                </tr>
                <tr>
                    <th scope="row">Depth</th>
                    <td><%= theProduct.getDepth() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(mm)</td>
                </tr>
                <tr>
                    <th scope="row">Weight</th>
                    <td><%= theProduct.getWeight()  %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(gm)</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-12">
        <h6 id="subhead">Warranty</h6>
        <table class="table table-bordered table-striped table-dark desctable">
            <tbody>
                <tr>
                    <th scope="row">Warranty Summary</th>
                    <td><%= theProduct.getWarrantySum() %></td>
                </tr>
            </tbody>
        </table>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-4">
            <h3><b>Rating & Reviews</b></h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <p class="font-weight-bold p-1">4.7 &nbsp;<span class="fa fa-star"></span></p>
            <p class="text-muted descriptionPara">15,754 Ratings & 9,783 Reviews</p>
        </div>
        <div class="col-md-2">
            <div class="progress mb-1">
                <p>5 &nbsp;<span class="fa fa-star">&nbsp;</span></p>
                </td>
                <div class="progress-bar bg-success" role="progressbar" style="width:20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">20%</div>
            </div>
            <div class="progress mb-1">
                <p>4 &nbsp;<span class="fa fa-star">&nbsp;</span></p>
                </td>
                <div class="progress-bar bg-success" role="progressbar" style="width:50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%</div>
            </div>
            <div class="progress mb-1">
                <p>3 &nbsp;<span class="fa fa-star">&nbsp;</span></p>
                </td>
                <div class="progress-bar bg-warning" role="progressbar" style="width:15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">15%</div>
            </div>
            <div class="progress mb-1">
                <p>2 &nbsp;<span class="fa fa-star">&nbsp;</span></p>
                </td>
                <div class="progress-bar bg-danger" role="progressbar" style="width:5%" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100">5%</div>
            </div>
            <div class="progress mb-1">
                <p>1 &nbsp;<span class="fa fa-star">&nbsp;</span></p>
                </td>
                <div class="progress-bar bg-warning" role="progressbar" style="width:10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">10%</div>
            </div>
        </div>
        <div class="col-md-2 offset-md-2">
            <button class="btn btn-primary">Rate this Product</button>
        </div>
    </div>
    <!-- PUBLIC REVIEWS -->
    <div class="row my-3">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body reviewer">
                    <p class="card-title font-weight-bold">Abhishek Dwivedi</p>
                    <p>	<i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <i class="far fa-star"></i>
                    </p>
                    <p class="text-secondary">September 16, 2018</p>
                    <p class="card-text">Nice phone with great specifications like 18MP + 12 MP front facing camera, really long battery life. Its worth to buy and Truly value for money</p>
                    <a href="#" class="card-link">Helpful</a>
                    <a href="#" class="card-link">Comment</a>
                    <a href="#" class="card-link">Report Abuse</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row my-3">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body reviewer">
                    <p class="card-title font-weight-bold">Naman Purwar</p>
                    <p><i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="far fa-star"></i>
                    </p>
                    <p class="text-secondary">September 16, 2018</p>
                    <p class="card-text">Nice phone with great specifications like 18MP + 12 MP front facing camera, really long battery life. Its worth to buy and Truly value for money</p>
                    <a href="#" class="card-link">Helpful</a>
                    <a href="#" class="card-link">Comment</a>
                    <a href="#" class="card-link">Report Abuse</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@ include file="footer.html" %>
