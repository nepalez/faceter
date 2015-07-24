# encoding: utf-8

describe Faceter::Functions, ".symbolize_keys" do

  let(:arguments) { [:symbolize_keys] }

  it_behaves_like :transforming_immutable_data do
    let(:input)  { { "foo" => :FOO, "foobar" => :FOOBAR, 1 => :BAR } }
    let(:output) { { foo: :FOO, foobar: :FOOBAR, "1": :BAR } }
  end

end # describe Faceter::Functions.symbolize_keys
