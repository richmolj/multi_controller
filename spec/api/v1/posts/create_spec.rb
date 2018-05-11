require 'rails_helper'

RSpec.describe "posts#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/posts", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'posts',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        make_request
      }.to change { Post.count }.by(1)
      post = Post.last

      assert_payload(:post, post, json_item)
    end
  end
end
