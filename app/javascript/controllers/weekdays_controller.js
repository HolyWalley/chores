import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "checkbox" ]
  static values = { weekdays: String }

  handleChange = (e) => {
    this.weekdaysValue = this.checkboxTargets.filter((t) => t.checked).map((t) => t.value).join('');
  }

  weekdaysValueChanged = () => {
    const allWeekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    allWeekdays.map((wd) => this.weekdaysValue.includes(wd)).forEach((v, i) => this.checkboxTargets[i].checked = v);

    this.inputTarget.value = this.weekdaysValue;
  }
}
