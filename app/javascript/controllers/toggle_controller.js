import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "togglableForm"]
  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
  show_form() {
    this.togglableFormTarget.classList.toggle("d-none");
  }
}
