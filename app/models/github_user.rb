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

  def login
    attrs[:login]
  end

  def html_url
    attrs[:html_url]
  end

  # def self.starred(token)
  #   GithubService.starred_by(token)
  # end

  def starred_repos(token)
    GithubService.starred_by(token)
  end

  def followers(token)
    GithubService.followers(token).map do |follower|
      GithubUser.new(follower)
    end
    # binding.pry
  end

  # def self.followers(token)
  #   ere = GithubService.new(token).followers.map do |follower|
  #     binding.pry
  #     new(follower)
  #   end
  # end


  # def self.repos(token)
  #   GithubService.find_repos(token)
  # end

  def repos(token)
    Repo.repos(token)
  end

  def following(token)
    GithubService.following(token).map do |following|
      GithubUser.new(following)
    end
  end

  def events(token, nickname)
    Event.events(token, nickname)
  end

  def commits(token, nickname)
    Event.find_commits(token, nickname)
  end

  private
  attr_reader :attrs
end
