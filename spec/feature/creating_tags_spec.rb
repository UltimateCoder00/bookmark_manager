feature 'Creating new tags' do
  scenario 'I can create a tag' do
    visit('links/new')
    fill_in 'title', with: "Google"
    fill_in 'url', with: "https://www.google.com"
    fill_in 'tag', with: "Search engine"
    click_button 'Add link'

    expect(page).to have_content ("Search engine")
  end
end
