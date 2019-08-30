# frozen_string_literal: true

class SearchesController < ApplicationController
  def index
    @cars = Car.search(params[:manufacturer], params[:color], params[:year], params[:mileage])
  end

  def new
    @search = Search.new
    @manufacturer_ids = Car.distinct.pluck(:manufacturer_id)
    @manufacturers_list = Manufacturer.find(@manufacturer_ids)
    @manufacturers = []
    @manufacturers_list.each do |m|
      @manufacturers << m.name
    end
    @colors = Car.distinct.pluck(:color)
    @years = Car.distinct.pluck(:year)
    @mileages = ['N/A', '1000', '10,000', '100,000']
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:manufacturer, :color, :year, :mileage)
  end
end
