require 'rails_helper'

RSpec.describe 'Notifications API', type: :request do
  describe 'POST /notifications' do
    let(:valid_params) { { notification: { title: 'Test Notification', body: 'Notification body' } } }
    let(:invalid_params) { { notification: { title: '', body: '' } } }

    context 'with valid parameters' do
      it 'creates a new notification and returns status 201' do
        expect {
          post '/notifications', params: valid_params
        }.to change(Notification, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq('Notification successfully received.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create the notification and returns errors' do
        expect {
          post '/notifications', params: invalid_params
        }.not_to change(Notification, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end
end
