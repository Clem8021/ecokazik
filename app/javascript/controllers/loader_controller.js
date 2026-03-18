import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loader"
export default class extends Controller {
  static targets = ["overlay"]

  connect() {
    document.addEventListener("turbo:load", () => {
      this.hideLoader()
    })
  }

  hideLoader() {
    this.overlayTarget.style.opacity = "0"

    setTimeout(() => {
      this.overlayTarget.style.display = "none"
    }, 500)
  }
}
