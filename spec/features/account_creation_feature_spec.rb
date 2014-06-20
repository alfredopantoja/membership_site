require 'spec_helper'

describe 'account creation' do
  it 'allows user to subscribe to silver content' do
    visit root_path
    within(".silver") do
      click_link 'Subscribe'
    end  

    fill_in 'Name', with: 'Alfredo'
    fill_in 'Email', with: 'alfredo@example.com'
    fill_in 'Password', with: 'changeme'
    fill_in 'Password confirmation', with: 'changeme'
    fill_in 'Credit Card Number', with: '4242424242424242'
    fill_in 'Card Security Code (CVV)', with: '139'
    select '2017', from: 'card_year'

    click_button 'Sign up'

    expect(page).to have_content('Signed up successfully')
  end  
end  
