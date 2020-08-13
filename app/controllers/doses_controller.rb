class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save!
      redirect_to cocktail_path(@cocktail), notice: 'dose was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroyxs
  end

  private

  def set_dose
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
