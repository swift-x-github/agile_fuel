class Experience < ApplicationRecord
  validates :name, presence: true
  has_many :responses


  def total_raiting# (ik)
    #@total_raiting ||= responses.count
    res = (responses.pluck( :raiting).sum.to_f / responses.pluck( :raiting).count.to_f).round(2) 
    res > 0 ? res : 0    
  end
 


  # это сколько всего отзывово в этом експиренсе
  def total_responses_number
    @total_responses_number ||= responses.count
  end



end
