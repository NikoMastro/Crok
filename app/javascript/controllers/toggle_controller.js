import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableForm", "togglableFormToilet", "togglableFormWalk", "togglableFormFeed", 'clickedDate', 'toggleWindow', 'togglableTaskDetail', 'togglableEditForm']
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
  show_edit_form(event) {
    const date = event.currentTarget.dataset.date;
    const detailTarget = this.togglableTaskDetailTargets.find(target => target.dataset.date === date);
    const formTarget = this.togglableEditFormTargets.find(target => target.dataset.date === date);
    detailTarget.classList.toggle("d-none");
    formTarget.classList.toggle("d-none");
  }
  show_form(event) {
    const date = event.currentTarget.closest(".toggle-task-window").dataset.date;
    const formTarget = this.togglableFormTargets.find(target => target.dataset.date === date);
    formTarget.classList.toggle("d-none");
    console.log(formTarget.closest(".toggle-task-window"));
  }

  show_form_toilet() {
    this.togglableFormToiletTarget.classList.remove("d-none");
  }
  close_form_toilet(event) {
    event.stopPropagation();
    this.togglableFormToiletTarget.classList.add("d-none");
  }
  show_form_walk() {
    this.togglableFormWalkTarget.classList.remove("d-none");
  }
  close_form_walk(event) {
    event.stopPropagation();
    this.togglableFormWalkTarget.classList.add("d-none");
  }

  show_form_feed() {
    this.togglableFormFeedTarget.classList.remove("d-none");
  }
  close_form_feed(event) {
    event.stopPropagation();
    this.togglableFormFeedTarget.classList.add("d-none");
  }
}
