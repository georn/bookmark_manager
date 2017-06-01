feature 'adding tags' do
  scenario 'has tag field' do
    visit('links/new')
    expect(page.status_code).to eq 200
    expect(page).to have_field('tag_name')
  end
end
