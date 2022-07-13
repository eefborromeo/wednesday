class ChartsController < ApplicationController
  def new_users
    render json: User.group_by_day(:created_at).count.map{ |k,v| [[k.strftime('%-B %-d')], v] }
  end

  def all_completed_transactions
    render json: Transaction.group_by_day(:created_at).count.map{ |k,v| [k.strftime('%-B %-d'), v] }
  end

  def asset_specific_transactions
    render json: current_user.transactions.where(asset_name: params[:asset_name]).group_by_day(:created_at).count.map{ |k,v| [[k.strftime('%-B %-d')], v] }
  end
end