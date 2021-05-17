var $chrt_border_color = "#efefef";	
/********** Bar Chart - Start **********/
function drawBarChart(_params){	
	var chart_id = _params.id;
	var chart_type = _params.type;
	var chart_data = _params.data;
	var chart_tick = _params.label;
	var chart_color = _params.color;
	var chart_width = _params.width;
	console.log("drawBarChart : "+chart_type+", id : "+chart_id);
	//console.log(">>> " +chart_data.length);
	//console.log(">>> " +chart_tick.length);
	
	var bar_chart;
	var temp_data = [];
	var temp_tick = [];
	var temp_color = [];
	
	if(typeof(chart_color)=='string'){
		$.each(chart_data, function(i, item){
			temp_color.push(chart_color); 
		});	
	}else{
		temp_color = chart_color;
	}
	
	if(chart_type=='C3'){
		temp_data.push('data');
		temp_tick.push('x');
		$.each(chart_data, function(i, item){
			temp_data.push(item); 
			temp_tick.push(chart_tick[i]);
		});		
		
		bar_chart = c3.generate({
			bindto: '#'+chart_id, 
			data: {
				type: "bar",
		    	x: "x",
		    	columns: [
					temp_data,
					temp_tick
		   	 	],		   	 	
		    	color: function(color, d){
		    		return temp_color[d.index];	
		    	}
		  	},
		  	axis: {	 
		  		x: {
		  			type: "category" 
		  		}
		  	},
		  	legend: {
		  		show: false
		  	},
		  	bar:{
		  		width: chart_width		  	
		  	}
		});
		
	}else if(chart_type=='ChartJs'){
		var bar_config = {
			type:'bar',
			data: {
				labels : chart_tick,
				datasets:[{
					label : '',
					data : chart_data,
					fill : false,
					backgroundColor : temp_color, 
					borderWidth : 1
				}]
			},
			options:{
				scales:{
					yAxes:[{
						display:true,
						ticks: {
					    	beginAtZero: true
					    }
					}],
					xAxes:[{
						ticks:{
							fontSize:12
						}
					}]
				},
				legend:{
					display:false
				}
				,responsive : true
			}
		}	
		bar_chart = new Chart($('#'+chart_id), bar_config);
		
	}else if(chart_type=='Flot'){
		$.each(chart_data, function(i, item){
			temp_data.push({ data:[[i, item]], color:temp_color[i] }); 
			temp_tick.push([i, chart_tick[i]]);
		});
		bar_chart = $.plot($('#'+chart_id), temp_data, {
			series: {
	        	bars: { 
	          		show: true,
         	  		barWidth: 0.5,
         	  		align: "center",
         	  		lineWidth: 0.3,
         	  		fill:1,
         	  		valueLabels:{
         	  			show:true 
         	  		}
	        	}        
	      	},	
			grid : {
				show : true,
				hoverable : true,
				clickable : true,
				tickColor : $chrt_border_color,
				borderWidth : 0,
				borderColor : $chrt_border_color,
			},
			legend : true,
			tooltip: {
		        show: true,
		        content: "<span style='font-size:10px;'>%y</span>",
		        lines: false,
		        clickTips: false 
		    }, 
			xaxis: {
	        	mode:"categories", 
	        	tickLength: 0,
	        	autoscaleMargin: .05,
	        	axisLabelUseCanvas: true,	
	        	font:{
	          		size: 12,
	          		color: '#000',
	          		axisLabelFontFamily: 'Arial'
	        	},		
	        	rotateTicks: 0,
	        	ticks:temp_tick 
	      	},
	      	valueLabels: { 
	         	show: true
	       	} 
		});
		
	}else if(chart_type='Google'){
		google.charts.load("visualization", '1.0', {packages:['corechart']});
		google.charts.setOnLoadCallback(function(){
			drawGoogleBarChart(chart_id, chart_data, chart_tick, temp_color, chart_width);  
		});
		bar_chart="Google";
	}
	
	return bar_chart;		
}

