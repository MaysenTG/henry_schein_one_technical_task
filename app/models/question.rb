class Question < ApplicationRecord
  # Add a relationship to the replies and model
  has_many :replies, dependent: :destroy
  belongs_to :account
  
  # Add validations
  validates :title, presence: true
  validates :body, presence: true
end
