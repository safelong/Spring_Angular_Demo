<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<style>
* {
	font-family: 'MICROSOFT YAHEI';
	margin: 0;
	padding: 0;
}

.odd {
	background: #E3EDCD;
}

.even {
	background: #eee;
}

.hover {
	background: #bdf3d4;
	color: #FFFFFF;
}

#testDiv {
	width: 900px;
	margin: 0px auto;
	padding: 15px 0px;
	border-top: 1px solid #bdf3d4;
	border-bottom: 1px solid #bdf3d4;
	text-align: center;
}

#testDiv table {
	margin: 10px auto;
}

#testDiv table thead {
	height: 30px;
	line-height: 30px;
	background: #DCE2F1;
}

#testDiv table thead tr td {
	height: 23px;
	padding: 2px 0;
}

#spanDiv {
	width: 100%;
}

.spanClass {
	color: #fff;
	background: #89D900;
	width: 35%;
	height: 18px;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	vertical-align: text-center;
	display: inline-block;
	cursor: pointer;
	font-size: 14px;
	font-weight: bold;
}

.banSpan {
	padding: 0 3px;
}

#operDiv,#formDiv {
	width: 900px;
	margin: 0px auto;
	padding: 10px 0 15px 0;
	border-bottom: 1px solid #bdf3d4;
	text-align: center;
}

#formDiv2 {
	display: none;
}

#formDiv table {
	margin: 8px auto;
}

#formDiv table tr td {
	height: 23px;
	padding: 2px 0;
}

.spanAddClass {
	color: #fff;
	background: #89D900;
	height: 25px;
	width: 100px;
	line-height: 25px;
	font-weight: bold;
	display: inline-block;
	text-align: center;
	cursor: pointer;
}

.fixClass {
	width: 137px;
	height: 22px;
	line-height: 20px;
}

.leftClass {
	text-align: left;
}

.errorClass {
	color: red;
	margin: 5px auto;
}
</style>
<link rel="stylesheet" href="resources/jqueryui/jquery-ui-1.10.4.css">
<script type="text/javascript" src="resources/jquery/jquery-2.1.0.js"></script>
<script type="text/javascript" src="resources/angular/angular.js"></script>
<script type="text/javascript"
	src="resources/jqueryui/jquery-ui-1.10.4.js"></script>
<script>
    var jq=$.noConflict();
