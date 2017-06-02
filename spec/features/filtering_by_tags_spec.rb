feature 'we can filter link by tags' do

  before(:each) do
    Link.create(url: 'http://makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(tag_name: 'education')])
    Link.create(url: 'http://google.com', title: 'Google', tags: [Tag.first_or_create(tag_name: 'search')])
    Link.create(url: 'http://zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(tag_name: 'bubbles')])
    Link.create(url: 'http://bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(tag_name: 'bubbles')])
  end

  scenario 'we filter by the tag "bubbles"' do
    visit('tags/bubbles')

    expect(page.status_code).to eq 200

    within'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Google')
      expect(page).to have_content('This is Zombo')
      expect(page).to have_content('Bubble Bobble')
    end
  end
end
