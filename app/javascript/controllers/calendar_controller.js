import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ['clickedDate', 'toggleWindow']
  connect() {
    console.log("hello");
  }
  open_task_window(event) {
    const date = event.currentTarget.dataset.date;
    const detailTarget = this.toggleWindowTargets.find(target => target.dataset.date === date);
    if (detailTarget) {
      detailTarget.classList.remove("d-none");
    }
  }
}
