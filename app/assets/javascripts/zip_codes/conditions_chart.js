// CONDITIONS CHART

var conditionsChart = {};

$(document).ready(function () {
  conditionsChart.ctx = $("#conditions-chart").get(0).getContext("2d");
  conditionsChart.data = {
    labels: chartLabels,
  	datasets: [
  		{
  			fillColor : "rgba(230,230,250,1)",
  			strokeColor : "rgba(51,51,51,1)",
  			data : chartData
  		}
  	]
  };

  conditionsChart.conditionsChart = new Chart(conditionsChart.ctx).Bar(conditionsChart.data, {
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

  conditionsChart.swapPercentagesWithChart = function () {
    $("#conditions-table").toggleClass("hidden");
    $("#conditions-chart").toggleClass("hidden");
  };
});
