# encoding: utf-8

describe Faceter::Functions, ".group" do

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(only: [:foo, :bar]) }
    let(:arguments) { [:group, :baz, selector] }

    let(:input) do
      [{ foo: :FOO, bar: :FOO, qux: :QUX }, { foo: :BAR, bar: :BAR, qux: :QUX }]
    end

    let(:output) do
      [
        { qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }
      ]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(except: :qux) }
    let(:arguments) { [:group, :baz, selector] }

    let(:input) do
      [{ foo: :FOO, bar: :FOO, qux: :QUX }, { foo: :BAR, bar: :BAR, qux: :QUX }]
    end

    let(:output) do
      [
        { qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }
      ]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(only: [:foo, :bar]) }
    let(:arguments) { [:group, :baz, selector] }

    let(:input) do
      [
        { foo: :FOO, bar: :FOO, baz: :BAZ, qux: :QUX },
        { foo: :BAR, bar: :BAR, baz: :BAZ, qux: :QUX }
      ]
    end

    let(:output) do
      [
        { qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }
      ]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(only: [:foo, :bar]) }
    let(:arguments) { [:group, :baz, selector] }

    let(:input) do
      [
        { foo: :FOO, bar: :FOO, baz: { bar: :BAZ }, qux: :QUX },
        { foo: :BAR, bar: :BAR, baz: { bar: :BAZ }, qux: :QUX }
      ]
    end

    let(:output) do
      [
        { qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }
      ]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(only: [:foo, :bar]) }
    let(:arguments) { [:group, :baz, selector] }

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

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(only: :foo) }
    let(:arguments) { [:group, :bar, selector] }

    let(:input) do
      [
        { foo: :FOO, bar: [{ baz: :FOO }, { baz: :BAR }], qux: :QUX },
        { foo: :BAR, bar: [{ baz: :BAZ }, { baz: :QUX }], qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          bar: [
            { baz: :FOO, foo: :FOO },
            { baz: :BAR, foo: :FOO },
            { baz: :BAZ, foo: :BAR },
            { baz: :QUX, foo: :BAR }
          ]
 }
      ]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(only: [:foo, :baz]) }
    let(:arguments) { [:group, :foo, selector] }

    let(:input) do
      [
        { foo: :FOO, baz: :FOO, qux: :QUX },
        { foo: :BAR, baz: :BAR, qux: :QUX }
      ]
    end

    let(:output) do
      [
        { qux: :QUX, foo: [{ foo: :FOO, baz: :FOO }, { foo: :BAR, baz: :BAR }] }
      ]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(only: :foo) }
    let(:arguments) { [:group, :foo, selector] }

    let(:input) do
      [
        { foo: [{ bar: :FOO }, { baz: :FOO }], qux: :QUX },
        { foo: [{ bar: :BAR }, { baz: :BAR }],  qux: :QUX }
      ]
    end

    let(:output) do
      [
        {
          qux: :QUX,
          foo: [
            { foo: [{ bar: :FOO }, { baz: :FOO }] },
            { foo: [{ bar: :BAR }, { baz: :BAR }] }
          ]
 }
      ]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:selector)  { Selector.new(only: :quxx) }
    let(:arguments) { [:group, :baz, selector] }

    let(:input) do
      [{ foo: :FOO, bar: :FOO, qux: :QUX }, { foo: :BAR, bar: :BAR, qux: :QUX }]
    end

    let(:output) do
      [{ foo: :FOO, bar: :FOO, qux: :QUX }, { foo: :BAR, bar: :BAR, qux: :QUX }]
    end
  end

end # describe Faceter::Functions.group
