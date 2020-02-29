// https://www.chartjs.org/docs/latest/getting-started/usage.html
// https://stackoverflow.com/questions/18831426/rails-charts-js-how-to-fill-out-the-javascript-array-with-value-from-database
// https://travishorn.com/stacked-bar-chart-with-chart-js-846ebdf11c4e

import Chart from 'chart.js';

var ctx = document.getElementById('myChart');
var barChart = new Chart(ctx, {
    type: 'bar',
    data: {
        //
        labels: $("#myChart").data('titles'),
        datasets: [{
            // Label = label du graphique
            label: "Emission type - Organization",
            // Data = données déclarées dans le controlleur
            // 1ere key pour le nom de la colonne
            // 2eme key pour les valeurs
            data: $("#myChart").data('values'),
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

var ctx2 = document.getElementById('mybarChart');

var stackedBar = new Chart(ctx2, {
   type: 'bar',
   data: {
      labels: ['Standing costs', 'Running costs'], // responsible for how many bars are gonna show on the chart
      // create 12 datasets, since we have 12 items
      // data[0] = labels[0] (data for first bar - 'Standing costs') | data[1] = labels[1] (data for second bar - 'Running costs')
      // put 0, if there is no data for the particular bar
      datasets: [{
         label: 'Washing and cleaning',
         data: [0, 8],
         backgroundColor: '#22aa99'
      }, {
         label: 'Traffic tickets',
         data: [0, 2],
         backgroundColor: '#994499'
      }, {
         label: 'Tolls',
         data: [0, 1],
         backgroundColor: '#316395'
      }, {
         label: 'Parking',
         data: [5, 2],
         backgroundColor: '#b82e2e'
      }, {
         label: 'Car tax',
         data: [0, 1],
         backgroundColor: '#66aa00'
      }, {
         label: 'Repairs and improvements',
         data: [0, 2],
         backgroundColor: '#dd4477'
      }, {
         label: 'Maintenance',
         data: [6, 1],
         backgroundColor: '#0099c6'
      }, {
         label: 'Inspection',
         data: [0, 2],
         backgroundColor: '#990099'
      }, {
         label: 'Loan interest',
         data: [0, 3],
         backgroundColor: '#109618'
      }, {
         label: 'Depreciation of the vehicle',
         data: [0, 2],
         backgroundColor: '#109618'
      }, {
         label: 'Fuel',
         data: [0, 1],
         backgroundColor: '#dc3912'
      }, {
         label: 'Insurance and Breakdown cover',
         data: [4, 0],
         backgroundColor: '#3366cc'
      }]
   },
   options: {
      responsive: false,
      legend: {
         position: 'right' // place legend on the right side of chart
      },
      scales: {
         xAxes: [{
            stacked: true // this should be set to make the bars stacked
         }],
         yAxes: [{
            stacked: true // this also..
         }]
      }
   }
});


export { barChart };
export { stackedBar };
