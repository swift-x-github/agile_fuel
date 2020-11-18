class Experience < ApplicationRecord
  has_many :questions
  has_many :rates
  has_many :responses
  belongs_to :user
  
  validates :name, presence:true
 

  def total_raiting_summa (ik)
    res = (rates.where(experience_id: ik).pluck( :rate).sum.to_f / rates.where(experience_id: ik).pluck( :rate).count.to_f) 
    res > 0 ? res : 0    
  end
  
  
  #def total_raiting_summa (ik)
  #  rates.select( :rate).where(experience_id: ik).to_s.sum
  #end
  # формула рейтинга
  def total_rating
    #@total_rating ||= (total_raiting_summa.to_i / total_rates.to_i)
    @total_rating ||= (10.to_f / total_rates_number.to_f)
  end


  # это сколько всего записей в этом експиренсе
  def total_rates_number
    @total_rates_number ||= rates.count
  end


  # это сколько всего записей в этом експиренсе
  def total_responses_number
    @total_responses_number ||= responses.count
  end

 # это сколько всего вопрсов в этом експиренсе
 def total_questions_number
  @total_questions_number ||= questions.count
end


end
