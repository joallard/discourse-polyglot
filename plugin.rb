# name: polyglot
# about: Extra support for multilingual Discourse
# version: 0.1.0
# author: Jonathan Allard

after_initialize do
  load File.expand_path("../lib/domain_locale.rb", __FILE__)

  class ::UserActivator

    # FORK
    def start
      register_nickname
      set_locale
    end

    protected

    def set_locale
      @user.locale = I18n.locale
    end
  end


  class ::ApplicationController < ActionController::Base

    # FORK
    def set_locale
      I18n.locale =
        if SiteSetting.allow_user_locale && current_user && current_user.locale.present?
          current_user.locale
        elsif locale = DomainLocale.for(request.domain)
          locale
        else
          SiteSetting.default_locale
        end
    end
  end
end
