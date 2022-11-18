import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="simple-test"
export default class extends Controller {
  static targets = [ 'answer', 'correct_answer', 'pointer', 'button' ]

  connect(){
    this.disable_button();
    this.answerTargets.forEach(e => e.classList.add('transition', 'cursor-pointer', 'hover:bg-gray-200'));

  }

  select_option(e){
    this.remove_all_options();
    this.active_button();


    e.target.classList.add('bg-gray-300', 'font-bold');
    e.target.dataset.selected = true;
  }

  evaluate(e){
    let responses = this.answerTargets;

    let select;

    responses.forEach((e) => {
      if (e.dataset.selected === 'true') {
        select = e;
      }

      e.classList.add('pointer-events-none');
    });

    let score = select.dataset.score;
    let max_score = this.element.dataset.maxScore;

    this.pointerTarget.innerText = `${score}/${max_score}`;
    this.remove_all_options();
    this.paint_correct_answer();
    this.paint_incorrect_answer(select);
    this.disable_button();
  }


  remove_all_options(){
    let answers = this.answerTargets;

    answers.forEach((e) => {
      e.classList.remove('bg-gray-300', 'font-bold');
      e.dataset.selected = false;
    });
  }

  active_button(){
    this.buttonTarget.classList.remove('grayscale', 'cursor-not-allowed', 'pointer-events-none');
  }

  disable_button(){
    this.buttonTarget.classList.add('grayscale', 'cursor-not-allowed', 'pointer-events-none');
  }

  paint_correct_answer(){
    this.correct_answerTarget.classList.add('bg-green-400', 'text-green-800', 'font-bold');
  }

  paint_incorrect_answer(selected){
    if (selected !== this.correct_answerTarget) {
      selected.classList.add('bg-red-300', 'text-red-800', 'font-bold');

    }
  }

}