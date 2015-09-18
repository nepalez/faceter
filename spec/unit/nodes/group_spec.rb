# encoding: utf-8

describe Faceter::Nodes::Group do

  let(:attributes) { { key: :baz, selector: selector } }
  let(:selector)   { Selector.new(options) }

  it_behaves_like :creating_immutable_node do
    let(:options) { {} }
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :bar] } }

    let(:input) do
      [
        { foo: :FOO, bar: :FOO, qux: :QUX },
        { foo: :BAR, bar: :BAR, qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }]
 }
      ]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :bar] } }

    let(:input) do
      [
        { foo: :FOO, bar: :FOO, baz: :BAZ, qux: :QUX },
        { foo: :BAR, bar: :BAR, baz: :BAZ, qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }]
 }
      ]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :bar] } }

    let(:input) do
      [
        { foo: :FOO, bar: :FOO, baz: { bar: :BAZ }, qux: :QUX },
        { foo: :BAR, bar: :BAR, baz: { bar: :BAZ }, qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }]
 }
      ]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :bar] } }

    let(:input) do
      [
        { foo: :FOO, bar: :FOO, baz: [{ baz: :BAZ }], qux: :QUX },
        { foo: :BAR, bar: :BAR, baz: [{ baz: :BAZZ }], qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          baz: [
            { foo: :FOO, bar: :FOO, baz: :BAZ },
            { foo: :BAR, bar: :BAR, baz: :BAZZ }
          ]
 }
      ]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: :foo } }

    let(:input) do
      [
        { foo: :FOO, baz: [{ baz: :FOO }, { baz: :BAR }], qux: :QUX },
        { foo: :BAR, baz: [{ baz: :BAZ }, { baz: :QUX }], qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          baz: [
            { baz: :FOO, foo: :FOO },
            { baz: :BAR, foo: :FOO },
            { baz: :BAZ, foo: :BAR },
            { baz: :QUX, foo: :BAR }
          ]
 }
      ]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: [:foo, :baz] } }

    let(:input) do
      [
        { foo: :FOO, baz: :FOO, qux: :QUX },
        { foo: :BAR, baz: :BAR, qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          baz: [{ foo: :FOO, baz: :FOO }, { foo: :BAR, baz: :BAR }]
 }
      ]
    end
  end

  it_behaves_like :mapping_immutable_input do
    let(:options) { { only: :baz } }

    let(:input) do
      [
        { baz: [{ bar: :FOO }, { baz: :FOO }], qux: :QUX },
        { baz: [{ bar: :BAR }, { baz: :BAR }],  qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          baz: [
            { baz: [{ bar: :FOO }, { baz: :FOO }] },
            { baz: [{ bar: :BAR }, { baz: :BAR }] }
          ]
 }
      ]
    end
  end

end # describe Faceter::Nodes::Group
