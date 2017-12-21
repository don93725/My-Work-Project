<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en-ch">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>登入頁面	</title>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			#result {
				position: absolute;
				background-color: lightblue;
				width: 50%;
				height: 50%;
				margin-top: 0% ;	
				margin-left: 25% ;	
				z-index: 10;
				padding: 8%;
				display: none;
				opacity: 0;
				font-size: 10vh;
				border-radius: 20%;
				color: red;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div id="result"></div>
		<div class="container" style="margin-top: 10% ;">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-sm-offset-3">
					<div class="panel panel-primary">
					  <div class="panel-heading">
					    <h3 class="panel-title">登入畫面</h3>
					  </div>
					  <div class="panel-body">
					    <div class="col-xs-12 col-sm-12">
							<div class="input-group input-group-lg">
							  <span class="input-group-addon" id="sizing-addon1">帳號</span>
							  <input id='account' type="text" class="form-control" aria-describedby="sizing-addon1">
							</div>
							<div class="input-group input-group-lg">
							  <span class="input-group-addon" id="sizing-addon1">密碼</span>
							  <input id='password' type="password" class="form-control" aria-describedby="sizing-addon1">
							</div>
						</div>
					  </div>
					  <div class="panel-footer" align='center'>
					    <button class="btn btn-primary" onclick="login.call(this);">登入</button>
					    <button id='logOutBtn' class="btn btn-danger" style="display: none;">登出</button>
					     <div id='magicDropBtn' class="btn-group" style="display: none;">
						  <button id='dbChoose' type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    <span class="caret"></span>
						  </button>
						  <button id='magicBtn' class="btn btn-warning" onclick='magicEvent();' style="display: none;">Oracle</button>
						  <ul class="dropdown-menu">
						    <li><a href="#" onclick="changeDB.call(this,'Oracle');">Oracle</a></li>
						    <li><a href="#" onclick="changeDB.call(this,'SQL Server');">SQL Server</a></li>
						  </ul>
						</div>
					  </div>
					</div>
			</div>
		</div>
		
		
		<script src="<%=request.getContextPath() %>/jquery/jquery-2.1.4.min.js"></script>
		<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function changeDB(param){
				$(this).parents('ul').prev().text(param);
			}
			
			function login(){
				
				if($('#account').val() == 'test' && $('#password').val() == 'test'){
					var loginBtn = $(this);
					loginBtn.hide();
					showDialog('登入成功');	
					$('#account').prop('disabled','true');
					$('#password').prop('disabled','true');
					$('#magicDropBtn').show();
					$('#magicBtn').show();
					$('#logOutBtn').show().click(function(){
						$(this).hide();
						loginBtn.show();
						$('#account').removeProp('disabled').val('');
						$('#password').removeProp('disabled').val('');
						$('#magicBtn').hide();
						$('#magicDropBtn').hide();
						showDialog('已登出');
					});
				}else {		
					showDialog('登入失敗');					
				}
				
			}
			
			function magicEvent(){
				var loc = '/HomeworkWeek2/CmInfomtn/select.do';
				if($('#magicBtn').text().trim() == 'Oracle'){
					loc += '?db=oracle';
				}else {
					loc += '?db=sql';
				}
				location.href = loc;
			}
			
			function showDialog(text){
				$( "#result" ).text(text);
				$( "#result" ).show();	 
				$( "#result" ).animate({					 	
				    opacity: 1
				  }, 1000, function() {
				    $( "#result" ).animate({					 	
					    opacity: 0
					  	}, 1000, function(){
					  		 $( "#result" ).hide();
				  	});
				});
			}
		</script>
	</body>
</html>