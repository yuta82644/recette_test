class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end
  def new
    @recipe = Recipe.new
     @recipe.procedures.build 
    5.times { @recipe.cooking_ingredients.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path(@recipe), notice: "レシピを投稿しました！"
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :short_comment,
      :title,
      :tortal_quantity,
      :image,
      procedures_attributes: [:procedure_comment, :_destroy],
      cooking_ingredients_attributes: [:ingredient_name, :quantity, :unit, :_destroy]
    )
  end
end
