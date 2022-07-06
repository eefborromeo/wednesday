class Admin::TransactionsController < ApplicationController
  def index
    @q = Transaction.all.ransack(params[:q])
    @transactions = @q.result.order(created_at: :desc)
  end
end
