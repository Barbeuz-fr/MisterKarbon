// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3
//= require jquery_ujs
//= require bootstrap.min
//= require_tree .


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "bootstrap";
import { initAjaxScroll, preserveTab } from '../plugins/ajax_scroll';
import { stackedBar } from '../plugins/bar_chart';
import { initToolTip } from '../components/init_tooltip';
import '../plugins/dropdown_dashboard';
import { initSubmit } from '../plugins/submit';
import { dropdownSelected } from '../plugins/dropdown_dashboard';
import { activeQueryDashboard} from '../plugins/tab-dashboard';
// import { testJs } from '../plugins/test-jquery';
// import '../plugins/sticky_multi_headers';

// testJs();
initAjaxScroll();

document.addEventListener('turbolinks:load', function () {
  if (document.getElementById('mybarChart')) {
    stackedBar();
  }
  initToolTip();
  initSubmit();
  preserveTab();
  dropdownSelected();
  activeQueryDashboard();
}, false);

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

