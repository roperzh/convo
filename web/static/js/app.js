// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"


var dots=[];
var numDots = 100;
var width = window.innerWidth - 30;
var height = window.innerHeight - 30;

for(var i=0 ; i<numDots ; i++){
  dots.push({
    x : Math.random() * width,
    y : Math.random() * height
  })
}

var validColours = {
  1: "rgb(87, 141, 200)",
  2: "rgb(233, 103, 94)",
  3: "rgb(104, 197, 153)",
  4: "rgb(175, 62, 192)",
  5: "rgb(230, 228, 228)"
}

function draw() {
  var div = document.createElement('div')
  div.style.overflow = "hidden";

  var j, dot;
  for(j = 0; j < numDots; j++) {
    var dot = dots[j];
    var color = validColours[Math.floor(Math.random()*5)];

    var span = document.createElement('span');
    span.className = "dot";
    span.style.backgroundColor = color;
    span.style.top = dot.y + "px";
    span.style.left = dot.x + "px";

    div.appendChild(span);
  }

  document.body.appendChild(div);
}

draw()