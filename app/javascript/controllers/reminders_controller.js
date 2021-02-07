import { Controller } from "stimulus"

export default class extends Controller {
  static values = { template: String }
  static targets = [ "reminders", "reminder" ]

  handleAddReminder(e) {
    this.remindersTarget.innerHTML += this.templateValue;

    e.preventDefault();
  }

  handleRemoveReminder(e) {
    this.reminderTargets.find((reminder) => reminder.contains(e.target)).remove();

    e.preventDefault();
  }
}
