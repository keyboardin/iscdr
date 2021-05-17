<!-- st004.jsp 일자별 채널 점유 보고서 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/CommonCss.jsp" %>
<%@ include file="/WEB-INF/views/common/CommonHeader.jsp" %> 
<link rel="stylesheet" href="${contextpath}/static/SmartAdmin/${system_skin}/css/jquery-step-master/normalize.css">
<link rel="stylesheet" href="${contextpath}/static/SmartAdmin/${system_skin}/css/jquery-step-master/main.css">
<link rel="stylesheet" href="${contextpath}/static/SmartAdmin/${system_skin}/css/jquery-step-master/jquery.steps.css">
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
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl">
				                    			보고서 타입
				                    		</div>
				                        	<div class="row p-sm-3">
				                            	<div class="col-md-12">
				                               		<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="call" name="rdoS1Type" checked="checked">
                                                        <label class="custom-control-label" for="call">콜 통계</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="agent" name="rdoS1Type">
                                                        <label class="custom-control-label" for="agent">상담직원 통계</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="ars" name="rdoS1Type">
                                                        <label class="custom-control-label" for="ars">ARS 통계</label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="trace" name="rdoS1Type">
                                                        <label class="custom-control-label" for="trace">콜 추적</label>
                                                    </div>
				                               	</div>
				                           </div>
				                    	</div>
				                    	<div class="col-lg-2">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl">
				                    			보고서
				                    		</div>
				                        	<div class="row p-sm-3">
				                            	<div class="col-md-12 border-bottom-dash">
				                               		<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="rd001" name="rdoS2Type" checked="checked">
                                                        <label class="custom-control-label" for="rd001">센터별일일통계</label>
                                                    </div>
				                               		<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="rd002" name="rdoS2Type">
                                                        <label class="custom-control-label" for="rd002">대표번호별 인입현황</label>
                                                    </div>
				                               		<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="rd003" name="rdoS2Type">
                                                        <label class="custom-control-label" for="rd003">ARS서비스별 콜통계</label>
                                                    </div>
				                               		<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="rd004" name="rdoS2Type">
                                                        <label class="custom-control-label" for="rd004">ARS서비스별 포기콜 통계</label>
                                                    </div>
				                               		<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="rd005" name="rdoS2Type">
                                                        <label class="custom-control-label" for="rd005">스킬그룹별 상담직원통계</label>
                                                    </div>
				                               		<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="rd006" name="rdoS2Type">
                                                        <label class="custom-control-label" for="rd006">고객별 대기시간 현황</label>
                                                    </div>
				                               		<div class="custom-control custom-radio">
                                                        <input type="radio" class="custom-control-input" id="rd007" name="rdoS2Type">
                                                        <label class="custom-control-label" for="rd007">콜센터 이용현황</label>
                                                    </div>
				                               	</div>
				                               	<div class="col-md-12 py-2 border-bottom-dash">
				                               		<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd008" name="rdoS2Type">
														<label class="custom-control-label" for="rd008">상담콜 처리 현황</label>
													</div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd009" name="rdoS2Type">
														<label class="custom-control-label" for="rd009">상담직원 실적통계</label>
													</div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd010" name="rdoS2Type">
														<label class="custom-control-label" for="rd010">상담직원근무현황</label>
													</div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd011" name="rdoS2Type">
														<label class="custom-control-label" for="rd011">상담직원 호전환 통계</label>
													</div>
				                               	</div>
				                               	<div class="col-md-12 py-2 border-bottom-dash">
				                               		<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd012" name="rdoS2Type">
														<label class="custom-control-label" for="rd008">ARS메뉴 이용현황</label>
													</div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd013" name="rdoS2Type">
														<label class="custom-control-label" for="rd009">고객인증 정보현황</label>
													</div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd014" name="rdoS2Type">
														<label class="custom-control-label" for="rd010">ARS현황</label>
													</div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd015" name="rdoS2Type">
														<label class="custom-control-label" for="rd011">ARS오류조회</label>
													</div>
				                               	</div>
				                               	<div class="col-md-12 py-2">
				                               		<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd012" name="rdoS2Type">
														<label class="custom-control-label" for="rd008">ARS 사용이력 추적</label>
													</div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd013" name="rdoS2Type">
														<label class="custom-control-label" for="rd009">콜추적</label>
													</div>
													<div class="custom-control custom-radio">
														<input type="radio" class="custom-control-input" id="rd014" name="rdoS2Type">
														<label class="custom-control-label" for="rd010">교환기</label>
													</div>
				                               	</div>
				                           </div>
				                    	</div>
				                    	<div class="col-lg-8">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl">
				                    			검색 조건
				                    		</div>
						                   	<div class="row p-sm-3">
						                   		<div class="col-md-2">
						                   			<div class="custom-control custom-radio mb-2">
	                                                    <label class="form-label">구분</label>
	                                                </div>
	                                            </div>
	                                            <div class="col-md-10">
						                        	<div class="row">
						                            	<div class="col-md-2">
						                               		<div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="dd" name="rdoS1Grp" checked="checked">
                                                                <label class="custom-control-label" for="dd">일별</label>
                                                            </div>
														</div>
														<div class="col-md-2">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="week" name="rdoS1Grp">
                                                                <label class="custom-control-label" for="week">요일별</label>
                                                            </div>
                                                        </div>
														<div class="col-md-2">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="mm" name="rdoS1Grp">
                                                                <label class="custom-control-label" for="mm">월별</label>
                                                            </div>
                                                        </div>
														<div class="col-md-2">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="hh" name="rdoS1Grp">
                                                                <label class="custom-control-label" for="hh">시간대별</label>
                                                            </div>
                                                        </div>
														<div class="col-md-4">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" class="custom-control-input" id="dh" name="rdoS1Grp">
                                                                <label class="custom-control-label" for="dh">일별/시간대별</label>
                                                            </div>
						                               	</div>
						                           	</div>
												</div>
				                    		</div>
				                    		<div class="row px-3">
												<div class="col-md-2">
                                                	<div class="custom-control mb-2">
	                                                    <label class="form-label">기간</label>
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
						                    <div class="row p-sm-3">
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
											<div class="row px-3">
                                                <div class="col-md-2">
                                                	<div class="custom-control mb-2">
	                                                    <label class="form-label">센터</label>
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
						                    <div class="row p-sm-3">
                                                <div class="col-md-2">
                                                	<div class="custom-control custom-radio mb-2">
	                                                    <label class="form-label">조직</label>
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
		                                                                <!-- <small class="m-0 text-muted">
		                                                                    Below is a static modal example
		                                                                </small> -->
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
	                                            	<input id="grp_list" class="tagsinput form-control" data-role="tagsinput sometext">
	                                            </div>
											</div>
						                    <div class="row px-3">
                                                <div class="col-md-2">
                                                	<div class="custom-control custom-radio mb-2">
	                                                    <label class="form-label">상담직원</label>
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
	                                            	<input id="agt_list" class="tagsinput form-control" data-role="tagsinput sometext">
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
															<ul id="sortable1" class="connectedSortable">
																<li class="ui-state-default">Item 1</li>
																<li class="ui-state-default">Item 2</li>
																<li class="ui-state-default">Item 3</li>
																<li class="ui-state-default">Item 4</li>
																<li class="ui-state-default">Item 5</li>
															</ul>
														</div>
													</div>  
												</div>
				                        	</div>
				                    	</div>
				                    	<div class="col-md-10">
				                    		<div class="bd-highlight w-85 height-2 text-center fs-xl">
				                    			선택 항목
				                    		</div>
				                        	<div class="row p-sm-3 m-sm-3 bg-info-50">
													<ul id="sortable2" class="ulTable">
														<li class="ui-state-default">Item 1</li>
														<li class="ui-state-default">Item 2</li>
														<li class="ui-state-default">Item 3</li>
													</ul>
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
<script src="${contextpath}/static/SmartAdmin/${system_skin}/js/jquery-steps-master/modernizr-2.6.2.min.js"></script>
<script src="${contextpath}/static/SmartAdmin/${system_skin}/js/formplugins/select2/select2.bundle.js"></script>
<script src="${contextpath}/static/SmartAdmin/${system_skin}/js/bootstrap-tags/bootstrap-tagsinput.min.js"></script>
<script src="${contextpath}/static/plugin/jstree/js/jstree.min.js"></script>
<script src="${contextpath}/static/SmartAdmin/${system_skin}/js/jquery-steps-master/jquery.steps.min.js"></script>
<script type="text/javascript">

