require 'rails_helper'

feature 'User can view recent events' do
  context 'when she is authenticated' do
    scenario 'she can click a link to see recent events' do
      VCR.use_cassette('recent_events') do
        Capybara.app = ApiCurious::Application
        stub_omniauth

        visit '/'
        click_link('Login with Github')
        click_on('View Recent Events')

        expect(current_path).to eq(events_path)

        within(".my-events") do
          expect(page).to have_content("5849994554")
        end

        # within(".their-events") do
        #   expect(page).to have_content("jwkafjw")
        # end

      end
    end
  end
end
