class ProductsController < ApplicationController
  def index
    # render nothing: true, status: :ok
    render json: Product.all
  end

  def show
    # product = Product.where(id: params[:id])
    # if product.size > 1
    #   # render json: Product.find(params[:id])
    #   render json: product[0]
    # else
    #   render json: { message: "Couldn't find Product with 'id'= #{params[:id]}"}, status: :not_found
    # end
    render json: Product.find(params[:id])
    

  end

  def create
    # render nothing: true, status: :created
    product = Product.create(name: params[:name])
    render json: product, status: :created
  end

  def update
    product = Product.find(params[:id])
    params.keys.each do |key|
      if key != :id && product.attributes.key?(key)
        product[key] = params[key]
      end
    end
    product.save
    render json: product
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render nothing: true, status: :no_content
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

end
