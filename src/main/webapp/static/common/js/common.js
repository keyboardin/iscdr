var data_cnt;
var queryURL ;
var paraMeters;

var _keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";

var Common = {
    /**
     * 페이지 이동
     */
    goPage : function(page) {
    	location.href = page;
    },
    
    /**
     * 페이지 reload
     */    
    reloadPage : function() {
        location.reload();
    },
        
    /**
     * ajax 호출 (response XML)
     * @param parameter for ajax
     * @param callback function
     */
    ajaxXML : function(_params, _func) {
        var self = this;        
        // ajax 요청시 캐싱방지 파라미터 추가
        $.extend(_params.data, {
            "nocache" : (new Date).getTime()
        });        
        $.ajax({
            type : _params.type || "GET",
            url : _params.url,
            async : (_params.async != undefined) ? _params.async : true,
            dataType : "xml",
            data : _params.data,
            success: function(xml) {
                xml = self.stringToXml(xml);
                var $xml = $(xml).find("xmlroot");
                if($xml.find("result > code").text().match("1")) {
                    /* 정상 */
                    _func($xml);
                } else {
                    /* 정상적인 XML이 아닌경우 */
                    alert("-.- xml error!");
                }
            },
            error: function (request, status, error) {
            	//alert("Error Common.ajaxXML = "+error);
            	alert("CRUD 작업이 실패 하였습니다. 다시 시도하세요!");
            }
        });
    },
    
    /**
     * ajax 호출 (response JSON)
     * @param parameter for ajax
     * @param callback function
     */
    ajaxJSON : function(_params, _func) {
        var self = this;
        var loading = (_params.loading != undefined) ? $("#"+_params.loading) : "";  
        var url = _params.url;        
        //console.log("ajaxJSON url >>> " + url);   
        
        // ajax 요청시 캐싱방지 파라미터 추가
        $.extend(_params.data, {
            "nocache" : (new Date).getTime()
        });
        $.ajax({
            type : _params.type || "GET",
            url : url,
            async : (_params.async != undefined) ? _params.async : true,
            dataType : "json",
            data : _params.data,
            beforeSend:function(){	
            	if(loading!=""){
	            	loading.css("position");
	            	loading.addClass("position-relative");
	            	loading.append('<div class="widget-box-overlay"><i class="loading-icon fal fa-spinner fa-spin fa-2x white"></i></div>');
            	}
            },
            success: function(data) {
            	_func(data);
            },
            error: function (request, status, error) {
            	console.log("Error Common.ajaxJSON = "+request+" : "+status+" : "+error);
            	/*if(_params.type == "POST"){
            		alert("CRUD 작업이 실패 하였습니다. 다시 시도하세요!");
            	}else{
            		console.log("CRUD 작업이 실패 하였습니다. 다시 시도하세요!");
            	}*/
            },
            complete: function(){
            	if(loading!=""){
            		loading.find(".widget-box-overlay").remove();
            		loading.removeClass("position-relative");
            	}
            } 
        });
    },
    
    /**
     * ajax 호출 - LoadingBar(response JSON)
     * @param parameter for ajax
     * @param callback function
     */
    ajaxLoadingJSON : function(_params, _func) {
        var self = this;
        var loading = $("#"+_params.loading);  
        var url = _params.url;
        //console.log("loading >>> " + _params.loading);
        //console.log("ajaxLoadingJSON url >>> " + url);
        
        // ajax 요청시 캐싱방지 파라미터 추가
        $.extend(_params.data, {
            "nocache" : (new Date).getTime()
        });        
        $.ajax({
            type : _params.type || "GET",
            url : url,
            async : (_params.async != undefined) ? _params.async : true,
            dataType : "json",
            data : _params.data,
            beforeSend:function(){	
            	loading.css("position");
            	loading.addClass("position-relative");
            	loading.append('<div class="widget-box-overlay"><i class="loading-icon fal fa-spinner fa-spin fa-2x white"></i></div>');
            },
            success: function(data) {
            	_func(data);
            },
            error: function (request, status, error) {
            	console.log("Error Common.ajaxJSON = "+request+" : "+status+" : "+error);
            	if(_params.type == "POST"){
            		alert("CRUD 작업이 실패 하였습니다. 다시 시도하세요!");
            	}else{
            		console.log("CRUD 작업이 실패 하였습니다. 다시 시도하세요!");
            	}
            },
            complete: function(){
            	loading.find(".widget-box-overlay").remove();
            	loading.removeClass("position-relative");
            }            
        });
    },
    
    /**
     * ajax 호출 - FileUpload(response JSON)
     * @param parameter for ajax
     * @param callback function
     */
    ajaxFileUploadJSON : function(_params, _func) {
        var self = this;
        var loading = $("#"+_params.loading);        
        // ajax 요청시 캐싱방지 파라미터 추가
        $.extend(_params.data, {
            "nocache" : (new Date).getTime()
        });        
        $.ajax({
            type : _params.type || "GET",
            url : _params.url,
            async : (_params.async != undefined) ? _params.async : true,
            dataType : "json",
            data : _params.data,
            processData: false, 
			contentType: false,
			beforeSend:function(){	
				loading.css("position");
                loading.addClass("position-relative");
            	loading.append('<div class="widget-box-overlay"><i class="loading-icon fal fa-spinner fa-spin fa-2x white"></i></div>');
			},
            success: function(data) {            	
            	_func(data);
            },
            error: function (request, status, error) {
            	console.log("Error Common.ajaxJSON = "+request+" : "+status+" : "+error);
            	if(_params.type == "POST"){
            		alert("CRUD 작업이 실패 하였습니다. 다시 시도하세요!");
            	}else{
            		console.log("CRUD 작업이 실패 하였습니다. 다시 시도하세요!");
            	}
            },
            complete: function(){
            	loading.find(".widget-box-overlay").remove();
            	loading.removeClass("position-relative");
            }
        });
    },
    
    /**
     * string을 xml로 변환 (IE에서 xml을 text로 인식하는경우 처리)
     * @param str
     */
    stringToXml : function(str) {
        if (typeof str == typeof "string" 
                && typeof ActiveXObject != typeof undefined) {
            var xml = new ActiveXObject("Microsoft.XMLDOM");
            xml.loadXML(str);
            str = xml;
        }
        return str;
    }
};


// loading image 영역을 만든다.
function makeLoadingDiv(){
	 if (document.getElementById("divLoading") == null) {
		  var str = '';
		  str += "<div id='divLoading' style='display：none;z-index:1002;position：absolute;'>";
		  //str += " <img src='./images/loading.jpg' alt='로딩중..' />";
		  str += "</div>";		  
		  $("body").append(str);
	 }
}

// url : 요청 주소, param : server 전송값, callback : 요청후 함수(전달 data), error: error 호출 함수,indicator : 로딩중 이미지 노출 유무
function ajaxCall(url,param,callback,error,indicator){
	 if(indicator) {
		  makeLoadingDiv();
		  $("#divLoading").ajaxStart(function(){
			$(this).show();
			//console.log("div show");
		  }); 
	 }	
	 $.ajax({
		 type : "POST",
		 url : url,
		 data : param,
		 datatype : "json",
		 beforeSend : function(xhr) {
		 },
		 success : callback,
		 error : error,
		 complete : function(xhr, textStatus) {},
		 timeout : 10000
	 });	 
	 if(indicator){
		  $("#divLoading").ajaxStop(function(){
		   $(this).hide();
		   //console.log("div hide");
		  });
	 }
} 


