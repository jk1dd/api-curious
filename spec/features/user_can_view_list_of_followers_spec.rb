require 'rails_helper'

RSpec.feature 'User can see followers' do
  context 'as an existing user with valid creds' do
    scenario 'user is on her followers page' do
      VCR.use_cassette('view_followers') do
        Capybara.app = ApiCurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq 200

        click_link('Login with Github')

        expect(current_path).to eq dashboard_index_path

        click_on("See Followers")

        expect(current_path).to eq(followers_path)

        within('.followers-list') do
          expect(page).to have_content("stovermc")
        end
      end
    end
  end
end
