require 'rails_helper'

RSpec.describe 'Notifications API', type: :request do
  describe 'POST /notifications' do
    let(:valid_params) { { notification: { title: 'Notificação de Teste', body: 'Corpo da notificação' } } }
    let(:invalid_params) { { notification: { title: '', body: '' } } }

    context 'com parâmetros válidos' do
      it 'cria uma nova notificação e retorna status 201' do
        expect {
          post '/notifications', params: valid_params
        }.to change(Notification, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq('Notificação recebida com sucesso.')
      end
    end

    context 'com parâmetros inválidos' do
      it 'não cria a notificação e retorna erros' do
        expect {
          post '/notifications', params: invalid_params
        }.not_to change(Notification, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end
end
