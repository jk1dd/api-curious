class Event

  def initialize(attrs = {})
    @attrs = attrs
  end

  def self.events(token, nickname)
    GithubService.new(token).find_events(nickname).map do |event|
      new(event)
    end
  end

  def id
    attrs[:id]
  end

  def type
    attrs[:type]
  end

  def payload
    attrs[:payload]
    # binding.pry
  end

  private
  attr_reader :attrs
end
