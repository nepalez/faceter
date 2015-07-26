# encoding: utf-8

describe Faceter::Coercers, ".create" do

  subject { described_class[:create] }

  it "coerces arguments" do
    expect(subject[:foo, from: :bar]).to eq(name: :foo, keys: :bar)
  end

  it "coerces arguments" do
    expect(subject[:foo, from: [:bar, :baz]])
      .to eq(name: :foo, keys: [:bar, :baz])
  end

end # describe Faceter::Coercers.create
