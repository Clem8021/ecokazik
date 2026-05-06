class PagesController < ApplicationController
  def home
    @testimonials = Testimonial.all
  end
end
