# encoding: utf-8

describe Faceter::Coercers, ".exclude" do

  subject { described_class[:exclude] }

  it "coerces arguments" do
    expect(subject[:foo]).to eq(
      selector: Selector.new(only: [:foo])
    )
  end

  it "coerces arguments" do
    expect(subject[:foo, :bar]).to eq(
      selector: Selector.new(only: [:foo, :bar])
    )
  end

  it "coerces arguments" do
    expect(subject[only: /foo/]).to eq(
      selector: Selector.new(only: /foo/)
    )
  end

  it "coerces arguments" do
    expect(subject[except: /foo/]).to eq(
      selector: Selector.new(except: /foo/)
    )
  end

end # describe Faceter::Coercers.exclude
