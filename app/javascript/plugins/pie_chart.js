import Chart from 'chart.js';

// For a pie chart


var ctx3 = document.getElementById('progressPieChart');

var piechart_data = $("#progressPieChart").data('progress');

var pieChartProgress = new Chart(ctx3, {
    type: 'pie',
    data: {
    datasets: [{
        data: piechart_data
    }],
    labels: [
        'To invite',
        'invited, not started',
        'On-going work',
        'Pending validation',
        'Done'
    ],
    backgroundColor: [
                  'rgba(0, 0, 0, 0.3)',
                  '#994499',
                  '#b82e2e',
                  '#66aa00',
                  '#3366cc',
      ]
  },
});

export { pieChartProgress };
