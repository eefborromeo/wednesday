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
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/i, message: "First name only allows letters" }

  validates :last_name,
              presence: true,
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/i, message: "Last name only allows letters" }

  before_save :capitalize_name            
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

  def ransackable_attributes(auth_object = nil)
    ["username", "email"]
  end

  def capitalize_name
    self.first_name = first_name.titleize
    self.last_name = last_name.titleize
  end
end
