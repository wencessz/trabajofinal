class Aviso < ApplicationRecord
  resourcify

  belongs_to :user
  belongs_to :category

  paginates_per 10

  # Configración de Paperclip
  has_attached_file :photo, styles: { large: "500x500>", medium: "200x220#", thumb: "100x100#" }
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :title, :description, presence: true
end
