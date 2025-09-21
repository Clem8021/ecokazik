// app/javascript/controllers/testimonials_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["track", "slide", "dots"]

  connect() {
    this.currentIndex = 0
    this.slideCount = this.slideTargets.length

    // Crée les dots une fois
    this.createDots()
    this.updateDots()

    // Auto-play
    this.startAutoPlay()
  }

  disconnect() {
    this.stopAutoPlay()
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.slideCount
    this.updateSlide()
  }

  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.slideCount) % this.slideCount
    this.updateSlide()
  }

  goTo(event) {
    this.currentIndex = parseInt(event.currentTarget.dataset.index)
    this.updateSlide()
  }

  updateSlide() {
    this.trackTarget.style.transform = `translateX(-${100 * this.currentIndex}%)`
    this.updateDots()
  }

  updateDots() {
    this.dotElements.forEach((dot, i) => {
      dot.classList.toggle("active", i === this.currentIndex)
    })
  }

  createDots() {
    this.dotsTarget.innerHTML = "" // reset
    this.slideTargets.forEach((_, i) => {
      const button = document.createElement("button")
      button.dataset.index = i
      button.dataset.action = "click->testimonials#goTo"
      this.dotsTarget.appendChild(button)
    })
    this.dotElements = this.dotsTarget.querySelectorAll("button") // ✅ variable interne
  }

  startAutoPlay() {
    this.timer = setInterval(() => this.next(), 6000)
  }

  stopAutoPlay() {
    clearInterval(this.timer)
  }
}
