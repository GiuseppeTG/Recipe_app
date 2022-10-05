class GeneralShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.where(user: current_user)
    @recipe_foods = RecipeFood.where(recipe: Recipe.where(user: current_user))
  end
end
