feature 'viewing the list of links' do
  scenario 'I can see the list of links' do
    Link.create(url: 'www.google.com', title: 'Google')
    visit('/links')

    # sanity check
    expect(page.status_code).to eq 200

    expect(page).to have_content('www.google.com')
  end
end
