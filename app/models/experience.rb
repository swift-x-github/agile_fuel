class Experience < ApplicationRecord
  has_many :questions
  has_many :rates
  has_many :responses
  belongs_to :user
  
  validates :name, presence:true
 

  

  def total_experiences
    @total_experiences ||= total_experiences.count
  end

  

end