function updateBarChart(_params, chart_obj){
	var chart_id = _params.id;
	var chart_type = _params.type;
	var chart_data = _params.data;
	var chart_tick = _params.label;
	var chart_color = _params.color;
	var chart_width = _params.width;	
	console.log("updateBarChart : "+chart_type+", id : "+chart_id);
	
	var temp_data = [];
	var temp_tick = [];
	var temp_color = [];
	
	if(typeof(chart_color)=='string'){
		$.each(chart_data, function(i, item){
			temp_color.push(chart_color); 
		});	
	}else{
		temp_color = chart_color;
	}
	
	if(chart_type=='C3'){
		temp_data.push('data'); 
		temp_tick.push('x');
		$.each(chart_data, function(i, item){
			temp_data.push(item); 
			temp_tick.push(chart_tick[i]);
		});
		chart_obj.load({
			columns: [
				temp_data,
				temp_tick
			],
			color:function(color, d){
		    	return temp_color[d.index];	
		    }
		});
	}else if(chart_type=='ChartJs'){
		$.each(chart_data, function(i, item){
			chart_obj.data.labels[i]=chart_tick[i];
			chart_obj.data.datasets[0].data[i] = item;
			chart_obj.data.datasets[0].backgroundColor[i] = temp_color[i];
		});
		chart_obj.update();  
	
	}else if(chart_type=='Flot'){
		$.each(chart_data, function(i, item){
			temp_data.push({ data:[[i, item]], color:temp_color[i], label:chart_tick[i] }); 
		});
		chart_obj.setData(temp_data);
		chart_obj.draw();
		
	}else if(chart_type='Google'){
		google.charts.load("visualization", '1.0', {packages:['corechart']});
		google.charts.setOnLoadCallback(function(){
			drawGoogleBarChart(chart_id, chart_data, chart_tick, temp_color, chart_width);  
		});
	}	
}

//Google Bar Chart
function drawGoogleBarChart(chart_id, chart_data, chart_tick, chart_color, chart_width) {
	//console.log(chart_data);
	var temp = [["Element", "duration", { role: "style" } ]];
	$.each(chart_data, function(i, item){
		temp.push([chart_tick[i], Number(item), chart_color[i]]); 
	});
	var data = google.visualization.arrayToDataTable(temp);
  	var view = new google.visualization.DataView(data);  
  	view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  	var options = {
  		//title: "Bar Chart",
    	width: '100%',   
    	height: '100%',    
    	bar: {
    		//groupWidth: "95%"
    		groupWidth: chart_width
    	},          
    	legend: { 
    		position: "none" 
    	},  
    	animation: { //차트가 뿌려질때 실행될 애니메이션 효과
        	startup: true,
            duration: 500,
            easing: 'linear' 
        }
	};
  
	var chart = new google.visualization.ColumnChart(document.getElementById(chart_id));
	chart.draw(view, options);
	window.addEventListener('resize', function() { chart.draw(view, options); }, false);    
}
/********** Bar Chart - End **********/


