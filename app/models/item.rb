class Item < ActiveRecord::Base
  belongs_to :day

  scope :for_grade, ->(grade){ where(grade: grade) }

  def self.from_line(line, grade)
    item = Item.new
    item.grade = grade
    parts = /(?<text>.*)\[(?<url>.*)\]\s*$/.match line

    if parts
      item.text = parts[:text].rstrip
      item.url = parts[:url]
    else
      item.text = line
    end

    item
  end
end
