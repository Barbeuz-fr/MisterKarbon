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

import { initAjaxScroll } from '../plugins/ajax_scroll';
initAjaxScroll();

document.addEventListener('turbolinks:load', function () {
}, false)

// const button = document.getElementById('data-orga');
// button.addEventListener('click', (event) => {
//   console.log(event);
// });




// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import "bootstrap";
// import * as d3 from "d3";

// import { test } from "../plugins/marimekko";
// import { test2 } from "../plugins/marimekko";
// import { square } from "../plugins/marimekko";

// test();
// test2();

// square();