//ajax error callback function
function errorFunc(xhr, textStatus, errorThrown){
	try {
		if ( xhr.readyState == 4 ) {
			if (xhr.status == 400) {
				var data = jQuery.parseJSON(xhr.responseText);
				var invalidMessage = '';
				$.each(data.fielderrors,function(n,value){
					invalidMessage += value+'\n';
				});
				alert(invalidMessage);
			} else if (xhr.status == 406) {
				//document.location.href="/cls-admin-web/ajaxjsp/goLogin.jsp";
				alert("errorFunc = 406");
				
			} else if(xhr.status == 500) {
				var data = jQuery.parseJSON(xhr.responseText);
				var invalidMessage = data.exception;
				alert(invalidMessage);
			} else {
				alert(xhr.responseText);
			}
		} else {
			alert("Failed to load resource");
		}
	} catch(e) {
		alert(e);
	}
}


// page list display function
function pagingList(obj, currentPage){
	//console.log("currentPage="+ currentPage);	
	if(currentPage == undefined) { 
        selectedPage = 1;
	} else {
	    selectedPage = parseInt(currentPage / ITEMS_PER_PAGE) + 1;	
	    //console.log("selectedPage="+selectedPage);
	}	
	if(total_page && total_page > 0){
		obj.empty();
		obj.zPaging(total_page, pageParm, {
			startPageIdx: 0,
			endPageIdx: 5,
			totalIndx: 1
		}, {
			align: "center",
			key: "zPage",
			movement: 10,
			perPage: 10,
			selectedPage: selectedPage,
			linkWidth: 25,
			linkTitle: "#NO#",
			viewInfo: true,
			infoTxt: "Page <strong>#now#</strong> of #total#",
			goFirstTxt: "FIRST",
			goPrevTxt: "PREV",
			goNowTxt: "NOW",
			goNextTxt: "NEXT",
			goLastTxt: "LAST",
			callBack: pageCall
		}, {
			nowPage: "nowPage",
			normalPage: "normalPage",
			infoPage: "infoPage",
			infoPageFirst: "infoPageFirst",
			infoPagePrev: "infoPagePrev",
			infoPageNow: "infoPageNow",
			infoPageNext: "infoPageNext",
			infoPageLast: "infoPageLast"
		});
		obj.css("position","relative");
		var page_width = obj.children('div').first().width();
		obj.css("width",page_width + 20);	
		//console.log("page_qwidth==="+page_width);		
		var page_id = obj.children('div').first().attr('id');
		$('#'+page_id+'_prev').css("width",10);
		$('#'+page_id+'_first').css("width",10);
		//console.log("page_qid==="+page_id);		
	} else {
		obj.empty();
	}
}

// 달력 노출
function datepick(obj,flag){
	obj.datepicker({ dateFormat: 'yy.mm.dd', showOn: 'button', buttonImage: '../../images/common/ico_calendar.gif' });
	if(flag == 'Y'){
		var now = new Date();	
		var year = now.getFullYear();
		var month = now.getMonth() + 1;
		var day = now.getDate();
		if(month < 10) month = "0" + month;
		if(day < 10) day = "0" + day;		
		obj.val(year+'.'+month+'.'+day);	
	}
}

// div mask
function divMask(obj, mask){
	obj.text(
			$.mask.string( obj.text(), mask )
	);	
	return;
}

//input mask
function inputMask(obj, mask){	
	obj.setMask(mask);	
	return;
}


/********** 날짜관련 함수 Start***********/
//오늘 날짜를 mask형태로 만든다. mask(-) : 2014-02-20 mask(.) : 2014.02.20
function getCurrentDate(day, mask){
	var now = new Date();	
	var d = now.getDate();
	now.setDate(d-day);	
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var day = now.getDate();
	if(month < 10) month = "0" + month;
	if(day < 10) day = "0" + day;	
	if(mask==undefined||mask == "") mask = "-";	
	return (year+mask+month+mask+day);
}

/* 오늘로부터 1주일전 날짜 반환 */
function getLastWeek(mask) {
	var now = new Date();
	var d = now.getDate();
	now.setDate(d-7);
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var day = now.getDate();
	if(month < 10) month = "0" + month;
	if(day < 10) day = "0" + day;	
	if(mask==undefined||mask == "") mask = "-";	
	return (year+mask+month+mask+day); 
}

/* 오늘로부터 1개월전 날짜 반환 */
function getLastMonth(mask) {
	var now = new Date();
	var m = now.getMonth();
	now.setDate(m-1);
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var day = now.getDate();
	if(month < 10) month = "0" + month;
	if(day < 10) day = "0" + day;	
	if(mask==undefined||mask == "") mask = "-";	
	return (year+mask+month+mask+day); 
}

//입력받은 두 날짜의 차를 구함
function getDateRange(val1, val2) {
	var mask = "-";
    // mask을 포함한 길이 체크
    if (val1.length != 10 || val2.length != 10)
        return null;

    // mask이 있는지 체크
    if (val1.indexOf(mask) < 0 || val2.indexOf(mask) < 0)
        return null;

    // 년도, 월, 일로 분리
    var start_dt = val1.split(mask);
    var end_dt = val2.split(mask);

    // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
    // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
    start_dt[1] = (Number(start_dt[1]) - 1) + "";
    end_dt[1] = (Number(end_dt[1]) - 1) + "";

    var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
    var to_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);

    return (to_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
}

//입력받은 날짜에서 일력받은 일수를 더하기/빼기 날짜를 구함
function getDiffDate(now, day){
	var mask = "-";
    // mask을 포함한 길이 체크
    if (now.length != 10)
        return null;

    // mask이 있는지 체크
    if (now.indexOf(mask) < 0)
        return null;

    // 년도, 월, 일로 분리
    var now_date = now.split(mask);

    // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
    // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
    now_date[1] = (Number(now_date[1]) - 1) + "";

    var now_dt = new Date(now_date[0], now_date[1], now_date[2]);
    
	var d = now_dt.getDate();
	now_dt.setDate(d-day);	
	var year = now_dt.getFullYear();
	var month = now_dt.getMonth() + 1;
	var day = now_dt.getDate();
	if(month < 10) month = "0" + month;
	if(day < 10) day = "0" + day;	
	if(mask==undefined||mask == "") mask = "-";	
	return (year+mask+month+mask+day);
}

$.getYear=function(){
    var year = new Date().getFullYear();    
    return year;
}

$.getMonth=function(){
    var month = new Date().getMonth()+1; //January is 0!
    if(month<10) { month='0'+month	} 
    return month;
}

$.getDay=function(){
    var day = new Date().getDate()
    if(day<10) { day='0'+day	} 
    return day;
}

//해당 년월에 맨 마지막 날짜를 구한다.
function getLastDay(year, month){
	var lastDate = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	//윤년검사
	if((0 == year%4 && 0 != year%100) || 0 == year%400){
		lastDate[1] = 29;	//윤년이면 2월의 마지막 날짜는 29일
	}	
	day = lastDate[month -1];	
	return day;
}

