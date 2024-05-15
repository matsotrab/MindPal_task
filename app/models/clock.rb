class Clock < ApplicationRecord
  belongs_to :user
  
  enum :category, {standard: 0, premium: 1, 'premium+': 2}
end
