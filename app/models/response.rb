class Response < ApplicationRecord
  belongs_to :experience
  validates :name, presence: true
  validates_uniqueness_of :ip, scope: [ :experience_id] # ip & exp validation
 
  def total_responses
    @total_responses ||= total_responses.count
  end
end
