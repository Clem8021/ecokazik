// app/javascript/controllers/services_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["service"]

  connect() {
    console.log("✅ Services controller connecté")

    this.observer = new IntersectionObserver(this.handleIntersect.bind(this), {
      threshold: 0.2
    })

    this.serviceTargets.forEach((el, i) => {
      el.style.transitionDelay = `${i * 200}ms`
      this.observer.observe(el)
    })
  }

  handleIntersect(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible")
      } else {
        entry.target.classList.remove("visible")
      }
    })
  }
}
