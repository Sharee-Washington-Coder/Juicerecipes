class RecipesController < ApplicationController
before_action :set_recipe, only: [:show, :edit, :update, :destroy]

before_action :authenticate_user!, except: [:index]

  def index
    # order recipes by creation date and max 2 recipes per page, then paginator.
    @recipes = Recipe.all.order(created_at: :desc).paginate(page: params[:page], per_page: 2)
end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render action: 'new'
    end
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

before_action :correct_user, only: [:edit, :update, :destroy] 
  
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
    # strong parameters
    def recipe_params
      params.require(:recipe).permit(:title, :veggie1, :veggie2, :fruit1, :fruit2, :image)
  end
end
