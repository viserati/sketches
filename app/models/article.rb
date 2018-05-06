class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: {minimum: 3}
  validates :text, presence: true,
            length: {minimum: 5}

  # For photo
  has_attached_file :photo, styles: {large: "450x450>", thumb: "50x50#"}
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  # For music
  has_attached_file :music
  validates_attachment :music,
  :content_type => {:content_type => ["audio/mpeg", "audio/mp3"]},
  :file_type => {:matches => [/mp3\z/]}

  # For movie
  has_attached_file :movie
  validates_attachment :movie, :styles =>
  {
    :medium => {:geometry =>"640x480", :format => 'mp4'},
    :thumb => {:geometry =>"100x40", :format => 'jpg', :time => 10},
  }, :processor => [:transcoder]
  validates_attachment_content_type :movie, content_type: /\Avideo\/.*\z/

def self.search(params)
  articles = Article.where("text LIKE ? or title LIKE ?", "%#{params[:search]}%",
            "%#{params[:search]}%") if params[:search].present?
  articles # returns the articles containing the search words
end
end