/********** Pie Chart - Start **********/
//function drawPieChart(chart_type, chart_id, chart_data, chart_tick, chart_color) {  
function drawPieChart(_params) {  
	var chart_id = _params.id;
	var chart_type = _params.type;
	var chart_data = _params.data;
	var chart_tick = _params.label;
	var chart_color = _params.color;
	console.log("drawPieChart : "+chart_type+", id : "+chart_id);
	
	var pie_chart;
	var temp_data = [];
	var temp_color='';
	if(chart_type=='C3'){
		$.each(chart_data, function(i, item){
			temp_data.push([chart_tick[i], chart_data[i]]); 
			if(i!=chart_data.length-1) temp_color += '"'+chart_tick[i]+'":"'+chart_color[i]+'",';
			else temp_color += '"'+chart_tick[i]+'":"'+chart_color[i]+'"';
		});
		//console.log(temp_color);
		temp_color = '{'+temp_color+'}';
		var json_color = JSON.parse(temp_color);			
    	pie_chart = c3.generate({
    		bindto: '#'+chart_id,
	  		data: {
				type: "pie",
	    		columns: temp_data,
	    		colors: json_color
	  		},
	  		pie:{
		  		label:{
			  		show:false
			 		//format:function(value, ratio, id){
			  		//	  return d3.format("$")(value);
			  		//}
		  		}
	  		}
		});	
    	
	}else if(chart_type=='ChartJs'){
		var pie_config = {
	        type:'pie',
	        data:{
	        	labels : chart_tick,	
	            datasets:[{
	                data : chart_data,
	                backgroundColor : chart_color,
	            }]
	        },
	        options:{
	            responsive : true
	            ,legend:{
					display : true
					,position: 'bottom'
				}
	        	,tooltips: {
	        		callbacks: {
				        label: function(tooltipItem, data) {
				        	var dataset = data.datasets[tooltipItem.datasetIndex];
				        	var total = dataset.data.reduce(function(previousValue, currentValue, currentIndex, array) {
				        		return previousValue + currentValue;
				        	});
				        	var currentValue = dataset.data[tooltipItem.index];
				        	var percentage = Math.floor(((currentValue/total) * 100)+0.5);         
				        	return percentage + "%";
			        	},
			        	title: function(tooltipItem, data) {
					        return data.labels[tooltipItem[0].index]; 
					    }
	        		}
			    }
	        }	        
	    }			
		pie_chart = new Chart($('#'+chart_id), pie_config);
		
	}else if(chart_type=='Flot'){
		$.each(chart_data, function(i, item){
			temp_data.push({	label:chart_tick[i], data:chart_data[i], color:chart_color[i] 	}); 
		});
		pie_chart = $.plot($('#'+chart_id), temp_data, {
    		grid: {
    	    	hoverable: true,
    	    	clickable: true,
    	    	borderWidth: 1,
		        borderColor: '#ccc'
    	  	},
    	  	series: {
    	    	pie: {
   	          		show: true,
   	          		radius: 1, 
   	          		//innerRadius: 0.4, 	//도넛
   	          		label: {
            			show: true,
            			radius: 1,		//label 위치
            			formatter: labelFormatter
            			//threshold: 0.1
   	          		} 
  	        	}
  	        	/* ,pie:{
  	        		show:true,
  	        		position:"s" 
  	        	} */
    	  	},    	  	
    	  	legend: {
    	    	show:true
    	  	}
    	});    	
		
	}else if(chart_type='Google'){
		google.charts.load("visualization", '1.0', {packages:['corechart']});
		google.charts.setOnLoadCallback(function(){
			drawGooglePieChart(chart_id, chart_data, chart_tick, chart_color);  
		});
		pie_chart="Google";
	}
	
	return pie_chart;
}   