//20141024(8자리 형식) -> 2014-10-24(변환)
function convStringToYmd(strYmd){
	var rtn = "";	
	if(strYmd.length > 8){
		return strYmd;
	}	
	rtn = strYmd.slice(0, 4)+"-"+strYmd.slice(4, 6)+"-"+strYmd.slice(6,8);	
	return rtn;
}

//1024(4자리 형식) -> 10:24(변환)
function convStringToHm(strHm){
	var rtn = "";	
	if(strHm.length > 8){
		return strHm;
	}	
	rtn = strHm.slice(0, 2)+":"+strHm.slice(2, 4);	
	return rtn;
}

//20141024134956(14자리 형식) -> 2014-10-24 13:49:56(변환)
function convStringToDate(strDate){
	var rtn = "";	
	if(strDate.length > 14){
		return strDate;
	}	
	rtn = strDate.slice(0, 4)+"-"+strDate.slice(4, 6)+"-"+strDate.slice(6,8);
	rtn += " "+strDate.slice(8, 10)+":"+strDate.slice(10, 12)+":"+strDate.slice(12,14);	
	return rtn;
}

//밀리세컨드를 00:00:00 형태로 변환
function convMilliSecToHMS(intSec) {
	var input = intSec / 1000;
	var hr, min, sec;
	var cday = 86400; //하루
	var chr = 3600; //한시간
	var cmin = 60;  //1분
	var day = parseInt(input/cday);  //1일로 나눈 몫

	hr = parseInt(input%cday/chr);  //1일로 나눈 나머지를 시간으로 나눔
	min = parseInt(input%cday%chr/cmin);  //일과 시간으로 나눈 나머지를 분으로 나눔
	sec = input%cday%chr%cmin; //그 나머지
	
	if(hr < 10) hr = "0"+hr;
	if(min < 10) min = "0"+min;
	if(sec < 10) sec = "0"+sec;
	
	return (hr + ":" + min + ":" + sec).substr(0, 8);
}

//초를 hh:mm:ss 형태로 변환
function convSecToHMS(intSec) {
	var input = intSec;
	var hr, min, sec;
	var cday = 86400; //하루
	var chr = 3600; //한시간
	var cmin = 60;  //1분
	var day = parseInt(input/cday);  //1일로 나눈 몫
	
	if(intSec == 0){
		return "00:00:00";
	}

	hr = parseInt(input%cday/chr);  //1일로 나눈 나머지를 시간으로 나눔
	min = parseInt(input%cday%chr/cmin);  //일과 시간으로 나눈 나머지를 분으로 나눔
	sec = input%cday%chr%cmin; //그 나머지
	
	if(hr < 10) hr = "0"+hr;
	if(min < 10) min = "0"+min;
	if(sec < 10) sec = "0"+sec;
	
	return (hr + ":" + min + ":" + sec).substr(0, 8);
}

//초를  mm:ss 형태로 변환
function convSecToMS(intSec) {
	var input = intSec;
	var hr, min, sec;
	var cday = 86400; //하루
	var chr = 3600; //한시간
	var cmin = 60;  //1분
	var day = parseInt(input/cday);  //1일로 나눈 몫

	min = parseInt(input%cday/cmin);  //일과 시간으로 나눈 나머지를 분으로 나눔
	sec = input%cday%chr%cmin; //그 나머지
	
	if(min < 10) min = "0"+min;
	if(sec < 10) sec = "0"+sec;
	
	return (min + ":" + sec).substr(0, 8);
}

//hh:ss을 > 초로 환산 + 1 > 000:00으로 다시 만들어서 반환
function convMsToSecToMs(ms, interval){
	var intMM = parseInt(ms.split(":")[0], 10);
	var intSS = parseInt(ms.split(":")[1], 10);
	
	return convSecToMS((intMM*60 + (intSS+interval)));	//1초 증가
}

//현재 일시를 리턴한다 2014-03-12 11:23:11
function getDateTime(){
    var str     = '';
    var Stamp   = new Date();
    var yyyy    = Stamp.getYear();
	var mm, dd;
	var Hours, Mins, Sec;

    if (yyyy < 2000) yyyy = 1900 + yyyy;
	
	mm = (Stamp.getMonth() + 1);
	if(mm < 10) mm = "0" +mm;

	dd = Stamp.getDate();
	if(dd < 10) dd = "0" +dd;

    str = yyyy + "-" + mm  + "-" + dd;

	Hours = Stamp.getHours();
    Mins = Stamp.getMinutes();
	Sec = Stamp.getSeconds();

    if (Hours < 10) Hours = "0" + Hours;
    if (Mins < 10) Mins = "0" + Mins;
	if (Sec < 10) Sec = "0" + Sec;

    str += ' ' + Hours + ":" + Mins + ":" + Sec;
    return str;
}

//현재 시간을 리턴한다 11:23:11
function getTime(){
    var str     = '';
    var Stamp   = new Date();
	var Hours, Mins, Sec;

	Hours = Stamp.getHours();
    Mins = Stamp.getMinutes();
	Sec = Stamp.getSeconds();

    if (Hours < 10) Hours = "0" + Hours;
    if (Mins < 10) Mins = "0" + Mins;
	if (Sec < 10) Sec = "0" + Sec;

    str = Hours + ":" + Mins + ":" + Sec;

    return str;
}

function getCurrentHour(){
    var stamp = new Date();
	var hour = stamp.getHours();
    if (hour < 10) hour = "0" + hour;
    return hour.toString();
}

function getCurrentHourInt(){
    var stamp = new Date();
	var hour = stamp.getHours();
    return hour;
}

function getCurrentMinute(){
    var stamp = new Date();
	var minute = stamp.getMinutes();
    if (minute < 10) minute = "0" + minute;
    return minute.toString();
}

function getCurrentMinuteInt(){
    var stamp = new Date();
	var minute = stamp.getMinutes();
    return minute;
}

/*
 * currTime : 00:00:00 형식
 * inTime   : 00:00:00 형식
 * 두 시분초의 차이를 00:00:00 형식으로 리턴한다.  
 */
function getFinesseConvHHMMSS(inTime){
	var chh = 3600; //한시간
	var cmm = 60;  //1분
	
	if(inTime == "") return "";
	
	var currTamp = new Date();
	var currHH = currTamp.getHours();
    var currMM = currTamp.getMinutes();
	var currSS = currTamp.getSeconds();
	
	//현재 시간을 초로 환산
	var currTime = (currHH*chh) + (currMM*cmm) + currSS;
	
	var arrInTime = inTime.split(":");
	var inHH = parseInt(arrInTime[0]) + 9;
	var inMM = parseInt(arrInTime[1]);
	var inSS = parseInt(arrInTime[2]);
	
	//넘어온 시간을 초로 환산
	var reTime = (inHH*chh) + (inMM*cmm) + inSS;
	
	return (convSecToHMS((currTime - reTime)));
}

