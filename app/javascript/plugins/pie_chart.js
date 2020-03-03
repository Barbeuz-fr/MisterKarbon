import Chart from 'chart.js';

// For a pie chart


var ctx3 = document.getElementById('progressPieChart');

var piechart_data = $("#progressPieChart").data('progress');

var pieChartProgress = new Chart(ctx3, {
    type: 'pie',
    data: {
    datasets: [{
        data: piechart_data,
        backgroundColor: [
                      '#A9927D',
                      '#7B9EA8',
                      '#3366cc',
                      '#8AC495',
                      '#66aa00',
          ]
    }],
    labels: [
        'To start',
        'On-going work',
        'Almost there',
        'Pending validation',
        'Done'
    ],
  },
    options: {
      legend: {
        position: 'right',
      }
    }
});

export { pieChartProgress };
