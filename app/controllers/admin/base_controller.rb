# frozen_string_literal: true

module Admin
    class BaseController < ApplicationController
        layout 'admin'
        before_action :redirect_if_unauthenticated, only: [:index]
        helper_method :current_admin

        private
        def current_admin
            @current_admin ||= CurrentAdmin.user
        end
    end
end
