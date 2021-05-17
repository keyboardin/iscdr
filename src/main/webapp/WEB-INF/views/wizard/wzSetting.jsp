<!-- st004.jsp 일자별 채널 점유 보고서 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %> 
<link rel="stylesheet" href="${contextpath}/static/plugin/jquery-step-master/normalize.css">
<link rel="stylesheet" href="${contextpath}/static/plugin/jquery-step-master/main.css">
<link rel="stylesheet" href="${contextpath}/static/plugin/jquery-step-master/jquery.steps.css">
<link rel="stylesheet" href="${contextpath}/static/SmartAdmin/${system_skin}/css/formplugins/select2/select2.bundle.css">        

<style>
<!--
.table.dataTable th {
    background: #6a9ab5 !important;
    color: #ffffff !important;
}
.table th, .table td {
	padding: 0.1rem;
	text-align: center;
}

.custom-control-inline {
	margin-right: 0;
}


.bootstrap-tagsinput{display:block;width:100%;min-height:38px;padding:1px 3px;font-size:13px;line-height:1.428571429;color:#555;vertical-align:middle;background-color:#FFF;border:1px solid #CCC;border-radius:0}
.bootstrap-tagsinput>span{border-radius:0!important;font-weight:400;padding:3px 28px 4px 8px;font-size:13px;border:1px solid #285E8E;background:#3276B1}
.bootstrap-tagsinput input{border:none;box-shadow:none;outline:0;background-color:transparent;padding:0;margin:0;width:auto!important;max-width:inherit}
.bootstrap-tagsinput input:focus{border:none;box-shadow:none}
.bootstrap-tagsinput .tag{color:#FFF;position:relative;margin:3px 0 3px 2px;display:inline-block}
.bootstrap-tagsinput .tag [data-role=remove]{display:block;top:-1px;right:0;padding:3px 4px 3px 5px;width:23px;height:22px;position:absolute;cursor:pointer}
.bootstrap-tagsinput .tag [data-role=remove]:hover{background:rgba(0,0,0,.3)}
.bootstrap-tagsinput .tag [data-role=remove]:after{content:"x";font-family:FontAwesome;padding:2px 1px;line-height:17px;font-size:15px;text-align:center}
.bootstrap-tagsinput .tag [data-role=remove]:hover{box-shadow:inset 0 1px 0 rgba(255,255,255,.2),0 1px 2px rgba(0,0,0,.05)}
.bootstrap-tagsinput .tag [data-role=remove]:hover:active{box-shadow:inset 0 3px 5px rgba(0,0,0,.125)}

.connectedSortable { list-style-type: none; margin: 0; padding: 0; margin-bottom: 10px; }
.connectedSortable>li { margin: 5px; padding: 5px; border:1px #A7A7A7 dashed;}
.ulTable { list-style-type: none; margin: 0; padding: 0; margin-bottom: 10px; }
.ulTable>li { float:left;; margin: 5px; padding: 5px; width: 100px; border:1px #A7A7A7 dashed;}

.wizard > .content {
    min-height: 45em;
 }
-->
</style>
<!-- BEGIN Page Content -->
<main id="js-page-content" role="main" class="page-content">
	<ol class="breadcrumb page-breadcrumb" id="menu_title">
		&nbsp; 
	</ol>
   	
	<div class="row">  
		<div class="col-lg-12 col-xl-12">
			<div id="panel-1" class="panel">
				<div class="panel-container show">
					<div class="panel-content">
						<div class="row">
							<div id="wizard">
				                <h2>조건</h2>
				                <!-- 조건 section Start -->
				                <section>
				                    <div class="row">
				                    	<div class="col-lg-2">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl" style="padding-top:5px !important;">
				                    			보고서 타입
				                    		</div>
				                        	<div class="row p-sm-3">
				                        		<c:forEach var="item" items="${resultList}" varStatus="status">
				                            	<div class="col-md-12 border-bottom-dash <c:if test="${status.first == false }">pt-2</c:if>">
			                            			<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="${item.rpt_id }" name="rdoRpt01" 
                                                        data-procnm="${item.rpt_div}" data-rptnm="${item.rpt_nm}" <c:if test="${status.first == true }">checked="checked"</c:if>>
                                                        <label class="custom-control-label" for="${item.rpt_id }">${item.rpt_nm }</label>
                                                    </div>
				                               	</div>
				                               	</c:forEach>
				                           </div>
				                    	</div>
				                    	<div class="col-lg-2">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl" style="padding-top:5px !important;">
				                    			보고서 양식
				                    		</div>
				                        	<div class="row p-sm-3" id="rptKind"></div>
				                    	</div>
				                    	<div class="col-lg-8">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl" style="padding-top:5px !important;">
				                    			검색 조건
				                    		</div>
						                   	<div class="row py-3" id="where_dttype">
						                   		<div class="col-md-2">
						                   			<div class="custom-control custom-radio mb-2 text-right pt-2">
	                                                    <label class="form-label pt-1">구분</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-10">
						                        	<div class="row" style="padding-top:8px;">
						                            	<div class="col-md-2" style="padding-right:5px;" id="IN_D">
						                               		<div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="D" name="rdoDateType" checked="checked">
                                                                <label class="custom-control-label" for="D">일별</label>
                                                            </div>
														</div>
														<div class="col-md-2">
                                                            <div class="custom-control custom-radio" id="IN_M">
                                                                <input type="radio" class="custom-control-input" id="M" name="rdoDateType">
                                                                <label class="custom-control-label" for="M">월별</label>
                                                            </div>
                                                        </div>
														<div class="col-md-2">
                                                            <div class="custom-control custom-radio" id="IN_H">
                                                                <input type="radio" class="custom-control-input" id="H" name="rdoDateType">
                                                                <label class="custom-control-label" for="H">시간대별</label>
                                                            </div>
                                                        </div>
														<div class="col-md-4">
                                                            <div class="custom-control custom-radio" id="IN_DH">
                                                                <input type="radio" class="custom-control-input" id="DH" name="rdoDateType">
                                                                <label class="custom-control-label" for="DH">일별시간대별</label>
                                                            </div>
						                               	</div>
						                           	</div>
												</div>
				                    		</div>
				                    		
				                    		<div class="row py-3" id="where_datetime">
												<div class="col-md-2">
                                                	<div class="custom-control mb-1 text-right pt-2">
	                                                    <label class="form-label pt-1">기간</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-4">
		                                            <div class="input-daterange input-group">
						                            	<div class="input-group-prepend">
	                                                        <span class="input-group-text fs-xl">
	                                                             <i class="fal fa-calendar"></i>  
	                                                         </span>
	                                                    </div>
						                                <input type="text" class="form-control" name="frdt" id="frdt" onkeydown="onlyDatepicker(event)" style="width:100px;">
						                                <select class="form-control" id="frtm" style="width:70px;"></select>
						                            </div>
						                        </div>
						                        <div class="col-md-4">
						                            <div class="input-daterange input-group">
						                                <div class="input-group-prepend">
	                                                        <span class="input-group-text fs-xl">
	                                                             <i class="fal fa-calendar"></i>  
	                                                         </span>
	                                                    </div>
						                                <input type="text" class="form-control" name="todt" id="todt" onkeydown="onlyDatepicker(event)" style="width:100px;">
						                                <select class="form-control" id="totm" style="width:70px;"></select>
						                            </div>
						                        </div>
						                    </div>
						                    <div class="row py-3" id="where_maintel">
                                                <div class="col-md-2">
                                                	<div class="custom-control mb-1 text-right pt-2">
	                                                    <label class="form-label pt-1">대표번호</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-8">
		                                            <select class="select2 form-control" multiple="multiple" id="selectMainTel">
	                                                </select>
						                        </div>
											</div>
											
											<div class="row py-3" id="where_center">
                                                <div class="col-md-2">
                                                	<div class="custom-control mb-2 text-center">
	                                                    <label class="form-label pt-2">센터</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-10">
		                                            <select class="select2 form-control" multiple="multiple" id="selectCenter">
                                                        <option value="1">상암센터</option>
                                                        <option value="2">분당센터</option>
                                                        <option value="3">강남센터</option>
	                                                </select>
						                        </div>
											</div>
						                    <div class="row py-3" id="where_org">
                                                <div class="col-md-2">
                                                	<div class="custom-control custom-radio mb-2 text-center">
	                                                    <label class="form-label pt-2">조직</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-2">
	                                            	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-group">선택</button>
	                                                <!-- Modal center -->
		                                            <div class="modal fade" id="modal-group" tabindex="-1" role="dialog" aria-hidden="true">
		                                                <div class="modal-dialog modal-dialog-centered" role="document">
		                                                    <div class="modal-content">
		                                                        <div class="modal-header">
		                                                            <h4 class="modal-title">
																		조직 선택
		                                                            </h4>
		                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                                                <span aria-hidden="true"><i class="fal fa-times"></i></span>
		                                                            </button>
		                                                        </div>
		                                                        <div class="modal-body">
		                                                            <div id="groupJSTree"></div>
		                                                        </div>
		                                                        <div class="modal-footer">
		                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
	                                            </div>
	                                            <div class="col-md-8">
	                                            	<input id="organi" class="tagsinput form-control" data-role="tagsinput sometext">
	                                            </div>
											</div>
											
						                    <div class="row py-3" id="where_agent">
                                                <div class="col-md-2">
                                                	<div class="custom-control custom-radio mb-2 text-right pt-2">
	                                                    <label class="form-label pt-1">상담직원</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-2">
	                                            	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-agent">선택하세요</button>
		                                            <div class="modal fade" id="modal-agent" tabindex="-1" role="dialog" aria-hidden="true">
		                                                <div class="modal-dialog modal-dialog-centered" role="document">
		                                                    <div class="modal-content">
		                                                        <div class="modal-header">
		                                                            <h4 class="modal-title">
																		상담직원 선택
		                                                            </h4>
		                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                                                <span aria-hidden="true"><i class="fal fa-times"></i></span>
		                                                            </button>
		                                                        </div>
		                                                        <div class="modal-body">
		                                                            <div id="agentJSTree"></div>
		                                                        </div>
		                                                        <div class="modal-footer">
		                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
	                                            </div>
	                                            <div class="col-md-6">
	                                            	<input id="agent" class="form-control">
	                                            </div>
											</div>
											<div class="row py-3" id="where_ani">
                                                <div class="col-md-2">
                                                	<div class="custom-control mb-2 text-right pt-2">
	                                                    <label class="form-label pt-1">발신번호</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-8">
		                                            <input id="txt_ani" class="form-control" value="">
						                        </div>
											</div>
				                    	</div>
				                    </div>
			                   		<!--// 조건 section End -->
				                </section>

				                <h2>보고서</h2>
				                <!--// 보고서 section Start -->
				                <section>
				                    <div class="row">
				                    	<div class="col-md-2">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl" style="padding-top:5px !important;">
				                    			표시 항목
				                    		</div>
				                        	<div class="row p-sm-3">
												<div class="frame-wrap mb-0 w-100">
													<div class="card">
														<div class="card-body" style="height:500px;scroll;overflow-y:scroll;">
															<ul id="sortable1" class="connectedSortable"></ul>
														</div>
													</div>  
												</div>
				                        	</div>
				                    	</div>
				                    	<div class="col-md-10">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl" style="padding-top:5px !important;">
				                    			선택 항목
				                    		</div>
				                        	<!-- <div class="row p-sm-3 m-sm-3 bg-info-50">그룹</div>
				                        	<div class="row p-sm-3 m-sm-3 bg-info-50">
												<ul id="sortable2" class="ulTable"></ul>
				                        	</div> -->
				                        	<div class="row p-sm-3 m-sm-3 bg-info-50">컬럼</div>
				                        	<div class="row p-sm-3 m-sm-3 bg-info-50"> 
												<ul id="sortable3" class="ulTable"></ul>
				                        	</div>
				                    	</div>
				                    </div>
				                </section>
				                <!--// 보고서 section End -->
				            </div>
						</div>
					</div>
				</div>
			</div>  
		</div>                                      
	</div>
</main>
<!-- END Page Content -->     


<input type="hidden" id="condition">       
<input type="hidden" id="dt_condition">       
<%@ include file="/WEB-INF/views/common/CommonFooter.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonJs.jsp" %>
<script src="${contextpath}/static/common/js/common.js"></script>
<script src="${contextpath}/static/plugin/jquery-step-master/modernizr-2.6.2.min.js"></script>
<script src="${contextpath}/static/SmartAdmin/${system_skin}/js/formplugins/select2/select2.bundle.js"></script>
<script src="${contextpath}/static/plugin/bootstrap-tags/bootstrap-tagsinput.min.js"></script>
<script src="${contextpath}/static/plugin/jstree/js/jstree.min.js"></script>
<script src="${contextpath}/static/plugin/jquery-step-master/jquery.steps.min.js"></script>
<script type="text/javascript">
$(function() { 
	
	setTitle("${param.menu_par_id}","${param.menu_id}");
	
    $("#wizard").steps({
        headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "fade",
        //enableFinishButton: false,
        //enablePagination: false,
        //enableAllSteps: true,
        //titleTemplate: "#title#",
        //cssClass: "tabcontrol",
        onStepChanging: function(event, currentIndex, priorIndex){
        	if($("input:radio[name=rdoRpt02]").is(":checked") == false){
            	alert("보고서를 선택하세요!!");
				return false;
			}
			
        	return true;
        }
        ,onStepChanged: function(event, currentIndex, priorIndex){
			//console.log(event);
			//console.log("onStepChanged currentIndex = "+currentIndex+", priorIndex = "+priorIndex);
        	var rpt_id = $("input:radio[name=rdoRpt02]:checked").attr("id");
        	Service.requestTableColumnList(rpt_id);
        	//console.log("onStepChanged tablename = "+tablename+", datetype = "+datetype);
		}
		,onFinishing: function(event, currentIndex){
			/* 
			var dttype = $("input:radio[name=rdoDateType]:checked").attr("id");
			var frdt =$("#frdt").val();
			var todt =$("#todt").val();
			var frtm =$("#frtm").val();
			var totm =$("#totm").val();
			return false; 
			*/
			//console.log("onFinishing currentIndex = "+currentIndex);
			//console.log("보고서 팝업");
		
			Service.requestWzPopup();
		}
		,onFinished: function(event, currentIndex){
			console.log("onFinished currentIndex = "+currentIndex);
		}
    });

    
    $("input:radio[name=rdoRpt01]").on("click", function(){
    	//console.log("rdoRpt01 id = "+this.id);
    	Service.requestChildList(this.id, 0);
	});


	$(document).on("click","input:radio[name=rdoRpt02]",function(e){
		//console.log("rdoRpt02 id = "+this.id);
    	Service.requestChildList(this.id, 1);
	});

	Service.requestChildList("${firstRptId}", 0);
	

    var controls = {
        leftArrow: '<i class="fal fa-angle-left" style="font-size: 1.25rem"></i>',
        rightArrow: '<i class="fal fa-angle-right" style="font-size: 1.25rem"></i>' 
    };

    $('#frdt').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    });
	$('#todt').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    });
	
	$("#frdt").val(getCurrentDate(0,"-")); 
	$("#todt").val(getCurrentDate(0,"-"));
	
	getSelectHour('frtm', '00', '시');
	getSelectHour('totm', '23', '시');


	$('#selectCenter, #selectMainTel').select2({
        placeholder: "선택하세요"
    });

	/* 
	var jsonData2 = [
		{"id":"aidx01","parent":"#","text":"상담원"},
		{"id":"aidx0101","parent":"aidx01","text":"agent-1"},
		{"id":"aidx0102","parent":"aidx01","text":"agent-2"},
		{"id":"aidx0103","parent":"aidx01","text":"agent-3"},
		{"id":"aidx0104","parent":"aidx01","text":"agent-4"},
		{"id":"aidx0105","parent":"aidx01","text":"agent-5"}
	]; 
	*/

	
	//var jsonArray = new Array();	
	function createAgentList() {
		var ajaxParam = {
            "url" : "${contextpath}/wizard/agentTree.json",
            "type" : "POST",
        	"data" : {
            }
        };
		Common.ajaxJSON(ajaxParam, function(data) {
			var jsonArray=[];	
			$.each(data.resultList, function(index, item) {
				//console.log(item.id+' : '+item.text);
				var json = new Object();
				json.id=item.id;
				json.parent=item.parent;
				json.text=item.text;
				json.level=item.level;
				json.icon=item.icon;
				jsonArray.push(json); 
			});
			//var jsonData2 = JSON.stringify(jsonArray);
			//console.log(jsonArray);
			createJSTree("agentJSTree",jsonArray);
		});
	}
	createAgentList();
	
	
	var jsonData1 = [
		{"id":"idx01","parent":"#","text":"ROOT-1"},
		{"id":"idx0101","parent":"idx01","text":"child-1-1"},
		{"id":"idx0102","parent":"idx01","text":"child-1-2"},
		{"id":"idx0103","parent":"idx01","text":"child-1-3"},
		{"id":"idx0104","parent":"idx01","text":"child-1-4"},
		{"id":"idx0105","parent":"idx01","text":"child-1-5"},
		{"id":"idx02","parent":"#","text":"ROOT-2"},
		{"id":"idx0201","parent":"idx02","text":"child-2-1"},
		{"id":"idx0202","parent":"idx02","text":"child-2-2"},
		{"id":"idx0203","parent":"idx02","text":"child-2-3"},
		{"id":"idx0204","parent":"idx02","text":"child-2-4"},
		{"id":"idx0205","parent":"idx02","text":"child-2-5"},
		{"id":"idx03","parent":"#","text":"ROOT-3"},
		{"id":"idx0301","parent":"idx03","text":"child-3-1"},
		{"id":"idx0302","parent":"idx03","text":"child-3-2"},
		{"id":"idx0303","parent":"idx03","text":"child-3-3"},
		{"id":"idx0304","parent":"idx03","text":"child-3-4"},
		{"id":"idx0305","parent":"idx03","text":"child-3-5"}
	];
	
	createJSTree("groupJSTree",jsonData1);
	

	$('#modal-group').on('hidden.bs.modal', function (e) {
		//var selectedNodeLen = ( $('#groupJSTree').jstree("get_selected") ).length;
		$('#organi').tagsinput('removeAll');		// 
		$.each( $('#groupJSTree').jstree("get_selected") ,function(i,item){ 
			//console.log(item+" / "+$('#groupJSTree').jstree().get_node(item).text);
			$("#organi").tagsinput("add", {id:item, text:$('#groupJSTree').jstree().get_node(item).text}); 
		});
	});

	$("#organi").tagsinput({
		itemValue:'id',
		itemText:'text'
	});
	
	$('#modal-agent').on('hidden.bs.modal', function (e) {
		//var selectedNodeLen = ( $('#agentJSTree').jstree("get_selected") ).length;
		$('#agent').tagsinput('removeAll');		// 
		$.each( $('#agentJSTree').jstree("get_selected") ,function(i,item){ 
			//console.log(item+" / "+$('#agentJSTree').jstree().get_node(item).text);
			//console.log(item);
			//console.log($('#agentJSTree').jstree().get_node(item).text);
			//console.log($('#agentJSTree').jstree().get_node(item).original.level);
			var lvl = $('#agentJSTree').jstree().get_node(item).original.level;
			if(lvl>1) $("#agent").tagsinput("add", {id:item, text:$('#agentJSTree').jstree().get_node(item).text}); 
		});
	});

	$("#agent").tagsinput({
		itemValue:'id',
		itemText:'text'
	}); 


	$("#sortable1, #sortable2, #sortable3").sortable({
		connectWith: ".connectedSortable, .ulTable"
	}).disableSelection();
	
	
	Service.requestMainTelList();
	
	
});//jQuery

function createJSTree(objTree, jsonData){
	$('#'+objTree).jstree({
        "core": {
            "check_callback": true,
            'data': jsonData                    
        },
		"checkbox" : {
			"keep_selected_style" : false
		},
        "plugins": ["checkbox"]
    });
}


var Service = {
		
	initCondition : function(){
		$("#where_dttype").hide();
		$("#where_datetime").hide();
		$("#where_maintel").hide();
	    $("#where_center").hide();
	    $("#where_org").hide();
	    $("#where_agent").hide();
	    $("#where_ani").hide();
	    /*
		콜통계 : 구분,기간,대표번호,센터,조직,상담직원
		상담직원통계 : 구분,기간,센터,조직,상담직원
		ARS통계 : 구분,기간,대표번호,센터
		콜추적 : 구분,	기간,대표번호,발신번호
	    */
	}
	, //initTableColumn 
	initTableColumn : function(){
		$("#sortable1").empty();
		$("#sortable2").empty();
		$("#sortable3").empty().append("<li class='ui-state-default' id='aaa' style='border: 0px #A7A7A7 dashed;'>&nbsp;</li>");
	}
	, //requestChildList
	requestChildList : function(rpt_par_id, level) {
		console.log("Service.requestChildList");
		var rpt_div="";
		if(level==1){
			rpt_div="WHERE";
		}
		var ajaxParam = {
            "url" : "${contextpath}/wizard/reportChildList.json",
            "type" : "POST",
        	"data" : {
        		"rpt_par_id" : rpt_par_id,
        		"rpt_div" : rpt_div
            }
        };
		Common.ajaxJSON(ajaxParam, function(data) { 
			Service.initCondition();
			if(level==0){		//보고서타입선택
				var inRptHTML = "";
				$("#rptKind").empty();
				$.each(data.resultList, function(index, item) {
					if(index == 0)
						inRptHTML += "<div class='col-md-12 border-bottom-dash'>";
					else
						inRptHTML += "<div class='col-md-12 pt-2 border-bottom-dash'>";
					inRptHTML += 	"<div class='custom-control custom-radio'>";
					inRptHTML +=		"<input type='radio' class='custom-control-input' id='"+item.rpt_id+"' name='rdoRpt02' data-tnm='"+item.tv01+"' data-rptnm='"+item.rpt_nm+"'>";
					inRptHTML += 		"<label class='custom-control-label' for='"+item.rpt_id+"'>"+item.rpt_nm+"</label>";
					inRptHTML += 	"</div>";
					inRptHTML += "</div>";
		    	});
				$("#rptKind").append(inRptHTML);
			}else if(level==1){	//보고서양식선택
				var condition="";
				var dt_condition="";
				$.each(data.resultList, function(index, item) {		//where조건 루프
					$("#"+item.tv01).show();
					if(item.tv01=="where_dttype"){
						$("#IN_D").hide();	
						$("#IN_M").hide();	
						$("#IN_H").hide();	
						$("#IN_DH").hide();	
						var tv02=item.tv02
						var arr = tv02.split("/");
						for(i=0; i<arr.length; i++){
							$("#IN_"+arr[i]).show();
						}
						dt_condition=tv02;
					}
					condition += item.tv01+",";
		    	});
				$("#condition").val(condition);
				$("#dt_condition").val(dt_condition);
			}
		});
	}
	, //requestTableColumnList
	requestTableColumnList : function(rpt_id) {
		console.log("Service.requestTableColumnList");
		var ajaxParam = {
            "url" : "${contextpath}/wizard/tableColumnList.json",
            "type" : "POST",
        	"data" : {
        		"rpt_id" : rpt_id
            }
        };
		Common.ajaxJSON(ajaxParam, function(data) {
			Service.initTableColumn();
			var inColumnHTML = "";
			var selectColumnHTML = "";
			var datetype = $("input:radio[name=rdoDateType]:checked").attr("id");
			$.each(data.resultList, function(index, item) {
				inColumnHTML += "<li class='ui-state-default' id='"+item.column_name+"' data-align='"+item.column_align+"'>"+item.column_type+"</li>";
			});
			$("#sortable1").append(inColumnHTML);
		});
	}
	, //requestWzPopup
	requestWzPopup : function(){
		console.log("Service.requestWzPopup");
		var report_type = $("input:radio[name=rdoRpt01]:checked").attr("id");		//보고서타입
		var report_type_nm = $("input:radio[name=rdoRpt01]:checked").data("rptnm");	//보고서타입명
		var report_temp = $("input:radio[name=rdoRpt02]:checked").attr("id");		//보고서양식
		var report_temp_nm = $("input:radio[name=rdoRpt02]:checked").data("rptnm");	//보고서양식명
		var procnm = $("input:radio[name=rdoRpt02]:checked").data("tnm");			//프로시져명
		
		
		//기간은 필수항목
		var frdt = $("#frdt").val();		//검색조건-일자
		var todt = $("#todt").val();
		var frtm = $("#frtm").val();
		var totm = $("#totm").val();
		if(frdt > todt){
			alert("기간(일자)을 확인하세요");
			return false;
		}
		
		var condition2=new Array();
		var condition = $("#condition").val();									//조건리스트
		
		if(condition.indexOf("where_datetime")!=-1){							//검색조건-기간
			condition2.push("where_datetime"); 									//기간은 템블릿에 있으면 추가
		}		
		
		var dt_condition = $("#dt_condition").val();							//D/M/H/DH
		
		var dttype="";
		if(condition.indexOf("where_dttype")!=-1){
			dttype = $("input:radio[name=rdoDateType]:checked").attr("id");		//검색조건-구분	
			condition2.push("where_dttype"); 									//구분은 템블릿에 있으면 추가
		}		
		
		var maintel = "";														
		if(condition.indexOf("where_maintel")!=-1){
			maintel = $("#selectMainTel").select2("val").toString();			//검색조건-대표번호
			//console.log($("#selectMainTel").select2("data"));					//검색조건-대표번호
			if(maintel!="") {
				var jsonArray=[];	
				var maintels = $("#selectMainTel").select2("data");
				//console.log(maintels);
				maintels.forEach(function(item, i){
					var json = new Object();
					json.id = item.id;
					json.text = item.text;
					jsonArray.push(json);
				});
				maintel = JSON.stringify(jsonArray);
				condition2.push("where_maintel"); 					//대표번호를 하나라도 선택했으면 검색조건목록에 추가
			}
		}
		
		var agent;
		if(condition.indexOf("where_agent")!=-1){
			//console.log($("#agent").val());
			if($("#agent").val()!="") {
				agent=JSON.stringify($("#agent").tagsinput('items'));			//검색조건-상담원
				condition2.push("where_agent"); 								//상담원을 하나라도 선택했으면 검색조건목록에 추가
			}else{
				agent="";
			}
		}
		
		if(condition.indexOf("where_ani")!=-1){									//검색조건-기간
			condition2.push("where_ani"); 										//고객번호는 템블릿에 있으면 추가
		}				
		
		//표시항목
		var header="", cols="", align="";
		$("#sortable3 > li").each(function(index, item){
			if($(this).attr("id")!='aaa'){
				header += $(this).text()+",";
				cols += $(this).attr("id")+",";
				align += $(this).data("align")+",";
			}
		});
		if(header.length<1) {
			alert("컬럼을 선택하세요");
			return false;
		}		
		header = header.substring(0, header.lastIndexOf(","));
		cols = cols.substring(0, cols.lastIndexOf(","));
		align = align.substring(0, align.lastIndexOf(","));

		console.log("report_type : "+report_type);
		console.log("report_type_nm : "+report_type_nm);
		console.log("report_temp : "+report_temp);
		console.log("report_temp_nm : "+report_temp_nm);
		console.log("procnm : "+procnm);
		console.log("dttype : "+dttype);
		console.log("frdt : "+frdt);
		console.log("todt : "+todt);
		console.log("frtm : "+frtm);
		console.log("to_tm : "+totm);
		console.log("maintel : "+maintel);
		console.log("agent : "+agent);
		console.log("header : "+header);
		console.log("cols : "+cols);
		console.log("align : "+align);		
			
		$("#frmCols").remove();
		var frmObj = $("<form>", {"id":"frmCols","action":"${contextpath}/wizard/wzPopup.do","method":"POST","target":"_blank" , "style":"display:none;"});
		var report_typeObj 		= $("<input>", {"name":"report_type","id":"report_type","value":report_type});
		var report_type_nmObj 	= $("<input>", {"name":"report_type_nm","id":"report_type_nm","value":report_type_nm});
		var report_tempObj 		= $("<input>", {"name":"report_temp","id":"report_temp","value":report_temp});
		var report_temp_nmObj	= $("<input>", {"name":"report_temp_nm","id":"report_temp_nm","value":report_temp_nm});
		var procnmObj 			= $("<input>", {"name":"procnm","id":"procnm","value":procnm});
		var conditionObj 		= $("<input>", {"name":"condition","id":"condition","value":condition2});
		var dt_conditionObj 	= $("<input>", {"name":"dt_condition","id":"dt_condition","value":dt_condition});
		
		var dttypeObj 	= $("<input>", {"name":"dttype","id":"dttype","value":dttype});
		var frdtObj 	= $("<input>", {"name":"frdt","id":"frdt","value":frdt});
		var todtObj 	= $("<input>", {"name":"todt","id":"todt","value":todt});
		var frtmObj 	= $("<input>", {"name":"frtm","id":"frtm","value":frtm});
		var totmObj 	= $("<input>", {"name":"totm","id":"totm","value":totm});
		var maintelObj 	= $("<input>", {"name":"maintel","id":"maintel","value":maintel});
		var agentObj    = $("<input>", {"name":"agent","id":"agent","value":agent});
		var aniObj 		= $("<input>", {"name":"ani","id":"ani","value":$("#ani").val()});
		//var centerObj = $("<input>", {"name":"center","id":"center","value":$("#selectCenter").select2("val").toString()});
		//var organiObj = $("<input>", {"name":"organi","id":"organi","value":$("#organi").val()});
		
		var headerObj = $("<input>", {"name":"header","id":"header","value":header});
		var colsObj = $("<input>", {"name":"cols","id":"cols","value":cols});
		var alignObj = $("<input>", {"name":"align","id":"align","value":align});
		
		frmObj
			.append(report_typeObj).append(report_type_nmObj).append(report_tempObj).append(report_temp_nmObj).append(procnmObj).append(conditionObj).append(dt_conditionObj)
			.append(dttypeObj).append(frdtObj).append(todtObj).append(frtmObj).append(totmObj).append(maintelObj).append(agentObj).append(aniObj)
			.append(headerObj).append(colsObj).append(alignObj)
			//.append(maintelObj).append(centerObj).append(organiObj).append(agentObj).append(aniObj)
		$(document.body).append(frmObj);
		//console.log($("#frmCols").html());
		$("#frmCols").submit();
	},
	
	requestMainTelList : function(){
		var ajaxParam = {
            "url" : "${contextpath}/wizard/mainTelList.json",
            "type" : "POST",
        	"data" : {
            }
        };
		Common.ajaxJSON(ajaxParam, function(data) {
			$.each(data.resultList, function(index, item) {
				//console.log(item.main_tel);
				$('#selectMainTel').append("<option value='"+item.main_tel+"'>"+item.main_tel_name+"("+item.main_tel+")</option>");		
			});
		});
	},
	
	
	
	
};
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>