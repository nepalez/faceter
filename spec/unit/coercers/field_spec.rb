# encoding: utf-8

describe Faceter::Coercers, ".field" do

  subject { described_class[:field] }

  it "coerces arguments" do
    expect(subject[:baz]).to eq(key: :baz)
  end

end # describe Faceter::Coercers.field
