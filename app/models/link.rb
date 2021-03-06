class Link < ApplicationRecord
  validates :url, presence: true, url: true
  validates :title, presence: true
  belongs_to :user

  scope :hot, -> {
    select('links.url as url')
      .joins('join reads on reads.link_id = links.id')
      .where('reads.created_at > ?', Time.now - 1.day)
      .group("links.url")
      .order('count("reads".id) DESC').limit(10)
  }

  def self.by_user_id(id)
    where(user_id: id).order(created_at: :desc)
  end
end