</script>
<script type="text/javascript">
    var app = angular.module('Demo', [], angular.noop);
    app.directive('jqdatepicker', function () {
        return {
            restrict: 'A',
            require: 'ngModel',
             link: function (scope, element, attrs, ngModelCtrl) {
                element.datepicker({
                    dateFormat: 'yy-mm-dd',
                    onSelect: function (date) {
                        scope.user.hireDate = date;
                        scope.$apply();
                    }
                });
            }
        };
    });
    
   app.controller('UserCtrl', function ($scope,$http){
	    $http.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded';
		$http.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
		// Override $http service's default transformRequest
		$http.defaults.transformRequest = [function(data) {
			/**
			 * The workhorse; converts an object to x-www-form-urlencoded serialization.
			 * @param {Object} obj
			 * @return {String}
			 */
			var param = function(obj) {
				var query = '';
				var name, value, fullSubName, subName, subValue, innerObj, i;
				for (name in obj) {
					value = obj[name];
					if (value instanceof Array) {
						for (i = 0; i < value.length; ++i) {
							subValue = value[i];
							fullSubName = name + '[' + i + ']';
							innerObj = {};
							innerObj[fullSubName] = subValue;
							query += param(innerObj) + '&';
						}
					} else if (value instanceof Object) {
						for (subName in value) {
							subValue = value[subName];
							fullSubName = name + '[' + subName + ']';
							innerObj = {};
							innerObj[fullSubName] = subValue;
							query += param(innerObj) + '&';
						}
					} else if (value !== undefined && value !== null) {
						query += encodeURIComponent(name) + '='
								+ encodeURIComponent(value) + '&';
					}
				}

				return query.length ? query.substr(0, query.length - 1) : query;
			};
			return angular.isObject(data) && String(data) !== '[object File]'
					? param(data)
					: data;
		}];
	  $scope.users ={};
	  $scope.regions={};
	  $scope.counties={};
	  $scope.user={};
	  $scope.isAdd=true;
	  $scope.url = '';
	  $scope.regionId=null;
	  $scope.countyId=null;
	  $scope.ifShow = false;
	  $scope.sysInfo = '';
	  $scope.url='/Spring_Angular_Demo/user/list/all';
	  $http({
	        method: 'GET',
	        url:    $scope.url
	     }).success(function(data){
	    	 $scope.users=data;
	    }).error(function(){
	    	$scope.ifShow = true;
	    	$scope.sysInfo = '系统错误，请刷新页面';
	    });
	  $scope.url='/Spring_Angular_Demo/region/all';
	  $http({
	        method: 'GET',
	        url:    $scope.url
	     }).success(function(data){
	    	 $scope.regions=data;
	    }).error(function(){
	    	$scope.ifShow = true;
	    	$scope.sysInfo = '系统错误，请刷新页面';
	    });
	  $scope.preUpdateUser = function(varUser) {
		    $scope.isAdd=false;
		    $scope.ifShow = false;
			$scope.user = varUser;
			 var keepGoing = true;
			 angular.forEach($scope.regions, function(k,v){
			    if(keepGoing) {
			      if(k==varUser.region){
			    	$scope.user.region=k;
			    	$scope.regionId=v;
			        keepGoing = false;
			      }
			    }
			  });
			   $scope.url='/Spring_Angular_Demo/region/region';
			      $http({
			          method: 'GET',
			          url:    $scope.url,
			          params:  {regionId:$scope.regionId}
			       }).success(function(data){
			    	      $scope.counties=data;
			    	      keepGoing = true;
						  angular.forEach($scope.counties, function(k,v){
							    if(keepGoing) {
							      if(k==varUser.county){
							    	$scope.user.county=k;
							    	$scope.countyId=v;
							        keepGoing = false;
							      }
							    }
						  }); 
			      }).error(function(){
			    	  $scope.ifShow = true;
			    	  $scope.sysInfo = '系统错误，请刷新页面';
			    });
	  }
	  $scope.removerUser = function(varUser) {
		  $scope.ifShow = false;
		  $scope.url='/Spring_Angular_Demo/user/list/deleteUser';
	      $http({
	          method: 'GET',
	          url:    $scope.url,
	          params:  {userId:varUser.id}
	       }).success(function(data){
	    	    $scope.ifShow = true;
		    	$scope.sysInfo = '删除成功';
	    	    var index = $scope.users.indexOf(varUser);
				if (index != -1) {
					$scope.users.splice(index, 1);
				}
	      }).error(function(){
	    	  $scope.ifShow = true;
	    	  $scope.sysInfo = '系统错误，请刷新页面';
	    });
	      $scope.user={};
	      $scope.isAdd=true;
	      $scope.ifShow = false;
		}
	  $scope.resetForm= function(varUser) {
		  $scope.user={};
		  $scope.isAdd=true;
		  $scope.ifShow = false;
	  }
	  
	  $scope.addUserForm= function() {
		  $scope.counties={};
		  $scope.user={};
		  $scope.ifShow = false;
	  }
	  
	  $scope.commitUser= function(varUser) {
		  if($scope.isAdd==true){
			  $scope.url ='/Spring_Angular_Demo/user/list/addUser';
		       varUser.region=$scope.regionId;
		       varUser.county=$scope.countyId;
		       $http.post($scope.url, varUser).success(function(data){
		    	  $scope.url='/Spring_Angular_Demo/user/list/all';
		 		  $http({
		 		        method: 'GET',
		 		        url:    $scope.url
		 		     }).success(function(data){
		 		    	$scope.ifShow = true;
				    	$scope.sysInfo = '添加成功';
		 		    	 $scope.users=data;
		 		    }).error(function(){
		 		    	$scope.ifShow = true;
				    	  $scope.sysInfo = '系统错误，请刷新页面';
		 		    });
		      }).error(function(){
		    	  $scope.ifShow = true;
		    	  $scope.sysInfo = '系统错误，请刷新页面';
		    });
		  }else{
			  $scope.url ='/Spring_Angular_Demo/user/list/updateUser';
			  varUser.region=$scope.regionId;
		      varUser.county=$scope.countyId;
			  $http.post($scope.url, varUser).success(function(){
				  $scope.url='/Spring_Angular_Demo/user/list/all';
		 		  $http({
		 		        method: 'GET',
		 		        url:    $scope.url
		 		     }).success(function(data){
		 		    	 $scope.ifShow = true;
				    	 $scope.sysInfo = '修改成功';
		 		    	 $scope.users=data;
		 		    }).error(function(){
		 		    	$scope.ifShow = true;
				    	$scope.sysInfo = '系统错误，请刷新页面';
		 		    });
		    });
		  }
	  }
	  $scope.onRegionChange=function(varUser) {
		  var  region=$scope.user.region;
		  $scope.ifShow = false;
		  var keepGoing = true;
		  angular.forEach($scope.regions, function(k,v){
		    if(keepGoing) {
		      if(v == region){
		        $scope.user.region=k;
		        $scope.regionId=v;
		        keepGoing = false;
		      }
		    }
		  });  
		  $scope.url='/Spring_Angular_Demo/region/region';
		  $http({
		        method: 'GET',
		        url:    $scope.url,
		        params:  {regionId:$scope.regionId}
		     }).success(function(data){
		    	 $scope.counties=data;
		    }).error(function(){
		    	$scope.ifShow = true;
		    	$scope.sysInfo = '系统错误，请刷新页面';
		    });
	  }
	  $scope.onSelectChange=function() {
		  var county=$scope.user.county;
		  $scope.ifShow = false;
		  var keepGoing = true;
		  angular.forEach($scope.counties, function(k,v){
		    if(keepGoing) {
		      if(v == county){
		        $scope.user.county=k;
		        $scope.countyId=v;
		        keepGoing = false;
		      }
		    }
		  }); 
	  }
   });
    var UserCtrl = function($scope,$http) {
    	
	}
