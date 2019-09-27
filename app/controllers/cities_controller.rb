class CitiesController < ApplicationController

	before_action :set_city, only: [:show, :destroy, :update, :edit]

	def index
		@cities = City.all
	end

	def new
		@city = City.new
	end

	def create
		@city = City.new(city_params)
		respond_to do |format|
			if @city.save
				format.html { redirect_to cities_path }
			else
				format.html { render :new }
			end
		end
	end

	def shoe
	end

	def edit
	end

	def update
		respond_to do |format|
			if @city.update(city_params)
				format.html { redirect_to cities_path }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		respond_to do |format|
			if @city.destroy
				format.html{ redirect_to cities_path }
			else
				format.html { redirect_to cities_path }
			end
		end
	end

	private

		def set_city
			@city = City.find(params[:id]) if params[:id]
		end

		def city_params
			params.require(:city).permit(:name)
		end

end