class RecipesController < ApplicationController

 
    def index
    @recipes = Recipe.all
    @user_rooms = user_signed_in? ? current_user.rooms : nil
  end
  def new
    @recipe = Recipe.new
     @recipe.procedures.build 
    
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path(@recipe), notice: "レシピを投稿しました！"
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

   def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "レシピを更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
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
