# encoding: utf-8

describe Faceter::Functions, ".claster" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:claster, -> v { v.class }] }

    let(:input)  { [:foo, :bar, "foo", :bar, :baz] }
    let(:output) { [[:foo, :bar], ["foo"], [:bar, :baz]] }
  end

end # describe Faceter::Functions.claster