// number format
/**
 * Formats the number according to the 'format' string; adherses to the american number standard where a comma is inserted after every 3 digits.
 *  note: there should be only 1 contiguous number in the format, where a number consists of digits, period, and commas
 *        any other characters can be wrapped around this number, including '$', '%', or text
 *        examples (123456.789):
 *          '0' - (123456) show only digits, no precision
 *          '0.00' - (123456.78) show only digits, 2 precision
 *          '0.0000' - (123456.7890) show only digits, 4 precision
 *          '0,000' - (123,456) show comma and digits, no precision
 *          '0,000.00' - (123,456.78) show comma and digits, 2 precision
 *          '0,0.00' - (123,456.78) shortcut method, show comma and digits, 2 precision *
 * @method format
 * @param format {string} the way you would like to format this text
 * @return {string} the formatted number
 * @public
 */
Number.prototype.format = function(format) {
	if (typeof format != 'string') {return '';} // sanity check
	var hasComma = -1 < format.indexOf(','),
		psplit = format.stripNonNumeric().split('.'),
		that = this;
	// compute precision
	if (1 < psplit.length) {
		// fix number precision
		that = that.toFixed(psplit[1].length);
	}
	// error: too many periods
	else if (2 < psplit.length) {
		throw('NumberFormatException: invalid format, formats should have no more than 1 period: ' + format);
	}
	// remove precision
	else {
		that = that.toFixed(0);
	}

	// get the string now that precision is correct
	var fnum = that.toString();

	// format has comma, then compute commas
	if (hasComma) {
		// remove precision for computation
		psplit = fnum.split('.');
		
		var cnum = psplit[0],
			parr = [],
			j = cnum.length,
			m = Math.floor(j / 3),
			n = cnum.length % 3 || 3; // n cannot be ZERO or causes infinite loop

		// break the number into chunks of 3 digits; first chunk may be less than 3
		for (var i = 0; i < j; i += n) {
			if (i != 0) {n = 3;}
			parr[parr.length] = cnum.substr(i, n);
			m -= 1;
		}
		// put chunks back together, separated by comma
		fnum = parr.join(',');

		// add the precision back in
		if (psplit[1]) {fnum += '.' + psplit[1];}
	}
	//console.log("------------------");
	// replace the number portion of the format with fnum
	return format.replace(/[\d,?\.?]+/, fnum);
};

// Number.prototype.format에서 호출하는 함수
String.prototype.stripNonNumeric = function(){
	var str = this;
	str += '';
	var rgx = /^\d|\.|-$/;
	var out = '';
	for( var i = 0; i < str.length; i++ ) {
		if( rgx.test( str.charAt(i) ) ){
			if( !( ( str.charAt(i) == '.' && out.indexOf( '.' ) != -1 ) ||
				( str.charAt(i) == '-' && out.length != 0 ) ) ) {
				out += str.charAt(i);
			}
		}
	}
	return out;
};

//자동으로 YYYY-MM-DD 넣어주기
function autoYYYYMMDD(object){
	if (object.value.length == 4){
		object.value = object.value + "-";
	}else if (object.value.length == 7){
		object.value = object.value + "-";
	}
}

//long 을 YYYY-MM-DD Date 로 변환
$.longToDate=function(_long) {
	var _date = new Date(_long);
	var year = _date.getFullYear();
	var month = _date.getMonth() + 1;
	var day = _date.getDate();
	if(month < 10) month = "0" + month;
	if(day < 10) day = "0" + day;		
	return year+'-'+month+'-'+day;	
}
/********** 날짜관련 함수 Start **********/


/********** 정규식 체크 Start **********/
//숫자만 체크 확인
//사용법 <input type="text" id="n" maxlength="4" class="nb" value="" onkeyUp="this.value.only_number();" />
String.prototype.only_number = function(){
	var rtn = this.replace(/[^0-9]/gi, '');
	if(this.length != rtn.length){
		alert("숫자만 입력할 수 있습니다");
		return false;
	}
		
	return true;
};

// 숫자만 가능
function chkOnlyNumbers(obj){
	obj.bind('keydown',function(event){
	    var keyCode = event.which;
	    
	    // 48-57 Standard Keyboard Numbers
	    var isStandard = (keyCode > 47 && keyCode < 58);

	    // 96-105 Extended Keyboard Numbers (aka Keypad)
	    var isExtended = (keyCode > 95 && keyCode < 106);

	    var validKeyCodes = ',8,9,37,38,39,40,46,';
	    var isOther = ( validKeyCodes.indexOf(',' + keyCode + ',') > -1 );

	    if ( isStandard || isExtended || isOther ){
	        return true;
	    } else {
	        return false;
	    }
	}).bind('blur',function(){

	    var pattern = new RegExp('[^0-9]+', 'g');

	    var $input = $(this);
	    var value = $input.val();

	    value = value.replace(pattern, '');
	    $input.val( value );
	});	
	
}
 
//숫자만 가능 input 속성에 onkeyup="checkNum(this);" 적용
function checkNum(obj){
	var word = obj.value;
	var str = "-1234567890";	
	for(i=0; i<word.length; i++){
		if(str.indexOf(word.charAt(i)) < 0){
			alert("숫자만 입력하세요!");
			obj.value = "";
			obj.focus = "";
			return false;
		}
	}
}

// 숫자와 특수문자 가능
function chkOnlyCriteria(obj){
	obj.bind('keypress',function(event){
	    var keyCode = event.which;
	    //console.log(keyCode);
	    // 48-57 Standard Keyboard Numbers 
	    var isStandard = (keyCode > 47 && keyCode < 58);
	    var validKeyCodes = ',8,9,32,37,39,40,46,60,61,62,88,65,78,68,97,100,110,';
	    var isOther = ( validKeyCodes.indexOf(',' + keyCode + ',') > -1 );
	    if ( isStandard || isOther ){
	        return true;
	    } else {
	        return false;
	    }
	});		
}

// 영문 대문자만 가능
function chkOnlyCapital(obj){	
	obj.bind('keypress',function(event){
	    var keyCode = event.which;
	    // 48-57 Standard Keyboard Numbers
	    var isStandard = (keyCode > 64 && keyCode < 91);
	    // 8 Backspace, 46 Forward Delete
	    // 37 Left Arrow, 38 Up Arrow, 39 Right Arrow, 40 Down Arrow
	    var validKeyCodes = ',8,9,37,38,39,40,46,';
	    var isOther = ( validKeyCodes.indexOf(',' + keyCode + ',') > -1 );
	    if ( isStandard || isOther ){
	        return true;
	    } else {
	        return false;
	    }
	});	
}

//영문 소문자만 가능
function chkOnlyMinuscule(obj){	
	obj.bind('keypress',function(event){
	    var keyCode = event.which;	    
	    //console.log("keyCode="+keyCode);
	    //if(keyCode === null) console.log("aaa");

	    // 48-57 Standard Keyboard Numbers
	    var isStandard = (keyCode >= 97 && keyCode <= 122);

	    // 8 Backspace, 46 Forward Delete
	    // 37 Left Arrow, 38 Up Arrow, 39 Right Arrow, 40 Down Arrow
	    var validKeyCodes = ',8,9,37,38,39,40,46,';
	    var isOther = ( validKeyCodes.indexOf(',' + keyCode + ',') > -1 );

	    if ( isStandard || isOther ){
	        return true;
	    } else {
	        return false;
	    }

	});	
}

