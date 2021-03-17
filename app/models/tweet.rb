class Tweet < ApplicationRecord
    has_many :retweets, class_name: 'Tweet', foreign_key: 'retweet_id'
    belongs_to :origin, class_name: 'Tweet', optional: true
    
    
    belongs_to :user
    has_many :likes, dependent: :destroy

    validates :content, presence: true

    delegate :profile_photo, to: :user, prefix: :true

  def add_like(user)
    Like.create(user: user, tweet: self)
  end

  def remove_like(user)
    Like.where(user: user, tweet: self).first.destroy
  end

  def original_tweet
    Tweet.find(self.origin_tweet)
  end

  after_create do
    #tweet = Tweet.find_by(id: self.id)
    hashtags = self.content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag 
    end
  end

  before_update do
    #tweet = Tweet.find_by(id: self.id)
    tweet.tags.clear
    hashtags = self.content.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      self.tags << tag 
    end
  end
end

