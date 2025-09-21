import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bg"]

  connect() {
    // désactive l’effet sur mobile (moins fluide)
    if (window.innerWidth > 768) {
      window.addEventListener("scroll", this.parallax)
    }
  }

  disconnect() {
    window.removeEventListener("scroll", this.parallax)
  }

  parallax = () => {
    const scrolled = window.scrollY
    this.bgTarget.style.transform = `translateY(${scrolled * 0.3}px)`
  }
}
