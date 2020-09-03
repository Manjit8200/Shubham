<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Add Product</title>

<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/admin/img/favicon.ico">

<!-- fonts -->
<link href="<%=request.getContextPath() %>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- styles -->
<link href="<%=request.getContextPath() %>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<!-- -->
<link href="<%=request.getContextPath() %>/resources/admin/css/style.css" rel="stylesheet">

<!-- Responsive -->
<link href="<%=request.getContextPath() %>/resources/admin/css/responsive.css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/font-awesome-4.7.0/css/font-awesome.min.css">
<!-- Custom styles for this page -->
<link href="<%=request.getContextPath() %>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<script src="<%=request.getContextPath() %>/resources/admin/js/jquery.Jcrop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/jquery.Jcrop.css"	type="text/css" />


<script src="<%=request.getContextPath() %>/resources/admin/datetimepicker/js/jquery.min.js"></script>



<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/bootstrap-clockpicker.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.26.0/slimselect.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/slim-select/1.26.0/slimselect.min.css" rel="stylesheet"></link>

<link href="<%=request.getContextPath() %>/resources/admin/css/toastr.min.css" rel="stylesheet"><%-- 
<script src="<%=request.getContextPath() %>/resources/admin/js/slimselect.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/admin/css/slimselect.min.css" rel="stylesheet"></link> --%>
<script	src="<%=request.getContextPath()%>/resources/admin/js/angular.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/conf.js"></script>
<script	src="<%=request.getContextPath()%>/resources/admin/js/controller/product.js"></script>

	<script src="<%=request.getContextPath() %>/resources/admin/js/jquery.Jcrop.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/admin/css/jquery.Jcrop.css"	type="text/css" />
	
