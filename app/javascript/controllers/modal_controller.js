import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [
    'handle',
    'modal'
  ]

  open(e){
    this.modalTarget.classList.remove('hidden');
  }

  close(e){
    this.modalTarget.classList.add('hidden');
  }
}
