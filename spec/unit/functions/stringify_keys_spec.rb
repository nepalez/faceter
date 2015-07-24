# encoding: utf-8

describe Faceter::Functions, ".stringify_keys" do

  let(:arguments) { [:stringify_keys] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { { foo: :FOO, foobar: :FOOBAR, bar: :BAR } }
    let(:output) { { "foo" => :FOO, "foobar" => :FOOBAR, "bar" => :BAR } }
  end

end # describe Faceter::Functions.stringify_keys
