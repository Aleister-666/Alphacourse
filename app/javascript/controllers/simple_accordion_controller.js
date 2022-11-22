import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="simple-accordion"
export default class extends Controller {
  static targets = [ 'header', 'content' ]


  handler(e){
    let accordionMaxHeight = this.contentTarget.style.maxHeight;
    if (accordionMaxHeight == "0px" || accordionMaxHeight.length == 0) {
      this.contentTarget.style.maxHeight = `${this.contentTarget.scrollHeight + 32}px`;
      this.headerTarget.querySelector(".fas").classList.remove("fa-plus");
      this.headerTarget.querySelector(".fas").classList.add("fa-minus");
      this.headerTarget.parentElement.classList.add('bg-gray-300');
    } else {
      this.contentTarget.style.maxHeight = `0px`;
      this.headerTarget.querySelector(".fas").classList.add("fa-plus");
      this.headerTarget.querySelector(".fas").classList.remove("fa-minus");
      // this.headerTarget.parentElement.classList.remove("bg-gray-200");
    }
  }
}