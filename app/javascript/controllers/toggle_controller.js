import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "toggleElement", "toggleArrow", "moviePicElement", "border" ]

  connect() {
    console.log("hello from the toggle controller");
  }

  fire() {
    this.toggleElementTargets.forEach(element => {
      element.classList.toggle("d-none");
    });
    this.borderTargets.forEach(element => {
      element.classList.toggle("border");
    });

    this.moviePicElementTargets.forEach(element => {
      element.classList.toggle("image-visible");
    });

    this.toggleArrowTarget.classList.toggle("arrow-right");
  }
}
