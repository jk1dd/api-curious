require 'rails_helper'

feature 'User can view recent commits' do
  context 'when she is authenticated' do
    scenario 'she can click a link to see recent commits' do
      VCR.use_cassette('recent_commits') do
        Capybara.app = ApiCurious::Application
        stub_omniauth

        visit '/'
        click_link('Login with Github')
        click_on('View Recent Commits')

        expect(current_path).to eq(commits_path)

        within(".my-commits") do
          expect(page).to have_content("add current user token to following method in view")
        end

        # within(".their-events") do
        #   expect(page).to have_content("jwkafjw")
        # end

      end
    end
  end
end
