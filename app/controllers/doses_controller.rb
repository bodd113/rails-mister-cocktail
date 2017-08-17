class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    dose_to_delete = Dose.find(params[:id])
    c = dose_to_delete.cocktail
    dose_to_delete.destroy
    redirect_to cocktails_path(c)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
