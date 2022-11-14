class GeneralShoppingListController < ApplicationController
  def index
    @foods = Food.where(user: current_user)
    @recipe_foods = RecipeFood.includes([:food]).where(recipe: Recipe.where(user: current_user))
  end
end
