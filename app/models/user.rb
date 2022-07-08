class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :transactions, dependent: :destroy
  has_many :assets, dependent: :destroy

  validates :username,
              presence: true,
              uniqueness: true,
              length: { maximum: 15 }
  
  validates :first_name,
              presence: true,
              format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  validates :last_name,
              presence: true,
              format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  after_update_commit :send_approval_email, if: :approved?

  def approved_status
    if self.approved?
      "Approved"
    else
      "Not approved"
    end
  end

  private

  def send_approval_email
    if saved_change_to_attribute?(:approved)
      ApprovalMailer.trader_approved(self).deliver_now
    end
  end
end
