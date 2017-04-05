feature 'Creating links' do
  scenario 'I can create a new link' do
    visit('/links/new')
    fill_in 'title', with: "Google"
    fill_in 'url', with: "https://www.google.com"
    click_button 'Add link'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end
