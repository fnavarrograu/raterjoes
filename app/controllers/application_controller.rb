class ApplicationController < ActionController::Base

def homepage

  render( :template => "products/homepage.html.erb")
end

end
