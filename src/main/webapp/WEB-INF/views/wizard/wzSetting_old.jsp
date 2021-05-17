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


.bootstrap-tagsinput{display:block;width:100%;min-height:32px;padding:1px 3px;font-size:13px;line-height:1.428571429;color:#555;vertical-align:middle;background-color:#FFF;border:1px solid #CCC;border-radius:0}
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
.ulTable>li { float:left;; margin: 5px; padding: 5px; width: 150px; border:1px #A7A7A7 dashed;}
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
                                                        <input type="radio" class="custom-control-input" id="${item.rpt_id }" name="rdoRpt01" data-procnm="${item.rpt_div}" <c:if test="${status.first == true }">checked="checked"</c:if>>
                                                        <label class="custom-control-label" for="${item.rpt_id }">${item.rpt_nm }</label>
                                                    </div>
				                               	</div>
				                               	</c:forEach>
				                           </div>
				                    	</div>
				                    	<div class="col-lg-2">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl" style="padding-top:5px !important;">
				                    			보고서
				                    		</div>
				                        	<div class="row p-sm-3" id="rptKind"></div>
				                    	</div>
				                    	<div class="col-lg-8">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl" style="padding-top:5px !important;">
				                    			검색 조건
				                    		</div>
						                   	<div class="row py-3" id="where_datetype">
						                   		<div class="col-md-2">
						                   			<div class="custom-control custom-radio mb-2 text-center">
	                                                    <label class="form-label pt-2">구분</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-10">
						                        	<div class="row">
						                            	<div class="col-md-2">
						                               		<div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="DT" name="rdoDateType" checked="checked">
                                                                <label class="custom-control-label" for="DT">일별</label>
                                                            </div>
														</div>
														<div class="col-md-2">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="WeekDay" name="rdoDateType">
                                                                <label class="custom-control-label" for="WeekDay">요일별</label>
                                                            </div>
                                                        </div>
														<div class="col-md-2">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="YM" name="rdoDateType">
                                                                <label class="custom-control-label" for="YM">월별</label>
                                                            </div>
                                                        </div>
														<div class="col-md-2">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="TM" name="rdoDateType">
                                                                <label class="custom-control-label" for="TM">시간대별</label>
                                                            </div>
                                                        </div>
														<div class="col-md-4">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="DH" name="rdoDateType">
                                                                <label class="custom-control-label" for="DH">일별/시간대별</label>
                                                            </div>
						                               	</div>
						                           	</div>
												</div>
				                    		</div>
				                    		<div class="row py-3" id="where_datetime">
												<div class="col-md-2">
                                                	<div class="custom-control mb-2 text-center">
	                                                    <label class="form-label pt-2">기간</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-5">
		                                            <div class="input-daterange input-group">
						                            	<div class="input-group-prepend">
	                                                        <span class="input-group-text fs-xl">
	                                                             <i class="fal fa-calendar"></i>  
	                                                         </span>
	                                                    </div>
						                                <input type="text" class="form-control" name="from_date" id="from_date" onkeydown="onlyDatepicker(event)" style="width:100px;">
						                                <select class="form-control" id="from_time" style="width:100px;"></select>
						                            </div>
						                        </div>
						                        <div class="col-md-5">
						                            <div class="input-daterange input-group">
						                                <div class="input-group-prepend">
	                                                        <span class="input-group-text fs-xl">
	                                                             <i class="fal fa-calendar"></i>  
	                                                         </span>
	                                                    </div>
						                                <input type="text" class="form-control" name="to_date" id="to_date" onkeydown="onlyDatepicker(event)" style="width:100px;">
						                                <select class="form-control" id="to_time" style="width:100px;"></select>
						                            </div>
						                        </div>
						                    </div>
						                    <div class="row py-3" id="where_maintel">
                                                <div class="col-md-2">
                                                	<div class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" id="chkMainTel" checked="checked">
                                                        <label class="custom-control-label" for="chkMainTel">대표번호</label>
                                                    </div>
	                                            </div>
	                                            <div class="col-md-10">
		                                            <select class="select2 form-control" multiple="multiple" id="selectMainTel">
                                                        <option value="1">1588-0000</option>
                                                        <option value="2">1644-0000</option>
                                                        <option value="3">1111-2222</option>
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
						                    <div class="row py-3" id="where_organi">
                                                <div class="col-md-2">
                                                	<div class="custom-control custom-radio mb-2 text-center">
	                                                    <label class="form-label pt-2">조직</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-2">
	                                            	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-group">선택하세요...</button>
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
                                                	<div class="custom-control custom-radio mb-2 text-center">
	                                                    <label class="form-label pt-2">상담직원</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-2">
	                                            	<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-agent">선택하세요...</button>
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
	                                            <div class="col-md-8">
	                                            	<input id="agent" class="tagsinput form-control" data-role="tagsinput sometext">
	                                            </div>
											</div>
											<div class="row py-3" id="where_ani">
                                                <div class="col-md-2">
                                                	<div class="custom-control mb-2">
	                                                    <label class="form-label">발신번호</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-10">
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
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl">
				                    			표시 항목
				                    		</div>
				                        	<div class="row p-sm-3">
												<div class="frame-wrap mb-0 w-100">
													<div class="card">
														<div class="card-body">
															<ul id="sortable1" class="connectedSortable"></ul>
														</div>
													</div>  
												</div>
				                        	</div>
				                    	</div>
				                    	<div class="col-md-10">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl">
				                    			선택 항목
				                    		</div>
				                        	<div class="row p-sm-3 m-sm-3 bg-info-50">그룹</div>
				                        	<div class="row p-sm-3 m-sm-3 bg-info-50">
												<ul id="sortable2" class="ulTable"></ul>
				                        	</div>
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
        	var table_name = $("input:radio[name=rdoRpt02]:checked").data("tnm");
        	Service.requestTableColumnList(table_name);
        	//console.log("onStepChanged tablename = "+tablename+", datetype = "+datetype);
		}
		, onFinishing: function(event, currentIndex){
			//console.log("onFinishing currentIndex = "+currentIndex);
			//console.log("보고서 팝업");
			var table_name = $("input:radio[name=rdoRpt02]:checked").data("tnm");
			Service.requestWzPopup(table_name);
		}
		, onFinished: function(event, currentIndex){
			console.log("onFinished currentIndex = "+currentIndex);
		}
    });

    //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    
    $("input:radio[name=rdoRpt01]").on("click", function(){
    	//console.log("rdoRpt01 id = "+this.id);
    	Service.requestChildList(this.id, 0);
	});


	$(document).on("click","input:radio[name=rdoRpt02]",function(e){
		//console.log("rdoRpt02 id = "+this.id);
    	Service.requestChildList(this.id, 1);
	});

	Service.requestChildList("${firstRptId}", 0);
	
    //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

    var controls = {
        leftArrow: '<i class="fal fa-angle-left" style="font-size: 1.25rem"></i>',
        rightArrow: '<i class="fal fa-angle-right" style="font-size: 1.25rem"></i>' 
    };

    $('#from_date').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    });
	$('#to_date').datepicker({
        todayHighlight: true,
        orientation: "bottom left",
        templates: controls,
      	format : "yyyy-mm-dd"
    });
	
	$("#from_date").val(getCurrentDate(0,"-")); 
	$("#to_date").val(getCurrentDate(0,"-"));
	
	getSelectHour('from_time', '00', '시');
	getSelectHour('to_time', '23', '시');

	//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

	$('#selectCenter, #selectMainTel').select2({
        placeholder: "선택 하세요..."
    });

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
	var jsonData2 = [
		{"id":"aidx01","parent":"#","text":"상담원"},
		{"id":"aidx0101","parent":"aidx01","text":"agent-1"},
		{"id":"aidx0102","parent":"aidx01","text":"agent-2"},
		{"id":"aidx0103","parent":"aidx01","text":"agent-3"},
		{"id":"aidx0104","parent":"aidx01","text":"agent-4"},
		{"id":"aidx0105","parent":"aidx01","text":"agent-5"}
	];

	createJSTree("groupJSTree",jsonData1);
	createJSTree("agentJSTree",jsonData2);

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
			$("#agent").tagsinput("add", {id:item, text:$('#agentJSTree').jstree().get_node(item).text}); 
		});
	});

	$("#agent").tagsinput({
		itemValue:'id',
		itemText:'text'
	}); 

	//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

	$("#sortable1, #sortable2, #sortable3").sortable({
		connectWith: ".connectedSortable, .ulTable"
	}).disableSelection();
	
	
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
		$("#where_maintel").hide();
	    $("#where_center").hide();
	    $("#where_organi").hide();
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
		$("#sortable3").empty().append("<li class='ui-state-default'></li>");
	}
	, //requestChildList
	requestChildList : function(rpt_par_id, level) {
		var ajaxParam = {
            "url" : "${contextpath}/wizard/reportChildList.json",
            "type" : "POST",
        	"data" : {
        		"rpt_par_id" : rpt_par_id
            }
        };
		Common.ajaxJSON(ajaxParam, function(data) { 
			Service.initCondition();
			if(level == 0){
				var inRptHTML = "";
				$("#rptKind").empty();
				$.each(data.resultList, function(index, item) {
					if(index == 0)
						inRptHTML += "<div class='col-md-12 border-bottom-dash'>";
					else
						inRptHTML += "<div class='col-md-12 pt-2 border-bottom-dash'>";
					inRptHTML += 	"<div class='custom-control custom-radio'>";
					inRptHTML +=		"<input type='radio' class='custom-control-input' id='"+item.rpt_id+"' name='rdoRpt02' data-tnm='"+item.tv01+"'>";
					inRptHTML += 		"<label class='custom-control-label' for='"+item.rpt_id+"'>"+item.rpt_nm+"</label>";
					inRptHTML += 	"</div>";
					inRptHTML += "</div>";
		    	});
				$("#rptKind").append(inRptHTML);
			}else if(level == 1){
				$.each(data.resultList, function(index, item) {
					$("#"+item.tv01).show();
		    	});
			}
		});
	}
	, //requestTableColumnList
	requestTableColumnList : function(table_name) {
		var ajaxParam = {
            "url" : "${contextpath}/wizard/tableColumnList.json",
            "type" : "POST",
        	"data" : {
        		"table_name" : table_name
            }
        };
		Common.ajaxJSON(ajaxParam, function(data) {
			Service.initTableColumn();
			var inColumnHTML = "";
			var selectColumnHTML = "";
			var datetype = $("input:radio[name=rdoDateType]:checked").attr("id");
			$.each(data.resultList, function(index, item) {
				if(datetype == item.column_name)
					selectColumnHTML += "<li class='ui-state-default'>"+item.column_name+"</li>";
				else{
					if(datetype == "DH" && (item.column_name == "DT" || item.column_name == "TM"))
						selectColumnHTML += "<li class='ui-state-default'>"+item.column_name+"</li>";
					else
						inColumnHTML += "<li class='ui-state-default'>"+item.column_name+"</li>";
				}
			});
			$("#sortable1").append(inColumnHTML);
			$("#sortable2").append(selectColumnHTML);
		});
	}
	, //requestWzPopup
	requestWzPopup : function(table_name){
		var grps = "", cols = "", vcols = "";
		var len2 = $("#sortable2 > li").length - 1;
		var len3 = $("#sortable3 > li").length - 1;
		$("#sortable2 > li").each(function(index, item){
			if(index < len2){
				grps += $(this).text()+",";
			}else{
				grps += $(this).text();
			}
			vcols+= $(this).text()+",";
		});
		$("#sortable3 > li").each(function(index, item){
			if(index < len3){
				cols += "SUM("+$(this).text()+") "+$(this).text()+",";
				vcols+= $(this).text()+",";
			}else{
				cols += "SUM("+$(this).text()+") "+$(this).text();
				vcols+= $(this).text();
			}
		});
		//console.log(table_name+" / ("+len+")"+cols);
		
		var procnm = $("input:radio[name=rdoRpt01]:checked").data("procnm");
		var datetype = $("input:radio[name=rdoDateType]:checked").attr("id");
		var frdt = $("#from_date").val();
		var todt = $("#to_date").val();
		if(frdt > todt){
			alert("기간(일자)을 확인하세요!");
			return false;
		}

		$("#frmCols").remove();
		var frmObj = $("<form>", {"id":"frmCols","action":"${contextpath}/wizard/wzPopup.do","method":"POST","target":"_blank"});
		var procnmObj = $("<input>", {"name":"procnm","id":"procnm","value":procnm});
		var tnmObj = $("<input>", {"name":"wtnm","id":"wtnm","value":table_name});
		var grpObj = $("<input>", {"name":"wgrps","id":"wcgrps","value":grps});
		var colObj = $("<input>", {"name":"wcols","id":"wcols","value":cols});
		var vcolObj = $("<input>", {"name":"vcols","id":"vcols","value":vcols});
		var vtypeObj = $("<input>", {"name":"vtype","id":"vtype","value":datetype});
		var frdtObj = $("<input>", {"name":"frdt","id":"frdt","value":frdt});
		var todtObj = $("<input>", {"name":"todt","id":"todt","value":todt});
		var frtmObj = $("<input>", {"name":"frtm","id":"frtm","value":$("#from_time").val()});
		var totmObj = $("<input>", {"name":"totm","id":"totm","value":$("#to_time").val()});
		var maintelObj = $("<input>", {"name":"maintel","id":"maintel","value":$("#selectMainTel").select2("val").toString()});
		var centerObj = $("<input>", {"name":"center","id":"center","value":$("#selectCenter").select2("val").toString()});
		var organiObj = $("<input>", {"name":"organi","id":"organi","value":$("#organi").val()});
		var agentObj = $("<input>", {"name":"agent","id":"agent","value":$("#agent").val()});
		var aniObj = $("<input>", {"name":"ani","id":"ani","value":$("#txt_ani").val()});
		frmObj
			.append(procnmObj).append(tnmObj).append(colObj).append(vcolObj).append(grpObj)
			.append(vtypeObj).append(frdtObj).append(todtObj).append(frtmObj).append(totmObj)
			.append(maintelObj).append(centerObj).append(organiObj).append(agentObj).append(aniObj)
		$(document.body).append(frmObj);
		//console.log($("#frmCols").html());
		$("#frmCols").submit();
	}
};
</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>