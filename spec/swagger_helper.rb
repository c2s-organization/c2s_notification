# spec/swagger_helper.rb
require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.to_s + '/swagger'

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1', # Ensure this line is present and correctly specifies the OpenAPI version
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {}
      # You can add components, securitySchemes, etc., as needed
    }
  }

  config.swagger_format = :yaml
end
