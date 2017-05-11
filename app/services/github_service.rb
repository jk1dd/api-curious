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

  def starred
    response = conn.get("/user/starred?access_token=#{token}")
    JSON.parse(response.body, symbolize_names: true)
  end


  def self.starred_by(token)
    service = GithubService.new(token)
    service.starred
  end

  def followers
    response = conn.get("/user/followers?access_token=#{token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followers(token)
    service = GithubService.new(token)
    service.followers
  end

  def find_repos
    response = conn.get("/user/repos?access_token=#{token}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_repos(token)
    service = GithubService.new(token)
    service.find_repos
  end

  def following
    response = conn.get("/user/following?access_token=#{token}")
    tuff = JSON.parse(response.body, symbolize_names: true)
  end

  def self.following(token)
    service = GithubService.new(token)
    service.following
  end

  def find_commits(nickname)
    response = conn.get("/users/#{nickname}/events?access_token=#{token}")
    blah = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  def self.find_commits(token)
    service = GithubService.new(token)
    service.find_commits
  end

  private
  attr_reader :token

  def conn
    @_conn
  end
end
