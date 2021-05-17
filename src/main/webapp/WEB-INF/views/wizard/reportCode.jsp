<!-- reportCode.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %> 
<style>
#sortable1 > li { 
	margin: 0.4rem 0!important; 
	width: 100%!important; 
	height: 50px!important; 
	text-align:left; 
	background-color:#e3f2fd; 
}
#sortable1 { 
	list-style-type: none; 
	margin: 0; 
	padding: 0; 
	width: 100%; 
}
#sortable1 li { 
	margin: 0 3px 3px 3px; 
	padding: 0.4em; 
	padding-left: 1.1em; 
	font-size: 1.2em; 
	height: 18px; 
}

#sortable2 > li { 
	margin: 0.4rem 0!important; 
	width: 100%!important; 
	height: 50px!important; 
	text-align:left; 
	background-color:#ffb75261; 
}
#sortable2 { 
	list-style-type: none; 
	margin: 0; 
	padding: 0; 
	width: 100%; 
}
#sortable2 li {
	margin: 0 3px 3px 3px; 
	padding: 0.4em; 
	padding-left: 1.1em; 
	font-size: 1.2em; 
	height: 18px; 
}
</style>
<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<ol class="breadcrumb page-breadcrumb" id="menu_title">
		&nbsp; 
	</ol>
   
	<div class="row">  
		<div class="col-lg-3 col-xl-3">
			<div id="panel-1" class="panel">
				<div class="panel-hdr">
					<h2></h2>  
					<div class="panel-toolbar"> 
						<button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
						<button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
						<button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
					</div>
				</div>
				<div class="panel-container show custom-scroll" style="height:755px;overflow-x:scroll;overflow-y:scroll;">   
					<div class="panel-content">
						<div class="frame-wrap">
							<div class="form-group">
								<div class="row">
									<div class="col-lg-12 text-right">  
										<button id="btnAdd" type="button" class="btn btn-primary btn-sm" data-toggle="modal">등록</button>
									</div> 
								</div>
							</div>  
							<div id="resultTree">      
								<ul></ul>   
							</div>
						</div>                                          
					</div>
				</div>
			</div>
		</div>    
		
		<div class="col-lg-9 col-xl-9">
			<div id="panel-2" class="panel">
				<div class="panel-hdr">
					<h2></h2>
					<div class="panel-toolbar">
						<button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
						<button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
						<button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
					</div>
				</div>
				<div class="panel-container show custom-scroll" style="overflow-y:scroll !important;" >
					<div class="panel-content"> 
						<div class="frame-wrap" id="panel1">
							<table class="table table-bordered table-hover w-100">
	                        	<thead>
	                            	<tr>												
										<th>상위 레포트ID</th> 
										<th>레포트ID</th>  
										<th>레포트명</th>   
										<th>레포트구분</th>   
										<th>TV01</th>   
							            <th>TV02</th>  
							            <th>우선순위</th>   
							            <th>사용여부</th>   
							            <th></th>   
									</tr>
	                        	</thead>
	                        	<tbody id="dataTable"></tbody>
	                        </table> 
						</div>                                            
					
	                  	<div class="frame-wrap mb-0 col-md-12 sortable-grid ui-sortable" id="panel2">
	                  		<div class="form-group mb-3">
								<div class="row">
									<div class="col-md-12 text-right">   
										<button id="btnAdd1" type="button" class="btn btn-info btn-sm">추가</button>
										<button id="btnSave1" type="button" class="btn btn-info btn-sm">저장</button>
									</div> 
								</div>
							</div>   
	                  		<ul id="sortable1"></ul>
	                  		<br><br>
	                  		<div class="form-group mb-3">
								<div class="row">
									<div class="col-md-12 text-right">   
										<button id="btnAdd2" type="button" class="btn btn-warning btn-sm">추가</button>
										<button id="btnSave2" type="button" class="btn btn-warning btn-sm">저장</button>
									</div> 
								</div>
							</div>   
	                  		<ul id="sortable2"></ul>
	                  	</div>
	            	</div>
				</div>
			</div>
		</div>                                      
	</div>
