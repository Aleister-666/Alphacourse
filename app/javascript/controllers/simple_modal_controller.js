import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="simple-modal"
export default class extends Controller {
  static targets = [ 'modal' ]


  handler(e){
    this.modalTarget.classList.toggle('hidden');

  }

}
