class GithubService

  def initialize(token)
    @token = token
    @_conn = Faraday.new('https://api.github.com/')
  end

  def user
    response = conn.get("/user?access_token=#{token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_by(token)
    service = GithubService.new(token)
    service.user
  end

  private
  attr_reader :token

  def conn
    @_conn
  end
end
