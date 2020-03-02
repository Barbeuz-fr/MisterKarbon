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
        'Not sent',
        'Sent, not started',
        'On-going',
        'Pending validation',
        'Done'
    ],
    backgroundColor: [
                  '#22aa99',
                  '#994499',
                  '#b82e2e',
                  '#66aa00',
                  '#3366cc',
      ]
  },
});

export { pieChartProgress };
