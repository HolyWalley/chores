import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "each", "period", "weekdays" ]
  static values = { period: String }
  static classes = [ "dNone" ]

  handlePeriodChange = (e) => {
    this.periodValue = e.target.value;
  }

  periodValueChanged = () => {
    if (this.periodValue === "weekdays") {
      this.eachTarget.classList.add(this.dNoneClass)
      this.weekdaysTarget.classList.remove(this.dNoneClass)
    } else {
      this.eachTarget.classList.remove(this.dNoneClass)
      this.weekdaysTarget.classList.add(this.dNoneClass)
    }
  }
}
