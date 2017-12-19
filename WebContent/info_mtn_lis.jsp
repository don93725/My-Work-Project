<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-ch">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>人員維護列表</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<%
	pageContext.setAttribute("path", request.getContextPath());
	pageContext.setAttribute("db", request.getParameter("db"));
	%>
	<style type="text/css">
		.firstColWitdth{
			width: 10%;
		}
		.secondColWitdth {
			width: 50%;
		}
		.thirdColWitdth {
			width: 20%;
		}
		#result {
			position: fixed;
			background-color: lightblue;
			width: 50%;
			height: 70%;
			margin-top: 0% ;	
			margin-left: 25% ;	
			z-index: 10;
			padding: 8%;
			display: none;
			opacity: 0;
			font-size: 2.5vh;
			border-radius: 20%;
			color: gray;
			text-align: center;
		}
		.error {
			background-color: red;
		}
		.addRow {
			background-color: yellow;
		}
	</style>
	<body>
		<div id="result"></div>
		<div class="container">
			<div class="row">
				<table class="table table-hover">
					<caption>資料列表</caption>
					<thead>
						<tr>
							<th class='firstColWitdth'>全選/取消勾選<br>
							<input type="checkbox" class='allCheck'></th>
							<th class='firstColWitdth'>索引</th>
							<th class='secondColWitdth'>身分證</th>
							<th class='thirdColWitdth'>操作  
								<input type="button" style='margin-left: 20%;' class='btn btn-success' value='新增' onclick="add();">
								<input type="button" id='openBtn' class='btn btn-info' value='展開全部' onclick="showAllData();">
							</th>
					</thead>
					<tbody>
						<c:if test="${empty listInfomation }">
							<tr class="dataTrigger">
								
								<td><input type="checkbox" class='check'></td>
								<td><div class="idx"></div></td>
								<td>
									<div class="data">TEST111111</div>
								</td>
								<td>
									<button class='btn btn-danger' onclick='del.call(this);'>刪除</button>								
								</td>
	
							</tr>
							<tr class="moreData" style="display: none;" >
								<td colspan="4">								
									<div class="col-xs-12 col-sm-6">
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">姓名</span>
										  <input type="text" class="form-control" name='name' aria-describedby="sizing-addon1" value='假姓名' disabled="true">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">電話</span>
										  <input type="text" class="form-control" name='phone' aria-describedby="sizing-addon1" value='假電話' disabled="true">
										</div>									
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">性別</span>
										  <div class='form-control specialDiv' disabled="true">
											  <label class="sex">
												  <input type="radio" class="sexRadio" name="sex0" id="sex" value="0" disabled="true"> 男
											  </label>
											  <label class="sex">
												  <input type="radio" class="sexRadio" name="sex0" id="sex" value="1" disabled="true"> 女
											  </label>
										  </div>
										</div>										
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">年紀</span>
										  <input type="text" class="form-control" name='age' aria-describedby="sizing-addon1" value='00' disabled="true">
										</div>									
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">職業</span>
										  <input type="text" class="form-control" name='job' aria-describedby="sizing-addon1" value='假職業' disabled="true">
										</div>									
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">手機</span>
										  <input type="text" class="form-control" name='cphone' aria-describedby="sizing-addon1" value='假手機' disabled="true">
										</div>									
									</div>
									<div class="col-xs-12 col-sm-12">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">居住地址</span>
										  <input type="text" class="form-control" name='address' aria-describedby="sizing-addon1" value='假地址' disabled="true">
										</div>
									</div>	
								</td>
							</tr>
						</c:if>
						<c:if test="${!empty listInfomation }">
							<c:forEach var="info" items="${listInfomation }" varStatus="loop">
								<tr class="dataTrigger">
									<td><input type="checkbox" class='check'></td>
									<td><div class="idx"></div></td>
									<td>
										<div class="data">${info.id }</div>
									</td>
									<td>
										<button class='btn btn-danger' onclick='del.call(this);'>刪除</button>								
									</td>
		
								</tr>
								<tr class="moreData" style="display: none;" >
									<td colspan="4">								
										<div class="col-xs-12 col-sm-6">
											<div class="input-group input-group-lg">
											  <span class="input-group-addon" id="sizing-addon1">姓名</span>
											  <input type="text" class="form-control" name='name' aria-describedby="sizing-addon1" value='${info.name}' disabled="true">
											</div>
										</div>
										<div class="col-xs-12 col-sm-6">									
											<div class="input-group input-group-lg">
											  <span class="input-group-addon" id="sizing-addon1">電話</span>
											  <input type="text" class="form-control" name='phone' aria-describedby="sizing-addon1" value='${info.phone }' disabled="true">
											</div>									
										</div>
										<div class="col-xs-12 col-sm-6">									
											<div class="input-group input-group-lg">
											  <span class="input-group-addon" id="sizing-addon1">性別</span>
											  <div class='form-control specialDiv' disabled="true">
												  <label class="sex">
													  <input type="radio" class="sexRadio" name="sex${loop.count }" id="sex" value="0" disabled="true" ${(info.sex == '0') ? 'checked="true"' :''}> 男
												  </label>
												  <label class="sex">
													  <input type="radio" class="sexRadio" name="sex${loop.count }" id="sex" value="1" disabled="true" ${(info.sex == '1') ? 'checked="checked"' :''}> 女
												  </label>
											  </div>
											</div>										
										</div>									
										<div class="col-xs-12 col-sm-6">									
											<div class="input-group input-group-lg">
											  <span class="input-group-addon" id="sizing-addon1">年紀</span>
											  <input type="text" class="form-control" name='age' aria-describedby="sizing-addon1" value='${info.age }' disabled="true">
											</div>									
										</div>
										<div class="col-xs-12 col-sm-6">									
											<div class="input-group input-group-lg">
											  <span class="input-group-addon" id="sizing-addon1">職業</span>
											  <input type="text" class="form-control" name='job' aria-describedby="sizing-addon1" value='${info.job }' disabled="true">
											</div>									
										</div>
										<div class="col-xs-12 col-sm-6">									
											<div class="input-group input-group-lg">
											  <span class="input-group-addon" id="sizing-addon1">手機</span>
											  <input type="text" class="form-control" name='cphone' aria-describedby="sizing-addon1" value='${info.cell_phone }' disabled="true">
											</div>									
										</div>
										<div class="col-xs-12 col-sm-12">									
											<div class="input-group input-group-lg">
											  <span class="input-group-addon" id="sizing-addon1">居住地址</span>
											  <input type="text" class="form-control" name='address' aria-describedby="sizing-addon1" value='${info.address }' disabled="true">
											</div>
										</div>	
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<tr class="addData" style="display: none;" >
							<td colspan="4">
								<div class="col-xs-12 col-sm-12">
									<h1 id='addIndex'>新增資料</h1>
									<button onclick='fillCol.call(this)'></button>
								</div>
								<form id='addForm'>
									<div class="col-xs-12 col-sm-6">
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">姓名</span>
										  <input required="required" type="text" class="form-control" name='name' aria-describedby="sizing-addon1">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">身分證</span>
										  <input required="required" pattern="[A-Za-z]{1}[0-9]{9}" title='格式：A123456789' type="text" class="form-control" name='id' length='10' aria-describedby="sizing-addon1">
										</div>
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">電話</span>
										  <input required="required" type="text" class="form-control" name='phone' aria-describedby="sizing-addon1">
										</div>									
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">性別</span>
										  <div class="form-control">
											  <label class="sex">
												  <input required="required" type="radio" name="n"  class="sexRadio" id="sex" value="0"> 男
											  </label>
											  <label class="sex">
												  <input type="radio" class="sexRadio" name="n" id="sex" value="1"> 女
											  </label>
										  </div>
										</div>										
									</div>	
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">年紀</span>
										  <input required="required" type="text" class="form-control" name='age' aria-describedby="sizing-addon1">
										</div>									
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">職業</span>
										  <input required="required" type="text" class="form-control" name='job' aria-describedby="sizing-addon1">
										</div>									
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">手機</span>
										  <input required="required" type="text" class="form-control" name='cphone' aria-describedby="sizing-addon1">
										</div>									
									</div>
									<div class="col-xs-12 col-sm-6">									
										<div class="input-group input-group-lg">
										  <span class="input-group-addon" id="sizing-addon1">居住地址</span>
										  <input required="required" type="text" class="form-control" name='address' aria-describedby="sizing-addon1">
										</div>
									</div>
									<div class="col-xs-12 col-sm-12">									
										<div class="input-group input-group-lg" align="center">
										  <button class="btn btn-success btn-lg" onclick="confirmAdd.call(this);">確定新增</button>
										  <button class="btn btn-danger btn-lg" onclick="rejectAdd.call(this);">取消新增</button>
										</div>
									</div>	
								</form>
							</td>
						</tr>
						<tr class='lastTr' >
							<td colspan="4" align="center">
								<button class='btn btn-primary' onclick='change.call(this);'>修改</button>
								<button class='btn btn-primary' onclick='showCheckedData();'>確認</button>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			var openFlag = false , indexCount;
			$(function(){
				init();
				$('#addForm').on('submit',function(evt){
					evt.preventDefault();
				});
			})
			
			function checkAllCheckboxStat(){
				if($('.check').length == $('.check:checked').length){
					$('.allCheck').prop('checked','ture');
				}else{
					$('.allCheck').removeProp('checked');
				}
			}
			

			function init(){
				fillIndex();
				$('.data').unbind('click');
				$('.data').click(function(e) {
					$(this).parents('.dataTrigger').next('.moreData').toggle();
					checkAllDataVisible();
				});
				$('.allCheck').unbind('click');
				$('.allCheck').click(function(){
					if($(this).prop('checked') == true){
						$('.check').each(function(){
							$(this).prop('checked','true');
							$(this).parents('tr').next().find('input').removeProp('disabled');
							$(this).parents('tr').next().find('.specialDiv').removeAttr('disabled');
						});
					} else {
						$('.check').each(function(){
							$('.check').removeProp('checked');
							$(this).parents('tr').next().find('input').prop('disabled','disabled');
							$(this).parents('tr').next().find('.specialDiv').attr('disabled','disabled');
						});
						
					}
					
				});
				$('input.check').unbind('change');
				$('input.check').change(function(){
					checkAllCheckboxStat();
					if($(this).prop('checked')){
						$(this).parents('tr').next().find('input').removeProp('disabled');
						$(this).parents('tr').next().find('.specialDiv').removeAttr('disabled');
					} else {
						$(this).parents('tr').next().find('input').prop('disabled','disabled');
						$(this).parents('tr').next().find('.specialDiv').attr('disabled','disabled');
					}
					
				});
			}
