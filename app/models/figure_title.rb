# frozen_string_literal: true

class FigureTitle < ActiveRecord::Base
  # add relationships here
  belongs_to :figure
  belongs_to :title
end
