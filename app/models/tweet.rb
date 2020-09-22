class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
end

def self.search(search)
  if search != ""
    Tweet.where('text LIKE(?)', "%#{search}%")
  else
    Tweet.all
  end
  search = "#{search}%"
  Tweet.find_by_sql(["select * from tweets where text like ? ", search])
end