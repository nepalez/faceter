# encoding: utf-8

describe Faceter::Functions, ".ungroup" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:ungroup, :baz] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, bar: :FOO }, { qux: :QUX, foo: :BAR, bar: :BAR }]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:ungroup, :baz, except: []] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, bar: :FOO }, { qux: :QUX, foo: :BAR, bar: :BAR }]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:ungroup, :baz, only: [:foo, :bar]] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :BAR, bar: :BAR }] }]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, bar: :FOO }, { qux: :QUX, foo: :BAR, bar: :BAR }]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:ungroup, :baz, only: :foo] }

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

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:ungroup, :baz, only: :foo] }

    let(:input) do
      [{ qux: :QUX, baz: [{ foo: :FOO, bar: :FOO }, { foo: :FOO, bar: :BAR }] }]
    end

    let(:output) do
      [{ qux: :QUX, foo: :FOO, baz: [{ bar: :FOO }, { bar: :BAR }] }]
    end
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:ungroup, :baz, only: [:foo, :bar]] }

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

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:ungroup, :baz] }

    let(:input) do
      [{ qux: :QUX, baz: [] }]
    end

    let(:output) do
      [{ qux: :QUX }]
    end
  end

end # describe Faceter::Functions.ungroup
