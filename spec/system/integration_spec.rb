require 'rails_helper'

RSpec.describe 'IndexRecipes', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    Food.create(user: @user, name: 'meet', quantity: 5, price: 100, measurement_unit: 'lb')
    sign_in(@user)
    visit '/'
  end

  it 'Contains user information' do
    visit '/users'
    expect(page.body).to include('Andres')
  end

  it 'Logged user is taken to public recipes' do
    expect(page.body).to include('PUBLIC')
  end

  it 'Public recipes redirects user to Punlic recipes path' do
    click_on('Public Recipes')
    expect(page.body).to include('PUBLIC')
    expect(page.body).to include('Recipes')
    expect(page.body).to include('New recipe')
  end

  it 'Your recipes link redirects user to recipes path' do
    click_on('Your Recipes')
    expect(page.body).to include('Recipes')
    expect(current_path).to eq('/recipes')
  end

  it 'Your recipes link redirects user to recipes path' do
    click_on('Your Recipes')
    expect(page.body).to include('Recipes')
    expect(current_path).to eq('/recipes')
  end

  it 'Food link redirects user to foods path' do
    click_on('Food')
    expect(page.body).to include('Foods')
    expect(current_path).to eq('/foods')
  end

  it 'Food link shows food information' do
    click_on('Food')
    expect(page.body).to include('meet')
    expect(page.body).to include('lb')
    expect(page.body).to include('500')
  end

  it 'Food link shows food information' do
    click_on('Shopping List')
    expect(page.body).to include('Shopping List')
    expect(page.body).to include('Amount of food')
  end
end
