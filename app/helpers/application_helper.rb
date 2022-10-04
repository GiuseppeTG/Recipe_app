module ApplicationHelper
  def needed_ingredients(recipe_food)
    quantity = recipe_food.quantity - recipe_food.food.quantity
    return unless quantity.positive?

    { name: recipe_food.food.name, quantity: "#{quantity} #{recipe_food.food.measurement_unit}",
      price: recipe_food.food.price * quantity }
  end

  def total_price(recipe_foods)
    total_price = 0
    recipe_foods.each do |rf|
      total_price += needed_ingredients(rf)[:price]
    end
    total_price
  end

  def total_ingredients(recipe_foods)
    total_ingredients = 0
    recipe_foods.each do |rf|
      total_ingredients += 1 if needed_ingredients(rf)
    end
    total_ingredients
  end
end
