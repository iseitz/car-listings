# frozen_string_literal: true
require 'pry'
class CarsController < ApplicationController
  def search
    @search = Search.new
    # params =n{"utf8"=>"✓", "manufacturer"=>"3", "color"=>"orange", "year"=>"1989", "mileage"=>"N/A", "search"=>{"search_form"=>"Search"}}
    @manufacturers_list = Manufacturer.find(@manufacturer_ids)
    @manufacturers = []
    @manufacturers_list.each do |m|
      @manufacturers << m.name
    end
    @colors = Car.distinct.pluck(:color)
    @years = Car.distinct.pluck(:year)
    @mileages = ['N/A', '1000', '10,000', '100,000']
  end

  def index
    @manufacturer_ids = Car.distinct.pluck(:manufacturer_id)
    @manufacturers_list = Manufacturer.find(@manufacturer_ids)
    @manufacturers = []
    @manufacturers_list.each do |m|
      @manufacturers << m.name
    end
    @colors = Car.distinct.pluck(:color)
    @years = Car.distinct.pluck(:year)
    @mileages = ['N/A', '1000', '10,000', '100,000']
    @cars = if params[:search]
              binding.pry
              Car.search(params[:manufacturer], params[:color], params[:year], params[:mileage])
            else
              Car.all
            end
  end

  def show
    @car = Car.find(params[:id])
    @manufacturer = Manufacturer.find(@car.manufacturer_id)
   end

  def new
    @car = Car.new
    @manufacturers = Manufacturer.all.order('name ASC')
  end

  def create
    @car = Car.new(car_params)
    @manufacturers = Manufacturer.all.order('name ASC')
    respond_to do |format|
      if @car.save
        format.html { redirect_to cars_path, notice: 'Car successfully added' }
        format.json { render :show, status: :created, location: @car }
      else
        # I personally perefer not to set the description to emty string but the test requires it so the user will need to refill the description
        @car.description = ''
        format.html { render :new, notice: 'Error' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :color, :year, :mileage, :description, :manufacturer_id)
  end
end
