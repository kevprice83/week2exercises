# OC2. Money, money, money

# We were going back home yesterday. Second week, Monday, rain, new teacher... But just before getting into the subway, we found a bag full of
# money in different currencies! So we skipped TV shows for now (we’ll be back sometime, don’t worry!) because, don’t know why, we were
# suddenly interested in money.

# So we got to our local dealer, knowing that either way he will have a cut of the deal, but anyway we asked him about the current rates.
# And instead of using his services, we decided we wanted to get home, and write an awesome currency converter so we could know how much
# money was in the bag.

# Let’s do it now!

# You already have a little skeleton class with currency exchanges from and to €. Note that converting from/to € is direct, but if none
# of the from/to currencies is the € you have to do two conversions, using the € as a bridge.

# The only condition is: write ALL the tests first. Go full TDD on it. Yeah, all tests first. All of them. Yeah, every single one. Every.
# Single. One. Got it? One more time: every single one. And then, when everything is failing and so on... go implement it.

# Feel free to add support for your country currency! :)
require 'rspec'

class TheBanker
  TO_EURO = {
    usd: 0.77818,
    gbp: 1.27341,
    cad: 0.70518,
    aud: 0.69052,
    eur: 1
  }

  FROM_EURO = {
    usd: 1.28356,
    gbp: 0.78478,
    cad: 1.41613,
    aud: 1.44651,
    eur: 1
  }

  def convert(amount, from_currency, to_currency)
   convert = TO_EURO[from_currency.to_sym] * FROM_EURO[to_currency.to_sym] * amount
    convert.round(2)
  end
end



describe "Banker" do
  before do 
    @converter = TheBanker.new
  end

  describe "#convert" do

    it "should convert 100 usd to 61.14 gbp" do
    expect(@converter.convert(100, :usd, :gbp)).to eq(61.14)
    end

    it "should convert 100 usd to 110.32 cad" do
    expect(@converter.convert(100, :usd, :cad)).to eq(110.32)
    end

    it "should convert 100 usd to 112.69 aud" do
    expect(@converter.convert(100, :usd, :aud)).to eq(112.69)
    end

    it "should convert 100 usd to 77.818 eur" do
    expect(@converter.convert(100, :usd, :eur)).to eq(77.81)
    end

    it "should convert 100 gbp to 163.56 usd" do
    expect(@converter.convert(100, :gbp, :usd)).to eq(163.56)
    end

    it "should convert 100 gbp to 180.449 cad" do
    expect(@converter.convert(100, :gbp, :cad)).to eq(180.44)
    end

    it "should convert 100 gbp to 184.32 aud" do
    expect(@converter.convert(100, :gbp, :aud)).to eq(184.32)
    end

    it "should convert 100 gbp to 127.341 eur" do
    expect(@converter.convert(100, :gbp, :eur)).to eq(127.34)
    end

    it "should convert 100 cad to 102.15 aud" do
    expect(@converter.convert(100, :cad, :aud)).to eq(102.15)
    end

    it "should convert 100 cad to 90.645 usd" do
    expect(@converter.convert(100, :cad, :usd)).to eq(90.64)
    end

    it "should convert 100 cad to 55.40 gbp" do
    expect(@converter.convert(100, :cad, :gbp)).to eq(55.40)
    end

    it "should convert 100 cad to 70.518 eur" do
    expect(@converter.convert(100, :cad, :eur)).to eq(70.51)
    end

    it "should convert 100 aud to 88.739 usd" do
    expect(@converter.convert(100, :aud, :usd)).to eq(88.73)
    end

    it "should convert 100 aud to 97.90 cad" do
    expect(@converter.convert(100, :aud, :cad)).to eq(97.90)
    end

    it "should convert 100 aud to 54.25 gbp" do
    expect(@converter.convert(100, :aud, :gbp)).to eq(54.25)
    end

    it "should convert 100 aud to 69.052 eur" do
    expect(@converter.convert(100, :aud, :eur)).to eq(69.05)
    end

    it "should convert 100 eur to 78.478 gbp" do
    expect(@converter.convert(100, :eur, :gbp)).to eq(78.47)
    end

    it "should convert 100 eur to 141.613 cad" do
    expect(@converter.convert(100, :eur, :cad)).to eq(141.61)
    end

    it "should convert 100 eur to 144.651 aud" do
    expect(@converter.convert(100, :eur, :aud)).to eq(144.65)
    end

    it "should convert 100 eur to 128.356 usd" do
      expect(@converter.convert(100, :eur, :usd)).to eq(128.35)
    end
  end
end