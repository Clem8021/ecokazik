// app/javascript/controllers/navbar_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["heroText"]

  connect() {
    console.log("✅ Navbar controller connecté")

    window.addEventListener("scroll", this.onScroll.bind(this))
  }

  disconnect() {
    window.removeEventListener("scroll", this.onScroll.bind(this))
  }

  onScroll() {
    const navbar = document.getElementById("navbar")
    if (navbar) {
      navbar.classList.toggle("scrolled", window.scrollY > 20)
    }

    if (this.hasHeroTextTarget) {
      const scrollY = window.scrollY
      this.heroTextTarget.style.transform = `translateY(${scrollY * 0.3}px)`
    }
  }
}
