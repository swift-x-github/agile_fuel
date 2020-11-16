class Response < ApplicationRecord
  belongs_to :experience
  scope :completed, -> do
    where(completed: true)
  end

  def total_responses
    @total_responses ||= total_responses.count
  end


end