function updatePieChart(_params, chart_obj){
	var chart_id = _params.id;
	var chart_type = _params.type;
	var chart_data = _params.data;
	var chart_tick = _params.label;
	var chart_color = _params.color;
	console.log("updatePieChart : "+chart_type+", id : "+chart_id);
	
	var temp_data = [];
	var temp_tick = [];
	var temp_color = [];
	
	if(chart_type=='C3'){
		temp_data.push('data'); 
		temp_tick.push('x');
		$.each(chart_data, function(i, item){
			temp_data.push([chart_tick[i], chart_data[i]]); 
			if(i!=chart_data.length-1) temp_color += '"'+chart_tick[i]+'":"'+chart_color[i]+'",';
			else temp_color += '"'+chart_tick[i]+'":"'+chart_color[i]+'"';
		});
		temp_color = '{'+temp_color+'}';
		var json_color = JSON.parse(temp_color);		
		chart_obj.load({
			columns: [
				temp_data,
				temp_tick
			],
			color:function(color, d){
		    	return temp_color[d.index];	
		    }
		});
	}else if(chart_type=='ChartJs'){
		$.each(chart_data, function(i, item){
			chart_obj.data.labels[i]=chart_tick[i];
			chart_obj.data.datasets[0].data[i] = item;
			chart_obj.data.datasets[0].backgroundColor[i] = chart_color[i];
		});		
		chart_obj.update();  
	
	}else if(chart_type=='Flot'){
		$.each(chart_data, function(i, item){
			temp_data.push({	label:chart_tick[i], data:chart_data[i], color:chart_color[i] 	}); 
		});
		chart_obj.setData(temp_data);
		chart_obj.draw();
		
	}else if(chart_type='Google'){
		google.charts.load("visualization", '1.0', {packages:['corechart']});
		google.charts.setOnLoadCallback(function(){
			drawGooglePieChart(chart_id, chart_data, chart_tick, chart_color);  
		});
	}	
}

//Google Pie Chart
function drawGooglePieChart(chart_id, chart_data, chart_tick, chart_color) {
	//console.log("drawGooglePieChart : "+chart_id);
	var temp = [["Element", "duration", { role: "style" } ]]; 
	$.each(chart_data, function(i, item){
		temp.push([chart_tick[i], Number(item), chart_color[i]]); 
	});
	var data = google.visualization.arrayToDataTable(temp);
  	var view = new google.visualization.DataView(data);  
  	view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  	var options = {
  		//title: "Pie Chart",
    	width: '100%',   
    	height: '100%',
    	legend: { 
    		//position: "none" 
    	},  
    	animation: { //차트가 뿌려질때 실행될 애니메이션 효과
        	startup: true,
            duration: 500,
            easing: 'linear' 
        },
        colors: chart_color
    	//,is3D:true
        ,chartArea: {
        	width:"90%",
        	height:"90%"
        }
	};
  
	var chart = new google.visualization.PieChart(document.getElementById(chart_id));
	chart.draw(view, options);
	window.addEventListener('resize', function() { chart.draw(view, options); }, false);    
}


function labelFormatter(label, series) {
	//var formatter = '<div style="font-size:14px;text-align:center;padding:0px !important;color:#555;font-weight:bold">'+label+'<br/>' + Math.round(series.percent)  +'</div>';
	var formatter = '<div style="font-size:14px;text-align:center;padding:0px !important;color:#333;">'+ Math.round(series.percent)+'%</div>';
    return formatter; 
}	
/********** Pie Chart - End **********/


/*
function drawBarChartBillboard(chart_type, chart_id, chart_data, chart_tick, chart_color){
	//console.log(chart_data);
	var bar_chart;
	var temp_data = ['data'];
	var temp_tick = ['x'];
	$.each(chart_data, function(i, item){
		temp_data.push(item); 
		temp_tick.push(chart_tick[i]);
	});		
	bar_chart = bb.generate({
		data: {
			type: "bar",
	    	x: "x",
	    	columns: [
				temp_data,
				temp_tick
	   	 	],
	    	color:function(color, d){
	    		return chart_color[d.index];	
	    	}
	  	},
	  	axis: {	x: {type: "category"}},
	  	legend: {show: false},
	  	bindto: '#'+chart_id 
	});
	return bar_chart;		
}

function updateBarChartBillboard(chart_type, chart_id, chart_data, chart_tick, chart_color, chart_obj){
	//console.log(chart_data);
	var temp_data = ['data'];
	var temp_tick = ['x'];
	$.each(chart_data, function(i, item){
		temp_data.push(item); 
		temp_tick.push(chart_tick[i]);
	});
	chart_obj.load({
		columns: [
			temp_data,
			temp_tick
		],
		color:function(color, d){
	    	return chart_color[d.index];	
	    }
	});

	return chart_obj;
}
*/
