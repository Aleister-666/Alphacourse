import { Controller } from "@hotwired/stimulus";
import debounce from 'debounce';

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
    this.submit = debounce(this.submit.bind(this), 300);
  }

  submit(e){
    this.element.requestSubmit();
  }
}