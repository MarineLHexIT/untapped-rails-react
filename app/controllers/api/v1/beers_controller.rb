module Api
  module V1
    class BeersController < ApplicationController
      before_action :set_beer, only: %i[ show edit update destroy ]

      # GET /beers or /beers.json
      def index
        @beers = Beer.all.order(brand: :asc)
        render json: @beers
      end

      # GET /beers/1 or /beers/1.json
      def show
        if @beer
          render json: @beer
        else
          render json: @beer.errors
        end
      end

      # GET /beers/new
      def new
        @beer = Beer.new
      end

      # GET /beers/1/edit
      def edit
      end

      # POST /beers or /beers.json
      def create
        @beer = Beer.new(beer_params)

        if @beer.save
          render json: @beer
        else
          render json: @beer.errors
        end
      end

      # PATCH/PUT /beers/1 or /beers/1.json
      def update
      end

      # DELETE /beers/1 or /beers/1.json
      def destroy
        @beer.destroy!

        render json: { notice: "Beer was successfully destroyed."}
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_beer
        @beer = Beer.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def beer_params
        params.require(:beer).permit(:name, :brand, :style, :country, :quantity)
      end

    end
  end
end
