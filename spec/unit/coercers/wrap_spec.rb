# encoding: utf-8

describe Faceter::Coercers, ".wrap" do

  subject { described_class[:wrap] }

  it "coerces arguments" do
    expect(subject[to: :baz]).to eq(
      key: :baz,
      selector: Selector::ANYTHING
    )
  end

  it "coerces arguments" do
    expect(subject[:foo, :bar, to: :baz]).to eq(
      key: :baz,
      selector: Selector.new(only: [:foo, :bar])
    )
  end

  it "coerces arguments" do
    expect(subject[to: :baz, only: /foo/]).to eq(
      key: :baz,
      selector: Selector.new(only: /foo/)
    )
  end

  it "coerces arguments" do
    expect(subject[to: :baz, except: /foo/]).to eq(
      key: :baz,
      selector: Selector.new(except: /foo/)
    )
  end

end # describe Faceter::Coercers.wrap
