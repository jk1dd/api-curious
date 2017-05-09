require 'rails_helper'

RSpec.feature 'User can log in with github' do
  context 'An existing user has valid credentials' do

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

    scenario 'The user clicks login on root path' do
      visit '/'

      expect(page.status_code).to eq 200

      click_link('Login with Github')

      expect(current_path).to eq user_path(User.last)

      expect(page.body).to have_content 'Welcome, POODR!'
      expect(page.body).to have_link 'Logout'
    end
  end
end
