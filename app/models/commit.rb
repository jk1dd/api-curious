class Commit

  def initialize(attrs = {})
    @attrs = attrs
  end

  def self.commits(token, nickname)
    GithubService.new(token).find_commits(nickname).map do |commit|
      new(commit)
    end
  end

  private
  attr_reader :attrs
end
