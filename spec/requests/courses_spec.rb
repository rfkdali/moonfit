require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe 'GET index' do
    let!(:courses) { create_list(:course, 3) }
    before { get '/api/v1/courses' }
    it 'returns ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns courses' do
      expect(json_body.size).to eq(3)
    end
  end

  describe 'GET show' do
    context 'with coach' do
      let(:course) { create(:course, :with_coach ) }
      before { get "/api/v1/courses/#{course.id}" }
      it 'returns ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns requested course' do
        response_name = json_body[:attributes][:name]
        expect(response_name).to eq(course.name)
      end
    end
  end

  describe 'POST create' do
    let(:headers) do
      {
        'Accept' => JSONAPI::MEDIA_TYPE,
        'Content-Type' => JSONAPI::MEDIA_TYPE
      }
    end

    let(:params) {{data: { type: 'courses', attributes: {name:'Astrology 101'} }}}
    it 'returns ok' do
      post "/api/v1/courses", params: params.to_json, headers: headers
      expect(response).to have_http_status(201)
    end

    it 'creates a new course' do
      expect {
        post '/api/v1/courses', params: params.to_json, headers: headers
      }.to change(Course, :count).by(1)
    end
  end
end

def json_body
  JSON.parse(response.body, symbolize_names: true)[:data]
end

