import Rails from "@rails/ujs"
import "channels"
import "@oddcamp/cocoon-vanilla-js";

import bootstrap from 'bootstrap'
import "../stylesheets/application.scss"

import "@fortawesome/fontawesome-free/js/all"

import { Turbo } from "@hotwired/turbo-rails"

Rails.start()
window.Turbo = Turbo

import "controllers"
