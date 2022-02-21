require 'game'

describe Game do
  describe "#play_x" do
    it "x can claim a field on the 3x3 grid" do
      subject.play_x(0, 0)
      expect(subject.grid[0][0]).to eq "X"
    end
  end

  describe "#play_o" do
    it "o can claim a field on the 3x3 grid" do
      subject.play_o(0, 0)
      expect(subject.grid[0][0]).to eq "O"
    end
  end

  describe "#play_turn" do
    it "x and o take turns to play" do
      subject.play_turn(0, 0)
      subject.play_turn(0, 1)
      expect(subject.grid[0][0]).to eq "X"
      expect(subject.grid[0][1]).to eq "O"
    end
  end
end