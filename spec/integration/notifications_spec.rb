# spec/integration/notifications_spec.rb
require 'swagger_helper'

RSpec.describe 'Notifications API', type: :request do
  path '/notifications' do
    post 'Creates a Notification' do
      tags 'Notifications'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :notification, in: :body, schema: {
        type: :object,
        required: ['title', 'body'],
        properties: {
          title: { type: :string, example: 'New Notification' },
          body: { type: :string, example: 'This is the body of the notification.' }
        }
      }

      response '201', 'Notification successfully received.' do
        let(:notification) { { title: 'New Notification', body: 'This is the body of the notification.' } }

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:notification) { { title: '', body: '' } }

        run_test!
      end
    end
  end
end
# spec/integration/notifications_spec.rb
require 'swagger_helper'

RSpec.describe 'Notifications API', type: :request do
  path '/notifications' do
    post 'Creates a Notification' do
      tags 'Notifications'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :notification, in: :body, schema: {
        type: :object,
        required: ['title', 'body'],
        properties: {
          title: { type: :string, example: 'New Notification' },
          body: { type: :string, example: 'This is the body of the notification.' }
        }
      }

      response '201', 'Notification successfully received.' do
        let(:notification) { { title: 'New Notification', body: 'This is the body of the notification.' } }

        run_test!
      end

      response '422', 'Unprocessable Entity' do
        let(:notification) { { title: '', body: '' } }

        run_test!
      end
    end
  end
end
