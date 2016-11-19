class GeneratedTask < ApplicationRecord
    validates :user_ans, presence: true, numericality: true

end
