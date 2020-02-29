// https://www.chartjs.org/docs/latest/getting-started/usage.html
// https://stackoverflow.com/questions/18831426/rails-charts-js-how-to-fill-out-the-javascript-array-with-value-from-database
// https://travishorn.com/stacked-bar-chart-with-chart-js-846ebdf11c4e

import Chart from 'chart.js';

var ctx = document.getElementById('myChart');
var barChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            // Label = label du graphique
            label: "colors",
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

// var stackedBar = new Chart(ctx, {
//     type: 'bar',
//     data: data,
//     options: {
//         scales: {
//             xAxes: [{
//                 stacked: true
//             }],
//             yAxes: [{
//                 stacked: true
//             }]
//         }
//     }
// });


// data = {
//     labels : $("#orders_chart").data('dates'),
//     datasets : [
//       {
//         fillColor : "rgba(220,220,220,0.5)",
//         strokeColor : "rgba(220,220,220,1)",
//         pointColor : "rgba(220,220,220,1)",
//         pointStrokeColor : "#fff",
//         data : $("#orders_chart").data('values')
//     }
//   ]
// };

// ordersChart = new Chart($("#orders_chart").get(0).getContext("2d")).Line(data);


export { barChart };
// export { stackedBar };
// export { ordersChart };
