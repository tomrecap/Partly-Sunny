// CONDITIONS CHART
var ctx = $("#conditions-chart").get(0).getContext("2d");
var data = {
  labels: chartLabels,
	datasets: [
		{
			fillColor : "rgba(230,230,250,1)",
			strokeColor : "rgba(51,51,51,1)",
			data : chartData
		}
	]
};

var conditionsChart = new Chart(ctx).Bar(data, {
  scaleFontFamily: "'Fira Sans'",
  scaleFontSize: 16,
  scaleFontColor: "#000",
  scaleOverride:true,
  scaleSteps: scaleSteps,
  scaleStepWidth:5,
  scaleStartValue: 0,
  barValueSpacing: 5,
  scaleLabel : "<%= value %> %",
});

var swapPercentagesWithChart = function () {
  $("#conditions-table").toggleClass("hidden");
  $("#conditions-chart").toggleClass("hidden");
};