</main>
<!-- END Page Content -->     

<!-- BEGIN Modal -->
<!-- 
  <div id="modal-form" class="modal fade" data-body-scroll="false" 
  data-offset="false" data-placement="right" data-fixed="true" data-backdrop="false" tabindex="-1">
  data-backdrop="static" : modal 영역밖 선택시 modal 닫힘 방지
  data-keyboard="false" : ESC model 닫힘 방지
-->       
<div id="form_modal" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog"> 
	<div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal_title"></h5> 
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fal fa-times"></i></span> 
                </button>
            </div>
            <div class="modal-body px-6">
            	<div class="form-group">
            		<div class="row">
            			<div class="col-md-2">
            				<label class="form-label pt-2" for="rpt_par_id">상위 레포트ID</label> 
            			</div>
            			<div class="col-md-10">
            				<input type="text" id="rpt_par_id" class="form-control" readonly="readonly">     
            			</div>  
            		</div>
                </div>
                <div class="form-group">
            		<div class="row">
            			<div class="col-md-2">
            				<label class="form-label pt-2" for="group_nm">상위 레포트명</label>
            			</div>
            			<div class="col-md-10">
            				<input id="rpt_par_nm" type="text" class="form-control"  readonly="readonly">
            			</div>  
            		</div>
                </div>
                <div class="form-group">
                	<div class="row">
            			<div class="col-md-2">
            				<label class="form-label pt-2" for="rpt_id">레포트ID</label>
            			</div>
                    	<div class="col-md-10">
                    		<input id="rpt_id" type="text" class="form-control" autocomplete="off">
                    	</div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
                    	<div class="col-md-2">
                    	<label class="form-label pt-2" for="rpt_nm">레포트명</label></div>
                    	<div class="col-md-10">
                    	<input type="text" id="rpt_nm" class="form-control" autocomplete="off"></div>
                   </div>
                </div>
                <div class="form-group">
               		<div class="row">
	                    <div class="col-md-2">
	                    	<label class="form-label pt-2" for="rpt_div">레포트 구분</label>
	                    </div>
	                    <div class="col-md-10">
	                    	<!-- <input id="rpt_div" type="text" class="form-control" autocomplete="off"> -->
	                    	<select class="form-control" id="rpt_div">
	                    		<option value="">선택</option>	
	                    		<option value="CALL">CALL</option>	
	                    		<option value="AGENT">AGENT</option>	
	                    		<option value="ARS">ARS</option>	
	                    	</select>
	                    </div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
	                    <div class="col-md-2">
	                    	<label class="form-label pt-2" for="tv01">템프값01</label>
	                    </div>
	                    <div class="col-md-10">
	                    <input id="tv01" type="text" class="form-control" autocomplete="off"></div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
	                    <div class="col-md-2">
	                    	<label class="form-label pt-2" for="tv02">템프값02</label>
	                    </div>
	                    <div class="col-md-10">
	                    <input id="tv02" type="text" class="form-control" autocomplete="off"></div>
                    </div>
                </div>
                <div class="form-group">
                	<div class="row">
                    	<div class="col-md-2">
                    		<label class="form-label pt-2" for="priority">우선순위</label>
                    	</div>
                    	<div class="col-md-10">
                    		<input id="priority" type="text" class="form-control" autocomplete="off">
                    	</div> 
                   </div>
                </div>
                <div class="form-group">
                	<div class="row">
                   		<div class="col-md-2"><label class="form-label pt-2" for="use_yn">사용여부</label></div>
                   		<div class="col-md-10">
	                       	<select class="form-control" id="use_yn">
	                           	<option value="Y">사용</option> 
								<option value="N">사용안함</option>
	                       	</select>
	                    </div>
	            	</div> 
               	</div>
            </div>
            <div class="modal-footer px-6">
                <button id="btnClose" 	type="button" 	class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
                <button id="btnSave"	type="button" 	class="btn btn-primary btn-sm">저장</button>
            </div>
        </div>
    </div>
