require 'rails_helper'

feature 'User can see organizations and count thereof' do
  context 'when that user is an authenticated user' do
    scenario 'and she is on her organizations page' do
      VCR.use_cassette('view_orgs') do
        Capybara.app = ApiCurious::Application
        stub_omniauth

        visit '/'
        click_link('Login with Github')

        expect(page).to have_content("Number of Organizations:")

        click_on("See Organizations")

        expect(current_path).to eq(organizations_path)

        within(".orgs-list") do
          expect(page).to have_content("")
        end
      end
    end
  end
end
