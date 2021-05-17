<!-- menuCodeMap.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %> 

<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<ol class="breadcrumb page-breadcrumb" id="menu_title">
		&nbsp; 
	</ol> 
   
	<div class="row">  
		<div class="col-lg-3 col-xl-3"> 
			<div id="panel-1" class="panel">
				<div class="panel-hdr">
					<h2><!-- 메뉴순서 --></h2>  
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
									<div class="col-md-8">
										<select id="user_type" class="form-control"></select> 
									</div> 
									<div class="col-md-4 pt-2px"> 
										<button id="btnSave" type="button" class="btn btn-primary btn-sm">저장</button>
									</div> 
								</div>
							</div>   
							<div class="dd" id="nestable"></div>  
						</div>                                          
					</div>
				</div>
			</div>
		</div>  
		  
		<div class="col-lg-9 col-xl-9">
			<div id="panel-1" class="panel">
				<div class="panel-hdr">
					<h2><!-- 메뉴매핑 --></h2> 
					<div class="panel-toolbar">
						<button class="btn btn-panel" data-action="panel-collapse" data-toggle="tooltip" data-offset="0,10" data-original-title="Collapse"></button>
						<button class="btn btn-panel" data-action="panel-fullscreen" data-toggle="tooltip" data-offset="0,10" data-original-title="Fullscreen"></button>
						<button class="btn btn-panel" data-action="panel-close" data-toggle="tooltip" data-offset="0,10" data-original-title="Close"></button>
					</div>
				</div>
				<div class="panel-container show">
					<div class="panel-content"> 
						<div class="frame-wrap">
							<table id="dataTable" class="table table-bordered table-hover w-100">
	                        	<thead>
	                            	<tr>												
										<th></th> 
										<th>메뉴명</th>   
										<th>아이디</th>   
										<th>상위</th>   
							            <th>아이콘</th>  
									</tr>
	                        	</thead>
	                        </table> 
						</div>                                            
					</div>
				</div>
			</div>  
		</div>                                      
	</div>
</main>
<!-- END Page Content -->     

<input type="hidden" id="menu_id">
<input type="hidden" id="nestable-output">	  
               
