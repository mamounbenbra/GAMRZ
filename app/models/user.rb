class User < ApplicationRecord
  STYLES = ['AWP','Rifler','Supporter','Lurker','IGL','Fragguer']
  RANKS = ['Unranked', 'Silver I','Silver II','Silver III','Silver IV','Silver Elite','Silver Elite Master','Gold Nova I','Gold Nova II','Gold Nova III','Gold Nova Master','Master Guardian I','Master Guardian II','Master Guardian Elite','Distinguished Master Guardian','Legendary Eagle','Legendary Eagle Master','Supreme Master First Class','Global Elite']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many: matches
  has_many: reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :first_name, presence: true
  validates :age, presence: true
  validates :rank, presence: true
  validates :region, presence: true
  validates :style, presence: true
  validates :description, length: { maximum: 400 }
  validates :style, inclusion: {in: STYLES, message: "-- Choose a style from the dropdown"}
  validates :rank, inclusion: {in: RANKS, message: "-- Choose your rank from the dropdown"}
end
