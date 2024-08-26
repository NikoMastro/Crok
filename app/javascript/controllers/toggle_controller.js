import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableForm", "togglableFormToilet", "togglableFormWalk", "togglableFormFeed", ]

  show_form() {
    this.togglableFormTarget.classList.toggle("d-none");
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
