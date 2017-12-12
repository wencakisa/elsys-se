require 'RSA'

RSpec.describe RSA do
  let(:keys)    { RSA.new_key }
  let(:rsa)     { RSA.new(*keys) }
  let(:message) { "Hello World" }

  context "#new_key" do
    it "generates integer array" do
      expect(keys).to all be_an(Integer)
    end

    it "generates array with three elements" do
      expect(keys.size).to eq 3
    end
  end

  context "attribute readers" do
    it "returns n" do
      expect(rsa.n).to eq keys[0]
    end

    it "returns e" do
      expect(rsa.e).to eq keys[1]
    end

    it "returns d" do
      expect(rsa.d).to eq keys[2]
    end
  end

  context "#encrypt" do
    it "returns a string" do
      expect(rsa.encrypt message).to be_an String
    end

    it "returns a string with the same length as the provided" do
      # As long as I use a delimiter, code will be awful :/
      encrypted_string = rsa.encrypt(message).split RSA::DELIMITER
      expect(encrypted_string.size).to eq message.size
    end

    it "returns a string different from the provided" do
      expect(rsa.encrypt message).to_not eq message
    end
  end

  context "#decrypt" do
    it "returns a string" do
      expect(rsa.decrypt message).to be_an String
    end

    it "returns a string different from the provided" do
      expect(rsa.decrypt(message)).to_not eq message
    end

    it "decrypts encrypted message back to original one" do
      expect(rsa.decrypt(rsa.encrypt message)).to eq message
    end
  end
end
