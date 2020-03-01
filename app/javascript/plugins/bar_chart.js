// https://www.chartjs.org/docs/latest/getting-started/usage.html
// https://stackoverflow.com/questions/18831426/rails-charts-js-how-to-fill-out-the-javascript-array-with-value-from-database
// https://travishorn.com/stacked-bar-chart-with-chart-js-846ebdf11c4e

import Chart from 'chart.js';


// ----------------------------------------------------------
// SIMPLE BAR CHART
// ----------------------------------------------------------

// var ctx = document.getElementById('myChart');
// var barChart = new Chart(ctx, {
//     type: 'bar',
//     data: {
//         //
//         labels: $("#myChart").data('titles'),
//         datasets: [{
//             // Label = label du graphique
//             label: "Emission type - Organization",
//             // Data = données déclarées dans le controlleur
//             // 1ere key pour le nom de la colonne
//             // 2eme key pour les valeurs
//             data: $("#myChart").data('values'),
//             backgroundColor: [
//                 'rgba(255, 99, 132, 0.2)',
//                 'rgba(54, 162, 235, 0.2)',
//                 'rgba(255, 206, 86, 0.2)',
//                 'rgba(75, 192, 192, 0.2)',
//                 'rgba(153, 102, 255, 0.2)',
//                 'rgba(255, 159, 64, 0.2)'
//             ],
//             borderColor: [
//                 'rgba(255, 99, 132, 1)',
//                 'rgba(54, 162, 235, 1)',
//                 'rgba(255, 206, 86, 1)',
//                 'rgba(75, 192, 192, 1)',
//                 'rgba(153, 102, 255, 1)',
//                 'rgba(255, 159, 64, 1)'
//             ],
//             borderWidth: 1
//         }]
//     },
//     options: {
//         scales: {
//             yAxes: [{
//                 ticks: {
//                     beginAtZero: true
//                 }
//             }]
//         }
//     }
// });


// ----------------------------------------------------------
// STACKED BAR CHART
// ----------------------------------------------------------

var ctx2 = document.getElementById('mybarChart');

// Array vide qui sera ajouté à la key 'dataset' au script stackedBar
var datasets_for_barchart = [];

// Recupération des données dans le controlleur
var barchart_data = $("#bar_chart_data").data('emissions');
var label_orga = $("#bar_chart_data").data('orga');

// Definition des couleurs
var stackedbackgroundColors = [
                '#22aa99',
                '#994499',
                '#b82e2e',
                '#66aa00',
                '#3366cc',
                '#3366cc',
                '#3366cc',
                '#3366cc',
                '#3366cc',
                '#3366cc',
                '#3366cc',
                '#3366cc',
                ];

// boucle sur les n modules (longueur de l'array principal)
var barchart_data_length = barchart_data.length;
for (var i = 0; i < barchart_data_length; i++) {
  // Definition du hash à ajouter
  var new_hash = {
    label: "WIP",
    data: barchart_data[i],
    backgroundColor: stackedbackgroundColors[i],
  } ;
  datasets_for_barchart.push(new_hash)
};
// console.log(datasets_for_barchart);

// Rendu du graphique
var stackedBar = new Chart(ctx2, {
   type: 'bar',
   data: {
      labels: $("#mybarChart").data('titles'), // responsible for how many bars are gonna show on the chart
      datasets: datasets_for_barchart
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


// export { barChart };
export { stackedBar };
