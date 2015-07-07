# encoding: utf-8

describe Faceter::Functions, ".drop_prefix" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:drop_prefix, "foo", "."] }

    let(:input)  { "foo.bar" }
    let(:output) { "bar"     }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:drop_prefix, "foo", "."] }

    let(:input)  { "foo." }
    let(:output) { ""     }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:drop_prefix, "foo", "."] }

    let(:input)  { "baz_bar" }
    let(:output) { "baz_bar" }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:drop_prefix, "foo", "."] }

    let(:input)  { :foo_bar  }
    let(:output) { "foo_bar" }
  end

end # describe Faceter::Functions.drop_prefix
