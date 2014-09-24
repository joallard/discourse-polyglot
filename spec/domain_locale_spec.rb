load File.expand_path("../../lib/domain_locale.rb", __FILE__)

describe DomainLocale do
  SiteSetting = Class.new

  describe ".for" do
    it "returns the locale for the domain" do
      allow(SiteSetting).to receive(:domain_locales) { "forum.enfrancais.ca: fr" }

      expect(DomainLocale.for("forum.enfrancais.ca")).to eq("fr")
    end

    it "returns nil if setting is not a map" do
      allow(SiteSetting).to receive(:domain_locales) { "only a string" }

      expect(DomainLocale.for("forum.enfrancais.ca")).to be_nil
    end

    it "returns nil if YAML is invalid" do
      allow(SiteSetting).to receive(:domain_locales) { "::" }

      expect(DomainLocale.for("forum.enfrancais.ca")).to be_nil
    end
  end
end
