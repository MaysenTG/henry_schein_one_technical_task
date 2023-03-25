class Question < ApplicationRecord
  has_many :replies, dependent: :destroy
  belongs_to :account
end
