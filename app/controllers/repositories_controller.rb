class RepositoriesController < ApplicationController

  def search

  end

  def github_search


      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = 2083946415a606cfb59b
          req.params['client_secret'] = 827b73b2c32fd31149eec8cb07196e0b1555ea5d
          req.params['q'] = params[:q]

        end
        body = JSON.parse(@resp.body)
        # if @resp.success?
          @name = body["items"][0]["name"]
          @url = body["items"][1]["name"]
          @description = body["items"][1]["description"]
        # else
        #   @error = body["meta"]["errorDetail"]
        # end

      # rescue Faraday::ConnectionFailed
      #   @error = "There was a timeout. Please try again."
      # end
      render 'search'
    end

end
