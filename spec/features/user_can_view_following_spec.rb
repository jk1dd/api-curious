require 'rails_helper'

RSpec.feature 'User can see following' do
  context 'as an existing user with valid creds' do
    scenario 'user is on her following page' do
      # skip
      VCR.use_cassette('view_following') do
        Capybara.app = ApiCurious::Application
        stub_omniauth

        visit '/'

        expect(page.status_code).to eq 200

        click_link('Login with Github')

        expect(current_path).to eq dashboard_index_path

        click_on("See Following")

        expect(current_path).to eq(following_index_path)

        within('.following-list') do
          expect(page).to have_content("jasonnoble")
        end
      end
    end
  end
end
