import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["track", "dots"]

  connect() {
    this.currentIndex = 0
    this.cards = this.trackTarget.children
    this.total = this.cards.length

    this.setupDots()
    this.update()
  }

  setupDots() {
    this.dotsTarget.innerHTML = ""

    for (let i = 0; i < this.total; i++) {
      const dot = document.createElement("button")
      dot.dataset.index = i
      dot.dataset.action = "click->instruments#goTo"
      this.dotsTarget.appendChild(dot)
    }

    this.dotButtons = this.dotsTarget.querySelectorAll("button")
  }

  goTo(event) {
    this.currentIndex = parseInt(event.currentTarget.dataset.index)
    this.update()
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.total
    this.update()
  }

  prev() {
    this.currentIndex = (this.currentIndex - 1 + this.total) % this.total
    this.update()
  }

  update() {
    this.trackTarget.style.transform = `translateX(-${this.currentIndex * 100}%)`

    this.dotButtons.forEach((dot, i) => {
      dot.classList.toggle("active", i === this.currentIndex)
    })
  }
}
