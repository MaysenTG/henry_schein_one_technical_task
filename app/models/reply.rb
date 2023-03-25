class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :account
  
  validates :body, presence: true
end
