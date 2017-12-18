class Article < ApplicationRecord
  # destroy all associated comments when an article is deleted
  has_many :comments, dependent: :destroy
  # ensure all articles have a title at least five characters long
  validates :title, presence: true, length: { minimum: 5 }
end
