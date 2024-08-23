import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disablebutton"
export default class extends Controller {
  connect() {
    console.log("hello");
  }

  disableButton(event) {
    event.preventDefault()
    this.element.disabled = true
    this.element.value = "Submitted"
  }
}
