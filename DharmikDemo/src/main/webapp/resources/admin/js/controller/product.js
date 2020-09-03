app.controller('ProductCtrl', function($scope, $http, $window, $filter,
		$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;

	$scope.formreset = function(){
		
		document.getElementById("myFormProduct").reset();
		}
	//---------------------------------------------------getAllCategoryName
	var link = baseUrl+'getAllCategoryName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllCategoryNameList = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllCategoryNameList = "Response Fail";
	});
	
	//---------------------------------------------------getAllSubCategoryName	
var link = baseUrl+'getAllSubCategoryName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllSubCategory = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllSubCategory = "Response Fail";
	});
	
	//---------------------------------------------------getAllTypeName	
	var link = baseUrl+'getAllTypeName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAlltype = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAlltype = "Response Fail";
	});

	//---------------------------------------------------Add Tax Data	
	
	
	
	
	$scope.addProductData = function(){

		var link = baseUrl+'addProduct';	
	alert(link);
		$http({url: link, method: "POST", data: $scope.product}).success(function(data, status, headers, config) {
			$scope.product11 = data;	
			alert($scope.product11);
		//location.reload(true);
		 
			}).error(function(data, status, headers, config) {
				$scope.product11 = "Response Fail";
			});
		
		}
	
	//--------------------------------------------------- GET TAX ROW
	
	$scope.Taxtype = [];
	$scope.getTax = function(){

		
		for(var j=0;j<$scope.getAllMasterTax.length;j++){

	if($scope.getAllMasterTax[j].tax_type_id == $scope.tax_type){
		
		$scope.Taxtype.push({'tax_type_name':$scope.getAllMasterTax[j].tax_type_name,'tax_type':$scope.tax_type, 'tax_value':$scope.tax_value});		
			
	}
}
		$scope.tax_type="";
		$scope.tax_value="";
	}
	
	//----------------------------------------------------- Flag Function
	$scope.setflag = function(){
			
		$scope.category_idError = 0;
			$scope.sub_category_namecodeError = 0;	
			$scope.type_idcodeError = 0;
			$scope.billing_group_idcodeError = 0
			$scope.product_nameError = 0;
			$scope.product_codeError = 0;		
			$scope.product_hsncodecodeError = 0;			
			$scope.price_typecodeError = 0;	
			$scope.subscriptioncodeError = 0;	
			$scope.non_subscriptionError = 0;		
			$scope.guestError = 0;		
			$scope.visitorError = 0;		
			$scope.location_idError = 0;
			
		
			
			}

	
	var link = baseUrl+'getAllProductName';  
	
	$http.get(link).success(function(data, status, headers, config) {
		$scope.getAllProductName = data;
		
	}).error(function(data, status, headers, config) {
		$scope.getAllProductName = "Response Fail";
	});
	  // =====================================================getProduct By Id=======================================================
	
	$scope.getProductName = function(product_id){
		
		var location = new SlimSelect({
			select: '#location_id',
			});
	
		var link = baseUrl+'getProductById?product_id='+product_id;		

		$http.get(link).success(function(data, status, headers, config) {		
			
			$scope.product = data;	
			$scope.product_id=product_id;
			
		//	console.log($scope.product.location_id);
			$scope.location_name = $scope.product.location_id.split(',');
			alert($scope.location_name);
		$scope.product.location_id="";
			for(var i = 0; i < $scope.location_name.length; i++){
				
				location.set($scope.location_name[i]); 
			}
			
			
		}).error(function(data, status, headers, config) {
			$scope.product = "Response Fail";
		});
		
	};
	
	  // =====================================================get Product Tax=======================================================
		
	$scope.getProductTax = function(product_id){
		
		var link = baseUrl+'getAllProductTaxName?product_id='+product_id;	
		
	
		$http.get(link).success(function(data, status, headers, config) {		
			$scope.product_id=product_id;
				
			$scope.productTax = data;	
			
		
			
		}).error(function(data, status, headers, config) {
			$scope.productTax = "Response Fail";
		});
		
	};
	
	
	$scope.editProductData = function(product_id){
	

		$scope.product.product_id=product_id;
		
		var link = baseUrl+'editProductName';	
		
		
		$http({url: link, method: "POST", data: $scope.product}).success(function(data, status, headers, config) {
	
			$scope.product_id=product_id;
			$scope.product = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.product = "Response Fail";
			});
		/*}*/
	};
	
	  // =====================================================deleteProduct=======================================================
		
	$scope.deleteProduct = function(product_id) {
		
		var link = baseUrl+'deleteProduct?product_id='+product_id;
		
		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.product_id=product_id;
			$scope.productt = data;			
		  location.reload(true); 
			}).error(function(data, status, headers, config) {
				$scope.productt = "Response Fail";
			});
	};
	
	   // =====================================================Get MAster Tax JS =======================================================

	var link = baseUrl+'getMasterTaxName';  
	
				$http.get(link).success(function(data, status, headers, config) {
					$scope.getAllMasterTax = data;
					
					
				}).error(function(data, status, headers, config) {
					$scope.getAllMasterTax = "Response Fail";
				});
				
	//--------------------------------------------------- GET TAX ROW
				
				$scope.Taxtype = [];
				$scope.getTax = function(){

					
					for(var j=0;j<$scope.getAllMasterTax.length;j++){

				if($scope.getAllMasterTax[j].tax_type_id == $scope.tax_type){
					
					$scope.Taxtype.push({'tax_type_name':$scope.getAllMasterTax[j].tax_type_name,'tax_type':$scope.tax_type, 'tax_value':$scope.tax_value});		
						
				}
			}
					$scope.tax_type="";
					$scope.tax_value="";
				}
				
	  // =====================================================InsertProductTax =======================================================
	
	$scope.InsertProductTax = function(product_id) {
	
		var link = baseUrl+'InsertProductTax?product_id='+product_id+'&tax_type='+$scope.tax_type+'&tax_value='+$scope.tax_value;		
			
					$http.post(link).success(function(data, status, headers, config) {
						
						$scope.InsertProductTax11 = data;
						$scope.getProductTax(product_id);
						getProductTax(product_id);

					}).error(function(data, status, headers, config) {
						 $scope.InsertProductTax11 = "Response Fail";
					});
				
					
	}

	
	//--------------------------------------------------- Delete TAX ROW on Update Time
	$scope.deleteProductTax = function(product_tax_id) {
		
		var link = baseUrl+'deleteProductTax?product_tax_id='+product_tax_id;

		$http['delete'](link).success(function(data, status, headers, config) {
			$scope.deleteProductTax11 = data;	
			$scope.product_tax_id=product_tax_id;
		
			$scope.getProductTax($scope.product.product_id);
		
			}).error(function(data, status, headers, config) {
				$scope.deleteProductTax11 = "Response Fail";
			});
	};

