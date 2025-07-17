class HomeController < ApplicationController
  def index
    @testimonials = Testimonial.all
  end
end
