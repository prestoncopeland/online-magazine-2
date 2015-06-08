class Article < ActiveRecord::Base

  has_many :taggings
  has_many :tags, through: :taggings
  has_many :photos
  accepts_nested_attributes_for :photos, :reject_if => :all_blank, :allow_destroy => true

  enum category: [ :celebrities, :music, :inspiration, :sports ]

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
      tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
      new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
      self.tags = new_or_found_tags
  end

end
