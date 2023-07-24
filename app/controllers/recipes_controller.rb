class RecipesController < ApplicationController
# include RecipesHelper

  # before_action :authenticate_user!, only: [:my_recipes]

  def index
    if params[:room_id]
    @room = Room.find(params[:room_id])
    @recipes = @room.recipes.where(public: true)
  else
    @recipes = Recipe.where(public: true)
  end

  def new
    @recipe = Recipe.new
    @recipe.procedures.build
    @user_rooms = user_signed_in? ? current_user.rooms : []
    @public_post = public_post?
  end

 def create
  
   @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user # もしユーザーと関連付ける場合は、現在のユーザーを設定します

    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "レシピを投稿しました！"
    else
      # @user_rooms = current_user.rooms
      render :new
    end
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

  def my_recipes
    @user_recipes = current_user.recipes
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
      :public, # レシピに公開設定を保存するためのパラメータを追加
      :room_id, # レシピにルームIDを保存するためのパラメータを追加
      :public_post,
    
      procedures_attributes: [:procedure_comment, :_destroy],
      cooking_ingredients_attributes: [:ingredient_name, :quantity, :unit, :_destroy]
    )
  end

  def public_post?
    # フォームから送信されたパラメーターにrecipe[public_post]が存在するかをチェック
    params["recipe"] && params["recipe"]["public_post"].present?
  end


end