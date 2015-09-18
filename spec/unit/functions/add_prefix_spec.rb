# encoding: utf-8

describe Faceter::Functions, ".add_prefix" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:add_prefix, "foo", "."] }

    let(:input)  { "bar" }
    let(:output) { "foo.bar" }
  end

end # describe Faceter::Functions.add_prefix
