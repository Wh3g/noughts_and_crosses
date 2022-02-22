require 'game'

describe Game do
  describe "#play_turn" do
    it "x can claim a field on the 3x3 grid" do
      subject.play_turn(0, 0)
      expect(subject.grid[0][0]).to eq :x
    end

    it "o can claim a field on the 3x3 grid" do
      subject.switch_turn
      subject.play_turn(0, 0)
      expect(subject.grid[0][0]).to eq :o
    end

    it "x and o take turns to play" do
      subject.play_turn(0, 0)
      subject.play_turn(0, 1)
      expect(subject.grid[0][0]).to eq :x
      expect(subject.grid[0][1]).to eq :o
    end

    it "cannot claim a field that is already been taken" do
      subject.play_turn(0, 0)
      expect{ subject.play_turn(0, 0) }.to raise_error "this square is taken"
    end

    it "declares winner when player claims row" do
      subject.play_turn(0, 0)
      subject.switch_turn
      subject.play_turn(0, 1)
      subject.switch_turn
      subject.play_turn(0, 2)
      expect(subject.winner).to eq :x
    end
    it "declares winner when player claims column" do
      subject.play_turn(0, 0)
      subject.switch_turn
      subject.play_turn(1, 0)
      subject.switch_turn
      subject.play_turn(2, 0)
      expect(subject.winner).to eq :x
    end
  end
end