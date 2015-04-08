require 'spec_helper'

feature 'User browses the list if links' do
  before(:each) do
    Link.create(title: 'Makers Academy',
                url:   'http://www.makeracademy.com/',
                tags:  [Tag.first_or_create(text: 'education')])
    Link.create(title: 'Google',
                url:   'http://www.google.com/',
                tags:  [Tag.first_or_create(text: 'search')])
    Link.create(title: 'Bing',
                url:   'http://www.bing.com/',
                tags:  [Tag.first_or_create(text: 'search')])
    Link.create(title: 'Code.org',
                url:   'http://www.code.org/',
                tags:  [Tag.first_or_create(text: 'education')])
  end

  scenario 'when opening the home page' do
    visit('/')
    expect(page).to have_content('Makers Academy')
  end

  scenario 'filtered by a tag' do
    visit '/tags/search'
    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('Code.org')
    expect(page).to have_content('Google')
    expect(page).to have_content('Bing')
  end
end
