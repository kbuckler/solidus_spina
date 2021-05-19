module SolidusSpina
  module Spina
    module AdminControllerDecorator
      def authorize_spina_user
        redirect_to '/login' unless current_spina_user
      end

      def current_spina_user
        @current_spina_user ||= current_user if current_user&.admin?
      end
    end
    ::Spina::Admin::AdminController.prepend AdminControllerDecorator
  end
end
