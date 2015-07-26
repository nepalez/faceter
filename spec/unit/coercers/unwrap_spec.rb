# encoding: utf-8

describe Faceter::Coercers, ".unwrap" do

  subject { described_class[:unwrap] }

  it "coerces arguments" do
    expect(subject[from: :baz]).to eq(
      key: :baz,
      selector: Selector::ANYTHING
    )
  end

  it "coerces arguments" do
    expect(subject[:foo, :bar, from: :baz]).to eq(
      key: :baz,
      selector: Selector.new(only: [:foo, :bar])
    )
  end

  it "coerces arguments" do
    expect(subject[from: :baz, only: /foo/]).to eq(
      key: :baz,
      selector: Selector.new(only: /foo/)
    )
  end

  it "coerces arguments" do
    expect(subject[from: :baz, except: /foo/]).to eq(
      key: :baz,
      selector: Selector.new(except: /foo/)
    )
  end

end # describe Faceter::Coercers.unwrap
