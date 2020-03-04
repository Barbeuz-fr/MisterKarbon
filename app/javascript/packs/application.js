// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require("Chart.min")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "bootstrap";
import { initAjaxScroll, preserveTab } from '../plugins/ajax_scroll';
import { stackedBar } from '../plugins/bar_chart';
import { pieChartProgress } from '../plugins/pie_chart';
import '../plugins/dropdown_dashboard';
import { dropdownSelected } from '../plugins/dropdown_dashboard';
import { initSubmit } from '../plugins/submit';
// import { stackedBar } from '../plugins/bar_chart';
initAjaxScroll();

document.addEventListener('turbolinks:load', function () {
  initSubmit();
  preserveTab();
  dropdownSelected();
  stackedBar();
  pieChartProgress();

}, false)

if (document.getElementById('mybarChart')) {

}

// const button = document.getElementById('data-orga');
// button.addEventListener('click', (event) => {
//   console.log(event);
// });


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// import { updateDropdownValue } from '../plugins/dropdown_dashboard';
if (document.getElementById('mybarChart')) {
  stackedBar();
}
if ( document.getElementById('progressPieChart')) {
  pieChartProgress();
}
