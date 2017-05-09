require 'rails_helper'

RSpec.feature 'User can see basic account info' do
  context 'as an existing user with valid creds' do

    before do
      Capybara.app = ApiCurious::Application
      stub_oauth
    end

    def stub_oauth
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                           provider: 'github',
                                           uid: '12345678',
                                           info: {
                                            nickname: 'whatever',
                                            email: 'whatever@whatever.com',
                                            name: 'Whatevery McWhatever',
                                            image: 'http://wallpaper-gallery.net/images/random-image/random-image-4.jpg',
                                           },
                                           credentials: {
                                             token: 'lwkerkjle'
                                           }
      })
    end

    scenario 'user is on her dashboard page' do
      skip
      visit '/'

      click_link('Login with Github')

      visit '/dashboard'

      expect(page.status_code).to eq(200)

      expect(page).to have_css("img")
      expect(page).to have_content("Starred Repo count")
      expect(page).to have_content("Followers")
      expect(page).to have_content("Following")
    end
  end
end
