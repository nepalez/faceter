# encoding: utf-8

describe Faceter::Functions, ".split" do

  let(:arguments) { [:split, Selector.new(options)] }
  let(:input)     { { foo: :FOO, bar: :BAR, baz: :BAZ } }

  it_behaves_like :transforming_immutable_data do
    let(:options) { {} }
    let(:output) { [{ foo: :FOO, bar: :BAR, baz: :BAZ }, {}] }
  end

  # :only

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: [] } }
    let(:output) { [{}, { foo: :FOO, bar: :BAR, baz: :BAZ }] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: :qux } }
    let(:output) { [{}, { foo: :FOO, bar: :BAR, baz: :BAZ }] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: :foo } }
    let(:output) { [{ foo: :FOO }, { bar: :BAR, baz: :BAZ }] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: [:foo, :bar, :qux] } }
    let(:output) { [{ foo: :FOO, bar: :BAR }, { baz: :BAZ }] }
  end

  # :except

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: [] } }
    let(:output) { [{ foo: :FOO, bar: :BAR, baz: :BAZ }, {}] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: :qux } }
    let(:output) { [{ foo: :FOO, bar: :BAR, baz: :BAZ }, {}] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: :foo } }
    let(:output) { [{ bar: :BAR, baz: :BAZ }, { foo: :FOO }] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: [:foo, :bar, :qux] } }
    let(:output) { [{ baz: :BAZ }, { foo: :FOO, bar: :BAR }] }
  end

  # :except and :only

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: /z/, only: /b/ } }
    let(:output) { [{ bar: :BAR }, { foo: :FOO, baz: :BAZ }] }
  end

end # describe Faceter::Functions.split
