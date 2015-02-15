class RecipesController < ApplicationController
before_action :set_recipe, only: [:show, :edit, :update, :destroy]

before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(params[:recipe].permit(:title, :veggie1, :veggie2, :fruit1, :fruit2, :image))
      redirect_to(recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(params[:recipe].permit(:title, :veggie1, :veggie2, :fruit1, :fruit2, :image))
    redirect_to(recipe)
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect_to(recipes_path)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def correct_user
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to recipes_path, notice: "Not authorized to edit this recipe" if @recipe.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # strong paramaters
    def recipe_params
      params.require(:recipe).permit(:title, :veggie1, :veggie2, :fruit1, :fruit2, :image)
end
end
