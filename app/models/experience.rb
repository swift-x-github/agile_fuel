class Experience < ApplicationRecord
  validates :name, presence: true
  has_many :responses, dependent:  :destroy, :autosave => true
  

  def total_raiting
    res = (responses.pluck( :raiting).sum.to_f / responses.pluck( :raiting).count.to_f).round(2) 
    res > 0 ? res : 0    
  end
 
  def total_responses_number
    @total_responses_number ||= responses.count
  end



end
