class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    client_id = "REPLACE ME"
      secret = "REPLACE ME"

      resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params["q"] = params[:query]
        req.params["client_id"] = 2083946415a606cfb59b
        req.params["client_secret"] = d5011ad9e64c0bd7d124b3822a5fcf4a390795b7
      end

      body = JSON.parse(resp.body)
      @results = body["items"]
      render :search
    end

end
