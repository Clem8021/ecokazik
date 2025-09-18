import { Controller } from "@hotwired/stimulus"

// data-controller="menu"
export default class extends Controller {
  static targets = ["links", "toggle"]

  connect() {
    // petit log pour vérifier que ça charge bien
    console.log("✅ menu_controller connecté")
    this._closeOnResize = this.closeOnResize.bind(this)
    window.addEventListener("resize", this._closeOnResize)
  }

  disconnect() {
    window.removeEventListener("resize", this._closeOnResize)
  }

  toggle() {
    this.linksTarget.classList.toggle("active")
    this.toggleTarget.classList.toggle("open")
  }

  closeOnResize() {
    if (window.innerWidth > 768) {
      this.linksTarget.classList.remove("active")
      this.toggleTarget.classList.remove("open")
    }
  }
}
