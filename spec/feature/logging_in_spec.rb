feature 'User sign in' do

  scenario 'with correct credentials' do
    sign_up(email: 'test@test.com', password: 'password', password_confirmation: 'password')
    sign_in(email: 'test@test.com',   password: 'password')

    expect(page).to have_content "Welcome, test@test.com"
  end

end
