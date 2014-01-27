class Step < ActiveRecord::Base
  belongs_to :task
  validates :task, :presence => true
end
