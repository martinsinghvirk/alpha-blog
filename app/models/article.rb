class Article < ActiveRecord::Base
    belongs_to :user
    has_many :article_categories #En artikel har många artikelkategorier.
    has_many :categories, through: :article_categories #En artikel har många kategorier genom artikelkategorier.

    # Validerar att en titel/beskrivning finns samt innehållslängd, innan en artikel lagras i db.
    validates_presence_of :title
    validates_length_of :title, minimum: 3, maximum: 50

    validates_presence_of :description
    validates_length_of :description, minimum: 10, maximum: 200
end