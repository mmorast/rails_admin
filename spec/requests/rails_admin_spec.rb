require 'spec_helper'

describe "RailsAdmin" do

  describe "authentication" do
    it "should be disableable" do
      logout
      RailsAdmin.authenticate_with {}
      get rails_admin_dashboard_path
      response.should be_successful
    end
  end

  # A common mistake for translators is to forget to change the YAML file's
  # root key from en to their own locale (as people tend to use the English
  # file as template for a new translation).
  describe "localization" do
    it "should default to English" do
      get rails_admin_dashboard_path

      response.should contain("Site administration")
      response.should contain("Dashboard")
    end
  end
  
  describe "html head" do
    it "should include the required css and js files" do
      get rails_admin_dashboard_path
      
      response.should have_selector('link[href^="/stylesheets/rails_admin/ra.timeline.css"]')
      response.should have_selector('script[src^="/javascripts/rails_admin/application.js"]')
    end
  end

end
