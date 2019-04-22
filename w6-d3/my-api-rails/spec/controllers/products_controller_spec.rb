require 'rails_helper'

describe ProductsController do

  # before(:each) do
  #   Product.delete_all
  # end


  describe 'GET index' do
    it 'returns http status ok' do
      get :index
      # expect(response.status).to eq 200
      expect(response).to have_http_status(:ok)
    end

    it 'render json with all products' do
      Product.create(name: 'Apple')
      get :index
      products = JSON.parse(response.body)
      expect(products.size).to eq 1
    end
  end

  describe 'GET show' do
    it 'returns http status ok' do
      product = Product.create(name:'Apple')
      get :show, params: { id: product }
      expect(response).to have_http_status(:ok)
    end

    it 'render the correct product' do
      product = Product.create(name: 'Apple')
      # puts "Product es: #{product.values.class}"
      get :show, params: { id: product }
      expected_product = JSON.parse(response.body)
      # puts "Expected_product es: #{expected_product.class}"
      expect(expected_product["name"]).to eq(product.name)
      # expect(expected_product).to eq(product.values)
    end

    it 'return http status not found' do
      get :show, params: { id: 'xxx' }
      expect(response).to have_http_status(:not_found)
    end
  end
  describe "POST create" do
    it "returns http status created" do
      post :create, params: { name: "Beer" }
      expect(response.status).to eq(201)
      # expect(response).to have_http_status(:created)
    end

    it "returns the created product" do
      post :create, params: { name: "Banana" }
      expected_product = JSON.parse(response.body)
      # expect(expected_product["name"]).to eq(product.name)
      expect(expected_product).to have_key("id")
    end
  end
  describe "PATCH upate" do
    it "return http status accepted" do
      product = Product.create(name: "Apple" )
      patch :update, params: { name: "Orange", id: product.id, category: "Hola" }
      expect(response).to have_http_status(:ok)
    end

    it "returns the updated product" do
      product = Product.create(name: "Apple")
      patch :update, params: { name: "Orange", id: product.id, category: "Hola" }
      expected_product = JSON.parse(response.body)
      expect(expected_product["name"]).to eq("Orange")
      expect(expected_product["category"]).to eq("Hola")
    end
  end

  describe "DELETE destroy" do
    it "return http status No content (204)" do
      product = Product.create(name: "Apple")
      delete :destroy, params: { id: product }
      expect(response).to have_http_status(:no_content)
    end

    it "return empty body" do
      product = Product.create(name: "Apple")
      delete :destroy, params: { id: product }
      expect(response.body).to eq(" ")
    end

    it "decrement by 1 the total of products" do
      product = Product.create(name: "Apple")
      expect {
        delete :destroy, params: { id: product }
      }.to change { Product.count }.by(-1)
=begin
      expect do
        delete :destroy, params: { id: product }
      end.to change { Product.count }.by(-1)
=end
    end

    it "actually delete the product" do
      product = Product.create(name: "Apple")
      delete :destroy, params: { id: product }
      products = Product.where(id: product.id)
      expect(products.size).to eq(0)
    end
  end

end



