# encoding: utf-8

describe Faceter::Functions, ".clean" do

  let(:arguments) { [:clean, Selector.new(options)] }
  let(:input)     { { foo: { foo: :FOO }, bar: {}, baz: {}, qux: :QUX } }

  it_behaves_like :transforming_immutable_data do
    let(:options) { {} }
    let(:output) { { foo: { foo: :FOO }, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: [:foo, :bar] } }
    let(:output) { { foo: { foo: :FOO }, baz: {}, qux: :QUX } }
  end

end # describe Faceter::Functions.clean
