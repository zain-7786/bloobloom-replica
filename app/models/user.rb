# frozen_string_literal: true

class User < ApplicationRecord
  has_many :frames
  has_many :lenses
  has_many :glasses
end