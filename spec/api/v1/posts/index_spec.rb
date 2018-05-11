require 'rails_helper'

RSpec.describe "posts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/posts",
      params: params
  end

  describe 'basic fetch' do
    let!(:post1) { create(:post) }
    let!(:post2) { create(:post) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(true)).to match_array([post1.id, post2.id])
      assert_payload(:post, post1, json_items[0])
      assert_payload(:post, post2, json_items[1])
    end
  end
end
