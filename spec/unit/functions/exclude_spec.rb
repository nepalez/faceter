# encoding: utf-8

describe Faceter::Functions, ".exclude" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { {}                                  }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, {}] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { {}                                  }
  end

  # :only

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, only: []] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR, baz: :BAZ } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, only: :qux] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR, baz: :BAZ } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, only: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { bar: :BAR, baz: :BAZ }            }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, only: [:foo, :bar, :qux]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { baz: :BAZ }                       }
  end

  # :except

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, except: []] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { {}                                  }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, except: :qux] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { {}                                  }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, except: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO }                       }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, except: [:foo, :bar, :qux]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { foo: :FOO, bar: :BAR }            }
  end

  # :except and :only

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:exclude, except: [:foo, :bar], only: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ } }
    let(:output) { { baz: :BAZ }                       }
  end

end # describe Faceter::Functions.exclude
