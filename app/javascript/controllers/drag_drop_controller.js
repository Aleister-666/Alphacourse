import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs'
import { patch } from '@rails/request.js'


// Connects to data-controller="drag-drop"
export default class extends Controller {

  connect() {
    this.sorteable = Sortable.create(this.element, {
      handle: '.fa-gear',
      onEnd: this.drop.bind(this)
    })
  }


  async drop(event){
    let id = event.item.id;
    let data = new FormData();
    let url = event.item.dataset.moveUrl;
    
    data.append("position", event.newIndex + 1);

    await patch(url, {
      body: data
    })
    
  }
}
