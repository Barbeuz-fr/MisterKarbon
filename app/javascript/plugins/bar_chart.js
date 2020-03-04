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
                  '#3366cc',
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
      label: ylabel[i],
      data: barchart_data[i],
      backgroundColor: stackedbackgroundColors[i],
    } ;
    datasets_for_barchart.push(new_hash)
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
  console.log(myStackedBar);

    //   const el = document.getElementById('mybarChart');
    // if(el){
    //   el.addEventListener('click', (e) => {
    //     console.log('rrrrr')
    //     console.log(myStackedBar.data);
    //     const chartData = myStackedBar.getBarsAtEvent(e);
    //   });
    // };
};

// Fonction pour récupérer les data au click
// getBarsAtEvent

  // const clickChart = () => {
  //   const el = document.getElementById('mybarChart');
  //   if(el){
  //     el.addEventListener('click', (e) => {
  //       console.log($("mybarChart"));
  //       const chartData = $("mybarChart").getBarsAtEvent(e);
  //     });
  //   };
  // }

// function handleClick(evt);
// {
//   var activeElement = stackedBar.getElementAtEvent(evt);
// };


export { stackedBar };
