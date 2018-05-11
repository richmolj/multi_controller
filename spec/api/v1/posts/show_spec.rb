require 'rails_helper'

RSpec.describe "posts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/posts/#{post.id}",
      params: params
  end

  describe 'basic fetch' do
    let!(:post) { create(:post) }

    it 'serializes the resource correctly' do
      make_request
      assert_payload(:post, post, json_item)
    end
  end
end
