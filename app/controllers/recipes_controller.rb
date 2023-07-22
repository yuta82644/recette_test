class RecipesController < ApplicationController
  def index
    if params[:room_id]
      @recipes = Recipe.where(room_id: params[:room_id], public: true)
    else
      @recipes = Recipe.where(public: true)
    end

    @user_rooms = user_signed_in? ? current_user.rooms : nil
  end

  def new
    @recipe = Recipe.new
    @recipe.procedures.build
    @user_rooms = user_signed_in? ? current_user.rooms : []
  end

  def create
    @recipe = Recipe.new(recipe_params)

      if params[:commit] == "公開で投稿"
      @recipe.public = true
    else
      @recipe.public = false
      @recipe.room = current_user.rooms.find_by(id: params[:recipe][:room_id])
    end

    if @recipe.save
      redirect_to recipes_path, notice: "レシピを投稿しました！"
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
      :public, # レシピに公開設定を保存するためのパラメータを追加
      :room_id, # レシピにルームIDを保存するためのパラメータを追加
      procedures_attributes: [:procedure_comment, :_destroy],
      cooking_ingredients_attributes: [:ingredient_name, :quantity, :unit, :_destroy]
    )
  end
end
