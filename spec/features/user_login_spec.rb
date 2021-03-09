require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
  before :each do

    @user = User.create!(
      first_name: 'Emily',
      last_name: 'Lim',
      email: 'emily@mail.com',
      password: '12345',
      password_confirmation: '12345'
    )
  end 

  scenario "should be able to login successfully and are taken to the home page" do

    visit login_path

    save_screenshot('test4a.png')

    within('form') do
      fill_in 'email', with: 'emily@mail.com'
      fill_in 'password', with: '12345'
    end

    click_button('Submit')

    sleep(2)
    save_screenshot('test4b.png')

    expect(page).to have_text('Signed in as Emily')

    

  end



end
