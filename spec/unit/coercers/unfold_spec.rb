# encoding: utf-8

describe Faceter::Coercers, ".unfold" do

  subject { described_class[:unfold] }

  it "coerces arguments" do
    expect(subject[from: :baz]).to eq(key: :baz)
  end

end # describe Faceter::Coercers.unfold
