import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = [ 'handle', 'marker', 'modal' ]

  static values = {
    status: String,
    activeColor: { type: String, default: 'text-purple-600' }
  }

  connect() {
    this.show_modal();
  }

  click(e) {
    if (this.statusValue === 'show') {
      this.hidden_modal();
    } else {
      this.show_modal();
    }
  }


  show_modal() {
    this.handleTarget.classList.replace('text-gray-500', this.activeColorValue);
    this.markerTarget.classList.add('rotate-180');
    this.modalTarget.classList.remove('hidden');

    this.element.setAttribute('data-accordion-status-value', 'show');
  }

  hidden_modal() {
    this.handleTarget.classList.replace(this.activeColorValue, 'text-gray-500');
    this.markerTarget.classList.remove('rotate-180');
    this.modalTarget.classList.add('hidden');

    this.element.setAttribute('data-accordion-status-value', 'hidden');
  }
}
