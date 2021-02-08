import Rails from "@rails/ujs"
import "channels"
import "@oddcamp/cocoon-vanilla-js";

import bootstrap from 'bootstrap'
import "../stylesheets/application.scss"
import "animate.css"

import "@fortawesome/fontawesome-free/js/all"

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
