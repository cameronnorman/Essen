module Contentful
  class Recipes
    def all
      client.entries(content_type: 'recipe').to_a
    end

    def find(id)
      client.entry(id)
    end

    def client
      @client ||= Contentful::Client.new(
        space: ENV['CONTENTFUL_SPACE'],
        access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
        environment: ENV['CONTENTFUL_ENVIRONMENT']
      )
    end
  end
end