</div>
<!-- END Modal -->

<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>                    
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/plugin/jstree/js/jstree.min.js"></script>
<script src="${contextpath}/static/plugin/jquery-nestable/jquery.nestable.min.js"></script>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript">
var _MAX_DEPTH = 3;
var _RPT_ID, _RPT_NM;
$(function() {
	_RPT_ID = "";
	_RPT_NM = "";
	setTitle('${param.menu_par_id}','${param.menu_id}');  
	
	/***** Start - Tree *****/   
	var resultTree;
	
	function createResultTree(){
		$.post( 
			'${contextpath}/wizard/reportCodeTree.json?max_depth='+_MAX_DEPTH,	
			function(data,textStatus,jqXHR){ 
				if(!data){ alert('return data error');
					return false; 
				}	
				resultTree = $('#resultTree').jstree({		 			
					"plugins" : ["dnd", "types", "json_data"],
					"core" : {
						"data" : data.resultTree, 
						"check_callback" : true,
						"themes" : { "name":"default", "dots":true, "icons":true }
					} 
				}).bind('select_node.jstree',function(e,data){ 	
					//console.log("id:"+data.node.original.id);
					//console.log("text:"+data.node.original.text);
					//console.log("parent:"+data.node.original.parent);
					console.log("level:"+data.node.original.level);
					//console.log("icon:"+data.node.original.icon);
					console.log("parents:"+data.node.parents);
					console.log("children:"+data.node.children);
					_RPT_ID = "";
					_RPT_NM = "";
					var lvl = data.node.original.level;
					if(lvl < _MAX_DEPTH){	//_MAX_DEPTH fix
						_RPT_ID = data.node.original.id;
						_RPT_NM = data.node.original.text;
						$("#rpt_par_id").val(_RPT_ID);
						if(lvl<2){
							Service.requestList(_RPT_ID);							
							$("#panel1").show();
							$("#panel2").hide();
						}else{
							requestWhereList(_RPT_ID);
							requestColumnList(_RPT_ID);
							$("#panel1").hide();
							$("#panel2").show();
						}
					}
				}).on('loaded.jstree', function() {
		        	//if('${sessionScope.tree_open_flag}'=='Y'){
		        	$(this).jstree('open_all'); 
		        	//}		
					
		        	//$(this).jstree('open_node', 'CD00'); 
					 var nodes = $(this).jstree(true).get_json('#', {'flat': true});		            
		            $(this).jstree('select_node', nodes[0].id); //최상위 루트그룹 선택
		        }).on('refresh.jstree', function(event, data) { 
		        	//$(this).jstree("deselect_all");
		            //$(this).jstree('open_all'); 	
		            //$(this).jstree('open_node', 'CD00');  
		        });				    
			},
			'json'
		); // $.post(
	}
	
	createResultTree(); //그룹&호스트 트리구성 호출	
	
 	function updateResultTree(){
		$.post(     
			"${contextpath}/wizard/reportCodeTree.json?max_depth="+_MAX_DEPTH,			
			function(data,textStatus,jqXHR){ 
				if(!data){ alert('return data error');
					return false;  
				}
				resultTree.jstree(true).settings.core.data = data.resultTree;
				resultTree.jstree(true).refresh(); 
			}
		);	
	} 
 	$("#panel1").hide();
	//$("#panel2").hide();
	/***** End - Tree *****/  
	
	var act = "insert"; 
	var str_url = "";
	var form_fields = ['rpt_id','rpt_nm','rpt_div','tv01','tv02','priority'];
	
	//조회
	$('#btnSearch').click(clickBtnSearch=function(){  
		updateResultTree();
	});
	
	//추가
	$("#btnAdd").click(clickBtnAdd=function(){
		if(_RPT_ID == ""){
			alert("먼저 Tree에서 등록할 폴더를 선택하세요!");
			return false;
		}
		act = "insert";
		$.resetField(form_fields);
		$("#use_yn").val("Y");
		$("#rpt_par_id").val(_RPT_ID);
		$("#rpt_par_nm").val(_RPT_NM);
		
		$('#btnSave').show();
		$("#form_modal").modal("show"); 
	}); 
	
	//저장
	$('#btnSave').click(clickBtnSave=function(){
		if(!Service.checkForm()) return;
		if(act=='insert'){
			Service.requestInsert();
		}else{
			Service.requestUpdate(); 
		}
	});	
	
	//수정
	$('#btnEdit').click(clickBtnEdit=function(rpt_id){
		act = "update";
		Service.requestDetail(rpt_id);
		$('#rpt_id').attr('readonly', true);
		$('#btnSave').show();
		$("#form_modal").modal("show");
	});	
	
	//삭제
	$('#btnDelete').click(clickBtnDelete=function(rpt_id){
		Service.requestDelete(rpt_id);
	});	
	
	
	/***** 조건 Sortable - Start *****/
	$("#sortable1").sortable({
		//connectWith: ".addItem", 
		placeholder: "highlight", 
		change: function(event, ui){}, 
		activate: function( event, ui ){}, 
		deactivate: function( event, ui ){}, 
		out: function( event, ui ){
			//console.log("sortable out ---------------");
		},
		update: function( event, ui ){
			//console.log("sortable update ---------------");
		}
	});
	$("#sortable1").disableSelection();
	
	//검색조건 - sortable 생성
	var maxIdx1;
	function requestWhereList(rpt_par_id) {
		var ajaxParam = {
			"url" : '${contextpath}/wizard/reportChildList.json',
		    "type" : "POST",
		    "loading" : "sortable",
		    "data" : {
		    	"rpt_par_id" : rpt_par_id,
		    	"rpt_div" : "WHERE",
		    }
		}			
		Common.ajaxJSON(ajaxParam, function(data) { 
			$('#sortable1').empty();
			var inHtml = "";
	    	$.each(data.resultList, function(index, item) {
	    		var rpt_id = item.rpt_id;
	    		var rpt_par_id = item.rpt_par_id;
	    		var rpt_nm = item.rpt_nm;
	    		var rpt_div = item.rpt_div;
	    		var tv01 = item.tv01;
	    		var tv02 = item.tv02;
	    		
	    		inHtml += "<li class='border border-info addItem' style='padding-top:6px;' area-id='"+index+"'>"; 
	    		inHtml += "  <div class='form-group'>";
				inHtml += "  	<div class='row mr-0'>";
				inHtml += "			<div class='col-md-1 pr-0 pt-2'>";
	    		inHtml += "				<button class='btn btn-info btn-xs' style='padding-left:0.4rem;padding-right:0.4rem;' onClick='clickBtnDelete1("
	    								+ '"' + index + '"'
	    								+ ")'><i class='fal fa-minus'></i></button>";
				inHtml += "			</div>";
	    		inHtml += "         <div class='col-md-2 pl-0'>";
	    		inHtml += "           <input type='text' class='form-control' placeholder='조건명' name='rpt_nm_1' value='"+rpt_nm+"'>"; 
	    		inHtml += "		    </div> ";
	    		inHtml += "         <div class='col-md-2 pl-0'>";
	    		inHtml += "           <input type='text' class='form-control' placeholder='구문1' name='tv01_1' value='"+tv01+"'>";
	    		inHtml += "		    </div> ";
	    		inHtml += "         <div class='col-md-2 pl-0'>";
	    		inHtml += "           <input type='text' class='form-control' placeholder='구문2' name='tv02_1' value='"+tv02+"'>";
	    		inHtml += "		    </div> ";
	    		inHtml += " 	</div>";
	    		inHtml += "  </div>";
	    		inHtml += "</li>";
	    		
	    	});
	    	//console.log(inHtml);
	    	$('#sortable1').html(inHtml);
	    	maxIdx1 = $('#sortable1 > li').length-1;
	    }); 
	}	
	
	$('#btnAdd1').click(clickBtnAdd1=function(){
		maxIdx1 = maxIdx1+1;
		var inHtml = "";
		inHtml += "<li class='border border-info addItem' style='padding-top:6px;' area-id='"+maxIdx1+"'>"; 
		inHtml += "  <div class='form-group'>";
		inHtml += "  	<div class='row mr-0'>";
		inHtml += "			<div class='col-md-1 pr-0 pt-2'>";
		inHtml += "				<button class='btn btn-info btn-xs delete' style='padding-left:0.4rem;padding-right:0.4rem;' onClick='clickBtnDelete1("
								+ '"' + maxIdx1 + '"'
								+ ")'><i class='fal fa-minus'></i></button>";
		inHtml += "			</div>";
		inHtml += "         <div class='col-md-2 pl-0'>";
		inHtml += "           <input type='text' class='form-control' placeholder='조건명' name='rpt_nm_1' value=''>"; 
		inHtml += "		    </div> ";
		inHtml += "         <div class='col-md-2 pl-0'>";
		inHtml += "           <input type='text' class='form-control' placeholder='구문1' name='tv01_1' value=''>";
		inHtml += "		    </div> ";
		inHtml += "         <div class='col-md-2 pl-0'>";
		inHtml += "           <input type='text' class='form-control' placeholder='구문2' name='tv02_1' value=''>";
		inHtml += "		    </div> ";
		inHtml += " 	</div>";
		inHtml += "  </div>";
		inHtml += "</li>";
		$('#sortable1').append(inHtml); 
	});

	$('#btnDelete1').click(clickBtnDelete1=function(index){
		$('#sortable1 > li').each(function(){
			var area_id = $(this).attr("area-id");
			if(index==area_id){
				$(this).remove();
			}
		}); 
	});	
	
	$('#btnSave1').click(clickBtnSave1=function(){
		var len = $('#sortable1 > li').length;
		var rpt_nm = "";
		var tv01 = "";
		var tv02 = "";
		
		//$("input:text[name=rpt_nm_1]").each(function(item, i){
		//var rpt_nm_1 = $(this).val();
		for(var i=0;i<len;i++){
			var rpt_nm_1 = $("input:text[name=rpt_nm_1]:eq("+i+")").val();
			var tv01_1 = $("input:text[name=tv01_1]:eq("+i+")").val();
			var tv02_1 = $("input:text[name=tv02_1]:eq("+i+")").val();
			if(rpt_nm_1==''||rpt_nm_1==null) {
				alert("조건명 를 입력하세요");
				$("input:text[name=rpt_nm_1]:eq("+i+")").focus();
				return false;
			}
			if(tv01_1==''||tv01_1==null) {
				alert("구문1 를 입력하세요");
				$("input:text[name=tv01_1]:eq("+i+")").focus();
				return false;
			}
			if(tv02_1==''||tv02_1==null) {
				alert("구문2 를 입력하세요");
				$("input:text[name=tv02_1]:eq("+i+")").focus();
				return false;
			}
			
		    if((len-1)==i){
		    	rpt_nm += rpt_nm_1;
				tv01 += tv01_1;
				tv02 += tv02_1;
		    }else{
		    	rpt_nm += rpt_nm_1+",";
				tv01 += tv01_1+",";
				tv02 += tv02_1+",";
		    }
		}
		console.log(rpt_nm);
		console.log(tv01);
		console.log(tv02);
		var rpt_div="WHERE";
		Service.requestInsertBatch(rpt_nm, rpt_div, tv01, tv02);
		
	});
	
	
	/***** 컬럼 Sortable - Start *****/
	$("#sortable2").sortable({
		//connectWith: ".addItem", 
		placeholder: "highlight", 
		change: function(event, ui){}, 
		activate: function( event, ui ){}, 
		deactivate: function( event, ui ){}, 
		out: function( event, ui ){
			//console.log("sortable out ---------------");
		},
		update: function( event, ui ){
			//console.log("sortable update ---------------");
		}
	});
	$("#sortable2").disableSelection();
	
	//컬럼 - sortable 생성
	var maxIdx2;
	function requestColumnList(rpt_par_id) {
		var ajaxParam = {
			"url" : '${contextpath}/wizard/reportChildList.json',
		    "type" : "POST",
		    "loading" : "sortable",
		    "data" : {
		    	"rpt_par_id" : rpt_par_id,
		    	"rpt_div" : "COLUMN",
		    }
		}			
		Common.ajaxJSON(ajaxParam, function(data) { 
			$('#sortable2').empty();
			var inHtml = "";
	    	$.each(data.resultList, function(index, item) {
	    		var rpt_id = item.rpt_id;
	    		var rpt_par_id = item.rpt_par_id;
	    		var rpt_nm = item.rpt_nm;
	    		var rpt_div = item.rpt_div;
	    		var tv01 = item.tv01;
	    		var tv02 = item.tv02;
	    		
	    		inHtml += "<li class='border border-info addItem' style='padding-top:6px;' area-id='"+index+"'>"; 
	    		inHtml += "  <div class='form-group'>";
				inHtml += "  	<div class='row mr-0'>";
				inHtml += "			<div class='col-md-1 pr-0 pt-2'>";
	    		inHtml += "				<button class='btn btn-info btn-xs' style='padding-left:0.4rem;padding-right:0.4rem;' onClick='clickBtnDelete2("
	    								+ '"' + index + '"'
	    								+ ")'><i class='fal fa-minus'></i></button>";
				inHtml += "			</div>";
	    		inHtml += "         <div class='col-md-2 pl-0'>";
	    		inHtml += "           <input type='text' class='form-control' placeholder='컬럼명' name='rpt_nm_2' value='"+rpt_nm+"'>"; 
	    		inHtml += "		    </div> ";
	    		inHtml += "         <div class='col-md-2 pl-0'>";
	    		inHtml += "           <input type='text' class='form-control' placeholder='헤더' name='tv01_2' value='"+tv01+"'>";
	    		inHtml += "		    </div> ";
	    		inHtml += "         <div class='col-md-2 pl-0'>";
	    		inHtml += "           <input type='text' class='form-control' placeholder='정렬' name='tv02_2' value='"+tv02+"'>";
	    		inHtml += "		    </div> ";
	    		inHtml += " 	</div>";
	    		inHtml += "  </div>";
	    		inHtml += "</li>";
	    		
	    	});
	    	//console.log(inHtml);
	    	$('#sortable2').html(inHtml);
	    	maxIdx2 = $('#sortable2 > li').length-1;
	    }); 
	}	
	
	$('#btnAdd2').click(clickBtnAdd2=function(){
		maxIdx2 = maxIdx2+1;
		var inHtml = "";
		inHtml += "<li class='border border-info addItem' style='padding-top:6px;' area-id='"+maxIdx2+"'>"; 
		inHtml += "  <div class='form-group'>";
		inHtml += "  	<div class='row mr-0'>";
		inHtml += "			<div class='col-md-1 pr-0 pt-2'>";
		inHtml += "				<button class='btn btn-info btn-xs' style='padding-left:0.4rem;padding-right:0.4rem;' onClick='clickBtnDelete2("
								+ '"' + maxIdx2 + '"'
								+ ")'><i class='fal fa-minus'></i></button>";
		inHtml += "			</div>";
		inHtml += "         <div class='col-md-2 pl-0'>";
		inHtml += "           <input type='text' class='form-control' placeholder='컬럼명' name='rpt_nm_2' value=''>"; 
		inHtml += "		    </div> ";
		inHtml += "         <div class='col-md-2 pl-0'>";
		inHtml += "           <input type='text' class='form-control' placeholder='헤더' name='tv01_2' value=''>";
		inHtml += "		    </div> ";
		inHtml += "         <div class='col-md-2 pl-0'>";
		inHtml += "           <input type='text' class='form-control' placeholder='정렬' name='tv02_2' value='center'>";
		inHtml += "		    </div> ";
		inHtml += " 	</div>";
		inHtml += "  </div>";
		inHtml += "</li>";
		$('#sortable2').append(inHtml); 
	});
	
	$('#btnDelete2').click(clickBtnDelete2=function(index){
		$('#sortable2 > li').each(function(){
			var area_id = $(this).attr("area-id");
			if(index==area_id){
				$(this).remove();
			}
		}); 
	});	
	
	$('#btnSave2').click(clickBtnSave2=function(){
		var len = $('#sortable2 > li').length;
		var rpt_nm = "";
		var tv01 = "";
		var tv02 = "";
		//$("input:text[name=rpt_nm_2]").each(function(item, i){
		//var rpt_nm_2 = $(this).val();
		for(var i=0;i<len;i++){
			var rpt_nm_2 = $("input:text[name=rpt_nm_2]:eq("+i+")").val();
			var tv01_2 = $("input:text[name=tv01_2]:eq("+i+")").val();
			var tv02_2 = $("input:text[name=tv02_2]:eq("+i+")").val();
			if(rpt_nm_2==''||rpt_nm_2==null) {
				alert("컬럼명 을 입력하세요");
				$("input:text[name=rpt_nm_2]:eq("+i+")").focus();
				return false;
			}
			if(tv01_2==''||tv01_2==null) {
				alert("헤더 를 입력하세요");
				$("input:text[name=tv01_2]:eq("+i+")").focus();
				return false;
			}
			if(tv02_2==''||tv02_2==null) {
				alert("정렬 을 입력하세요");
				$("input:text[name=tv02_2]:eq("+i+")").focus();
				return false;
			}
			
		    if((len-1)==i){
		    	rpt_nm += rpt_nm_2;
				tv01 += tv01_2;
				tv02 += tv02_2;
		    }else{
		    	rpt_nm += rpt_nm_2+",";
				tv01 += tv01_2+",";
				tv02 += tv02_2+",";
		    }
		}
		console.log(rpt_nm);
		console.log(tv01);
		console.log(tv02);
		var rpt_div="COLUMN";
		Service.requestInsertBatch(rpt_nm, rpt_div, tv01, tv02);
		
	});
	/***** 조건 Sortable - End *****/
	
	
});//jQuery

