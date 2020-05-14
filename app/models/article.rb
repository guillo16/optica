class Article < ApplicationRecord
  validates :title, presence: true
  validates :subtitle, presence: true
  has_one_attached :photo
  validates :content, presence: true
  validate :photo_attach

  private

  def photo_attach
    if photo.attached? == false
      errors.add(:photo, 'Tienes que elegir una foto')
    end
  end
end
