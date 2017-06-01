feature 'add links to the bookmark manager' do
  scenario 'add links' do
    visit('/links/new')
    expect(page.status_code).to eq 200
    fill_in "title", with: "Bing"
    fill_in "url", with: "www.bing.com"
    click_button('Submit')
    expect(page).to have_content("Bing")
    expect(page).to have_content("www.bing.com")
  end
end
