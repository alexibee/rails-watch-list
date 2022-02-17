# frozen_string_literal: true

class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true
  validates :image_url, format: { with: /\A(http:|https:).{6}(\.jpeg|\.png|\.jpg)/, message: 'Input a valid URL' }
end