//--------------------------------------------------- Delete TAX ROW
	
	$scope.removeRow = function(tax_type) {
		var index = -1;
		var comArr = eval( $scope.Taxtype);
	
		for( var i = 0; i < comArr.length; i++ ) {
		
			if( comArr[i].tax_type === tax_type ) {	
		
				index = i;
				break;
			}
		}
		if( index === -1 ) {
			alert( "Something gone wrong" );
		}
		$scope.Taxtype.splice(index, 1 );
	};
	
	

	

	
	$scope.calculationProduct = function(){
	


	$scope.product_cost= document.getElementById("product_cost").value ; 
	$scope.product_margin = document.getElementById("product_margin").value ;
	$scope.product_discount=document.getElementById("product_discount").value ; 
	$scope.product_profit = document.getElementById("product_profit").value ; 
	
	$scope.costMargin = ($scope.product_cost * $scope.product_margin)/100;
	
	document.getElementById("product_profit").value= $scope.costMargin ; 

	$scope.totalmargin =  $scope.productcost + $scope.costMargin;
	
	$scope.FinalDiscount = ($scope.totalmargin * $scope.product_discount )/100;
	 

	document.getElementById("product_selling").value =$scope.FinalDiscount;
	}
	



		$scope.addProductImages = function(){

			var valuex = document.getElementById("valuex1").value;
			var valuey = document.getElementById("valuey1").value;
			var valuew = document.getElementById("valuew1").value;
			var valueh = document.getElementById("valueh1").value;	
			alert(valuex);
		
			if(valuex == ''){
				valuex = 0;
			}
			if(valuey == ''){
				valuey = 0;
			}
			if(valuew == ''){
				valuew = 0;
			}
			if(valueh == ''){
				valueh = 0;
			}
			

	
			else {

				$scope.product.valuex = valuex;
				$scope.product.valuey = valuey;
				$scope.product.valuew = valuew;
				$scope.product.valueh = valueh;
				
		alert($scope.product.valueh);

				$scope.product.image=getDataUrl(document.getElementById("target1"));
				$scope.product.image = $scope.product.image.replace(/^data:image\/[a-z]+;base64,/, "");
		

				$scope.spin=1;
			
			var link = baseUrl+'addProductImage';	
			
		alert(link);
		
			$http({url: link, method: "POST", data:$scope.product}).success(function(data, status, headers, config) {
				$scope.LastMemberId = data;	
			
				$scope.spin=0;
			
			
				}).error(function(data, status, headers, config) {
					$scope.LastMemberId = "Response Fail";
					$scope.spin=0;
				});
			}

		}

		function getDataUrl(img) {
			   // Create canvas
			   const canvas = document.createElement('canvas');
			   const ctx = canvas.getContext('2d');
			   // Set width and height
			   canvas.width = img.width;
			   canvas.height = img.height;
			   // Draw the image
			   ctx.drawImage(img, 0, 0);
			   return canvas.toDataURL('image/jpeg');
			}
	
	
	<!--	var link = baseUrl+'getAllProductImages';  
	
		$http.get(link).success(function(data, status, headers, config) {
			$scope.getAllProductImage = data;
			
		}).error(function(data, status, headers, config) {
			$scope.getAllProductImage = "Response Fail";
		});
		-->
		
		//------------------------------------------------- 000000000000000000000000000000000-----------------------------------------

	 // =[2]===================================================== Family Details JS =======================================================

	
		$scope.productRegister=[];
	
		var formData=new FormData();
		$scope.addRow = function() {
		
			var valuex = document.getElementById("valuex").value;
			var valuey = document.getElementById("valuey").value;
			var valuew = document.getElementById("valuew").value;
			var valueh = document.getElementById("valueh").value;			
			
			if(valuex == ''){
				valuex = 0;
			}
			if(valuey == ''){
				valuey = 0;
			}
			if(valuew == ''){
				valuew = 0;
			}
			if(valueh == ''){
				valueh = 0;
			}
		
		else{
		
			$scope.productRegister.push({
			
				'product_sequence':$scope.product_sequence,
				'Secertcode':$scope.Secertcode, 
						
				'product_image':$scope.product_image, 
				
				'valuex':valuex,
				'valuey':valuey,
				'valuew':valuew,
				'valueh':valueh,
				
			
			});
			formData.append("image",imageadd.files[0]);
			
				$scope.product_sequence="";
				$scope.Secertcode="";
				$scope.product_image="";
			
				document.getElementById("target").src ="#";
				 $('#target').data('Jcrop').destroy();
				 document.getElementById("t1").innerHTML ="<img src='' id='target' >";
				
			
		}

			var i;
		$scope.addproductImage = function(){
			$scope.spin=1;
			
				for(i=0;i<$scope.productRegister.length;i++){
				var link = baseUrl+'addData?product_sequence='+$scope.productRegister[i].product_sequence+'&Secertcode='+$scope.productRegister[i].Secertcode+'&product_image='+$scope.productRegister[i].product_image+'&valuex='+$scope.productRegister[i].valuex+'&valuey='+$scope.productRegister[i].valuey+'&valuew='+$scope.productRegister[i].valuew+'&valueh='+$scope.productRegister[i].valueh+'&index='+i;		
			
	alert(link);
			
				$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) {
					return data;
				}}).success(function(data, status, headers, config) {
				
						$scope.addMasterMemberFamilyRegister = data;
						$scope.spin=0;
					
						 $scope.LastProductId =data;
					
					}).error(function(data, status, headers, config) {
						 $scope.LastProductId = "Response Fail";
					});
				
			} 

		}
		}	
});