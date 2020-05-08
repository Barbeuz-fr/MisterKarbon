// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

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
import { initActiveNavItem } from '../components/init_active_nav_item';
import '../plugins/dropdown_dashboard';
import { initSubmit } from '../plugins/submit';
import { dropdownSelected } from '../plugins/dropdown_dashboard';
import { activeQueryDashboard} from '../plugins/tab-dashboard';


initAjaxScroll();



document.addEventListener('turbolinks:load', function () {
  if (document.getElementById('mybarChart')) {
    stackedBar();
  }
  // gtag('config', 'UA-165936086-1');

  initActiveNavItem();
  initToolTip();
  initSubmit();
  preserveTab();
  dropdownSelected();
  activeQueryDashboard();
}, false)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

