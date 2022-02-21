require 'game'

describe Game do
  describe "#play_x" do
    it "x can claim a field on the 3x3 grid" do
      subject.play_x(0, 0)
      expect(subject.grid[0][0]).to eq "X"
    end
  end
end