<style>
input[type=number] {
  -moz-appearance: textfield;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>

</head>

<body id="page-top" ng-app="prc" ng-controller="ProductCtrl">
<form name="myForm">
										<input type="hidden" name="x" id="valuex" ng-model="valuex" />
										<input type="hidden" name="y" id="valuey" ng-model="valuey" />
										<input type="hidden" name="w" id="valuew" ng-model="valuew" />
										<input type="hidden" name="h" id="valueh" ng-model="valueh" />
									</form>
<form name="myForm1">
										<input type="hidden" name="x1" id="valuex1" ng-model="valuex1" />
										<input type="hidden" name="y1" id="valuey1" ng-model="valuey1" />
										<input type="hidden" name="w1" id="valuew1" ng-model="valuew1" />
										<input type="hidden" name="h1" id="valueh1" ng-model="valueh1" />
									</form>									

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Sidebar -->
			<!--/Left Navigation START-->
			<%@include file="left-nav.jsp" %>
			<!--/Left Navigation END-->
		<!-- End of Sidebar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">



				<!-- Topbar -->
				
				<%@include file="header.jsp" %>
				
				<!-- End of Topbar -->




				<div class="container-fluid">

					<!-- Content Row -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardExample" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExample" ng-click="formreset()">
									<h6 class="m-0 font-weight-bold text-light">Add Product Details
									</h6>
								</a>
								<!-- Card Content - Collapse  class="collapse"-->
								<div class="collapse hide"  id="collapseCardExample">
									<div class="card-body">

			<!--  -->	

									<form class=""  id="myFormProduct">

							
								   <div class="form-group row">
 						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Category Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="tenure_year" id="entitlement"  ng-change="setflag() || getAllBillingGroup()" ng-model="product.category_id">
													<option value="" selected> Select Category </option>
											<option ng-repeat="item in getAllCategoryNameList" value="{{item.category_id}}">{{item.category_name}}</option> 
										
													
									</select>

							</div>
							<p class="errormsg" ng-show="category_idError == 1">{{category_idMsg}}</p>
						</div>

										
								
						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Sub-Category Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="sub_category_id" id="sub_category_id" ng-change="setflag()" ng-model="product.sub_category_id">
													<option value="" selected> Select Sub-Category </option>
													<option ng-repeat="items in getAllSubCategory" value="{{items.sub_category_id}}">{{items.sub_category_name}}</option>
													
									</select>

							</div>
							<p class="errormsg" ng-show="sub_category_namecodeError == 1">{{sub_category_nameMsg}}</p>
						</div>
						
						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Type Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="type_id" id="type_id" ng-change="setflag()" ng-model="product.type_id">
													<option value="" selected> Select Type  </option>
										<option ng-repeat="item1 in getAlltype" value="{{item1.type_id}}">{{item1.type_name}}</option> 
																				
									</select>
							</div>
							<p class="errormsg" ng-show="type_idcodeError == 1">{{type_idMsg}}</p>
						</div>
								
							
									
								</div>

								<div class="row form-group">
										
									<div class="col-lg-3"  >
									    	<label>Product Title <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Product Title" ng-change="setflag()" ng-model="product.product_name" id="product_name" name="product_name" type="text">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
									<div class="col-lg-2">
									    	<label>Product Code  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Product Code" ng-change="setflag()" ng-model="product.product_code" id="product_code" name="product_code" type="text">
											<p class="errormsg" ng-show="product_codeError == 1">{{product_codeMsg}}</p>
										</div>
						
										
										<div class="col-lg-2"  >
									    	<label>Product Size<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Product Size" ng-change="setflag()" ng-model="product.product_hsncode" id="product_hsncode" name="product_hsncode" type="text">
											<p class="errormsg" ng-show="product_hsncodecodeError == 1">{{product_hsncodeMsg}}</p>
										</div>
										<div class="col-lg-5">
									    	<label>Description </label> 
											<input class="form-control" placeholder="Enter Description" ng-model="product.product_desc" id="product_desc"  name="product_desc" type="text">
										
										</div>
										
								</div>
						 <hr>		
					<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Price Details </h3>
							</div>
											
								<div class="row form-group">
										
									
										
										<div class="col-lg-2"  >
									    	<label> Product Cost per item<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Purchase Product Price" ng-change="calculationProduct()" ng-model="product.product_cost" id="product_cost" name="product_cost" type="number">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
										
										<div class="col-lg-2"  >
									    	<label>Margin <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Product Margin" ng-change="calculationProduct()" ng-model="product.product_margin" id="product_margin" name="product_margin" type="number">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
										
										<div class="col-lg-2"  >
									    	<label>Profit<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Product Profit" ng-change="calculationProduct()" ng-model="product.product_profit" id="product_profit" name="product_name" type="number">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
									<div class="col-lg-2"  >
									    	<label> Discount<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder=" Product Discount" ng-change="calculationProduct()" ng-model="product.product_discount" id="product_discount" name="product_discount" type="number">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
										<div class="col-lg-2"  >
									    	<label> Selling Price<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Product Discount" ng-change="calculationProduct()"  ng-model="product.product_selling" id="product_selling" name="product_selling" type="number">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
								</div>
								
										
									
									
								 <hr>
					<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> QUANTITY </h3>
							</div>	
								<div class="row">	  
								<div class="col-lg-3">
									    	<label>Available </label> 
											<input class="form-control" placeholder="Enter Available Product" ng-model="product.product_available" id="product_available"  name="product_available" type="number">
										
										</div>	 
										
										<div class="col-md-2">
													<div class="form-group"><br>
														<a ng-click="addProductData() " class="btn btn-primary" style="color:white;">Add Product</a>
													</div>
											</div>	
											
											</div> 
								<hr>
						<div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;"> Product Images </h3>
							</div>		
									
							<div class="form-group row">

  									    <div class="col-lg-3 " >
									    	<label>Product Sequence <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Product Squence" ng-model="product_sequence" id="product_sequence"  name="product_squence" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										 <div class="col-lg-3 " >
									    	<label>Product Number <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Product Number" ng-model="Secertcode" id="Secertcode"  name="Secertcode" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
			
				<div class="col-lg-3">
									<div class="form-group">
										<label> Image <font style="color: red;">*</font></label>
										<input type="file" id="imageadd" name="imageadd" ng-model="product_image" class="form-control" style="height:40px"><br>
										
									</div>
				</div>
					<div class="col-md-2">
													<div class="form-group"><br> <!--  addProductImages() -->
														<a ng-click="addRow()" class="btn btn-primary" style="color:white;">Add Images</a>
													</div>
											</div>	
	    
					<div class="row text-center">
								<div class="col-md-12"  id="t1">
									<img src="" id="target" />
									
								</div>
							</div>
					
										
							</div>	 
							
									<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr>
															<th style="width: 5%">#</th>
															<th style="width: 35%">Product Number </th>															
															<th style="width: 35%">Product sequence</th>					
															<th class="text-center">Del.</th>
														</tr>
													</thead>

													<tbody > 
	
														<tr ng-repeat="items in productRegister">
															<td style="width: 5%">{{$index + 1}}</td>
															<td style="width: 25%">{{items.product_sequence}} </td>
															
															<td style="width: 25%">{{items.Secertcode}}</td>
														
														
														<td>
														<a ng-click="removeAlbumImageRow(items.product_squence)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" title="Delete"></i>
														</a>	
													</td>
														</tr>

													
													</tbody>
												</table>
											</div>
										</div>
									</div>				
								
											<div class="form-group row" style="margin-top:15px;">

												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit" ng-click="addproductImage()" class="btn btn-md btn-success btn-block">
														Submit </button>
												</div>

											</div>



										</form>


									</div>
								</div>
							</div>

						</div>
					</div>
				</div>



				<div class="container-fluid">
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<!-- Collapsable Card Example -->
							<div class="card shadow mb-4">

								<!-- Card Header -->
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">All Products</h6>
								</div>




								<!-- Card Content -->
								<div class="card-body">

									<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr>
															<th style="width: 5%">#</th>
															<th style="width: 20%">Product </th>
															<th style="width: 20%">Category </th>
															
															<th style="width: 20%">Sub-Category Name</th>
															<th style="width: 20%">Type Name</th>
															
														
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody>

													<tr ng-repeat="item in getAllProductName">
															<td  style="width: 5%">{{$index+1 }}</td>
															<td data-toggle="modal" data-target="#myModal" ng-click="getProductName(item.product_id) || getProductTax(item.product_id)">{{item.product_name}} </td>
														
															<td  data-toggle="modal" data-target="#myModal" ng-click="getProductName(item.product_id) || getProductTax(item.product_id) " >{{item.category_name}}</td>
															
															<td data-toggle="modal" data-target="#myModal" ng-click="getProductName(item.product_id) || getProductTax(item.product_id) " >{{item.sub_category_name}}</td>
															<td data-toggle="modal" data-target="#myModal" ng-click="getProductName(item.product_id) || getProductTax(item.product_id) " >{{item.type_name}} </td>
														
														 	<td> <center>
														<a ng-click="deleteProduct(item.product_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" ></i>
														</a>	</center>
													</td>
														</tr>

													

													
													</tbody>

												</table>
											</div>
										</div>
									</div>

									<hr class="mt-0">

									<div class="row">

										<div class="col-sm-12 col-md-5">
											<div class="hint-text">Showing <b>{{startindex+1}}-{{getActivityList.length+startindex}}</b> out of <b>{{allcounts.activityCount}}</b> entries</div>
										</div>

										<div class="col-sm-12 col-md-7 text-right">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dataTable_paginate">
												<ul class="pagination pull-right">
													<li class="paginate_button page-item previous disabled"
														id="dataTable_previous"><a href="#"
														aria-controls="dataTable" data-dt-idx="0" tabindex="0"
														class="page-link">Previous</a></li>
													<li class="paginate_button page-item active"><a
														href="#" aria-controls="dataTable" data-dt-idx="1"
														tabindex="0" class="page-link">{{currentPage+1}}</a></li>
													<li class="paginate_button page-item next"
														id="dataTable_next"><a href="#"
														aria-controls="dataTable" data-dt-idx="7" tabindex="0"
														class="page-link">Next</a></li>
												</ul>
											</div>
										</div>

									</div>


								</div>

							</div>

						</div>

					</div>
				</div>




			</div>
		
			<!--/#footer START-->
			<%@include file="footer.jsp" %>
			<!--/#footer END-->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

<!--/ ------------------------------------------------------------- Model PopUp-->
<div class="" >
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Edit Product Details</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							
							</div>
							<div class="modal-body">
								
					<form class="" ng-submit="editProductData(product_id)">

							
								   <div class="form-group row">
 						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Category Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="tenure_year" id="entitlement"  ng-change="setflag()" ng-model="product.category_id">
													<option value="" selected> Select Category </option>
											<option ng-repeat="item in getAllCategoryNameList" value="{{item.category_id}}">{{item.category_name}}</option> 
										
													
									</select>

							</div>
							<p class="errormsg" ng-show="category_idError == 1">{{category_idMsg}}</p>
						</div>

										
								
						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Sub-Category Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="sub_category_id" id="sub_category_id" ng-change="setflag()" ng-model="product.sub_category_id">
													<option value="" selected> Sub-Category </option>
													<option ng-repeat="items in getAllSubCategory" value="{{items.sub_category_id}}">{{items.sub_category_name}}</option>
													
									</select>

							</div>
							<p class="errormsg" ng-show="sub_category_namecodeError == 1">{{sub_category_nameMsg}}</p>
						</div>
						
						<div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
							<label>Type Name  <span class="errormsg">*</span></label>
							<div class="form-group input-group ">
								<select class="form-control"  name="type_id" id="type_id" ng-change="setflag()" ng-model="product.type_id">
													<option value="" selected> Select Type  </option>
										<option ng-repeat="item1 in getAlltype" value="{{item1.type_id}}">{{item1.type_name}}</option> 
																				
									</select>
							</div>
							<p class="errormsg" ng-show="type_idcodeError == 1">{{type_idMsg}}</p>
						</div>
					
									
								</div>

								<div class="row form-group">
										
									<div class="col-lg-3"  >
									    	<label>Product Title <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Enter Product Title" ng-change="setflag()" ng-model="product.product_name" id="product_name" name="product_name" type="text">
											<p class="errormsg" ng-show="product_nameError == 1">{{product_nameMsg}}</p>
										</div>
									<div class="col-lg-3">
									    	<label>Product Code  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Product Code" ng-change="setflag()" ng-model="product.product_code" id="product_code" name="product_code" type="text">
											<p class="errormsg" ng-show="product_codeError == 1">{{product_codeMsg}}</p>
										</div>
						
										
										<div class="col-lg-2"  >
									    	<label>HSN Code<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="HSN Code" ng-change="setflag()" ng-model="product.product_hsncode" id="product_hsncode" name="product_hsncode" type="text">
											<p class="errormsg" ng-show="product_hsncodecodeError == 1">{{product_hsncodeMsg}}</p>
										</div>
										<div class="col-lg-4">
									    	<label>Description </label> 
											<input class="form-control" placeholder="Enter Description" ng-model="product.product_desc" id="product_desc"  name="product_desc" type="text">
										
										</div>
										
								</div>
											
								<div class="row form-group">
										
									<div class="col-lg-4"  >
									    	<label>Price <span class="errormsg">*</span></label> 
											<select class="form-control"  name="price_type" id="price_type"  ng-change="setflag()" ng-model="product.price_type">
													<option value="" selected> Select price   </option>
													<option value="1"> Inclusive</option>
													<option value="2"> Exclusive</option>
																					
									</select>
											<p class="errormsg" ng-show="price_typecodeError == 1">{{price_typeMsg}}</p>
										</div>
									<div class="col-lg-4">
									    	<label>Subscription  <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Subscription  " ng-change="setflag()" ng-model="product.subscription" id="subscription" name="subscription" type="number">
											<p class="errormsg" ng-show="subscriptioncodeError == 1">{{subscriptionMsg}}</p>
										</div>
						<div class="col-lg-4"  >
									    	<label>Non Subscription<span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Non Subscription " ng-change="setflag()" ng-model="product.non_subscription" id="totalAmount" type="number">
											<p class="errormsg" style="white-space:nowrap;"ng-show="non_subscriptionError == 1">{{non_subscriptionMsg}}</p>
										</div>
										
										
								</div>
								<div class="row form-group">
								
										<div class="col-lg-4">
									    	<label>Guest <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Guest Amount" ng-change="setflag()" ng-model="product.guest" id="guest" name="guest" type="number">
											<p class="errormsg" ng-show="guestError == 1">{{guestMsg}}</p>
										</div>
										<div class="col-lg-4">
									    	<label>Visitor <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Visitor Amount" ng-change="setflag()" ng-model="product.visitor" id="visitor" name="visitor" type="number">
											<p class="errormsg" ng-show="visitorError == 1">{{visitorMsg}}</p>
										</div>
									</div>	
										  
										  
										  
										  <div class="box-header with-border card shadow mb-4" style="padding-top:15px;background-color: #f8f9fc;">
									<h3 class="box-title" style="color:#4A2818;">Product Images</h3>
							</div>
 										
 									<div class="form-group row">

  									    <div class="col-lg-3 " >
									    	<label>Product Sequence <span class="errormsg">*</span></label> 
											<input class="form-control" placeholder="Product Squence" ng-model="product_sequence" id="product_sequence"  name="product_squence" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										<div class="col-lg-3"  >
									    	<label>Product Number<span class="errormsg">*</span></label> 
												<input class="form-control" placeholder="Product Number" ng-model="Secertcode" id="Secertcode"  name="Secertcode" type="number">
											<p class="errormsg" ng-show="courseTitleError == 1">{{courseTitleMsg}}</p>
										</div>
										
										<div class="col-lg-3">
									<div class="form-group">
										<label> Image <font style="color: red;">*</font></label>
										<input type="file" id="imageadd1" name="imageadd1" ng-model="product_image1" class="form-control" style="height:40px"><br>
										
									</div>
				</div>
										  
  											<div class="col-md-2">
													<div class="form-group"><br>
														<a ng-click="addProductImages(product_id) "  class="btn btn-primary" style="color:white;"><span class="fa fa-plus" style="font-size: 14px;"></span>&nbsp;Add Images</a>
													</div>
											</div>	
										
							</div>	 
								<div class="row text-center">
								<div class="col-md-12"  id="t2">
									<img src="" id="target1" />
									
								</div>
							</div>
									<div class="row">

										<div class="col-sm-12 col-md-12">
											<div class="table-responsive">
												<table class="table table-bordered" id="dataTable"
													width="100%" cellspacing="0">

													<thead>
														<tr>
															<th style="width: 5%">#</th>
															<th style="width: 35%">Tax Name </th>
															
															<th style="width: 35%">Tax Value</th>
														
															
														
															<th class="text-center">Del.</th>
														</tr>
													</thead>


													<tbody>

														<tr ng-repeat="item4 in productTax" >
														
															<td style="width: 5%">{{$index + 1}}</td>
															<td style="width: 25%"> {{item4.tax_type_name}} </td>
															
															<td style="width: 25%"> {{item4.tax_value}} </td>
															
														 	<td> <center>
														<a ng-click="deleteProductTax(item4.product_tax_id)" style="cursor: pointer;" class="btn btn-danger">
															<i class="fa fa-trash" style="color:white;" aria-hidden="true" data-toggle="tooltip" ></i>
														</a>	</center></td>
														</tr>

													
													</tbody>

												</table>
											</div>
										</div>
									</div>		
										<div class="form-group row" style="margin-top:15px;">

												<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
													<button type="submit"  class="btn btn-md btn-success btn-block">
														Update  </button>
												</div>

											</div>



										</form>


					</div>
						
								
								
								</div>
											
						</div>
					</div>
				</div>
		



<!-- Bootstrap  JavaScript-->
	<!--<script src="vendor/jquery/jquery.min.js"></script>-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core  JavaScript-->
	<script src="<%=request.getContextPath() %>/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<%-- <script src="<%=request.getContextPath() %>/resources/admin/js/main.js"></script> --%>

	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/sb-admin-2.min.js"></script>
	
	
	<script src="<%=request.getContextPath() %>/resources/admin/js/toastr.min.js"></script>

	<!--inputmask-->
	<script src="<%=request.getContextPath() %>/resources/admin/js/bootstrap-inputmask.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>


		<script>
			jQuery(function($) {
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							if ($('#target').data('Jcrop')) {
							    $('#target').data('Jcrop').destroy();
							    $('#target').removeAttr('style');
							}
							
							var u = URL.createObjectURL(input.files[0]);
						    var img = new Image;
						    img.onload = function() {
						        if(img.width < 300 || img.height < 300)
						        {
						        	alert("Minimum image size should be 300px X 300px");
						        	$('#target').attr('src', "");
						        	document.getElementById("imageadd").value = null;
						        }
						        else
						        {
						        	$('#target').css("min-height", "208px");
								    $('#target').css("min-width", "337px");
									
									$('#target').attr('src', e.target.result);
									$('#target').Jcrop({
										aspectRatio : 1/ 1,
										boxWidth : 500,
										//boxHeight : 400,
										minSize : [100, 100],
										maxSize : [2000, 2000],
										setSelect : [ 100, 100, 400, 400 ],
										onChange : setCoordinates,
										onSelect : setCoordinates
									});
						        }
						    };
						        
						    img.src = u;
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				$("#imageadd").change(function() {
					readURL(this);
				});
				$("#imageadd").click(function() {
					this.value = null;
				});
			});
			
			function setCoordinates(c) {
				document.myForm.x.value = Math.round(c.x);
				document.myForm.y.value = Math.round(c.y);
				document.myForm.w.value = Math.round(c.w);
				document.myForm.h.value = Math.round(c.h);
			};
			
			function checkCoordinates() {
				if (document.myForm.x.value == "" || document.myForm.y.value == "") {
					alert("Please select a crop region");
					return false;
				} else {
					return true;
				}
			};
		</script>		
		
			
			<!-- For Edit -->
<script>
			jQuery(function($) {
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							if ($('#target1').data('Jcrop')) {
							    $('#target1').data('Jcrop').destroy();
							    $('#target1').removeAttr('style');
							}
							
							var u = URL.createObjectURL(input.files[0]);
						    var img = new Image;
						    img.onload = function() {
						        if(img.width < 300 || img.height < 300)
						        {
						        	alert("Minimum image size should be 300px X 300px");
						        	$('#target1').attr('src', "");
						        	document.getElementById("imageadd1").value = null;
						        }
						        else
						        {
						        	$('#target1').css("min-height", "208px");
								    $('#target1').css("min-width", "337px");
									
									$('#target1').attr('src', e.target.result);
									$('#target1').Jcrop({
										aspectRatio : 1/ 1,
										boxWidth : 500,
										//boxHeight : 400,
										minSize : [200, 200],
										maxSize : [2000, 2000],
										setSelect : [ 100, 100, 400, 400 ],
										onChange : setCoordinates1,
										onSelect : setCoordinates1
									});
						        }
						    };
						        
						    img.src = u;
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				$("#imageadd1").change(function() {
					readURL(this);
				});
				$("#imageadd1").click(function() {
					this.value = null;
				});
			});
			
			function setCoordinates1(c) {
				document.myForm1.x1.value = Math.round(c.x);
				document.myForm1.y1.value = Math.round(c.y);
				document.myForm1.w1.value = Math.round(c.w);
				document.myForm1.h1.value = Math.round(c.h);
			};
			
			function checkCoordinates1() {
				if (document.myForm1.x1.value == "" || document.myForm1.y1.value == "") {
					alert("Please select a crop region");
					return false;
				} else {
					return true;
				}
			};
		</script>	
		
		
			
</body>

</html>