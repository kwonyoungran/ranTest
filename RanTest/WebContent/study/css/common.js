
$(document).ready(function() {
	"use strict";

//	$(".content").innerHeight(window.innerHeight - $("footer").innerHeight() - $("nav").innerHeight() - 12);
	
	$('.input-group.date').datepicker({
		format: 'yyyy-mm-dd',
		autoclose: true,
	    todayHighlight: true,
	    leftArrow: '<i class="fa fa-long-arrow-left"></i>',
	    rightArrow: '<i class="fa fa-long-arrow-right"></i>',
	    language:'kr'
	});
	
	$("select").select2({
		width : "100%"
	});
	
	$('#daterange-btn').daterangepicker({
		opens: "left",
		autoApply: true,
		ranges: {
			'Today': [moment(), moment()],
			'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
			'Last 7 Days': [moment().subtract(6, 'days'), moment()],
			'Last 30 Days': [moment().subtract(29, 'days'), moment()],
			'This Month': [moment().startOf('month'), moment().endOf('month')],
			'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		},
		startDate: moment().subtract(29, 'days'),
		endDate: moment(),
		locale: {
			format : 'YYYY-MM-DD'
		}
	},
	function (start, end) {
//		$('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
		$('#daterange-btn span').html(start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD'));
	});
	
});
