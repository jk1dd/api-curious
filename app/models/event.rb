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

  def self.find_commits(token, nickname)
    push_events(token, nickname).map do |push_event|
      Commit.commits(push_event.payload, push_event.repo)
    end
    # binding.pry
  end

  def payload
    attrs[:payload]
    # binding.pry
  end

  def repo
    attrs[:repo][:name].split('/')[1]
  end

  def self.push_events(token, nickname)
    Event.events(token, nickname).select {|event| event.type == 'PushEvent'}
  end
  #
  # def commits(token, nickname)
  #   ere = push_events.map { |push_event| push_event.payload[:commits] }
  #   binding.pry
  # end

  # def commit_messages
  #   commits = attrs[:payload]
  # end

  private
  attr_reader :attrs
end
