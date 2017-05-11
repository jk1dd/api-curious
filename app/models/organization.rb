class Organization
  def initialize(attrs={})
    @attrs = attrs
  end

  def self.organizations(token)
    GithubService.find_organizations(token).map do |org|
      Organization.new(org)
    end
  end

  private
  attr_reader :attrs
end