//한글만 가능
function chkOnlyHangle(obj){	
	obj.bind('keypress',function(event){
	    var keyCode = event.which;

	    //console.log("keyCode="+keyCode);
	    
	    // 48-57 Standard Keyboard Numbers
	    var isStandard = (keyCode < 32 && keyCode > 126);

	    // 8 Backspace, 46 Forward Delete
	    // 37 Left Arrow, 38 Up Arrow, 39 Right Arrow, 40 Down Arrow
	    var validKeyCodes = ',8,9,37,38,39,40,46,';
	    var isOther = ( validKeyCodes.indexOf(',' + keyCode + ',') > -1 );
	    if ( isStandard || isOther ){
	        return true;
	    } else {
	        return false;
	    }
	});	
}

// Form Check Function
function formCheck(obj){
	// 숫자만 입력
	$('.onlyNumbers').bind('keydown',function(event){
	    var keyCode = event.which;
	    
	    // 48-57 Standard Keyboard Numbers
	    var isStandard = (keyCode > 47 && keyCode < 58);

	    // 96-105 Extended Keyboard Numbers (aka Keypad)
	    var isExtended = (keyCode > 95 && keyCode < 106);

	    var validKeyCodes = ',9,8,37,38,39,40,46,';
	    var isOther = ( validKeyCodes.indexOf(',' + keyCode + ',') > -1 );

	    //console.log("keyCode="+keyCode);	    
	    if ( isStandard || isExtended || isOther ){
	        return true;
	    } else {
	        return false;
	    }
	}).bind('blur',function(){
	    var pattern = new RegExp('[^0-9]+', 'g');

	    var $input = $(this);
	    var value = $input.val();

	    value = value.replace(pattern, '');
	    $input.val( value );
	});

	// 숫자와 특수문자 입력
	$('.onlyCriteria').bind('keypress',function(event){
	    var keyCode = event.which;
	    //console.log(keyCode);
	    // 48-57 Standard Keyboard Numbers
	    var isStandard = (keyCode > 47 && keyCode < 58);

	    var validKeyCodes = ',8,9,37,38,39,40,46,60,61,62,88,';
	    var isOther = ( validKeyCodes.indexOf(',' + keyCode + ',') > -1 );
	    if ( isStandard || isOther ){
	        return true;
	    } else {
	        return false;
	    }
	}).bind('blur',function(){
	    var pattern = new RegExp('[^0-9,=,<,>,X,&]+', 'g');
	    //console.log(pattern);

	    var $input = $(this);
	    var value = $input.val();

	    value = value.replace(pattern, '');
	    $input.val( value );
	});

	// 대문자만 입력
	$('.onlyCapital').bind('keypress',function(event){
	    var keyCode = event.which;
	    // 48-57 Standard Keyboard Numbers
	    var isStandard = (keyCode > 64 && keyCode < 91);
	    // 8 Backspace, 46 Forward Delete
	    // 37 Left Arrow, 38 Up Arrow, 39 Right Arrow, 40 Down Arrow
	    var validKeyCodes = ',8,9,37,38,39,40,46,';
	    var isOther = ( validKeyCodes.indexOf(',' + keyCode + ',') > -1 );
	    if ( isStandard || isOther ){
	        return true;
	    } else {
	        return false;
	    }
	}).bind('blur',function(){
	    var pattern = new RegExp('[^A-Z]+', 'g');

	    var $input = $(this);
	    var value = $input.val();

	    value = value.replace(pattern, '');
	    $input.val( value );
	});		
	
	obj.validate({
		//submitHandler: callbackSubmit
		submitHandler: function(f) {
			//$("div.error").hide();
			//alert("submit! use link below to go to the other step");
			callbackSubmit();
		}
		/*
	    invalidHandler: function(form, validator) {	    	
	    	console.log(validator);	    	
	        var errors = validator.numberOfInvalids();
	        if (errors) {
	          var message = errors == 1
	            ? 'You missed 1 field. It has been highlighted'
	            : 'You missed ' + errors + ' fields. They have been highlighted';
	          $("div.error span").html(message);
	          $("div.error").show();
	          alert(message);
	        } else {
	          $("div.error").hide();
	        }
	      }			
		*/
	});	
	
}

//Empty 및 공백 확인
function isEmptyJq(obj, error_msg){
    if(obj.val() == ''){
        alert(error_msg);
        obj.focus();
        return false;
    }else{
    	return true;
    }
}

// get array max 
Array.prototype.max = function() {
	var max = this[0];
	var max_index = 1;
	var len = this.length;
	for (var i = 1; i < len; i++){ 
		if (this[i] >= max){ 
			max_index = i + 1; 
			max = this[i]; 
			//console.log("max="+i);
		}
	}
	return max_index;
};

//get array min 
Array.prototype.min = function() {
	var min = this[0];
	var min_index = 1;
	var len = this.length;
	for (var i = 1; i < len; i++){ 
		if (this[i] < min){ 
			min_index = i + 1; 
			min = this[i]; 
			//console.log("min="+i);
		}
	}	
	return min_index;
};

function getNumberOnly(str){
    var val = str;
    val = new String(val);
    var regex = /[^0-9]/g;
    val = val.replace(regex, '');    
    return val;
}

//전화번호 형태로 리턴 010-1111-2222
function getConvTelNum(num){
	if(num == null) return num;
	return num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
}

/********** 정규식 체크 End **********/


/**
기능	: 새창 정중앙으로 open (href, window_name, width, heigth, scroll, center)
RETURN	: NONE
url	    : 이동할 주소
myname	: 팝업 이름
w		: 넓이
h		: 높이
scroll	: (yes, no, auto)
pos		: (right, center, left) center 로선택할것
*/
function newWindow(url, myname, w, h, scroll, pos, resize) {
	var win = null; 	
	if(pos == "center"){ 
		LeftPosition = (screen.width)?(screen.width-w)/2:100 ; 
		TopPosition = (screen.height)?(screen.height-h)/2:100 ;
	} 	
	settings = 'width='+w+',height='+h+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable='+resize;
	win = window.open(url,myname,settings); 	
	if(win.focus){
		win.focus();
	}
} 

String.prototype.cutStrLength = function(len, tail) { 
    if(typeof tail == 'undefined') tail = "..";    
    var str = this;
    if(str == "") str = "&nbsp;";
    var returnStr = "";
    returnStr = str.toString().substring(0, len);
    if (str.toString().length >= len) returnStr += tail;
    return returnStr;
};


