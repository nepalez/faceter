# encoding: utf-8

describe Faceter::Functions, ".wrap" do

  let(:arguments) { [:wrap, :foo, Selector.new(options)] }
  let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } }

  it_behaves_like :transforming_immutable_data do
    let(:options) { {} }
    let(:output) { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: [] } }
    let(:output) { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: :foo } }
    let(:output) { { foo: { bar: :BAR, baz: :BAZ, qux: :QUX } }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: :bar } }
    let(:output) { { bar: :BAR, foo: { foo: :FOO, baz: :BAZ, qux: :QUX } } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: [:foo, :bar] } }
    let(:output) { { bar: :BAR, foo: { baz: :BAZ, qux: :QUX } }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: [] } }
    let(:output) { { foo: {}, bar: :BAR, baz: :BAZ, qux: :QUX }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: :foo } }
    let(:output) { { foo: { foo: :FOO }, bar: :BAR, baz: :BAZ, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: :bar } }
    let(:output) { { foo: { bar: :BAR }, baz: :BAZ, qux: :QUX }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: [:foo, :bar] } }
    let(:output) { { foo: { foo: :FOO, bar: :BAR }, baz: :BAZ, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { only: [:bar] } }

    let(:input)  { { foo: { foo: :FOO, bar: :FOO }, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: { foo: :FOO, bar: :BAR }, baz: :BAZ }            }
  end

  it_behaves_like :transforming_immutable_data do
    let(:options) { { except: :foo } }

    let(:input)  { { foo: { foo: :FOO, bar: :FOO }, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ } }            }
  end

end # describe Faceter::Functions.wrap