var Service = {				
	//입력 폼 체크
	checkForm : function(){
		if(!$.notnull($('#rpt_id'), '레포트ID')) return false;
		if(!$.notnull($('#rpt_nm'), '레포트명')) return false;
		if(!$.notnull($('#priority'), '우선순위')) return false;
		return true;
	}
	,//list
	requestList : function(rpt_par_id) {
		var ajaxParam = {
	        "url" : "${contextpath}/wizard/reportCodeList.json",
	        "type" : "POST",
	    	"data" : {
	    		"rpt_par_id" : rpt_par_id
	        }
	    };
		Common.ajaxJSON(ajaxParam, function(data) { 
			var inRptHTML = "";
			$("#dataTable").empty();
			$.each(data.resultList, function(index, item) {
				inRptHTML += "<tr>";
				inRptHTML += "<td>"+item.rpt_par_id+"</td>";
				inRptHTML += "<td>"+item.rpt_id+"</td>";
				inRptHTML += "<td>"+item.rpt_nm+"</td>";
				inRptHTML += "<td>"+item.rpt_div+"</td>";
				inRptHTML += "<td>"+item.tv01+"</td>";
				inRptHTML += "<td>"+item.tv02+"</td>";
				inRptHTML += "<td>"+item.priority+"</td>";
				inRptHTML += "<td>"+item.use_yn+"</td>";
				inRptHTML += "<td>";
				inRptHTML += '&nbsp;<button type="button" class="btn btn-warning btn-xs" title="수정"  onClick="clickBtnEdit('+"'"+item.rpt_id+"'"+')"><i class="fal fa-edit"></i></button>';
				if(data.resultList.length > 0 && index > 0){
					inRptHTML += '&nbsp;<button type="button" class="btn btn-warning btn-xs" title="삭제"  onClick="clickBtnDelete('+"'"+item.rpt_id+"'"+')"><i class="fal fa-trash-alt"></i></button>';
				}
				inRptHTML += "</td>" 
				inRptHTML += "</tr>";
	    	});
			$("#dataTable").append(inRptHTML);
		});
	}
	,//detail
	requestDetail : function(rpt_id) {
		var ajaxParam = {
            "url" : "${contextpath}/wizard/reportCodeDetail.json",
            "type" : "POST",
        	"data" : {
        		"rpt_id" : rpt_id
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
			$("#rpt_id").val(data.result.rpt_id);
			$("#rpt_par_id").val(data.result.rpt_par_id);
			$("#rpt_nm").val(data.result.rpt_nm);
			$("#rpt_par_nm").val(data.result.rpt_par_nm);
			console.log(data.result.rpt_div);
			$("#rpt_div").val(data.result.rpt_div);
			$("#tv01").val(data.result.tv01);
			$("#tv02").val(data.result.tv02);
			$("#priority").val(data.result.priority);
			$("#use_yn").val(data.result.use_yn);
        });
	},
	//insert
	requestInsert : function() {
		var ajaxParam = {
            "url" : "${contextpath}/wizard/reportCodeInsert.json",
            "type" : "POST",
        	"data" : {
        		"rpt_par_id" : $("#rpt_par_id").val(),
        		"rpt_id" : $("#rpt_id").val(),
    			"rpt_nm" : $("#rpt_nm").val(),
    			"rpt_div" : $("#rpt_div").val(),
    			"tv01" : $("#tv01").val(),
    			"tv02" : $("#tv02").val(),
    			"priority" : $("#priority").val(),
    			"use_yn" : $("#use_yn").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$('#form_modal').modal('hide');	
			clickBtnSearch();
        });
	},
	//update
	requestUpdate : function() {
		var ajaxParam = {
            "url" : "${contextpath}/wizard/reportCodeUpdate.json",
            "type" : "POST",
        	"data" : {
        		"rpt_par_id" : $("#rpt_par_id").val(),
        		"rpt_id" : $("#rpt_id").val(),
    			"rpt_nm" : $("#rpt_nm").val(),
    			"rpt_div" : $("#rpt_div").val(),
    			"tv01" : $("#tv01").val(),
    			"tv02" : $("#tv02").val(),
    			"priority" : $("#priority").val(),
    			"use_yn" : $("#use_yn").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$('#form_modal').modal('hide');			
			clickBtnSearch();
        });
	},
	//delete
	requestDelete : function(rpt_id) {
		if(confirm('삭제하시겠습니까?')){
			var ajaxParam = {
				"url" : '${contextpath}/wizard/reportCodeDelete.json',
			    "type" : "POST",
			    "data" : {
			    	"rpt_id" : rpt_id
			    }
			}			
			Common.ajaxJSON(ajaxParam, function(data) { 
				if(!data){
					alert('return data error');
					return false;
				}
				alert(data.msg);
				if(!data.success) return;
				$('#form_modal').modal('hide');			
				clickBtnSearch();
		    }); 
		}
	},
	requestInsertBatch : function(rpt_nm, rpt_div, tv01, tv02) {
		var ajaxParam = {
            "url" : "${contextpath}/wizard/reportCodeInsertBatch.json",
            "type" : "POST",
        	"data" : {
        		"rpt_par_id" : $("#rpt_par_id").val(),
    			"rpt_nm" : rpt_nm,
    			"rpt_div" : rpt_div,
    			"tv01" : tv01,
    			"tv02" : tv02
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			if(!data.success) return;
			$('#form_modal').modal('hide');	
        });
	} 
}
</script>	
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
