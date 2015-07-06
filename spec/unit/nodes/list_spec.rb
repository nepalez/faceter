# encoding: utf-8

describe Faceter::Nodes::List do

  before do
    class Faceter::Test::Foo < AbstractMapper::Node
      define_method(:transproc) { Faceter::Functions[:rename_keys, foo: :baz] }
    end

    class Faceter::Test::Bar < AbstractMapper::Node
      define_method(:transproc) { Faceter::Functions[:rename_keys, bar: :qux] }
    end
  end

  let(:foo) { Faceter::Test::Foo.new }
  let(:bar) { Faceter::Test::Bar.new }

  it_behaves_like :creating_immutable_branch do
    let(:attributes) { [] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { []                  }
    let(:block)      { proc { [foo, bar] } }

    let(:input)  { [{ foo: :FOO, bar: :BAR }, { foo: :BAZ, bar: :QUX }] }
    let(:output) { [{ baz: :FOO, qux: :BAR }, { baz: :BAZ, qux: :QUX }] }
  end

end # describe Faceter::Nodes::List
