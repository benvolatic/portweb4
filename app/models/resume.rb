class Resume < ApplicationRecord
    has_one_attached :file # For handling file uploads
    validates :file, presence: true
  end