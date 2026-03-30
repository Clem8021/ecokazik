class TestimonialsController < ApplicationController
  def index
    @testimonials = GoogleReviewsService.fetch_reviews
  end
end
