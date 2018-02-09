class Article < ActiveRecord::Base

    # Validerar att en titel/beskrivning finns samt innehållslängd, innan en artikel lagras i db.
    # validates :title, presence :true, length: { minimum: 3, maximum: 50 }
    # validates :description, presence :true, length: { minimum: 10, maximum: 200 }
    
end