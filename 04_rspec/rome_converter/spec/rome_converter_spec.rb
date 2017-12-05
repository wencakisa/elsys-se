require 'rome_converter'

RSpec.describe RomeConverter do
  let(:converter) { RomeConverter.new }

  describe '#to_roman' do
    it "returns empty string on 0" do
      expect(converter.to_roman 0).to eq ''
    end

    it "converts 1 to 'I'" do
      expect(converter.to_roman 1).to eq 'I'
    end

    it "converts 2 to 'II'" do
      expect(converter.to_roman 2).to eq 'II'
    end

    it "converts 3 to 'III'" do
      expect(converter.to_roman 3).to eq 'III'
    end

    it "converts 4 to 'IV'" do
      expect(converter.to_roman 4).to eq 'IV'
    end

    it "converts 5 to 'V'" do
      expect(converter.to_roman 5).to eq 'V'
    end

    it "converts 9 to 'IX'" do
      expect(converter.to_roman 9).to eq 'IX'
    end

    it "converts 10 to 'X'" do
      expect(converter.to_roman 10).to eq 'X'
    end

    it "converts 40 to 'XL'" do
      expect(converter.to_roman 40).to eq 'XL'
    end

    it "converts 50 to 'L'" do
      expect(converter.to_roman 50).to eq 'L'
    end

    it "converts 90 to 'XC'" do
      expect(converter.to_roman 90).to eq 'XC'
    end

    it "converts 100 to 'C'" do
      expect(converter.to_roman 100).to eq 'C'
    end

    it "converts 400 to 'CD'" do
      expect(converter.to_roman 400).to eq 'CD'
    end

    it "converts 500 to 'D'" do
      expect(converter.to_roman 500).to eq 'D'
    end

    it "converts 900 to 'CM'" do
      expect(converter.to_roman 900).to eq 'CM'
    end

    it "converts 1000 to 'M'" do
      expect(converter.to_roman 1000).to eq 'M'
    end

    it "converts 2017 to 'MMXVII'" do
      expect(converter.to_roman 2017).to eq 'MMXVII'
    end
  end

  describe '#to_dec' do
    it "returns 0 on empty string" do
      expect(converter.to_dec '').to eq 0
    end

    it "converts 'I' to 1" do
      expect(converter.to_dec 'I').to eq 1
    end

    it "converts 'II' to 2" do
      expect(converter.to_dec 'II').to eq 2
    end

    it "converts 'III' to 3" do
      expect(converter.to_dec 'III').to eq 3
    end

    it "converts 'IV' to 4" do
      expect(converter.to_dec 'IV').to eq 4
    end

    it "converts 'V' to 5" do
      expect(converter.to_dec 'V').to eq 5
    end

    it "converts 'IX' to 9" do
      expect(converter.to_dec 'IX').to eq 9
    end

    it "converts 'X' to 10" do
      expect(converter.to_dec 'IX').to eq 10
    end

    it "converts 'XL' to 40" do
      expect(converter.to_dec 'XL').to eq 40
    end

    it "converts 'L' to 50" do
      expect(converter.to_dec 'L').to eq 50
    end

    it "converts 'XC' to 90" do
      expect(converter.to_dec 'XC').to eq 90
    end

    it "converts 'C' to 100" do
      expect(converter.to_dec 'C').to eq 100
    end

    it "converts 'CD' to 400" do
      expect(converter.to_dec 'CD').to eq 400
    end

    it "converts 'D' to 500" do
      expect(converter.to_dec 'D').to eq 500
    end

    it "converts 'CM' to 900" do
      expect(converter.to_dec 'CM').to eq 900
    end

    it "converts 'M' to 1000" do
      expect(converter.to_dec 'M').to eq 1000
    end

    it "converts 'MMXVII' to 2017" do
      expect(converter.to_dec 'MMXVII').to eq 2017
    end
  end
end