</script>
</head>
<body ng-app="Demo" ng-controller="UserCtrl">
	<div id="testDiv">
		<h3>
			<label>用户信息</label>
		</h3>
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<colgroup>
				<col width="12%">
				<col width="13%">
				<col width="20%">
				<col width="15%">
				<col width="20%">
				<col width="25%">
			</colgroup>
			<thead>
				<tr>
					<th>地市</th>
					<th>县市</th>
					<th>用户名称</th>
					<th>工资</th>
					<th>入职时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="infoDetail">
				<tr ng-repeat="user in users">
					<td>{{user.region}}</td>
					<td>{{user.county}}</td>
					<td>{{user.userName}}</td>
					<td>{{user.sale}}</td>
					<td>{{user.hireDate}}</td>
					<td><div id="spanDiv">
							<span class="spanClass" id="updateBtn"
								ng-click="preUpdateUser(user)">修改</span><span class="banSpan"></span><span
								class="spanClass" id="delBtn" ng-click="removerUser(user)">删除</span>
						</div></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div id="operDiv">
		<p>
			<b><span id="msgInfo" ng-show="ifShow">{{sysInfo}}</span></b>
		</p>
		<br /> <span class="spanAddClass" id="addUserSpan"
			ng-click="addUserForm()">{{isAdd ? '新增' : '修改'}}</span><br />
	</div>
	<div id="formDiv">
		<form name="userForm">
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td>地市:</td>
					<td class="leftClass"><select class="fixClass"
						ng-model="user.region" ng-options="k as v for (k, v) in regions"
						ng-change="onRegionChange()" >
							<option value="" disabled selected>请选择</option>
					</select></td>
					<td>{{user.region}}</td>
					<td>县市:</td>
					<td class="leftClass"><select class="fixClass"
						ng-model="user.county" ng-options="k as v for (k, v) in counties"
						ng-change="onSelectChange()">
							<option value="" disabled selected>请选择</option>
					  </select>
					</td>
					<td>{{user.county}}</td>
				</tr>
				<tr>
				    <td>用户姓名:</td>
					<td class="leftClass"><input type="text"
						ng-model="user.userName"></td>
					<td width="8%">&nbsp;</td>
					<td >工资:</td>
					<td class="leftClass"><input type="number" ng-model="user.sale"></td>
					<td >入职时间:</td>
					<td  class="leftClass"><input type="text"
					jqdatepicker ng-model="user.hireDate"></td>
					<input type="hidden" ng-model="user.id">
					</td>
				</tr>
			</table>
			<span class="spanAddClass" id="sbtSpan"  ng-click="commitUser(user)" >提交</span><span
			class="banSpan"></span> <span class="spanAddClass" id="resetSpan"
			ng-click="resetForm()">重置</span>
		</form>
	</div>
</body>
</html>