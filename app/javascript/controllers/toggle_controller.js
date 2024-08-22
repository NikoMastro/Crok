import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableDetail", "togglableForm"]
  show_detail() {
    this.togglableDetailTarget.classList.toggle("d-none");
  }
  show_form() {
    this.togglableFormTarget.classList.toggle("d-none");
  }
}
