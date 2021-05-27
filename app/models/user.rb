class User < ApplicationRecord
  STYLES = ['AWP','Rifler','Supporter','Lurker','IGL','Fragger']
  RANKS = ['Unranked', 'Silver I','Silver II','Silver III','Silver IV','Silver Elite','Silver Elite Master','Gold Nova I','Gold Nova II','Gold Nova III','Gold Nova Master','Master Guardian I','Master Guardian II','Master Guardian Elite','Distinguished Master Guardian','Legendary Eagle','Legendary Eagle Master','Supreme Master First Class','Global Elite']
  LANGUAGES = [ "Mandarin Chinese", "Spanish", "English", "Hindi/Urdu", "Arabic", "Bengali", "Portuguese", "Russian", "Japanese", "German", "Javanese", "Punjabi", "Wu", "French", "Telugu", "Vietnamese", "Marathi", "Korean", "Tamil", "Italian", "Turkish", "Cantonese/Yue"]
  REGIONS = ["EU north", "PW tianjin", "Singapore", "India West", "Autralia", "EU West", "PW Shanghai", "Chile", "US SouthEast", "India East", "EU East", "PW Guangdong ", "Japan", "US SouthWest","US West", "Poland", "Hong Kong", "US North Central", "Peru", "South Africa", "South America", "Spain", "US East", "Dubai"]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :matches
  has_many :chatrooms, through: :matches
  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :first_name, presence: true
  validates :age, presence: true
  validates :rank, presence: true
  validates :language, presence: true
  validates :region, presence: true
  validates :style, presence: true
  validates :description, length: { maximum: 400 }
  validates :style, inclusion: {in: STYLES, message: "-- Choose a style from the dropdown"}
  validates :rank, inclusion: {in: RANKS, message: "-- Choose your rank from the dropdown"}
  validates :region, inclusion: {in: REGIONS, message: "-- Choose your regions from the dropdown"}
  validates :language, inclusion: {in: LANGUAGES, message: "-- Choose your language from the dropdown"}
end
