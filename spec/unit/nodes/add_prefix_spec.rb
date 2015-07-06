# encoding: utf-8

describe Faceter::Nodes::AddPrefix do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { ["foo"] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo"] }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } }         }
    let(:output) { { foo_bar: "BAR", "foo_baz" => { qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", separator: "."] }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } }              }
    let(:output) { { :"foo.bar" => "BAR", "foo.baz" => { qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", only: :bar] }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } }     }
    let(:output) { { foo_bar: "BAR", "baz" => { qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", except: "baz"] }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } }     }
    let(:output) { { foo_bar: "BAR", "baz" => { qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", nested: true] }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } }             }
    let(:output) { { foo_bar: "BAR", "foo_baz" => { foo_qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", except: [:bar, "baz"], nested: true] }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } }     }
    let(:output) { { bar: "BAR", "baz" => { foo_qux: :QUX } } }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { ["foo", only: [:qux], nested: true] }

    let(:input)  { { bar: "BAR", "baz" => { qux: :QUX } }     }
    let(:output) { { bar: "BAR", "baz" => { foo_qux: :QUX } } }
  end

end # describe Faceter::Nodes::AddPrefix
