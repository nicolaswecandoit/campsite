class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Campeur"
  belongs_to :rateable, :polymorphic => true
end