$(function() { 
	
	setTitle("${param.menu_par_id}","${param.menu_id}");
	
    $("#wizard").steps({
        headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "fade"
    });

	$("#sortable1, #sortable2").sortable({
		connectWith: ".connectedSortable, .ulTable"
	}).disableSelection();

    

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
		$('#grp_list').tagsinput('removeAll');		// 
		$.each( $('#groupJSTree').jstree("get_selected") ,function(i,item){ 
			//console.log(item+" / "+$('#groupJSTree').jstree().get_node(item).text);
			$("#grp_list").tagsinput("add", {id:item, text:$('#groupJSTree').jstree().get_node(item).text}); 
		});
	});

	$("#grp_list").tagsinput({
		itemValue:'id',
		itemText:'text'
	});
	
	$('#modal-agent').on('hidden.bs.modal', function (e) {
		//var selectedNodeLen = ( $('#agentJSTree').jstree("get_selected") ).length;
		$('#agt_list').tagsinput('removeAll');		// 
		$.each( $('#agentJSTree').jstree("get_selected") ,function(i,item){ 
			//console.log(item+" / "+$('#agentJSTree').jstree().get_node(item).text);
			$("#agt_list").tagsinput("add", {id:item, text:$('#agentJSTree').jstree().get_node(item).text}); 
		});
	});

	$("#agt_list").tagsinput({
		itemValue:'id',
		itemText:'text'
	}); 
	
	
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

</script>		
<%@ include file="/WEB-INF/views/common/CommonBottom.jsp" %>