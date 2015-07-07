# encoding: utf-8

describe Faceter::Nodes::StringifyKeys do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [] }

    let(:input)  { { foo: [{ bar: :BAZ }] }         }
    let(:output) { { "foo" => [{ "bar" => :BAZ }] } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [only: :bar] }

    let(:input)  { { foo: [{ bar: :BAZ }] }         }
    let(:output) { { foo: [{ "bar" => :BAZ }] } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [except: :foo] }

    let(:input)  { { foo: [{ bar: :BAZ }] }         }
    let(:output) { { foo: [{ "bar" => :BAZ }] } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [nested: false] }

    let(:input)  { { foo: [{ bar: :BAZ }] }     }
    let(:output) { { "foo" => [{ bar: :BAZ }] } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [except: :foo, nested: false] }

    let(:input)  { { foo: [{ bar: :BAZ }], qux: :QUX }     }
    let(:output) { { foo: [{ bar: :BAZ }], "qux" => :QUX } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [only: :foo, nested: false] }

    let(:input)  { { foo: [{ bar: :BAZ }], qux: :QUX }     }
    let(:output) { { "foo" => [{ bar: :BAZ }], qux: :QUX } }
  end

end # describe Faceter::Nodes::StringifyKeys
