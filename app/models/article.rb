# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :reports, dependent: :destroy

  validates :title, :url, :introduction, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def reported_by?(user)
    reports.where(user_id: user.id).exists?
  end
  
  belongs_to :user

  acts_as_taggable
end
