feature 'Adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit('links/new')
    fill_in 'title', with: "Google"
    fill_in 'url', with: "https://www.google.com"
    fill_in 'tags', with: "Search engine"
    click_button 'Add link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Search engine')
  end
end
