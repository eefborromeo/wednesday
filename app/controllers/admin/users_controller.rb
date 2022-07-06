class Admin::UsersController < ApplicationController
  before_action :check_admin
  before_action :set_trader, only: [:show, :edit, :update, :destroy]

    def index
        @q = User.where(admin: false).ransack(params[:q])
        @traders = @q.result.order(created_at: :asc)
    end

    def show
    end

    def new
        @trader = User.new
    end

    def create
        @trader = User.new(trader_params)

        if @trader.save
            redirect_to admin_users_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @trader.update(trader_params)
            redirect_to admin_user_path(@trader)
        else
            render :edit
        end
    end

    def destroy
        @trader.destroy
        redirect_to admin_users_path
    end

    private

    def check_admin
        return if current_user.admin?
        redirect_to root_path, notice: 'Access Denied'
    end

    def set_trader
        @trader = User.find(params[:id])
    end
    
    def trader_params
        params.require(:user).permit(:email, :password, :password_confirmation, :money, :approved)
    end
end
