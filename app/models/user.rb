class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :transactions, dependent: :destroy
  has_many :assets, dependent: :destroy

  after_commit :send_approval_email

  def approved_status
    if self.approved?
      "Approved"
    else
      "Not approved"
    end
  end

  def send_approval_email
    ApprovalMailer.trader_approved(self).deliver_later if approved
  end
end
