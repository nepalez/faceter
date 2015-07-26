# encoding: utf-8

describe Faceter::Coercers, ".fold" do

  subject { described_class[:fold] }

  it "coerces arguments" do
    expect(subject[to: :baz]).to eq(key: :baz)
  end

end # describe Faceter::Coercers.fold
