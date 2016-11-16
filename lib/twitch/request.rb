module Twitch
  module Request
    def build_query_string(options)
      query = "?"
      options.each do |key, value|
        query += "#{key}=#{value.to_s.gsub(" ", "+")}&"
      end
      query = query[0...-1]
    end

    def get(url)
      @adapter.get(url, :headers => {
        'Accept' => 'application/vnd.twitchtv.v5+json',
        'Client-ID' => @client_id
      })
    end

    def post(url, data)
      @adapter.post(url, :body => data, :headers => {
        'Accept' => 'application/vnd.twitchtv.v5+json',
        'Client-ID' => @client_id
      })
    end

    def put(url, data={})
      @adapter.put(url, :body => data, :headers => {
        'Accept' => 'application/vnd.twitchtv.v5+json',
        'Client-ID' => @client_id
      })
    end

    def delete(url)
      @adapter.delete(url, :headers => {
        'Accept' => 'application/vnd.twitchtv.v5+json',
        'Client-ID' => @client_id
      })
    end
  end
end
