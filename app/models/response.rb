class Response < ApplicationRecord
  belongs_to :experience
  validates :name, presence: true
  validates_uniqueness_of :ip, scope: [ :experience_id] # ip & exp validation
  after_save :modify_raiting

  def modify_raiting
    self.experience.update_attribute(:rate, self.experience.total_raiting)
  end
end
