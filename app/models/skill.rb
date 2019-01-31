class Skill < ApplicationRecord
  validates_oresence_of :title, :percent_utilized
end
