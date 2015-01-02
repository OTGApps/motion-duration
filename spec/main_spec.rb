describe "Motion::Duration" do
  it "should initialize given duration in seconds" do
    d = Motion::Duration.new(90)
    d.weeks.should == 0
    d.days.should == 0
    d.hours.should == 0
    d.minutes.should == 1
    d.seconds.should == 30
    d.total.should == 90
    d.total_minutes.should == 1
    d.total_hours.should == 0
    d.total_days.should == 0
  end

  it "should initialize given duration in Hash" do
    d = Motion::Duration.new(:weeks => 1, :days => 2, :hours => 3, :minutes => 4, :seconds => 5)
    d.weeks.should == 1
    d.days.should == 2
    d.hours.should == 3
    d.minutes.should == 4
    d.seconds.should == 5
    d.total.should == 788645
    d.total_minutes.should == 13144
    d.total_hours.should == 219
    d.total_days.should == 9
  end

  describe "mathematical operations" do

    it "should +" do
      Motion::Duration.new(15).total.should == (Motion::Duration.new(10) + 5).total
      Motion::Duration.new(15).total.should == (Motion::Duration.new(10) + Motion::Duration.new(5)).total
    end

    it "should -" do
      Motion::Duration.new(5).total.should == (Motion::Duration.new(10) - 5).total
      Motion::Duration.new(5).total.should == (Motion::Duration.new(10) - Motion::Duration.new(5)).total
    end

    it "should *" do
      Motion::Duration.new(20).total.should == (Motion::Duration.new(10) * 2).total
      Motion::Duration.new(20).total.should == (Motion::Duration.new(10) * Motion::Duration.new(2)).total
    end

    it "should /" do
      Motion::Duration.new(5).total.should == (Motion::Duration.new(10) / 2).total
      Motion::Duration.new(5).total.should == (Motion::Duration.new(10) / Motion::Duration.new(2)).total
    end

    it "should %" do
      Motion::Duration.new(1).total.should == (Motion::Duration.new(10) % 3).total
      Motion::Duration.new(1).total.should == (Motion::Duration.new(10) % Motion::Duration.new(3)).total
    end
  end

  # describe "#format" do
  #   it "should display units in plural form when needed" do
  #     d = Motion::Duration.new(:weeks => 2, :days => 3, :hours => 4, :minutes => 5, :seconds => 6)
  #     assert_equal "2 weeks 3 days 4 hours 5 minutes 6 seconds", d.format("%w %~w %d %~d %h %~h %m %~m %s %~s")
  #   end

  #   it "should display units in singular form when needed" do
  #     d = Motion::Duration.new(:weeks => 1, :days => 1, :hours => 1, :minutes => 1, :seconds => 1)
  #     assert_equal "1 week 1 day 1 hour 1 minute 1 second", d.format("%w %~w %d %~d %h %~h %m %~m %s %~s")
  #   end

  #   it "should display total seconds" do
  #     d = Motion::Duration.new(:hours => 1, :minutes => 15)
  #     assert_equal "4500 seconds", d.format("%tsu")
  #   end

  #   it "should display total seconds in plural form when needed" do
  #     d = Motion::Duration.new(:minutes => 1, :seconds => 1)
  #     assert_equal "61 seconds", d.format("%tsu")
  #   end

  #   it "should display total minutes as number" do
  #     d = Motion::Duration.new(:hours => 1, :minutes => 15)
  #     assert_equal "75", d.format("%tm")
  #   end

  #   it 'should display total minutes with unit' do
  #     d = Motion::Duration.new(:hours => 1, :minutes => 15)
  #     assert_equal "75 minutes", d.format("%tmu")
  #   end

  #   it "should display total minutes in plural form when needed" do
  #     d = Motion::Duration.new(:hours => 1, :minutes => 1)
  #     assert_equal "61 minutes", d.format("%tmu")
  #   end

  #   it "should display total hours as number" do
  #     d = Motion::Duration.new(:days => 2, :hours => 1)
  #     assert_equal "49", d.format("%th")
  #   end

  #   it 'should display total hours with unit' do
  #     d = Motion::Duration.new(:days => 2, :hours => 2)
  #     assert_equal "50 hours", d.format("%thu")
  #   end

  #   it "should display total hours in plural form when needed" do
  #     d = Motion::Duration.new(:days => 1, :hours => 1)
  #     assert_equal "25 hours", d.format("%thu")
  #   end

  #   it "should display total days as number" do
  #     d = Motion::Duration.new(:weeks => 1, :days => 3)
  #     assert_equal "10", d.format("%td")
  #   end

  #   it 'should display total days with unit' do
  #     d = Motion::Duration.new(:weeks => 1, :days => 2)
  #     assert_equal "9 days", d.format("%tdu")
  #   end

  #   it "should display total days in plural form when needed" do
  #     d = Motion::Duration.new(:weeks => 1, :days => 1)
  #     assert_equal "8 days", d.format("%tdu")
  #   end
  # end

  # describe "output typographic marks for minutes and seconds" do
  #   it "uses a UTF-8 double prime for seconds" do
  #     d = Motion::Duration.new(:seconds => 14)
  #     assert_equal "14″", d.format("%SP")
  #   end

  #   it "uses a UTF-8 prime for seconds" do
  #     d = Motion::Duration.new(:minutes => 21)
  #     assert_equal "21′", d.format("%MP")
  #   end

  #   it "uses a HTML double prime for seconds" do
  #     d = Motion::Duration.new(:seconds => 14)
  #     assert_equal "14&#8243;", d.format("%SH")
  #   end

  #   it "uses a HTML prime for seconds" do
  #     d = Motion::Duration.new(:minutes => 21)
  #     assert_equal "21&#8242;", d.format("%MH")
  #   end
  # end

  # describe "creation from iso_8601" do
  #   it "should work" do
  #     60.should == Motion::Duration.new("PT1M").to_i
  #     3630.should == Motion::Duration.new("PT1H30S").to_i

  #     duration = Motion::Duration.new(:weeks => 1, :days => 1, :hours => 2, :minutes => 1, :seconds => 2)
  #     duration.should == Motion::Duration.new(duration.iso8601)
  #   end
  # end

  # describe "#iso_6801" do
  #   it "should format seconds" do
  #     d = Motion::Duration.new(:seconds => 1)
  #     assert_equal "PT1S", d.iso8601
  #   end

  #   it "should format minutes" do
  #     d = Motion::Duration.new(:minutes => 1)
  #     assert_equal "PT1M", d.iso8601
  #   end

  #   it "should format hours" do
  #     d = Motion::Duration.new(:hours => 1)
  #     assert_equal "PT1H", d.iso8601
  #   end

  #   it "should format days" do
  #     d = Motion::Duration.new(:days => 1)
  #     assert_equal "P1D", d.iso8601
  #   end

  #   it "should format weeks as ndays" do
  #     d = Motion::Duration.new(:weeks => 1)
  #     assert_equal "P7D", d.iso8601
  #   end

  #   it "should format only with given values" do
  #     d = Motion::Duration.new(:weeks => 1, :days => 2, :hours => 3, :minutes => 4, :seconds => 5)
  #     assert_equal "P9DT3H4M5S", d.iso8601

  #     d = Motion::Duration.new(:weeks => 1, :hours => 2, :seconds => 3)
  #     assert_equal "P7DT2H3S", d.iso8601

  #     d = Motion::Duration.new(:weeks => 1, :days => 2)
  #     assert_equal "P9D", d.iso8601

  #     d = Motion::Duration.new(:hours => 1, :seconds => 30)
  #     assert_equal "PT1H30S", d.iso8601
  #   end

  #   it 'should format empty duration' do
  #     d = Motion::Duration.new(0)
  #     assert_equal 'PT0S', d.iso8601
  #   end

  #   it 'should format negative duration' do
  #     d = Motion::Duration.new(-1)
  #     assert_equal '-PT1S', d.iso8601

  #     d = Motion::Duration.new(-100)
  #     assert_equal '-PT1M40S', d.iso8601
  #   end
  # end

  describe "utilities methods" do
    it "should respond to blank?" do
      Motion::Duration.new.blank?.should == true
      Motion::Duration.new(1).blank?.should == false
    end

    it "should respond to present?" do
      Motion::Duration.new.present?.should == false
      Motion::Duration.new(1).present?.should == true
    end
  end
end
