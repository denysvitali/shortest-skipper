require "./spec_helper"

describe Shortest::Skipper do
  # TODO: Write tests

  it "should return an url" do
    skipped = Shortest::Skipper::Skipper.skip "http://viid.me/qq0BOa"

    if skipped.is_a? Shortest::Skipper::Skipper::Result
      skipped.destinationUrl.should eq("https://goo.gl/FPLJ0B")
    end
  end
end
