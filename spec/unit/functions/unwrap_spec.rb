# encoding: utf-8

describe Faceter::Functions, ".unwrap" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo] }

    let(:input)  { { bar: :BAR, baz: :BAZ, qux: :QUX } }
    let(:output) { { bar: :BAR, baz: :BAZ, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX }          }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo, except: []] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX }          }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo, except: :foo] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: { foo: :FOO }, bar: :BAR, baz: :BAZ, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo, except: :bar] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: :FOO, baz: :BAZ, qux: :QUX }                     }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo, except: [:foo, :bar]] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: { foo: :FOO, bar: :BAR }, baz: :BAZ, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo, only: []] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo, only: :foo] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: :FOO, qux: :QUX }                                }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo, only: :bar] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: { foo: :FOO, baz: :BAZ }, bar: :BAR, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:unwrap, :foo, only: [:foo, :bar]] }

    let(:input)  { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ }, qux: :QUX } }
    let(:output) { { foo: :FOO, bar: :BAR, qux: :QUX }                     }
  end

end # describe Faceter::Functions.unwrap
