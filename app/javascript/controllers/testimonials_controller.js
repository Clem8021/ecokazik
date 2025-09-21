import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.track = this.element.querySelector(".testimonial-track")
    this.slides = Array.from(this.element.querySelectorAll(".testimonial-slide"))
    this.nextBtn = this.element.querySelector(".next")
    this.prevBtn = this.element.querySelector(".prev")
    this.dotsContainer = this.element.querySelector(".slider-dots")

    if (!this.slides.length || !this.track || !this.dotsContainer) return

    // Crée les dots
    this.dotsContainer.innerHTML = ""
    this.dots = this.slides.map((_, i) => {
      const btn = document.createElement("button")
      btn.type = "button"
      btn.setAttribute("aria-label", `Aller au témoignage ${i+1}`)
      btn.addEventListener("click", () => this.goTo(i))
      this.dotsContainer.appendChild(btn)
      return btn
    })

    this.index = 0
    this.update()

    this.nextBtn?.addEventListener("click", () => this.goTo((this.index + 1) % this.slides.length))
    this.prevBtn?.addEventListener("click", () => this.goTo((this.index - 1 + this.slides.length) % this.slides.length))
  }

  goTo(i) {
    this.index = i
    this.track.style.transform = `translateX(-${100 * this.index}%)`
    this.update()
  }

  update() {
    this.dots.forEach((d, j) => {
      const active = j === this.index
      d.classList.toggle("active", active)
      d.setAttribute("aria-current", active ? "true" : "false")
    })
  }
}
