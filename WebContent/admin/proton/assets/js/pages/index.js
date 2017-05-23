$(document).ready(function(){
	
	todoList();
	discussionWidget();
	
	/* ---------- Datable ---------- */
	$('.datatable').dataTable({
		"sDom": "<'row'<'col-lg-6'l><'col-lg-6'f>r>t<'row'<'col-lg-12'i><'col-lg-12 center'p>>",
		"bPaginate": false,
		"bFilter": false,
		"bLengthChange": false,
		"bInfo": false,		
	});
	
	$('.countries').dataTable({
		"sDom": "<'row'<'col-lg-6'l><'col-lg-6'f>r>t<'row'<'col-lg-12'i><'col-lg-12 center'p>>",
		"bPaginate": false,
		"bFilter": false,
		"bLengthChange": false,
		"bInfo": false,
		// Disable sorting on the first column
		"aoColumnDefs" : [ {
			'bSortable' : false,
			'aTargets' : [ 0 ]
		} ]
	});
	
	/*------- Moris chart -------*/
	Morris.Donut({
		element: 'hero-donut',
		data: [
			{label: '原创', value: Math.round(parseInt($('#original').attr('data-sum')) * 100 / (parseInt($('#original').attr('data-sum')) + parseInt( $('#copy').attr('data-sum'))))},
			{label: '转载', value: Math.round(parseInt($('#copy').attr('data-sum')) * 100 / (parseInt($('#original').attr('data-sum')) + parseInt( $('#copy').attr('data-sum'))))},
	    ],
		colors: ["#fabb3d", "#ff5454"],
		formatter: function (y) { return y + "%" }
	});
	
	/*------- Realtime Update Chart -------*/
	
	$(function() {

		 // we use an inline data source in the example, usually data would
	// be fetched from a server
	var data = [], totalPoints = 300;
	function getRandomData() {
		if (data.length > 0)
			data = data.slice(1);

		// do a random walk
		while (data.length < totalPoints) {
			var prev = data.length > 0 ? data[data.length - 1] : 50;
			var y = prev + Math.random() * 10 - 5;
			if (y < 0)
				y = 0;
			if (y > 100)
				y = 100;
			data.push(y);
		}

		// zip the generated y values with the x values
		var res = [];
		for (var i = 0; i < data.length; ++i)
			res.push([i, data[i]])
		return res;
	}

	// setup control widget
	var updateInterval = 30;
	$("#updateInterval").val(updateInterval).change(function () {
		var v = $(this).val();
		if (v && !isNaN(+v)) {
			updateInterval = +v;
			if (updateInterval < 1)
				updateInterval = 1;
			if (updateInterval > 2000)
				updateInterval = 2000;
			$(this).val("" + updateInterval);
		}
	});

	
	if($("#realtime-update").length)
	{
		var options = {
			series: { shadowSize: 1 },
			lines: { fill: true, fillColor: { colors: [ { opacity: 1 }, { opacity: 0.1 } ] }},
			yaxis: { min: 0, max: 100 },
			xaxis: { show: false },
			colors: ["#57889c"],
			grid: {	tickColor: "#dddddd",
					borderWidth: 0 
			},
		};
		var plot = $.plot($("#realtime-update"), [ getRandomData() ], options);
		function update() {
			plot.setData([ getRandomData() ]);
			// since the axes don't change, we don't need to call plot.setupGrid()
			plot.draw();
			
			setTimeout(update, updateInterval);
		}

		update();
	}
	
});
		
	/*------- Gauge -------*/
	var opts = {
	  	lines: 11, // The number of lines to draw
	  	angle: 0.03, // The length of each line
	  	lineWidth: 0.43, // The line thickness
	  	pointer: {
	    	length: 0.74, // The radius of the inner circle
	    	strokeWidth: 0.034, // The rotation offset
	    	color: '#484848' // Fill color
	  	},
	  	limitMax: 'false',   // If true, the pointer will not go past the end of the gauge
	  	colorStart: '#f4b162',   // Colors
	  	colorStop: '#f4b162',    // just experiment with them
	  	strokeColor: '#f5f5f5',   // to see which ones work best for you
	  	generateGradient: true
	};
	var target = document.getElementById('gauge1'); // your canvas element
	var gauge = new Gauge(target).setOptions(opts); // create sexy gauge!
	gauge.maxValue = 2000; // set max gauge value
	gauge.animationSpeed = 40; // set animation speed (32 is default value)
	gauge.set(parseFloat($('#gauge1').attr('data-percentage')) * gauge.maxValue); // set actual value
	
	var opts2 = {
	  	lines: 11, // The number of lines to draw
	  	angle: 0.03, // The length of each line
	  	lineWidth: 0.43, // The line thickness
	  	pointer: {
	    	length: 0.74, // The radius of the inner circle
	    	strokeWidth: 0.034, // The rotation offset
	    	color: '#484848' // Fill color
	  	},
	  	limitMax: 'false',   // If true, the pointer will not go past the end of the gauge
	  	colorStart: '#71d398',   // Colors
	  	colorStop: '#71d398',    // just experiment with them
	  	strokeColor: '#f5f5f5',   // to see which ones work best for you
	  	generateGradient: true
	};
	var target = document.getElementById('gauge2'); // your canvas element
	var gauge = new Gauge(target).setOptions(opts2); // create sexy gauge!
	gauge.maxValue = 2000; // set max gauge value
	gauge.animationSpeed = 80; // set animation speed (32 is default value)
	gauge.set(parseFloat($('#gauge2').attr('data-percentage')) * gauge.maxValue); // set actual value
	
});


