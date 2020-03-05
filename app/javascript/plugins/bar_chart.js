// https://www.chartjs.org/docs/latest/getting-started/usage.html
// https://stackoverflow.com/questions/18831426/rails-charts-js-how-to-fill-out-the-javascript-array-with-value-from-database
// https://travishorn.com/stacked-bar-chart-with-chart-js-846ebdf11c4e

import Chart from 'chart.js';

// Rendu du graphique
const stackedBar = () => {
  var ctx2 = document.getElementById('mybarChart');

  // Array vide qui sera ajouté à la key 'dataset' au script stackedBar
  var datasets_for_barchart = [];

  // Recupération des données dans le controlleur
  var barchart_data = $("#bar_chart_data").data('emissions');
  var label_orga = $("#bar_chart_data").data('orga');
  var ylabel = $("#bar_chart_data").data('ylabel');

  // Definition des couleurs
  var stackedbackgroundColors = [
                  '#4B88A2',
                  '#30305C',
                  '#994499',
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
  if (barchart_data) {

    var barchart_data_length = barchart_data.length;
    for (var i = 0; i < barchart_data_length; i++) {
      // Definition du hash à ajouter
      var new_hash = {
        label: ylabel[i],
        data: barchart_data[i],
        backgroundColor: stackedbackgroundColors[i],
      } ;
      datasets_for_barchart.push(new_hash)
    };
  };
  var myStackedBar = new Chart(ctx2, {
     type: 'bar',
     data: {
        labels: $("#mybarChart").data('titles'), // responsible for how many bars are gonna show on the chart
        datasets: datasets_for_barchart
     },
     options: {
        responsive: false,
        legend: {
          position: 'right',
          labels: {
            boxWidth: 70,
            fontSize: 16,
          },
        },
        scales: {
           xAxes: [{
              ticks: {
                    fontSize: 16
                },
              stacked: true // this should be set to make the bars stacked
           }],
           yAxes: [{
              ticks: {
                    fontSize: 16
                },
              stacked: true // this also..
           }],
        }
     }
  });
};

export { stackedBar };
