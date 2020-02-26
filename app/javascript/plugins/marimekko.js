// Source : https://observablehq.com/@barbeuz-fr/marimekko-chart
// Source: https://gist.github.com/jeanfw/5884317

// Import
import * as d3 from "d3";

const test = () => {
  d3.select("#map").style("color", "green");
};

const test2 = () => {
  const svg = d3.select("#test")
    .append("svg")
      .attr("viewBox", [0, 0, 900, 900])
      .style("font", "10px sans-serif");

};

const square = d3.selectAll("rect");
square.style("fill", "orange");

// ===========================================================================
// Dummy data
// ===========================================================================


// ===========================================================================
// Exports
// ===========================================================================



export { test2 };
export { test };
export { square };
