# frozen_string_literal: true

class Landmark < ActiveRecord::Base
  # add relationships here
  belongs_to :figure
end
