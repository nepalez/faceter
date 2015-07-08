# encoding: utf-8

describe Faceter::Functions, ".sub" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR, baz: :BAZ } }
  end

  # :only

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, only: []] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { {}                                  }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, only: :qux] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { {}                                  }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, only: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO }                       }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, only: [:foo, :bar, :qux]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR }            }
  end

  # :except

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, except: []] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR, baz: :BAZ } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, except: :qux] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR, baz: :BAZ } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, except: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { bar: :BAR, baz: :BAZ }            }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, except: [:foo, :bar, :qux]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { baz: :BAZ }                       }
  end

  # :except and :only

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:sub, except: [:foo, :bar], only: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR }            }
  end

end # describe Faceter::Functions.sub
