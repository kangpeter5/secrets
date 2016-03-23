require 'rails_helper'
RSpec.describe 'creating a user' do
  before do
    visit '/users/new'
  end
  it 'creates new user and redirects to profile page with proper credentials' do
    fill_in 'user[email]', with: 'kobe@lakers.com'
    fill_in 'user[name]', with: 'kobe'
    fill_in 'user[password]', with:  'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Join'
    last_user = User.last
    expect(current_path).to eq("/users/#{last_user.id}")
  end
  it 'shows validation errors without proper credentials' do
    click_button 'Join'
    expect(current_path).to eq('/users/new')
    expect(page).to have_text("can't be blank")
    expect(page).to have_text("invalid")
  end
end