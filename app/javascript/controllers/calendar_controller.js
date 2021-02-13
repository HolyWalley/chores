import { Controller } from "stimulus"
import pickmeup from "pickmeup"

export default class extends Controller {
  connect() {
    let urlParams = new URLSearchParams(window.location.search);

    let pmu = pickmeup(this.element, { date: urlParams.get('date'), max: new Date() });

    this.element.addEventListener('pickmeup-change', function (e) {
      pmu.hide();
      Turbo.visit(`?date=${ e.detail.formatted_date }`);
    });
  }
}
