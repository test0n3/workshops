class BooksController < ApplicationController
  def index
    render json: ['book_1', 'book_2']
  end
end