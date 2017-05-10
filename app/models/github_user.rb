class GithubUser
  attr_reader :name

  def initialize(attrs)
    @attrs = attrs
  end

  def self.find(token)
    new(GithubService.user_by(token))
    # binding.pry
  end

  def name
    attrs[:name]
  end

  def avatar_url
    attrs[:avatar_url]
  end

  def public_repos
    attrs[:public_repos]
  end

  def self.starred(token)
    GithubService.starred_by(token)
  end

  def self.followers(token)
    GithubService.followers(token)
  end

  def self.repos(token)
    GithubService.find_repos(token)
  end

  private
  attr_reader :attrs
end