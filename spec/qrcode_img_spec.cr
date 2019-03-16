require "./spec_helper"

describe QRcodeImg do
  # TODO: Write tests

  it "works" do
    true.should eq(true)
  end

  it "save a image" do
    qr = QRcodeImg::QRcode.new("大家好！", estimated_size = 720)
    qr.real_size.should eq(714)
    qr.save("spec.png")
  end
end
