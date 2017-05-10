require 'rails_helper'

RSpec.feature 'User can log in with github' do
  context 'An existing user has valid credentials' do
    scenario 'The user clicks login on root path' do
      VCR.use_cassette('login') do
        Capybara.app = ApiCurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq 200

        click_link('Login with Github')

        expect(current_path).to eq dashboard_index_path

        expect(page.body).to have_content("You've made it jk1dd")
        expect(page.body).to have_link('Logout')

      end
    end
  end
end
