class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = "Please enter a name"
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = "Please enter a name"
      redirect_to new_band_url
    end
  end

  def show
    @band = Band.find_by(id: params[:id])

    if @band
      render :show
    else
      flash.now[:errors] = "Band does not exist"
      redirect_to bands_url
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])

    if @band
      @band.delete
      redirect_to bands_url
    else
      flash.now[:errors] = "Band does not exist"
      redirect_to bands_url
    end
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
