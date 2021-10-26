require 'rails_helper'

RSpec.describe Item, :type => :model do
  describe "::from_line" do
    let(:row) { Row.create(name: "New Row") }

    context "when there are square brackets" do
      context "when the brackets are at the end of the line" do
        it "treats the text in the brackets as a url" do
          line = "example [text]"
          expect(Item.from_line(line, row).url).to eq("text")
        end

        it "uses the rest of the line as the item's text" do
          line = "example [text]"
          expect(Item.from_line(line, row).text).to eq("example")
        end

        it "ignores trailing whitespace" do
          line = "example [text]  "
          expect(Item.from_line(line, row).url).to eq("text")
        end
      end

      context "when the brackets are in the middle of the line" do
        it "users the line as the item's text" do
          line = "ex[ample] text"
          expect(Item.from_line(line, row).text).to eq(line)
        end
      end
    end

    it "uses the line as the item's text" do
      line = "example text"
      expect(Item.from_line(line, row).text).to eq(line)
    end
  end
end
