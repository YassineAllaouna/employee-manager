class ApplicationController < ActionController::API

    def current_user
        @current_user
      end
      #helper_method :current_user # si tu veux l’utiliser dans des views plus tard

end
