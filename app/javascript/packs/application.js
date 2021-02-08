import Rails from "@rails/ujs"
import "channels"
import "@oddcamp/cocoon-vanilla-js";

import bootstrap from 'bootstrap'
import "../stylesheets/application.scss"
import "animate.css"

import "@fortawesome/fontawesome-free/css/all"

import { Turbo } from "@hotwired/turbo-rails"

Rails.start()
window.Turbo = Turbo

import "controllers"

document.addEventListener('turbo:before-stream-render', (event) => {
  event.preventDefault()

  let oldElement = document.getElementById(event.target.target)

  oldElement.classList.add('animate__fadeOut', 'animate__animated')

  oldElement.addEventListener('animationend', function() {
    event.target.performAction()
  })
});

document.addEventListener("turbo:load", () => {
  document.getElementById("sidebarMenu").addEventListener('show.bs.collapse', (e) => {
    let menu = e.target;

    menu.classList.add("animate__bounceInLeft");

    setTimeout(() => menu.classList.remove("animate__bounceInLeft"), 1000);
  })

  document.getElementById("sidebarMenu").addEventListener('hide.bs.collapse', (e) => {
    let menu = e.target;

    menu.classList.add("animate__bounceOutLeft");
    setTimeout(() => menu.classList.remove("animate__bounceOutLeft"), 1000);
  });
});
