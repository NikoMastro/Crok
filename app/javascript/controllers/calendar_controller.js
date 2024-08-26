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
    console.log("open was clicked");

    // console.log(detailTarget);

    // detailTarget.style.display = "block";
    detailTarget.classList.remove("d-none");
  }
  close_task_window(event) {
    event.stopPropagation();
    const thisWindow = event.currentTarget.closest('.toggle-task-window');
    // thisWindow.style.display = "none";
    console.log("close was clicked");
    // console.log(thisWindow);

    thisWindow.classList.add('d-none');
  }
}
