class Repo

  def initialize(attrs = {})
    @attrs = attrs
  end

  def self.repos(token)
    GithubService.new(token).find_repos.map do |repo|
      new(repo)
    end
    # binding.pry
  end

  def name
    attrs[:name]
  end

  def html_url
    attrs[:html_url]
  end

  private
  attr_reader :attrs

end
