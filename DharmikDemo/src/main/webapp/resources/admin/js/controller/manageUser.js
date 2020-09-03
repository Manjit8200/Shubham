app.controller('UserCtrl', function($scope, $http, $window, $filter,$location, $timeout) {
	var baseUrl = $location.protocol() + "://" + location.host + u;

	$scope.currentPage = 0;
	$scope.pageSize = 5;
	$scope.search = "";
	$scope.startindex = $scope.currentPage;
	$scope.pages = [5, 10, 20, 50, 100, 500,'All'];
	$scope.LastMemberId=0;

	
		//-------------------------------FamilyDetails	
		$scope.getUpdateFamilyMember11 = function(){
			
			var link = baseUrl+'getMemberFamilyId?member_id='+$scope.LastMemberId;

			$http.get(link).success(function(data, status, headers, config) {
				$scope.familymember = data;
				
			}).error(function(data, status, headers, config) {
				$scope.familymember = "Response Fail";
			});
			
		}
		
		//---{1.0}----------------------------------------------------- SQUEANCE -----------------------------------------------------------------------
		
		$scope.typeschange = function() {
			
			var link = baseUrl + 'getMasterMemberPlanType?plan_id='+$scope.masterMemberRegister.plan_id;			
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getlastmembersequence1 = data;
				
				if($scope.getlastmembersequence1.sequence == 0) {
					$scope.getLastSequence1 = 0;
				} else {
					$scope.getLastSequence1 = $scope.getlastmembersequence1.sequence;
				}			
			
				var familyplan = $scope.familyplan;
				var count =  $scope.getLastSequence1 + 1;
				var typemem;
				var family = "";
				var d = new Date();
				var n = d.getFullYear();
				if($scope.getlastmembersequence1.plan_type){
					typemem = $scope.getlastmembersequence1.plan_type;
				}else{
					typemem = "PRC";
				}
				typemem=typemem+n;
				
				if(count >= 0 && count <= 9) {
					family = typemem + "0000" + count;
					$scope.masterMemberRegister.membership_number = family;
				} else if(count >= 10 && count <= 99) {
					family = typemem+ "000" + count;
					$scope.masterMemberRegister.membership_number = family;
				} else if(count >= 100 && count <= 999) {
					family = typemem+ "00" + count;
					$scope.masterMemberRegister.membership_number = family;
				} else if(count >= 1000 && count <= 9999) {
					family = typemem+ "0" + count;
					$scope.masterMemberRegister.membership_number = family;
				} else if(count >= 10000 && count <= 99999) {
					family = typemem + count;
					
					$scope.masterMemberRegister.membership_number = family;
				} else {
					$window.alert("Your membership number is not generated");
				}
				$scope.masterMemberRegister.sequence =count;
			}).error(function(data, status, headers, config) {
				$scope.getlastmembersequence1 = "Response Fail";
			});
		}
		
		
			
		
	$scope.typeschange11 = function() {
		var count1=0;
		var a = $scope.masterMemberRegister.membership_number;
			var link = baseUrl + 'getMasterMemberPlanType?plan_id='+$scope.masterMemberRegister.plan_id;			
			$http.get(link).success(function(data, status, headers, config) {
				$scope.getlastmembersequence1 = data;
				
				if($scope.getlastmembersequence1.sequence == 0) {
					$scope.getLastSequence1 = 0;
				} else {
					$scope.getLastSequence1 = $scope.getlastmembersequence1.sequence;
				}			
			
				var familyplan = $scope.familyplan;
				var count =  $scope.getLastSequence1 + 1;
				
				var typemem;
				count1++;
				var family = "";
				var d = new Date();
				var n = d.getFullYear();
				if($scope.getlastmembersequence1.plan_type){
					typemem = $scope.getlastmembersequence1.plan_type;
				}else{
					typemem = "PRC";
				}
				typemem=typemem+n;
				
				if(count >= 0 && count <= 9) {
					family = a +'F'+count1;
					$scope.family_membership_no = family;
					
				} else if(count >= 10 && count <= 99) {
					family = a +'F'+count1;
					$scope.family_membership_no = family;
					
				} else if(count >= 100 && count <= 999) {
					family = a +'F'+count1;
					$scope.family_membership_no= family;
					
				} else if(counmasterMemberRegister.membership_numbert >= 1000 && count <= 9999) {
					family = a +'F'+count1;
					$scope.family_membership_no = family;
					
				} else if(count >= 10000 && count <= 99999) {
					family = family + count1;
					
					$scope.family_membership_no = family;
				} else {
					$window.alert("Your membership number is not generated");
				}
				
				
			}).error(function(data, status, headers, config) {
				$scope.getlastmembersequence1 = "Response Fail";
			});
		}
