class HomeController < ApplicationController
  def index
    @testimonials = GoogleReviewsService.fetch_reviews
  end
end
