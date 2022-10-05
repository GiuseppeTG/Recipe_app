class PublicRecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.includes([:user]).where(public: true).order(created_at: :desc)
  end
end
