import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["window"]

  connect() {
    this.popupShown = false
    console.log("✅ PopupController connecté")
    window.addEventListener("scroll", this.showOnScroll.bind(this))
  }

  showOnScroll() {
    if (!this.popupShown && window.scrollY > 50) {
      this.element.classList.add("show")
      this.popupShown = true
      console.log("🎉 Popup affiché au scroll")
    }
  }

  close(event) {
    event.preventDefault()
    this.element.classList.remove("show")
    console.log("❌ Popup fermé")
  }
}
