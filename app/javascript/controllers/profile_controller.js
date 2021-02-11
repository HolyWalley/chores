import { Controller } from "stimulus"
import { createPopper } from '@popperjs/core';

export default class extends Controller {
  static targets = [ "dropdown" ];

  connect() {
    createPopper(this.element, this.dropdownTarget, {
      strategy: "fixed"
    });

    let handleClick = (e) => {
      let isClickInside = this.element.contains(event.target);

      if (isClickInside) {
        this.dropdownTarget.classList.toggle("d-block");
      }
      else{
        this.dropdownTarget.classList.remove("d-block");
      }
    }

    document.addEventListener('click', handleClick);
  }
}
