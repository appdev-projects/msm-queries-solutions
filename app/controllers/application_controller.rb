class ApplicationController < ActionController::Base
  def homepage
    render({ :template => "pages/home"})
  end
end
