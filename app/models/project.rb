class Project < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :versions

  before_validation :set_slug

  validates :slug,
    presence: true,
    format: /\A[a-z0-9_-]+\z/

  def to_s
    "#{owner}/#{name}"
  end

  def to_param
    slug
  end

  def set_slug
    if name.present? && slug.blank?
      self.slug = name.downcase.gsub(/[^a-z0-9_-]+/, "-")
    end
  end
end
