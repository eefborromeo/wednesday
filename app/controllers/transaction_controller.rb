class TransactionController < ApplicationController
    before_action :approved

    private

    def approved
        if !current_user.approved
            flash[:notice] = "Your account must be approved to access this area."
            redirect_to root_path unless current_user.approved?
        end
    end
end