//browser 체크
function getBrowserType(){
    var _ua = navigator.userAgent;
    
    //console.log("=====================================");
    //console.log("navigator.appName : "+_ua);
    //console.log("navigator.appName : "+navigator.appName);
    
    /* IE7,8,9,10,11 */
    if (navigator.appName == 'Microsoft Internet Explorer') {
        var rv = -1;
        var trident = _ua.match(/Trident\/(\d.\d)/i);
         
        //ie11에서는 MSIE토큰이 제거되고 rv:11 토큰으로 수정됨 (Trident표기는 유지)
        if(trident != null && trident[1]  == "7.0") return rv = "IE" + 11;
        if(trident != null && trident[1]  == "6.0") return rv = "IE" + 10;
        if(trident != null && trident[1]  == "5.0") return rv = "IE" + 9;
        if(trident != null && trident[1]  == "4.0") return rv = "IE" + 8;
        if(trident == null) return rv = "IE" + 7;
         
        var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(_ua) != null) rv = parseFloat(RegExp.$1);
        return rv;
    }
     
    /* etc */
    var agt = _ua.toLowerCase();
    if (agt.indexOf("chrome") != -1) return 'Chrome';
    if (agt.indexOf("opera") != -1) return 'Opera'; 
    if (agt.indexOf("staroffice") != -1) return 'Star Office'; 
    if (agt.indexOf("webtv") != -1) return 'WebTV'; 
    if (agt.indexOf("beonex") != -1) return 'Beonex'; 
    if (agt.indexOf("chimera") != -1) return 'Chimera'; 
    if (agt.indexOf("netpositive") != -1) return 'NetPositive'; 
    if (agt.indexOf("phoenix") != -1) return 'Phoenix'; 
    if (agt.indexOf("firefox") != -1) return 'Firefox'; 
    if (agt.indexOf("safari") != -1) return 'Safari'; 
    if (agt.indexOf("skipstone") != -1) return 'SkipStone'; 
    if (agt.indexOf("netscape") != -1) return 'Netscape'; 
    if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla';
}

if (typeof String.prototype.startsWith != 'function') {
  String.prototype.startsWith = function (str){
	return this.slice(0, str.length) == str;
  };
}
String.prototype.endsWith = function(suffix) {
	return this.indexOf(suffix, this.length - suffix.length) !== -1;
};

///////////////////////////////////////
//배열 중복 체크
Array.prototype.valueIndex = function(pval) {
    var idx = -1;
    if(this==null || this==undefined || pval==null || pval==undefined){
    }else{
        for(var i=0;i<this.length;i++){
            if(this[i]==pval){
                idx = i;
                break;
            }
        }
    }
    return idx;
};

Array.prototype.removeDup = function(){
    var resultArray = [];
    if(this==null || this==undefined){
    }else{
        for(var i=0;i<this.length;i++){
            var el = this[i];
            if(resultArray.valueIndex(el) === -1) resultArray.push(el);
            }
        }
    return resultArray;
};
///////////////////////////////////////



/*++
매치되는 모든 문자열을 치환한다.
@name  replaceAll
@param  str 문자열
@param  out 치환의 대상 문자
@param  add 치환의 목적 문자
@return 치환 후 문자열
*/
function replaceAll(str, out, add) {
	return str.split(out).join(add);
}

function addNbspHTML(no){
	var rtn = "";
	for(var i=0; i<no; i++){
		rtn += "&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	
	return rtn;
}

//사용법 decode64(base64EncStr)
function decode64(input) {
    var output = "";
    var chr1, chr2, chr3;
    var enc1, enc2, enc3, enc4;
    var i = 0;
    input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
    while (i < input.length) {
        enc1 = this._keyStr.indexOf(input.charAt(i++));
        enc2 = this._keyStr.indexOf(input.charAt(i++));
        enc3 = this._keyStr.indexOf(input.charAt(i++));
        enc4 = this._keyStr.indexOf(input.charAt(i++));
        chr1 = (enc1 << 2) | (enc2 >> 4);
        chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
        chr3 = ((enc3 & 3) << 6) | enc4;
        output = output + String.fromCharCode(chr1);
        if (enc3 != 64) {
            output = output + String.fromCharCode(chr2);
        }
        if (enc4 != 64) {
            output = output + String.fromCharCode(chr3);
        }
    }
    output = utf8_decode(output);
    return output;
}

function utf8_decode(utftext) {
    var string = "";
    var i = 0;
    var c = c1 = c2 = 0;
    while (i < utftext.length) {
        c = utftext.charCodeAt(i);
        if (c < 128) {
            string += String.fromCharCode(c);
            i++;
        }
        else if ((c > 191) && (c < 224)) {
            c2 = utftext.charCodeAt(i + 1);
            string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
            i += 2;
        }
        else {
            c2 = utftext.charCodeAt(i + 1);
            c3 = utftext.charCodeAt(i + 2);
            string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
            i += 3;
        }
    }
    return string;
}

//사용법 encode64(str)
function encode64(input) {
    var output = "";
    var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
    var i = 0;
    input = utf8_encode(input);
    while (i < input.length) {
        chr1 = input.charCodeAt(i++);
        chr2 = input.charCodeAt(i++);
        chr3 = input.charCodeAt(i++);
        enc1 = chr1 >> 2;
        enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
        enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
        enc4 = chr3 & 63;
        if (isNaN(chr2)) {
            enc3 = enc4 = 64;
        } else if (isNaN(chr3)) {
            enc4 = 64;
        }
        output = output +
		this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
		this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);
    }
    return output;
}

function utf8_encode(string) {
    string = string.replace(/\r\n/g, "\n");
    var utftext = "";
    for (var n = 0; n < string.length; n++) {
        var c = string.charCodeAt(n);
        if (c < 128) {
            utftext += String.fromCharCode(c);
        } else if ((c > 127) && (c < 2048)) {
            utftext += String.fromCharCode((c >> 6) | 192);
            utftext += String.fromCharCode((c & 63) | 128);
        } else {
            utftext += String.fromCharCode((c >> 12) | 224);
            utftext += String.fromCharCode(((c >> 6) & 63) | 128);
            utftext += String.fromCharCode((c & 63) | 128);
        }
    }
    return utftext;
}

