class Commit
  attr_reader :repo

  def initialize(attrs={}, repo)
    @attrs = attrs
    @repo = repo
  end

  def self.commits(payload, repo)
    payload[:commits].map do |raw_commit|
      Commit.new(raw_commit, repo)
    end
  end

  def message
    attrs[:message]
  end

  private
  attr_reader :attrs
end