<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>                    
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/plugin/jstree/js/jstree.min.js"></script>
<script src="${contextpath}/static/plugin/jquery-nestable/jquery.nestable.min.js"></script>
<script src="${contextpath}/static/common/js/common.js"></script> 
<script type="text/javascript">
$(function() {
	
	var chk_grid;   
	
	setTitle('${param.menu_par_id}','${param.menu_id}');
	
	/***** Start - DataTables *****/
	var dataTable;
	function createDataTable(user_type){
		dataTable =$('#dataTable').dataTable({
			"searching": false,
			"search":{		
				"caseInsensitive": false	//대소문자구분
			},
			"lengthChange": false, 
	    	"pageLength": 10,
	    	"lengthMenu": [10, 20, 30],
	    	"info": false,
	    	"paging": false,
	    	"serverSide": false, 
	    	"processing": true, 
	    	"responsive": true,
		  	"autoWidth": true, 
		  	"language": {
	           "loadingRecords": ""
	        },	
	      	"ajax":{ 
	      		"url":"${contextpath}/code/menuCodeMapListAll.json?user_type="+user_type,
			  	"type":"POST" 
		  	},
		  	//"dom": '<"top"lf>rt<"bottom"ip><"clear">',
		  	"columnDefs": [  
		  		{ 	"targets":[0], "searchable":false, "orderable":false	},
				{ 	"targets":[1], "searchable":true	},
				{ 	"targets":[2], "searchable":true	},
				{ 	"targets":[3], "searchable":true	},
				{ 	"targets":[4], "searchable":true	}			
	       	],	  	
		  	"columns": [
		    	{ 	"data":null, "width":"7%" 		},	
		    	{ 	"data":"menu_nm" 		},	    	    	
		    	{ 	"data":"menu_id" 		},
		    	{ 	"data":"menu_par_id" 		},
		    	{ 	"data":"menu_icon" 			}	
		    ],
		    "order":[2,"asc"],
		    "fnRowCallback":function(nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
		    	var menu_id = aData["menu_id"];
		    	var menu_par_id = aData["menu_par_id"];
		    	var check_flag = aData["check_flag"];
		    	//console.log(check_flag);
		    	var checked='';
		    	if(check_flag=="Y"){		
					checked = 'checked="checked"';
				}
		    	var rtn_value = '<div class="custom-control custom-checkbox text-center">  ';
		        rtn_value +=    '	<input type="checkbox" id="chk_'+menu_id+'" name="chk_'+menu_id+'" value="'+menu_id+'" class="custom-control-input" '+checked+'> ';
		        rtn_value +=    '	<input type="hidden" id="input_'+menu_id+'" name="input_'+menu_id+'" value="'+menu_par_id+'" > ';
		        rtn_value += 	'	<label class="custom-control-label" for="chk_'+menu_id+'"></label>';  
		        rtn_value += 	'</div>';
		    	$('td:eq(0)', nRow).html(rtn_value);
		    	
				if(menu_id != menu_par_id){		
					$('td:eq(1)', nRow).css('padding-left', '30px'); 
					$('td:eq(2)', nRow).css('padding-left', '30px');  
				}
				
	   	  	},
		   	"fnInitComplete": function(settings, json) {
		   		//console.log(json.data[0].menu_id);
		   		var gridData = json.data;
		   		
		   		$("input[type=checkbox]").change(function(){
					var chk_menu_id = $(this).val();
					var chk_menu_par_id = $("#input_"+$(this).val()).val();
					//console.log(chk_menu_id);
					
					if($(this).prop('checked')){
						for(var i=0; i<gridData.length; i++){ 
							if(gridData[i].menu_id == chk_menu_id){				//선택한 메뉴이면
								chk_grid = gridData[i];
								if(chk_grid.menu_id==chk_grid.menu_par_id){				//서브메뉴가 있으면
									if(chk_grid.menu_url==""){
										chk_grid.list = [];		
										for(var j=0; j<gridData.length; j++){ 
											if(gridData[j].menu_par_id==chk_menu_id && gridData[j].menu_id!=gridData[j].menu_par_id){
												$("#chk_"+gridData[j].menu_id).prop('checked', true);
												chk_grid.list.push(gridData[j]);
											}
										}
									}
									menu_tree.push(chk_grid);
								} else {
									for(var j=0; j<menu_tree.length; j++){
										//console.log(menu_tree[j].menu_id);
										if(menu_tree[j].menu_id==chk_menu_par_id){
											menu_tree[j].list.push(chk_grid);
										}
									} 
								}	
							}
						} 
						
					}else{
						//$("#"+chk_menu_id).remove();
						for(var i=0; i<gridData.length; i++){ 
							if(gridData[i].menu_id == chk_menu_id){					//선택한 메뉴이면
								chk_grid = gridData[i];
								if(chk_grid.menu_id==chk_grid.menu_par_id){
									if(chk_grid.menu_url==""){						//서브메뉴가 있으면
										for(var j=0; j<gridData.length; j++){ 
											if(gridData[j].menu_par_id==chk_menu_id && gridData[j].menu_id!=gridData[j].menu_par_id){
												$("#chk_"+gridData[j].menu_id).prop('checked', false);
											}
										}
									} 
									for(var j=0; j<menu_tree.length; j++){
										//console.log(menu_tree[j].menu_id);
										if(chk_menu_id==menu_tree[j].menu_id){
											menu_tree.splice(j,1);
										}
									} 
								}else{
									for(var j=0; j<menu_tree.length; j++){
										var sub_menu_tree = menu_tree[j].list;
										for(var k=0; k<sub_menu_tree.length; k++){
											if(chk_menu_id==sub_menu_tree[k].menu_id){
												sub_menu_tree.splice(k,1);
											}
										}
									} 
								}
							}
						}  
						
					}
					
					createMenuTree();
				});
		    }	//initComplete
		  	
	    });	
	}
	
	createDataTable('0001');
	
	
	//조회
	function updateResultTable(){
		//var strUrl = "${contextpath}/code/menuCodeMapListAll.json"; 
		//strUrl += '?user_type='+encodeURIComponent($("#user_type").val());
		//dataTable.api().ajax.url(strUrl).load();	
		dataTable.api().destroy();
		createDataTable($("#user_type").val());
	}
	/***** End - DataTables *****/

	
	/***** MenuTree - Start *****/
	var menu_tree = [];
	function updateMenuList() {
		menu_tree=[];
		var ajaxParam = {
            'url' : '${contextpath}/code/menuMapList.json',
            'type' : 'POST',
        	'data' : {
        		'user_type' : $("#user_type").val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$.each(data.resultList, function(index, item){
        		//console.log(item);  
        		menu_tree.push(item);
        	});
        	createMenuTree();
        });
	}
	
	function createMenuTree(){
		//console.log(menu_tree);
		var nestable_html = '<ol class="dd-list">';	
        $.each(menu_tree, function(index, item){
       		//console.log(item);			
			if(item.menu_url!=''){
				nestable_html += '<li class="dd-item" data-id="'+item.menu_id+'" id="'+item.menu_id+'">';
				nestable_html += '	<div class="dd-handle">'+item.menu_nm+'</div>';
				nestable_html += '</li>';
			}else{
				nestable_html += '<li class="dd-item" id="'+item.menu_id+'" data-id="'+item.menu_id+'">';  
				nestable_html += '	<div class="dd-handle">'+item.menu_nm+'</div>';   
				nestable_html += '	  <ol class="dd-list">';
				$.each(item.list, function(j, _item){
					//console.log(" >>> "+_item.menu_nm);
					nestable_html += '  <li class="dd-item" id="'+_item.menu_id+'" data-id="'+_item.menu_id+'">';
					nestable_html += '	  <div class="dd-handle">'+_item.menu_nm+'</div>';
					nestable_html += '  </li>';
				});
				nestable_html += '	  </ol>';
				nestable_html += '</li>';
			}
       	}); 
        nestable_html += '</ol>';
       	$("#nestable").html("");
		$("#nestable").html(nestable_html);
		setNestable();
	}
	/***** Menu Tree - End *****/
	
	
	//사용자 유형 Select
	function createCommCodeSelectBox(){
		var ajaxParam = {
            'url' : '${contextpath}/common/createCommCodeSelectBox.json',
            'type' : 'POST',
        	'data' : {
        		'group_id' : 'CD01',
        		'selected' : ''
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	$('#user_type option').remove();
        	$('#user_type').append(data.html);
        	//alert($('#user_type option:first').val());
        	updateMenuList();
        });
	}
	createCommCodeSelectBox(); 
	
	$('#user_type').change(function(){
		updateResultTable();
		updateMenuList();
	});
		
	/* 
	$('#chk_all').change(function(){
		if($(this).prop('checked')){
			$('input[type=checkbox]').each(function(){
				$(this).prop('checked', true);
			}); 
		}else{
			$('input[type=checkbox]').each(function(){
				$(this).prop('checked', false);
			});
		}
	}); 
	*/
	 	
	var updateOutput = function(e) {
		var nestable_val = "";
		var list = e.length ? e : $(e.target), output = list.data('output');  
		//console.log(list.nestable('serialize'));
		$.each(list.nestable('serialize'), function(index, item){
			//console.log(item.id);    
			//console.log(item.children);
			nestable_val += item.id+",";
			if(item.children) {
				$.each(item.children, function(j, _item){
					//console.log(_item.id);
					nestable_val += _item.id+",";
				});
			}
		});
		$("#nestable-output").val(nestable_val);
		
		//if (window.JSON) {
		//	output.val(window.JSON.stringify(list.nestable('serialize')));
			//, null, 2));			
		//} else { 
		//	output.val('JSON browser support required for this demo.');
		//}
		//console.log($("#nestable-output").val());  
		//console.log(output.val());  
		//$.each(output.val(), function(index, item){
		//	console.log(item.id);  
		//});
	};
	
	$('#nestable').nestable({
		group : 1  
	}).on('change', updateOutput);
	
	updateOutput($('#nestable').data('output', $('#nestable-output')));  
	
	function setNestable(){
		$('#nestable').nestable('init'); 
		updateOutput($('#nestable').data('output', $('#nestable-output')));   
	}	
	
	//저장
	$('#btnSave').click(clickBtnSave=function(){
		//console.log($('#nestable-output').val());
		$('#menu_id').val($('#nestable-output').val());
		
		var ajaxParam = {
            'url' : '${contextpath}/code/menuCodeMapInsert.json',
            'type' : 'POST',
        	'data' : {
        		'user_type' : $('#user_type').val(),
    			'menu_id' : $('#menu_id').val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			updateResultTable();
			updateMenuList();
        });
	});	
	
	
	
});//jQuery

var Service = {		
		
	//순서저장, 매핑저장
	requestInsert : function() {
		var ajaxParam = {
            'url' : '${contextpath}/code/menuCodeMapInsert.json',
            'type' : 'POST',
        	'data' : {
        		'user_type' : $('#user_type').val(),
    			'menu_id' : $('#menu_id').val()
            }
        };
        Common.ajaxJSON(ajaxParam, function(data) {
        	if(!data){
				alert('return data error');
				return false;
			}
			alert(data.msg);
			$.updateResultTable();
			$.createMenuList();
        });
	}
}
</script>	 	
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>
