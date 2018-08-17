begin
  @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 2083946415a606cfb59b
      req.params['client_secret'] = 827b73b2c32fd31149eec8cb07196e0b1555ea5d
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
      req.options.timeout = 0
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @venues = body["response"]["venues"]
    else
      @error = body["meta"]["errorDetail"]
    end

  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end
  render 'search'
