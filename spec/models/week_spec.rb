require 'rails_helper'

describe Week do
  describe "week navigation" do
    before :each do
      user = create(:user)
      year = Year.populate(user, "Test", 2, Date.today)
      @first_week = year.weeks.find_by(number: 1)
      @last_week = year.weeks.find_by(number: 2)
    end

    describe "#prev_week" do
      it "returns the previous week" do
        expect(@last_week.prev_week).to be_a(Week)
        expect(@last_week.prev_week.number).to eq(@last_week.number - 1)
      end

      it "returns nil if there isn't a previous week" do
        expect(@first_week.prev_week).to_not be
      end
    end

    describe "#next_week" do
      it "returns the next week" do
        expect(@first_week.next_week).to be_a(Week)
        expect(@first_week.next_week.number).to eq(@first_week.number + 1)
      end

      it "returns nil if there isn't a next week" do
        expect(@last_week.next_week).to_not be
      end
    end
  end
end
