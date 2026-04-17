require 'rails_helper'

describe Year do
  describe "#week_for" do
    before :each do
      user = create(:user)
      @year = Year.populate(user, "Test", 10, 1.month.ago)
    end

    it "returns nil if date is before the first week" do
      expect(@year.week_for(2.months.ago)).to_not be
    end

    it "returns nil if date is after the last week" do
      expect(@year.week_for(6.months.from_now)).to_not be
    end

    it "returns the week containing the given date" do
      week = @year.week_for(Date.today)

      expect(week).to be
      expect(week.start_date).to be <= Date.today
      expect(week.next_week.start_date).to be >= Date.today
    end
  end

  describe "#extend" do
    it "creates additional weeks" do
      user = create(:user)
      year = Year.populate(user, "Test", 10, 1.month.ago)
      expect { year.extend(2) }.to change(Week, :count).by(2)
    end
  end

  describe "::populate" do
    it "creates a Year" do
      user = create(:user)
      expect { Year.populate(user, "Test", 10, 1.month.ago) }.to change(Year, :count).by(1)
    end

    it "creates weeks for the new year" do
      user = create(:user)
      year = Year.populate(user, "Test", 10, 1.month.ago)
      expect(year.weeks.count).to eq 10
    end

    it "creates days for each week" do
      user = create(:user)
      expect { Year.populate(user, "Test", 10, 1.month.ago) }.to change(Day, :count).by(50)
    end
  end
end
