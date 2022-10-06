require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    @food = Food.create(user: @user, name: 'meet', quantity: 5, price: 100, measurement_unit: 'lb')
  end

  it 'name is required' do
    expect(@food).to be_valid
  end

  it 'price should be a positive number' do
    @food.price = -1
    expect(@food).to_not be_valid
    @food.price = 20
    expect(@food).to be_valid
  end

  it 'quantity is required' do
    @food.quantity = nil
    expect(@food).to_not be_valid
    @food.quantity = 6
    expect(@food).to be_valid
  end
end