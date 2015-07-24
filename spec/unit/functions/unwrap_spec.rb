# encoding: utf-8

describe Faceter::Functions, ".unwrap" do

  let(:arguments) { [:unwrap, :foo, Selector.new(options)] }
  let(:input)     { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: {} } }

  it_behaves_like :transforming_immutable_data do
    let(:options) { {} }
    let(:output)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: {} } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: :foo } }
    let(:output)  { { foo: { foo: :FOO }, bar: :BAR, baz: :BAZ, qux: {} } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: :bar } }
    let(:output)  { { foo: :FOO, baz: :BAZ, qux: {} } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: [:foo, :bar] } }
    let(:output)  { { foo: { foo: :FOO, bar: :BAR }, baz: :BAZ, qux: {} } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: [] } }
    let(:output)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: {} } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: :foo } }
    let(:output)  { { foo: :FOO, qux: {} } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { {} }
    let(:input)   { { foo: { bar: :BAR }, qux: {} } }
    let(:output)  { { bar: :BAR, qux: {} } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: :bar } }
    let(:output)  { { foo: { foo: :FOO, baz: :BAZ }, bar: :BAR, qux: {} } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: [:foo, :bar] } }
    let(:output)  { { foo: :FOO, bar: :BAR, qux: {} } }
  end

end # describe Faceter::Functions.unwrap
