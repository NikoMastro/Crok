import { Controller } from "@hotwired/stimulus";
import * as TomSelectModule from "tom-select";
export default class extends Controller {
  connect() {
    new TomSelect(this.element);
    var form = document.getElementById('bootstrap-form');
    form.addEventListener('submit', function (event) {
      // add was-validated to display custom colors
      form.classList.add('was-validated');
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
    }, false);
  }
}
