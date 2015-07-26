# encoding: utf-8

describe Faceter::Coercers, ".prefix" do

  subject { described_class[:prefix] }

  it "coerces arguments" do
    expect(subject[:foo]).to eql(
      prefix: :foo,
      separator: "_",
      nested: false,
      selector: nil
    )
  end

  it "coerces arguments" do
    attributes = subject[:foo, separator: ".", nested: true, only: /foo/]

    expect(attributes).to eq(
      prefix: :foo,
      separator: ".",
      nested: true,
      selector: Selector.new(only: /foo/)
    )
  end

  it "coerces arguments" do
    attributes = subject[:foo, separator: ".", nested: true, except: /foo/]

    expect(attributes).to eq(
      prefix: :foo,
      separator: ".",
      nested: true,
      selector: Selector.new(except: /foo/)
    )
  end

end # describe Faceter::Coercers.prefix
