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

  private
  attr_reader :attrs
end
