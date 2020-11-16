class Experience < ApplicationRecord
  has_many :rates
  has_many :responses
  belongs_to :user
end
