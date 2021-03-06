module SpreeRedirects
  class Engine < Rails::Engine
    
    engine_name "spree_redirects"
    
    initializer "redirect middleware" do |app|
      app.middleware.insert_after ::ActionDispatch::ShowExceptions, ::SpreeRedirects::RedirectMiddleware
    end

    config.to_prepare do
      
      # We're not using any decorators so there's no need for this
      
      # Dir.glob File.expand_path("../../../app/**/*_decorator.rb", __FILE__) do |c|
      #   Rails.configuration.cache_classes ? require(c) : load(c)
      # end

      Dir.glob File.expand_path("../../../app/overrides/**/*.rb", __FILE__) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
      
    end

  end
end
