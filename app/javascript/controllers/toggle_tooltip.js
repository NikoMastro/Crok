import { Controller } from "stimulus";
import tippy from 'tippy.js';

export default class extends Controller {
  connect() {
    this.element.querySelectorAll('[data-tooltip]').forEach((tooltipElement) => {
      tippy(tooltipElement, {
        content: tooltipElement.dataset.tooltip,
        placement: 'top',
        arrow: true,
        trigger: 'click', // Set trigger to click
      });
    });
  }
}
