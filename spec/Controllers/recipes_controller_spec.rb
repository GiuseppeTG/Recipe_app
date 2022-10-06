require 'rails_helper'

RSpec.describe 'Recipes controller', type: :request do
  before(:each) do
    @user = User.new(name: 'Andres', email: 'a@mail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    sign_in(@user)
  end

  it 'renders the index template' do
    get recipes_path
    expect(response).to render_template('index')
  end

  it 'should render the correct text' do
    get recipes_path
    expect(response.body).to include('Recipes')
  end

  it 'get 200 status' do
    get recipes_path
    expect(response).to have_http_status(200)
  end
end