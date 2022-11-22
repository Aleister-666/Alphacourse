import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="simple-navbar"
export default class extends Controller {
  static targets = [ 'navbar', 'sidebar', 'button', 'closed', 'open' ]
  connect() {
    this.sidebarTarget.style.top = parseInt(this.navbarTarget.clientHeight) - 1 + "px";
  }

  handler(e){
    this.sidebarTarget.classList.toggle('show');
    this.closedTarget.classList.toggle('hidden');
    this.openTarget.classList.toggle('hidden');
  }
}
