# encoding: utf-8

describe Faceter::Nodes::Ungroup do

  it_behaves_like :creating_immutable_node do
    let(:attributes) { [from: :baz] }
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [from: :baz] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, bar: :FOO }, { qux: :QUX, foo: :BAR, bar: :BAR }]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [from: :baz, except: []] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, bar: :FOO }, { qux: :QUX, foo: :BAR, bar: :BAR }]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, :bar, from: :baz] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, bar: :FOO }, { qux: :QUX, foo: :BAR, bar: :BAR }]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [:foo, from: :baz] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }]
    end

    let(:output) do
      [
        { qux: :QUX, foo: :FOO, baz: [{ bar: :FOO }] },
        { qux: :QUX, foo: :BAR, baz: [{ bar: :BAR }] }
      ]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [from: :baz, only: :foo] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :FOO, bar: :BAR }] }]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, baz: [{ bar: :FOO }, { bar: :BAR }] }]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [from: :baz, only: [:foo, :bar]] }

    let(:input) do
      [
        {
          qux: :QUX, foo: :QUX,
          baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }]
        }
      ]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, bar: :FOO }, { qux: :QUX, foo: :BAR, bar: :BAR }]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:attributes) { [from: :baz] }

    let(:input) do
      [{ qux: :QUX, baz: [] }]
    end

    let(:output) do
      [{ qux: :QUX }]
    end
  end

end # describe Faceter::Nodes::Ungroup
