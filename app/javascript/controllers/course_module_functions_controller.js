import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="course-module-functions"
export default class extends Controller {
  static targets = [
    'linkPage',
    'linkQuiz',
  ]

  set_links(e){
    this.linkPageTarget.href = e.currentTarget.dataset.urlPage;
    this.linkQuizTarget.href = e.currentTarget.dataset.urlQuiz;
  }
}