// 			function retrunLastSexIdx(){
// 				var strSexName = $('.moreData:last').find('.sexRadio').attr('name');
// 				return parseInt(strSexName.substring(3,strSexName.length)) + 1;
// 			}
			function resetNameIndex(){
				var idx = 1;
				$('.moreData').each(function(){
					$(this).find('.sexRadio').each(function(){
						$(this).attr('name', 'sex'+ idx);
					});
					idx++;
				});
			}
			
			function validate(id){
				if(id.length != 10){
					return '資料長度不對';
				}
				var charCode = id.toLowerCase().charCodeAt(0);
				if (charCode < 97 || charCode > 122){
					return '第一字必須為英文';
				}
				var strNumCheck = false;
				for(var i = 0 ; i < id.length-1; i++){
					if(id.charCodeAt(i+1) < 48 || id.charCodeAt(i+1) > 57){
						strNumCheck = true;
					}
				}
				if(strNumCheck){
					return '請首字後皆為數字';
				}				
				var patt = new RegExp("[A-Za-z]{1}[0-9]{9}")
				if(!patt.test(id)){
					return '反正格式錯了';
				}
				return '';
			}
			
			function confirmAdd(){
				$('#addForm').submit();
				var targetTR = $('.addData');
				var id = targetTR.find('input[name="id"]').val();
				var validResult = validate(id);
				$('.addRow').removeClass('addRow');
				if(validResult.length != 0){
					targetTR.find('input[name="id"]').attr('title',validResult);
				}else{
					var name = targetTR.find('input[name="name"]').val();
					var phone = targetTR.find('input[name="phone"]').val();
					var sex = targetTR.find('input.sexRadio:checked').val();
					var age = targetTR.find('input[name="age"]').val();
					var job = targetTR.find('input[name="job"]').val();
					var cell_phone = targetTR.find('input[name="cphone"]').val();
					var address = targetTR.find('input[name="address"]').val();
					var addTr = $(this).parents('tr');				
					
					$.ajax({
						url: '${path}/CmInfomtn/insert.do',
						type: "POST",
						dataType: "text",
						data:{
							"db" : '${db}',
							"id" : id,
							"name" : name,
							"phone" : phone,
							"sex" : sex,
							"age" : age,
							"job" : job,
							"cell_phone" : cell_phone,
							"address" : address						
						},						
						success: function(msg){
							addTr.before('<tr class="dataTrigger">' + addTr.prev().prev().html() + '</tr>');
							addTr.before('<tr class="moreData">' + addTr.prev().prev().html() + '</tr>');
							targetTR = $('.dataTrigger').last();					
							targetTR.addClass('addRow');
							targetTR.find('.data').text(id);
							targetTR = targetTR.next();
							targetTR.find('input[name="name"]').val(name);
							targetTR.find('input[name="phone"]').val(phone);
							targetTR.prev()
									.prev()
									.find('input.sexRadio[value="' + targetTR.find('input.sexRadio:checked').val() + '"]')
									.prop('checked','checked');
							init();
							resetNameIndex();
							targetTR.find('input.sexRadio[value="' + sex +'"]').prop('checked','checked');
							targetTR.find('input[name="age"]').val(age);
							targetTR.find('input[name="job"]').val(job);
							targetTR.find('input[name="cphone"]').val(cell_phone);
							targetTR.find('input[name="address"]').val(address);
							targetTR.hide();	
							checkAllCheckboxStat();
							checkAllDataVisible();
							$('#addIndex').text('新增第' + indexCount + '筆資料');
							$('.addData').css('display',"none");
							$('.addData input').val('');
							$('.addData input[type="radio"]').removeProp('checked');
						},
						error: function(xhr, ajaxOptions, thrownError){}
					});
					

				}				
			}
			
			
			function rejectAdd(){				
				if(confirm('取消後輸入的資料將遺失，確定取消？')){
					$('.addData input').val('');
					$('.addData').hide();
				}
				
			}
			function checkAllDataVisible(){
				if($('.moreData:hidden').length == 0){
					$('#openBtn').val('關閉全部');
				}else{
					$('#openBtn').val('展開全部');					
				}
			}
			
			function showAllData(){
				if($('#openBtn').val() == '關閉全部'){
					$('.moreData').hide();
					$('#openBtn').val('展開全部');
				}else{
					$('.moreData:hidden').show();	
					$('#openBtn').val('關閉全部');
				}
				
			}
			
			function del(event){				
				if($('.dataTrigger').length <= 1){
					alert('刪除時，列數不可少於一');
				} 
				else if(confirm('真的要刪除?')){	
					var id = $(this).parents('tr').find('.data').text();
					var $self = $(this).parents('tr');
					$.ajax({
						url : '${path}/CmInfomtn/delete.do',
						type : "POST",
						dataType : "text",
						data : {
							"id" : id,
							"db" : '${db}'
						},						
						success: function(msg){
							alert(msg);
							$self.next().remove();
							$self.remove();
							fillIndex();	
							$('#addIndex').text('新增第' + indexCount + '筆資料');
							checkAllCheckboxStat();
							resetNameIndex();
						},
						error: function(xhr, ajaxOptions, thrownError){}
					});					
					
				}
				
			}
			
			function change(){
				var dataList = [];
				var checkColumn = true;
				$('.check').each(function(index){
					$(this).parents('tr').removeClass('addRow');
					$(this).parents('tr').find('.specialDiv').removeClass('error');
				});
				$('.check:checked').each(function(index){
					var targetTR = $(this).parents('tr').next();
					$(this).parents('tr').addClass('addRow');
					var obj = {
						id : $(this).parents('tr').find('.data').text(),
						name : targetTR.find('input[name="name"]').val(),
						phone : targetTR.find('input[name="phone"]').val(),
						sex : (targetTR.find('input.sexRadio:checked').val()),
						age : targetTR.find('input[name="age"]').val(),
						job : targetTR.find('input[name="job"]').val(),
						cell_phone : targetTR.find('input[name="cphone"]').val(),
						address : targetTR.find('input[name="address"]').val(),
					};
					dataList[index] = obj; 
					var keyArr = Object.keys(obj);
					for(var idx in keyArr){
						if(obj[keyArr[idx]] == undefined || obj[keyArr[idx]].length == 0){
							checkColumn = false;
							targetTR.find('input[name="' + keyArr[idx] + '"]').addClass('error');
						}else{
							targetTR.find('input[name="' + keyArr[idx] + '"]').removeClass('error');
						}
					}	
					if(targetTR.find('input.sexRadio:checked').length == 0){
						checkColumn = false;
						targetTR.find('.specialDiv').addClass('error');
					}else{
						targetTR.find('.specialDiv').removeClass('error');
					}
				});
				if(true){
					var objToJSON = JSON.stringify(dataList);
					$.ajax({
						url : '${path}/CmInfomtn/update.do',
						type : "POST",
						dataType : "text",
						data : { 
							"db" : '${db}',
							"objToJSON" : objToJSON
						},	
						success : function(msg){
							alert('更新成功！')
						},
						error : function(xhr, ajaxOptions, thrownError){}
					});
				}else{
					$('.check').each(function(index){
						$(this).parents('tr').removeClass('addRow');
						$(this).parents('tr').find('.specialDiv').removeClass('error');
						alert('請檢查紅色欄位');
					});
				}	
			}
			
			function fillIndex(){
				indexCount = 1;
				
				$('div.idx').each(function(){
					$(this).text(indexCount++);
				})				
			}
			
			function fillCol(){
				var targetTR = $(this).parents('tr');
				var id = targetTR.find('input[name="id"]').val('X987654321');
				var name = targetTR.find('input[name="name"]').val('糧旭');
				var phone = targetTR.find('input[name="phone"]').val('027654321');
				var sex = targetTR.find('input.sexRadio[value="1"]').attr('checked','checked');
				var age = targetTR.find('input[name="age"]').val(23);
				var job = targetTR.find('input[name="job"]').val('程式設計師');
				var cell_phone = targetTR.find('input[name="cphone"]').val('0987654321');
				var address = targetTR.find('input[name="address"]').val('新店某處');
					
			}
			
			function add(){				
				if($('.addData').css('display') == 'none') {
					$('.addData').show();
					$('#addIndex').text('新增第' + indexCount + '筆資料');
				} else {
					alert('請完成新增再進行下筆操作');
				}
				
			}
			
			function showCheckedData(){
				var result = '';
				var flag = false;
				if($('.check:checked').length == 0){
					showDialog('請至少選擇一項好嗎？');
				}else{
					$('.check:checked').each(function(){					
						$(this).parents('tr').next().find('input').each(function(){
							if($(this).val().length == 0){
								flag = true;
							}
						});
						
						result += "項次" + $(this).parents('tr').find('.idx').text().trim() + "：" +
								$(this).parents('tr').next().find('input[name="name"]').val() + "<br>";					
					});
					
					if(flag){
						showDialog('請確認欄位皆不為空');
					}else{
						showDialog(result);
					}
				}
				
				
			}
			
			function showDialog(text){				
				$( "#result" ).html(text);
					$( "#result" ).show();	 
					$( "#result" ).animate({					 	
					    opacity: 1
					  }, 2000, function() {
					    $( "#result" ).animate({					 	
					    opacity: 0
					  	},1000,function(){
					  		 $( "#result" ).hide();
					  	});
					});
					
			}
		</script>
	</body>
</html>