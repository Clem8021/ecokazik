document.addEventListener("DOMContentLoaded", () => {
  const track = document.querySelector(".testimonial-track");
  const slides = Array.from(document.querySelectorAll(".testimonial-slide"));
  const nextBtn = document.querySelector(".next");
  const prevBtn = document.querySelector(".prev");
  const dotsContainer = document.querySelector(".slider-dots");
  let currentIndex = 0;

  // Crée les dots
  slides.forEach((_, index) => {
    const dot = document.createElement("button");
    dot.addEventListener("click", () => goToSlide(index));
    dotsContainer.appendChild(dot);
  });

  const dots = dotsContainer.querySelectorAll("button");
  updateDots();

  function goToSlide(index) {
    currentIndex = index;
    track.style.transform = `translateX(-${100 * currentIndex}%)`;
    updateDots();
  }

  function updateDots() {
    dots.forEach(dot => dot.classList.remove("active"));
    dots[currentIndex].classList.add("active");
  }

  nextBtn.addEventListener("click", () => {
    currentIndex = (currentIndex + 1) % slides.length;
    goToSlide(currentIndex);
  });

  prevBtn.addEventListener("click", () => {
    currentIndex = (currentIndex - 1 + slides.length) % slides.length;
    goToSlide(currentIndex);
  });
});
