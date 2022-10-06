require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @food = Food.create(user: @user, name: 'meet', quantity: 5, price: 100, measurement_unit: 'lb')
    @recipe = Recipe.create(user: @user, name: 'meet', preparation_time: 60, cooking_time: 60, description: 'Best meet ever', public: true)
  end

  it 'name is required' do
    expect(@recipe).to be_valid
  end

  it 'preparation_time should be a positive number' do
    @recipe.preparation_time = -1
    expect(@recipe).to_not be_valid
    @recipe.preparation_time = 20
    expect(@recipe).to be_valid
  end

  it 'Cooking time should be a positive number' do
    @recipe.cooking_time = -1
    expect(@recipe).to_not be_valid
    @recipe.cooking_time = 20
    expect(@recipe).to be_valid
  end

  it 'Name is required' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end
end