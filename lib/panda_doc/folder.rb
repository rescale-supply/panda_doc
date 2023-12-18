# frozen_string_literal: true

module PandaDoc
  module Folder
    extend self

    def create(data)
      respond(ApiClient.request(:post, "/documents/folders", **data))
    end

    def find(uuid, **data)
      respond(ApiClient.request(:get, "/documents/folders", **data))
    end

    def rename(data)
      respond(ApiClient.request(:put, "/documents/folders/#{uuid}", **data))
    end

    private

    def respond(response, type: :folder)
      failure(response)

      SuccessResult.new(
        ResponseFactory.build(type).new(response.body)
      )
    end

    def stream(response)
      failure(response)

      SuccessResult.new(response)
    end

    def failure(response)
      fail FailureResult.new(response) unless response.success?
    end
  end
end
