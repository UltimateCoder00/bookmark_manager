feature 'Adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit('links/new')
    fill_in 'title', with: "Google"
    fill_in 'url', with: "https://www.google.com"
    fill_in 'tags', with: "Search"
    click_button 'Add link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Search')
  end

  scenario "I can add multiple tags to a new link" do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education ruby'
    click_button 'Add link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end

  scenario 'I can filter links by tag' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    
    visit('/tags/bubbles')
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
