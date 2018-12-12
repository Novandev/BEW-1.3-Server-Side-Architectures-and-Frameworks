class Contact < ApplicationRecord
  # # model association
  # has_many :items, dependent: :destroy
  belongs_to :user
  # validations
  validates_presence_of :name, :number,:user_id
end