//---{1.2}------------------------------------------------------ Set Flag Function Member User Detais---------------------------------------		
		
		$scope.setflag = function(){
			
			$scope.masterMemberRegisterplan_idError = 0;
			$scope.masterMemberRegistertenureyear = 0;
			$scope.masterMemberRegisterStartdateError = 0;
			$scope.masterMemberRegisterEnddateError = 0;
			$scope.masterMemberRegistermember_firstnameError = 0;
			$scope.masterMemberRegistermember_middlenameError = 0;
			$scope.masterMemberRegistermember_lastnameError = 0;
			$scope.masterMemberRegisteraddress_line_1Error = 0;
			$scope.masterMemberRegistermember_country_idError = 0;
			$scope.masterMemberRegistermember_state_idError = 0;
			$scope.masterMemberRegistermember_cityError = 0;
			$scope.masterMemberRegisterpincodeError = 0;
			$scope.masterMemberRegistermember_mobile_noError = 0;
			$scope.masterMemberRegistermember_emailError = 0;
			$scope.masterMemberRegisterpasswordError = 0;
		}
		

		
 // =[2]===================================================== Family Details JS =======================================================

	
		$scope.MemberFamilyRegister=[];
		

		$scope.count1=1;
		var formData=new FormData();
		$scope.addRow = function() {
			var valuex = document.getElementById("valuex1").value;
			var valuey = document.getElementById("valuey1").value;
			var valuew = document.getElementById("valuew1").value;
			var valueh = document.getElementById("valueh1").value;			
			
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
			var a = Product;
				$scope.family_membership_no = a +'F'+$scope.count1;
				
				$scope.count1++;
				
			$scope.MemberFamilyRegister.push({
				'family_membership_no':$scope.family_membership_no,
				'member_family_first_name':$scope.member_family_first_name, 
						
				'member_family_image':$scope.member_family_image, 
				
				'valuex':valuex,
				'valuey':valuey,
				'valuew':valuew,
				'valueh':valueh,
				
			
			});
			formData.append("image",imageadd1.files[0]);
				$scope.family_membership_no= a +'F'+$scope.count1;
			
				$scope.member_family_image="";
			
				document.getElementById("target1").src ="#";
				 $('#target1').data('Jcrop').destroy();
				 document.getElementById("t1").innerHTML ="<img src='' id='target1' >";
				
			
		}

			var i;
		$scope.addMasterMemberFamilyRegister = function(){
			$scope.spin=1;
				$scope.MemberFamilyRegister.member_id =$scope.MemberLastId;
				for(i=0;i<$scope.MemberFamilyRegister.length;i++){
				var link = baseUrl+'addData?family_membership_no='+$scope.MemberFamilyRegister[i].family_membership_no+'&member_family_first_name='+$scope.MemberFamilyRegister[i].member_family_first_name+'&member_family_middle_name='+$scope.MemberFamilyRegister[i].member_family_middle_name+'&member_family_last_name='+$scope.MemberFamilyRegister[i].member_family_last_name+'&member_family_gender='+$scope.MemberFamilyRegister[i].member_family_gender+'&member_family_type_of_relation='+$scope.MemberFamilyRegister[i].member_family_type_of_relation+'&member_family_date_of_birth='+$scope.MemberFamilyRegister[i].member_family_date_of_birth+'&member_family_blood_group='+$scope.MemberFamilyRegister[i].member_family_blood_group+'&member_family_blood_group='+$scope.MemberFamilyRegister[i].member_family_aadhar_number+'&member_family_image='+$scope.MemberFamilyRegister[i].member_family_image+'&member_family_email='+$scope.MemberFamilyRegister[i].member_family_email+'&member_family_mobile_no='+$scope.MemberFamilyRegister[i].member_family_mobile_no+'& member_family_phone='+$scope.MemberFamilyRegister[i].member_family_phone+'&member_family_password='+$scope.MemberFamilyRegister[i].member_family_password+'&member_family_address1='+$scope.MemberFamilyRegister[i].member_family_address1+'&member_family_address2='+$scope.MemberFamilyRegister[i].member_family_address2+'&member_family_address3='+$scope.MemberFamilyRegister[i].member_family_address3+'&member_family_pincode='+$scope.MemberFamilyRegister[i].member_family_pincode+'&member_family_coutry_id='+$scope.MemberFamilyRegister[i].member_family_coutry_id+'&member_family_state_id='+$scope.MemberFamilyRegister[i].member_family_state_id+'&member_family_city='+$scope.MemberFamilyRegister[i].member_family_city+'&member_id1=0&valuex='+$scope.MemberFamilyRegister[i].valuex+'&valuey='+$scope.MemberFamilyRegister[i].valuey+'&valuew='+$scope.MemberFamilyRegister[i].valuew+'&valueh='+$scope.MemberFamilyRegister[i].valueh+'&index='+i;		
			

			
				$http({method: 'POST', url: link, headers: {'Content-Type': undefined}, data: formData, transformRequest: function(data, headersGetterFunction) {
					return data;
				}}).success(function(data, status, headers, config) {
				
						$scope.addMasterMemberFamilyRegister = data;
						$scope.spin=0;
					
						 $scope.MemberLastId =data;
					$scope.getUpdateFamilyMember11();
					}).error(function(data, status, headers, config) {
						 $scope.MemberLastId = "Response Fail";
					});
				
			} 

		}
		}
		
		
			$scope.setflag1 = function(){
					$scope.masterMemberRegistermember_family_first_nameError = 0;
					$scope.masterMemberRegistermember_family_middle_nameError = 0;
					$scope.masterMemberRegistermember_family_last_nameError = 0;
					$scope.masterMemberRegistermember_family_address1Error = 0;
					$scope.masterMemberRegistermember_family_coutry_idError = 0;
					$scope.masterMemberRegistermember_family_state_idError = 0;
					$scope.masterMemberRegistermember_family_pincodeError = 0;
					$scope.masterMemberRegistermember_family_cityError = 0;
					$scope.masterMemberRegistermember_family_type_of_relationError = 0;
					$scope.masterMemberRegistermember_family_date_of_birthError = 0;
					$scope.masterMemberRegister.member_family_gender = 0;
					$scope.masterMemberRegistermember_family_blood_groupError = 0;
					$scope.masterMemberRegistermember_family_mobile_noError = 0;
					$scope.masterMemberRegistermember_family_emailError = 0;
					$scope.masterMemberRegistermember_family_passwordError = 0;
			}
				
	//====================================== Edit User ============================================
			
				$scope.getUpdateUser = function(member_id)
				{
					window.location.href = baseUrl+"managePrc/EditUser?member_id="+member_id;
					
				}
				
				//====================================== delete User ============================================
				
							
			$scope.deleteRegisterMember = function(member_id) {
		
		var link = baseUrl+'deleteMasterMemberRegister?member_id='+member_id;
	
		$http['delete'](link).success(function(data, status, headers, config) {
				$scope.masterMemberRegister= data;
				  location.reload(true); 
		 $scope.getUpdateFamilyMember($scope.member_id);
		

			}).error(function(data, status, headers, config) {
					$scope.masterMemberRegister = "Response Fail";
			});
	};	
	
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
	
	//--------------------------------------------------- Remove Family row
	
	$scope.removeAlbumImageRow = function(family_membership_no) {
		var index = -1;
		var comArr = eval( $scope.MemberFamilyRegister);

		for( var i = 0; i < comArr.length; i++ ) {
			if( comArr[i].family_membership_no === family_membership_no ) {	
				

				index = i;
				var a = $scope.masterMemberRegister.membership_number;	
				$scope.count1--;
				$scope.family_membership_no = a +'F'+$scope.count1;
				break;
			}
		}
		if( index === -1 ) {
			alert( "Something gone wrong" );
		}
		$scope.MemberFamilyRegister.splice(index, 1 );
		
	}	
});