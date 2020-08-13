class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1
  def show
    @dose = Dose.new
  end
  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'cocktail was successfully created.'
    else
      render :new
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
