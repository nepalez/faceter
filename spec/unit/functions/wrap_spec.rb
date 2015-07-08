# encoding: utf-8

describe Faceter::Functions, ".wrap" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX }          }
    let(:output) { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, except: []] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX }          }
    let(:output) { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, except: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } }
    let(:output) { { foo: { bar: :BAR, baz: :BAZ, qux: :QUX } }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, except: :bar] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX }          }
    let(:output) { { bar: :BAR, foo: { foo: :FOO, baz: :BAZ, qux: :QUX } } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, except: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } }
    let(:output) { { bar: :BAR, foo: { baz: :BAZ, qux: :QUX } }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, only: []] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } }
    let(:output) { { foo: {}, bar: :BAR, baz: :BAZ, qux: :QUX }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, only: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX }          }
    let(:output) { { foo: { foo: :FOO }, bar: :BAR, baz: :BAZ, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, only: :bar] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX } }
    let(:output) { { foo: { bar: :BAR }, baz: :BAZ, qux: :QUX }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, only: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ, qux: :QUX }          }
    let(:output) { { foo: { foo: :FOO, bar: :BAR }, baz: :BAZ, qux: :QUX } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, only: [:bar]] }

    let(:input)  { { foo: { foo: :FOO, bar: :FOO }, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: { foo: :FOO, bar: :BAR }, baz: :BAZ }            }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:wrap, :foo, except: :foo] }

    let(:input)  { { foo: { foo: :FOO, bar: :FOO }, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: { foo: :FOO, bar: :BAR, baz: :BAZ } }            }
  end

end # describe Faceter::Functions.wrap
