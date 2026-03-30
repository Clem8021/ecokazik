# app/services/google_reviews_service.rb

require 'net/http'
require 'json'

class GoogleReviewsService
  PLACE_ID = "ChIJtUeBgluF50cR31w5NLG_d-4"
  API_KEY = ENV['GOOGLE_API_KEY']

  def self.fetch_reviews
    url = URI("https://places.googleapis.com/v1/places/#{PLACE_ID}?fields=reviews&languageCode=fr")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-Goog-Api-Key"] = API_KEY

    response = http.request(request)

    Rails.logger.debug "RAW RESPONSE:"
    Rails.logger.debug response.body

    return [] if response.body.blank?

    json = JSON.parse(response.body)

    reviews = json["reviews"] || []

    reviews.map do |r|
      {
        author: r.dig("authorAttribution", "displayName"),
        content: r.dig("text", "text"),
        rating: r["rating"]
      }
    end
  end
end
