require "./spec_helper"

include Tds::Core

DATA = Bytes[0x12, 0x01, 0x00, 0x3a, 0x00, 0x00, 0x00, 0x00, 
0x00, 0x00, 0x1a, 0x00, 0x06, 0x01, 0x00, 0x20, 
0x00, 0x01, 0x02, 0x00, 0x21, 0x00, 0x0c, 0x03, 
0x00, 0x2d, 0x00, 0x04, 0x04, 0x00, 0x31, 0x00, 
0x01, 0xff, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 
0x00, 0x4d, 0x53, 0x53, 0x51, 0x4c, 0x53, 0x65, 
0x72, 0x76, 0x65, 0x72, 0x00, 0x00, 0x00, 0x00, 
0x01, 0x00 ]

describe Tds::Core do

  it "pre login is correct" do
    io = IO::Memory.new()
    send_pre_login(io, process_id = 1_u32 )
    io.to_slice[0,io.pos].should eq DATA
  end

  it "reads pre login correct" do 
    io = IO::Memory.new(DATA[8..-1])
    info = PreLoginInfo.from_io(io)
    info.force_encryption.should be_false
    info.instance.should eq "MSSQLServer"
  end
end
