# encoding: utf-8

describe Faceter::Coercers, ".rename" do

  subject { described_class[:rename] }

  it "coerces arguments" do
    expect(subject[:foo, to: :bar]).to eq(keys: { foo: :bar })
  end

end # describe Faceter::Coercers.rename
