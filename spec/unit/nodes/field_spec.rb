# encoding: utf-8

describe Faceter::Nodes::Field do

  before do
    class Faceter::Test::Foo < AbstractMapper::AST::Node
      define_method(:transproc) { Faceter::Functions[:rename_keys, foo: :baz] }
    end

    class Faceter::Test::Bar < AbstractMapper::AST::Node
      define_method(:transproc) { Faceter::Functions[:rename_keys, bar: :qux] }
    end
  end

  let(:foo) { Faceter::Test::Foo.new }
  let(:bar) { Faceter::Test::Bar.new }

  it_behaves_like :creating_immutable_branch do
    let(:attributes) { { key: :foo } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { { key: :baz } }
    let(:block)      { proc { [foo, bar] } }

    let(:input)  { { baz: { foo: :FOO, bar: :BAR } } }
    let(:output) { { baz: { baz: :FOO, qux: :BAR } } }
  end

end # describe Faceter::Nodes::Field
