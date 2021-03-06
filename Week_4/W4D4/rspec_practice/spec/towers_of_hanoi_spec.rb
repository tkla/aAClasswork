require 'towers_of_hanoi'
require 'rspec'

describe "TowerOfHanoi" do 
    subject(:tower_of_hanoi) {TowersOfHanoi.new}
    
    describe "#Initialize" do 
        
        it "Creates 3 arrays" do 
            expect(subject.r1).to eq([3,2,1])
            expect(subject.r2).to eq([])
            expect(subject.r3).to eq([])
        end 
    end

    describe "#won?" do
        it "returns false when game starts" do
            expect(subject.won?).to eq(false)
        end

        it "returns true when all towers except r3 are empty" do
            subject.r3 = subject.r1
            subject.r1 = []
            subject.r2 = []

            expect(subject.won?).to eq(true)
        end
    end

    describe "#play" do
        it "calls #won?" do
            expect(subject).to receive(:won? => true)
            subject.play
        end

        it "calls #get_move" do
            expect(subject).to receive(:get_move => [1, 3])
            subject.play
        end

        it "calls #move" do
            expect(subject).to receive(:move)
            subject.play
        end
    end

    describe "#move" do 
        it "Calls #valid_move?" do 
            expect(subject).to receive(:valid_move?)
            subject.move([1, 2]) 
        end 
    end

    describe "#valid_move?" do
        it "returns false if start tower is empty" do
            expect(subject.valid_move?([2,1])).to eq(false)
        end

        it "returns.." do

        end
    end

end