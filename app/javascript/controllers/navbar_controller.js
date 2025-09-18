import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-burger"
export default class extends Controller {
  static targets = ["toggle", "sidebar"]

  connect() {
    console.log("✅ menu_burger_controller connecté !");
  }

  toggle() {
    this.toggleTarget.classList.toggle("open")
    this.sidebarTarget.classList.toggle("active")

    const isOpen = this.sidebarTarget.classList.contains("active")
    this.toggleTarget.setAttribute("aria-expanded", isOpen)
  }
}
