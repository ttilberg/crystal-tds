require "./spec_helper"
require "big"

describe TDS::Decoders do
  it "TINYINT" do
    DATABASE.query "SELECT @@MAX_PRECISION, @@MAX_PRECISION" { |rs| rs.each.map { |rs| rs.read(Int8); rs.read(Int8) }.first }.should eq 38
  end

  it "TINYINT" do
    DATABASE.query "SELECT CAST(1 as TINYINT)" { |rs| rs.each.map { |rs| rs.read(Int8) }.first }.should eq 1
  end

  it "TINYINT NULL" do
    DATABASE.query "SELECT CAST(NULL as TINYINT)" { |rs| rs.each.map { |rs| rs.read(Int8?) }.first }.should eq nil
  end

  it "SMALLINT" do
    DATABASE.query "SELECT CAST(1 as SMALLINT)" { |rs| rs.each.map { |rs| rs.read(Int16) }.first }.should eq 1
  end

  it "SMALLINT NULL" do
    DATABASE.query "SELECT CAST(NULL as SMALLINT)" { |rs| rs.each.map { |rs| rs.read(Int16?) }.first }.should eq nil
  end

  it "INT" do
    DATABASE.query "SELECT CAST(1 as INT)" { |rs| rs.each.map { |rs| rs.read(Int32) }.first }.should eq 1
  end

  it "INT NULL" do
    DATABASE.query "SELECT CAST(NULL as INT)" { |rs| rs.each.map { |rs| rs.read(Int32?) }.first }.should eq nil
  end

  it "BIGINT" do
    DATABASE.query "SELECT CAST(1 as BIGINT)" { |rs| rs.each.map { |rs| rs.read(Int64) }.first }.should eq 1
  end

  it "BIGINT NULL" do
    DATABASE.query "SELECT CAST(NULL as BIGINT)" { |rs| rs.each.map { |rs| rs.read(Int64?) }.first }.should eq nil
  end

  it "DECIMAL" do
    DATABASE.query "SELECT CAST(1.23 as DECIMAL(10,2))" { |rs| rs.each.map { |rs| rs.read(BigDecimal) }.first }.should eq BigDecimal.new(123, 2)
  end

  it "DECIMAL NULL" do
    DATABASE.query "SELECT CAST(NULL as DECIMAL(10,2))" { |rs| rs.each.map { |rs| rs.read(BigDecimal?) }.first }.should eq nil
  end

  it "FLOAT" do
    DATABASE.query "SELECT CAST(1.23 as FLOAT)" { |rs| rs.each.map { |rs| rs.read(Float64) }.first }.should eq 1.23
  end

  it "FLOAT NULL" do
    DATABASE.query "SELECT CAST(NULL as FLOAT)" { |rs| rs.each.map { |rs| rs.read(Float64?) }.first }.should eq nil
  end

  it "REAL" do
    DATABASE.query "SELECT CAST(1.23 as REAL)" { |rs| rs.each.map { |rs| rs.read(Float32) }.first }.should eq 1.23_f32
  end

  it "REAL NULL" do
    DATABASE.query "SELECT CAST(NULL as REAL)" { |rs| rs.each.map { |rs| rs.read(Float32?) }.first }.should eq nil
  end

  it "VARCHAR" do
    DATABASE.query "SELECT CAST('üätest' as VARCHAR)" { |rs| rs.each.map { |rs| rs.read(String) }.first }.should eq "üätest"
  end

  it "VARCHAR NULL" do
    DATABASE.query "SELECT CAST(NULL as VARCHAR)" { |rs| rs.each.map { |rs| rs.read(String?) }.first }.should eq nil
  end

  it "NVARCHAR" do
    DATABASE.query "SELECT CAST('üätest' as NVARCHAR)" { |rs| rs.each.map { |rs| rs.read(String) }.first }.should eq "üätest"
  end

  it "NVARCHAR NULL" do
    DATABASE.query "SELECT CAST(NULL as NVARCHAR)" { |rs| rs.each.map { |rs| rs.read(String?) }.first }.should eq nil
  end

  it "DATE" do
    DATABASE.query "SELECT CONVERT(DATE,'2020-01-01')" { |rs| rs.each.map { |rs| rs.read(String) }.first }.should eq "2020-01-01"
  end

  it "DATETIME" do
    DATABASE.query "SELECT CONVERT(DATETIME,'2020-01-01')" { |rs| rs.each.map { |rs| rs.read(Time) }.first }.should eq Time.utc(2020, 1, 1)
  end

  it "DATETIME NULL" do
    DATABASE.query "SELECT CONVERT(DATETIME,NULL)" { |rs| rs.each.map { |rs| rs.read(Time?) }.first }.should eq nil
  end

  it "DATETIME2" do
    DATABASE.query "SELECT CONVERT(DATETIME2,'2020-01-01')" { |rs| rs.each.map { |rs| rs.read(String) }.first }.should eq "2020-01-01 00:00:00.0000000"
  end

  it "SMALLDATETIME" do
    DATABASE.query "SELECT CONVERT(SMALLDATETIME,'2020-01-01')" { |rs| rs.each.map { |rs| rs.read(Time) }.first }.should eq Time.utc(2020, 1, 1)
  end

  it "SMALLDATETIME NULL" do
    DATABASE.query "SELECT CONVERT(SMALLDATETIME,NULL)" { |rs| rs.each.map { |rs| rs.read(Time?) }.first }.should eq nil
  end

  it "TEXT" do
    DATABASE.query "SELECT CAST('üätest' as TEXT)" { |rs| rs.each.map { |rs| rs.read(String) }.first }.should eq "üätest"
  end

  it "TEXT NULL" do
    DATABASE.query "SELECT CAST(NULL as TEXT)" { |rs| rs.each.map { |rs| rs.read(String?) }.first }.should eq nil
  end

  it "NTEXT" do
    DATABASE.query "SELECT CAST('üätest' as NTEXT)" { |rs| rs.each.map { |rs| rs.read(String) }.first }.should eq "üätest"
  end

  it "NTEXT NULL" do
    DATABASE.query "SELECT CAST(NULL as NTEXT)" { |rs| rs.each.map { |rs| rs.read(String?) }.first }.should eq nil
  end
end