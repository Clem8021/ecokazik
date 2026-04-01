import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["track", "slide", "dots"]

  connect() {
    console.log("TESTIMONIALS CONNECTED")

    this.currentIndex = 0
    this.slideCount = this.slideTargets.length

    console.log("Slides count:", this.slideCount)

    if (this.slideCount === 0) return

    this.createDots()
    this.updateDots()

    // 🔥 FIX MOBILE : attendre que le layout soit calculé
    setTimeout(() => {
      this.updateSlide()
    }, 100)

    // 🔥 recalcul si resize (mobile, rotation, etc.)
    this.handleResize = this.updateSlide.bind(this)
    window.addEventListener("resize", this.handleResize)

    this.startAutoPlay()
  }

  disconnect() {
    this.stopAutoPlay()
    window.removeEventListener("resize", this.handleResize)
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
    if (!this.slideTargets[0]) return

    const slideWidth = this.slideTargets[0].offsetWidth

    // 🔥 sécurité mobile
    if (slideWidth === 0) return

    const offset = this.currentIndex * slideWidth

    this.trackTarget.style.transform = `translateX(-${offset}px)`

    this.updateDots()
  }

  updateDots() {
    if (!this.dotElements) return

    this.dotElements.forEach((dot, i) => {
      dot.classList.toggle("active", i === this.currentIndex)
    })
  }

  createDots() {
    this.dotsTarget.innerHTML = ""

    this.slideTargets.forEach((_, i) => {
      const button = document.createElement("button")
      button.dataset.index = i
      button.dataset.action = "click->testimonials#goTo"
      this.dotsTarget.appendChild(button)
    })

    this.dotElements = this.dotsTarget.querySelectorAll("button")
  }

  startAutoPlay() {
    this.timer = setInterval(() => this.next(), 6000)
  }

  stopAutoPlay() {
    clearInterval(this.timer)
  }
}
