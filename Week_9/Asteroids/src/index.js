console.log("Webpack is working!"); 

const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

let currentCtx = window.addEventListener("DOMContentLoaded", document.getElementById("asteroid_game").getContext("2d"));
window.MovingObject = MovingObject;