function convStrToHtml(str){
	str = str.replace(/</g, "&lt;");
	str = str.replace(/>/g, "&gt;");$
	str = str.replace(/\"/g, "&quot;");
	str = str.replace(/\'/g, "&#39;");
	str = str.replace(/\\n/g, "<br/>");
	return str;
}

function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}


function debug(object){
	var str='';
	$.each(object,function(key,value){  
		str+=key+' : '+value+'\n\n';
	});
	return str;
}


//기본파일첨부 - 파일첨부폼  
$.setFileRow=function(){	
	$('input[name="file"]').unbind('change');
	$('input[name="file"]').change(function(){
		$('input[name="file"]').each(function(index){			
			if($(this).val()){
				$('input[name="file_name"]:eq('+index+')').val($(this).val());
			}
		});
	});		
};

//null check
$.notnull=function(obj, strName){
    if(!obj.val()||obj.val()==''||obj.val()==null){
		alert(strName+'(은)는 필수 입력 입니다');
		obj.focus();
		return false;
    }
    return true;
}

//숫자만 입력받도록 체크
$.number=function(obj, strName){
	if(obj.val().length<1) return true;
	for(var pnl=0;pnl<obj.val().length;pnl++){
		if(obj.val().charCodeAt(pnl)<48 || obj.val().charCodeAt(pnl)>57){
			alert(strName+'는 숫자만 입력할 수 있습니다');
			obj.focus();
			return false;
		}
	}
	return true;
};

//공통코드 셀렉트박스(table : tb_c_comm_code)
$.createCommCodeSelectBox=function(contextpath, idSelect, group_id, selected, first, remove_id){
	var ajaxParam = {
		"url" : contextpath+"/common/createCommCodeSelectBox.json",
		"type" : "POST",
    	"data" : {
    		"group_id" : group_id,
			"selected" : selected
        }
    };
	Common.ajaxJSON(ajaxParam, function(data) {
		$("#"+idSelect+" option").remove(); 
	    if(first!=''&&first!=undefined) $("#"+idSelect).append("<option value=''>"+first+"</option>");
	    $("#"+idSelect).append(data.html);
	    if(remove_id!=''&&remove_id!=undefined){
	    	var arr = remove_id.split(",");
	    	for(var i=0;i<arr.length;i++){
	    		 $("#"+idSelect+" option[value='"+arr[i]+"']").remove();
	    	}
	    }
    });	
};


//입력폼배열의 필드들을 enable 로 설정
/*$.enableField=function(form_fields){
    $.each(form_fields, function(i, field){
		if($("#"+field).is('input')){
		    $("#"+field).removeAttr('readonly');
		}else if($("#"+field).is('select')){
		    $("#"+field).removeAttr('disabled');
		}else if($("#"+field).is('checkbox')){
		    $("#"+field).removeAttr('disabled');
		}
		
    });
};*/
//입력폼배열의 필드들을 enable 로 설정
$.enableField=function(form_fields){
    $.each(form_fields, function(i, field){
		if($("#"+field).is('input')||$("#"+field).is('textarea')){
		    $("#"+field).prop('readonly', false);
		}else if($("#"+field).is('select')||$("#"+field).is('checkbox')){
		    $("#"+field).prop('disabled', false);
		}		
    });
};
//입력폼배열의 필드들을 disable 로 설정
/*$.disableField=function(form_fields){
    $.each(form_fields, function(i, field){
    	//console.log($.type($("#"+field)));
		if($("#"+field).is('input')){
		    $("#"+field).attr('readonly', true);
		}else if($("#"+field).is('select')){
		    $("#"+field).attr('disabled', 'disabled');
		}else if($("#"+field).is('checkbox')){
		    $("#"+field).attr('disabled', 'disabled');
		}		
    });
};*/
//입력폼배열의 필드들을 disable 로 설정
$.disableField=function(form_fields){
    $.each(form_fields, function(i, field){
    	//console.log($.type($("#"+field)));
		if($("#"+field).is('input')||$("#"+field).is('textarea')){
			$("#"+field).prop('readonly', true);
		}else if($("#"+field).is('select')||$("#"+field).is('checkbox')){
		    $("#"+field).prop('disabled', true);
		}		
    });
};
//입력폼의 필드들을 초기화
$.resetField=function(form_fields){
    $.enableField(form_fields);
    $.each(form_fields, function(i, field){
		$("#"+field).val('');
		if($("#"+field).is('select')){
		    //console.log(field);
		    //console.log($("#"+field+" option:eq(0)").val());
		    $("#"+field).val($("#"+field+" option:eq(0)").val());
		}		
    });
};

//Table의 입력폼 필드들을 enable 로 설정
$.enableTrField=function(formTableTrs){
	formTableTrs.each(function(){
		$(this).find('input[type=text]').eq(0).prop('readonly', false);
		$(this).find('select').eq(0).prop('disabled', false);
		$(this).find('input[type=checkbox]').prop('disabled', false);
		$(this).find('input[type=radio]').each(function(){
			$(this).prop('disabled', false);
		});		
    }); 
};
//Table의 입력폼 필드들을 disable 로 설정
$.disableTrField=function(formTableTrs){
	formTableTrs.each(function(){
		$(this).find('input[type=text]').eq(0).prop('readonly', true);
		$(this).find('select').eq(0).prop('disabled', true);
		$(this).find('input[type=checkbox]').eq(0).prop('disabled', true);
		$(this).find('input[type=radio]').each(function(){
			$(this).prop('disabled', true);
		});		
    }); 
};
//Table의 입력폼 필드들을 초기화
$.resetTrField=function(formTableTrs){
	$.enableTrField(formTableTrs);
	formTableTrs.each(function(){
		$(this).find('input[type=text]').eq(0).val('');
		$(this).find('select').eq(0).val($(this).children("option:eq(0)").val());
		//$(this).find('input[type=checkbox]').eq(0).prop('checked', true);
		$(this).find('input[type=radio]').eq(0).prop("checked", true);
    }); 
};



function logout(){
	var contextpath = getContextPath();
	var url = getContextPath()+'/login/logoutProc.json';
	var ajaxParam = {
        "url" : url, 
        "type" : "POST"
    };
    Common.ajaxJSON(ajaxParam, function(data) {
    	if(!data){ alert('return data error'); return false; }
		if(data.msg) alert(data.msg);
		if(!data.success) return;
		Common.goPage(contextpath);
    });
}


function changePwModal(){
	$('#new_user_pw').val("");
	$("#form_modal_changepw").modal("show"); 
} 

function changePw(contextpath, user_id, user_type, auth_type){
	if(!$.notnull($('#new_user_pw'), '비밀번호')) return false;
	var strUrl = '';
	if(user_type=='0001'||user_type=='0002'){
		strUrl = contextpath+'/user/userChangePw.json';
	}else if(user_type=='0003' && auth_type=='USER'){
		strUrl = contextpath+'/user/userChangePw.json';
	}else if(user_type=='0003' && auth_type=='EMP'){
		strUrl = contextpath+'/emp/empChangePw.json';
	}
	
	var ajaxParam = {
        "url" : strUrl,
        "type" : "POST",
    	"data" : {
    		"user_id" : user_id,
			"user_pw" : $("#new_user_pw").val()  
        }
    };
    Common.ajaxJSON(ajaxParam, function(data) {       
		alert(data.msg);
		if(!data.success) return;
		$('#form_modal_changepw').modal('hide');	
    });
}

function jqGridInit(jqgrid, jqgrid_pager, content) { 
    // Add navGrid
	if(jqgrid_pager!=undefined && jqgrid_pager.length>0){
		jqgrid.jqGrid('navGrid', jqgrid_pager, {edit:false, add:false, del:false, search:false, refresh:false});
	}
		
	// Add tooltips 
	$('.navtable .ui-pg-button').tooltip({container : 'body'});

	// remove classes
	$(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
	$(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
	$(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
	$(".ui-jqgrid-pager").removeClass("ui-state-default");
	$(".ui-jqgrid").removeClass("ui-widget-content");
	// add classes
	$(".ui-jqgrid-htable").addClass("table table-bordered table-hover");
	$(".ui-jqgrid-btable").addClass("table table-bordered table-striped");
	$(".ui-pg-div").removeClass().addClass("btn btn-primary btn-sm ");
	$(".ui-icon.ui-icon-plus").removeClass().addClass("fal fa-plus");
	$(".ui-icon.ui-icon-pencil").removeClass().addClass("fal fa-pencil");
	$(".ui-icon.ui-icon-trash").removeClass().addClass("fal fa-trash-o");
	$(".ui-icon.ui-icon-search").removeClass().addClass("fal fa-search");
	$(".ui-icon.ui-icon-refresh").removeClass().addClass("fal fa-refresh");
	$(".ui-icon.ui-icon-disk").removeClass().addClass("fal fa-save").parent(".btn-primary").removeClass("btn-primary").addClass("btn-success");
	$(".ui-icon.ui-icon-cancel").removeClass().addClass("fal fa-times").parent(".btn-primary").removeClass("btn-primary").addClass("btn-danger");
	$(".ui-icon.ui-icon-seek-prev").wrap("<div class='btn btn-default btn-sm '></div>");
	$(".ui-icon.ui-icon-seek-prev").removeClass().addClass("fal fa-backward");
	$(".ui-icon.ui-icon-seek-first").wrap("<div class='btn btn-default btn-sm'></div>");
	$(".ui-icon.ui-icon-seek-first").removeClass().addClass("fal fa-fast-backward");
	$(".ui-icon.ui-icon-seek-next").wrap("<div class='btn btn-default btn-sm'></div>");
	$(".ui-icon.ui-icon-seek-next").removeClass().addClass("fal fa-forward");
	$(".ui-icon.ui-icon-seek-end").wrap("<div class='btn btn-default btn-sm'></div>");
	$(".ui-icon.ui-icon-seek-end").removeClass().addClass("fal fa-fast-forward");
	$(".ui-jqgrid-bdiv").css('overflow-x','hidden');
	$('.ui-jqgrid-titlebar').hide();

	if(content!=undefined && content.length>0) {
		//console.log(content.width());
		jqgrid.jqGrid('setGridWidth', content.width());
	} else {
		//console.log($(".frame-wrap").width());
		jqgrid.jqGrid('setGridWidth', $(".frame-wrap").width()); 
	}
	
	$(window).on('resize.jqGrid', function() {
		//console.log("resize");
		if(content!=undefined && content.length>0) jqgrid.jqGrid('setGridWidth', content.width());
		else jqgrid.jqGrid('setGridWidth', $(".frame-wrap").width()); 
	});
	
} 

function setTitle(menu_par_id, menu_id){
	var menu_title = '<li class="breadcrumb-item" style="padding-left:10px;"><i class="fal fa-home"></i>&nbsp;&nbsp;Home</li>';
	menu_title += '<li class="breadcrumb-item active">'+$('#navi_'+menu_par_id+' > a > span').html()+'</li>';
	if(menu_par_id==menu_id){
		if($('#modal_title').length > 0)	$('#modal_title').html($('#navi_'+menu_par_id+' > a > span').html());  
	}else{
		menu_title += '<li class="breadcrumb-item active">'+$('#navi_'+menu_id+' > a').html()+'</li>';
		if($('#modal_title').length > 0)	$('#modal_title').html($('#navi_'+menu_id+' > a').html());  
	}
	
	$('#menu_title').html(menu_title);
}

function modalDragOn(){
	$('.modal').draggable({
		handle:'.modal-header'
	});
}

//Modal 움직임 가능
$('.modal').draggable({
	handle:'.modal-header'
});


function getZerofill(number,length){
	var result=number.toString();
	var pad=length-result.length;
	while(pad > 0){
		result='0'+result;
		pad--;
	}
	return result;
}

function debug(object){
	var str='';
	$.each(object,function(key,value){  
		str+=key+' : '+value+'\n\n';
	});
	return str;
}

/*
$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
    prevText: '<i class="fa fa-chevron-left"></i>',
    nextText: '<i class="fa fa-chevron-right"></i>',
    monthNames: ['년 01 월','년 02 월','년 03 월','년 04 월','년 05 월','년 06 월','년 07 월','년 08 월','년 09 월','년 10 월','년 11 월','년 12 월'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear:true,
	//showOn:'both',
	//buttonImage:'${contextpath}/static/common/images/btn_cal.gif',
	//buttonImageOnly:true
}); */

//달 Select
function getSelectMonth(idSelect, selected, display){
	$('#'+idSelect+ 'option').remove();
	for(var i=1;i<=12;i++) {
		if(getZerofill(i,2)==selected) $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'" selected >'+getZerofill(i,2)+display+'</option>');
		else $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'">'+getZerofill(i,2)+display+'</option>');
	}
}

//달 Select
function getSelectMonthInt(idSelect, selected, display){
	$('#'+idSelect+ 'option').remove();
	for(var i=1;i<=12;i++) {
		if(i==selected) $("#"+idSelect).append('<option value="'+i+'" selected >'+i+display+'</option>'); 
		else $("#"+idSelect).append('<option value="'+i+'">'+i+display+'</option>');
	}
}

//일자 Select
function getSelectDay(idSelect, selected, display){		//01일(display)
	$('#'+idSelect+ 'option').remove();
	for(var i=1;i<=31;i++) {
		if(getZerofill(i,2)==selected) $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'" selected >'+getZerofill(i,2)+display+'</option>');
		else $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'">'+getZerofill(i,2)+display+'</option>');
	}
}

