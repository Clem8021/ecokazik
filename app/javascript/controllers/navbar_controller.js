import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle(event) {
    const isOpen = this.menuTarget.classList.toggle("is-open")

    // Accessibilité
    event.currentTarget.setAttribute("aria-expanded", isOpen)
  }
}
