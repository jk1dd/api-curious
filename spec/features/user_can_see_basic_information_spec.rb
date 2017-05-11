require 'rails_helper'

RSpec.feature 'User can see basic account info' do
  context 'as an existing user with valid creds' do
    scenario 'user is on her dashboard page' do
      VCR.use_cassette('dashboard') do
        Capybara.app = ApiCurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq 200

        click_link('Login with Github')

        expect(current_path).to eq dashboard_index_path

        within('.basic-info') do
          expect(page).to have_css("img")
          expect(page).to have_content("Jonathan Kidd")
          expect(page).to have_content("jk1dd")
          expect(page).to have_link("See Followers")
          expect(page).to have_link("See Repos")
          expect(page).to have_link("See Following")
        end
      end
    end
  end
end