//일자 Select
function getSelectDayInt(idSelect, selected, display){	//1일(display)
	$('#'+idSelect+ 'option').remove();
	for(var i=1;i<=31;i++) {
		if(i==selected) $("#"+idSelect).append('<option value="'+i+'" selected >'+i+display+'</option>'); 
		else $("#"+idSelect).append('<option value="'+i+'">'+i+display+'</option>');
	}
}

//시간 Select
function getSelectHour(idSelect, selected, display){	//01시(display)
	$('#'+idSelect+ 'option').remove();
	//$("#"+idSelect).append('<option value="">시</option>');
	for(var i=0;i<24;i++) {
		if(getZerofill(i,2)==selected) $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'" selected >'+getZerofill(i,2)+display+'</option>');
		else $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'">'+getZerofill(i,2)+display+'</option>');
	}
}

//시간 Select
function getSelectHourInt(idSelect, selected, display){		//1시(display)
	$('#'+idSelect+ 'option').remove();
	for(var i=0;i<24;i++) {
		if(i==selected) $("#"+idSelect).append('<option value="'+i+'" selected >'+i+display+'</option>');
		else $("#"+idSelect).append('<option value="'+i+'">'+i+display+'</option>');
	}
}

//분 Select
function getSelectMinute(idSelect, selected, per, display){		//01분(display)
	$('#'+idSelect+ 'option').remove();
	//$("#"+idSelect).append('<option value="">분</option>');
	for(var i=0;i<60;i=i+per) {
		if(getZerofill(i,2)==selected) $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'" selected >'+getZerofill(i,2)+display+'</option>');
		else $("#"+idSelect).append('<option value="'+getZerofill(i,2)+'">'+getZerofill(i,2)+display+'</option>');
	}

}

function getSelectMinuteInt(idSelect, selected, per, display){		//1분
	$('#'+idSelect+ 'option').remove();
	//$("#"+idSelect).append('<option value="">분</option>');
	for(var i=0;i<60;i=i+per) {
		if(i==selected) $("#"+idSelect).append('<option value="'+i+'" selected >'+i+display+'</option>');
		else $("#"+idSelect).append('<option value="'+i+'">'+i+display+'</option>');
	}

}


//입력받은 자리수의 난수를 생성하여 반환한다
function getRandomNum(len){
	var str = "";
	for(var i=0; i < len ; i++){
		str += Math.floor(Math.random()*10); 
	}
	return str;
}

