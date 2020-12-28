class Api::V1::ProductsController < ApplicationController
  require 'faraday'
  before_action :set_price, only: [:show, :update]
  def show
    @response = Faraday.get("https://redsky.target.com/v3/pdp/tcin/#{product_params[:id]}?excludes=taxonomy,price,promotion,bulk_ship,rating_and_review_reviews,rating_and_review_statistics,question_answer_statistics&key=candidate")
    @response = JSON.parse(@response.body)
    @price = Price.find_by(product_id: product_params[:id])
    if @response["product"]["item"] != {}
      if @price
        respond_to do |format|
          format.json {
            render json: {
              id: product_params[:id],
              name: @response["product"]["item"]["product_description"]["title"],
              current_price: {
                value: @price.value,
                currency_code: @price.currency_code
              }
            }
          }
        end
      else
        respond_to do |format|
          format.json {
            render json: {
              id: product_params[:id],
              name: @response["product"]["item"]["product_description"]["title"]
            }
          }
        end
      end
    else
      respond_to do |format|
        format.json {
          render json: "This is not a valid product id. Please try a different one."
        }
      end
    end
  end

  def update
    if @price
      @price.value = product_params[:value]
      @price.save
      respond_to do |format|
        format.json {
          render json: {
            current_price: {
              value: @price.value,
              currency_code: @price.currency_code
            }
          }
        }
      end
    else
      respond_to do |format|
        format.json {
          render json: "We couldnt find the product you wanted to update. Please try again."
        }
      end
    end
  end

  private
    def product_params
      params.permit(:id, :value)
    end

    def set_price
      puts "wer in eresaf"
      @price = Price.find_by(product_id: product_params[:id])
    end
end
