import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = ['clickedDate', 'toggleWindow', 'togglableTaskDetail', 'togglableEditForm']
  connect() {
    console.log("hello");
  }
  open_task_window(event) {
    const date = event.currentTarget.dataset.date;
    const detailTarget = this.toggleWindowTargets.find(target => target.dataset.date === date);
    console.log("open was clicked");
    detailTarget.classList.remove("d-none");
  }
  close_task_window(event) {
    event.stopPropagation();
    const thisWindow = event.currentTarget.closest('.toggle-task-window');
    console.log("close was clicked");
    thisWindow.classList.add('d-none');
  }
  show_edit_form() {
    this.togglableTaskDetailTarget.classList.toggle("d-none");
    this.togglableEditFormTarget.classList.toggle("d-none");
  }
}
