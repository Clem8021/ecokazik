class ApplicationController < ActionController::Base
  allow_browser versions: { chrome: 80, safari: 13, firefox: 75 }
end
