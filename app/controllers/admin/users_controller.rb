class Admin::UsersController < ApplicationController
  before_action :check_admin
  before_action :set_trader, only: [:show, :edit, :update, :destroy]

    def index
        @q = User.where(admin: false).ransack(params[:q])
        @traders = @q.result.order(created_at: :asc)
        @users = User.where(admin: false)
    end

    def show
        @q = @trader.transactions.ransack(params[:q])
        @transactions = @q.result.order(created_at: :asc)
        @all_transactions = @trader.transactions.all
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
            redirect_to admin_user_path(@trader), notice: "You have successfully updated #{@trader.username}'s details"
        else
            redirect_to edit_admin_user_path, alert: "#{@trader.errors.first.message}"
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
        params.require(:user).permit(:email, :password, :password_confirmation, :money, :approved, :username, :first_name, :last_name)
    end
end
