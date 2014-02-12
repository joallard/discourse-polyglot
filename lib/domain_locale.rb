module DomainLocale

  # TODO: Cache the map
  def self.for(domain)
    map = YAML.load(SiteSetting.domain_locales)
    return unless map.respond_to? :[]

    map[domain]
  rescue YAML::Exception
    nil
  end
end
