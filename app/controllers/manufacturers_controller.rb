# frozen_string_literal: true

class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to manufacturers_path, notice: 'Manufacturer successfully added' }
        format.json { render :show, status: :created, location: @manufacturer }
      else
        format.html { render :new, notice: 'Error' }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
 end
end
