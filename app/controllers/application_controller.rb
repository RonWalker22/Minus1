class ApplicationController < ActionController::Base
  before_action :check_signed_in, unless: :guests_controllers?

  include Pundit
  protect_from_forgery with: :exception

  private

    def pundit_user
      current_user
    end

    def add_contributor(contribution)
      current_user.add_role(:contributor, contribution) unless current_user.has_role?(:contributor, contribution)
    end

    def check_signed_in
      return if user_signed_in?

      flash[:notice] = 'You must be signed in to access that area.'
      redirect_to(new_user_session_path)
    end

    def guests_controllers?
      devise_controller? || controller_name == 'static_pages' || 
        action_name == 'show_xml'
    end
end
