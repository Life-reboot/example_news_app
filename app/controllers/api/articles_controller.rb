class Api::ArticlesController < ApplicationController
  def index
    # Putting the API key in with a query parameter (less secure)
    # response = HTTP
    #   .get("http://newsapi.org/v2/everything?q=#{params[:query]}&api_key=#{Rails.application.credentials.news_api[:api_key]}")

    # Putting the API key in the header (more secure)
    response = HTTP
      .headers("Authorization" => "Bearer #{Rails.application.credentials.news_api[:api_key]}")
      .get("http://newsapi.org/v2/everything?q=#{params[:query]}")

    articles = response.parse["articles"]
    render json: articles
  end
end
