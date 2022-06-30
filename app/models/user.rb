class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :transactions
  has_many :assets

  def approved_status
    if self.approved?
      "Approved"
    else
      "Not approved"
    end
  end
end
