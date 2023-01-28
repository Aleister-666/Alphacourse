import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-module"
export default class extends Controller {
  static targets = [
    'linkPage',
    'linkQuiz',
    'modal',
  ]

  show(e){
    this.modalTarget.classList.remove('hidden');
    this.modalTarget.classList.add('flex');
    this.modalTarget.classList.add('justify-center');

    this.set_links(e.currentTarget.dataset.urlPage, e.currentTarget.dataset.urlQuiz)
  }

  close(e){
    this.modalTarget.classList.remove('flex');
    this.modalTarget.classList.remove('justify-center');
    this.modalTarget.classList.add('hidden');
  }

  set_links(page, quiz){
    this.linkPageTarget.href = page;
    this.linkQuizTarget.href = quiz;
  }
}
