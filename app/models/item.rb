class Item < ActiveRecord::Base
  belongs_to :day
  belongs_to :row
  has_one :year, through: :day

  scope :for_row, ->(row){ where(row: row) }

  def self.from_line(line, row)
    item = Item.new
    item.row = row
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
