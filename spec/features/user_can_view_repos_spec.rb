require 'rails_helper'

RSpec.feature 'User can see repos' do
  context 'as an existing user with valid creds' do
    scenario 'user is on her repos page' do
      VCR.use_cassette('view_repos') do
        Capybara.app = ApiCurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq 200

        click_link('Login with Github')

        expect(current_path).to eq dashboard_index_path

        click_on("See Repos")

        expect(current_path).to eq(repos_path)

        within('.repos-list') do
          expect(page).to have_content("archived_black_thursday")
          expect(page).to have_link("See Repo")
        end
      end
    end
  end
end
