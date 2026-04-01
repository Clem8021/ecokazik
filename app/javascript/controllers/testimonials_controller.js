import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["track", "slide", "dots"]

  connect() {
    this.currentIndex = 0
    this.slideCount = this.slideTargets.length

    if (this.slideCount === 0) return

    this.createDots()
    this.updateDots()

    // 🔥 attendre que le layout soit prêt
    requestAnimationFrame(() => {
      this.updateSlide()
    })

    window.addEventListener("resize", this.updateSlide.bind(this))

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
    const slider = this.trackTarget.parentElement
    const sliderWidth = slider.offsetWidth

    if (sliderWidth === 0) return

    const offset = this.currentIndex * sliderWidth

    this.trackTarget.style.transform = `translateX(-${offset}px)`
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
