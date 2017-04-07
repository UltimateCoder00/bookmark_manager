feature 'User signs out' do

  scenario 'while being signed in' do
    sign_up(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    sign_in(email: 'test@test.com', password: 'password')

    click_button 'Sign out'

    expect(page).to have_content('goodbye')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
