import { Controller } from "stimulus"
import { createPopper } from '@popperjs/core';

export default class extends Controller {
  static targets = [ "profile", "menu" ];
  static classes = [ "hiding", "showing" ];

  handleMenuToggle = () => {
    if (this.profileTarget.classList.contains(this.hidingClass)) {
      this.profileTarget.classList.remove("d-none")

      this.profileTarget.classList.remove(this.hidingClass)
      this.profileTarget.classList.add(this.showingClass)

      this.menuTarget.classList.remove(this.showingClass)
      this.menuTarget.classList.add(this.hidingClass)
    } else {
      this.menuTarget.classList.remove(this.hidingClass)
      this.menuTarget.classList.add(this.showingClass)

      this.profileTarget.classList.remove(this.showingClass)
      this.profileTarget.classList.add(this.hidingClass)
    }
  }
}
