# encoding: utf-8

describe Faceter::Functions, ".split" do

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ foo: :FOO, bar: :BAR, baz: :BAZ }, {}] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, {}] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ foo: :FOO, bar: :BAR, baz: :BAZ }, {}] }
  end

  # :only

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, only: []] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{}, { foo: :FOO, bar: :BAR, baz: :BAZ }] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, only: :qux] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{}, { foo: :FOO, bar: :BAR, baz: :BAZ }] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, only: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ foo: :FOO }, { bar: :BAR, baz: :BAZ }] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, only: [:foo, :bar, :qux]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ foo: :FOO, bar: :BAR }, { baz: :BAZ }] }
  end

  # :except

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, except: []] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ foo: :FOO, bar: :BAR, baz: :BAZ }, {}] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, except: :qux] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ foo: :FOO, bar: :BAR, baz: :BAZ }, {}] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, except: :foo] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ bar: :BAR, baz: :BAZ }, { foo: :FOO }] }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, except: [:foo, :bar, :qux]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ baz: :BAZ }, { foo: :FOO, bar: :BAR }] }
  end

  # :except and :only

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:split, except: [:foo, :bar], only: [:foo, :bar]] }

    let(:input)  { { foo: :FOO, bar: :BAR, baz: :BAZ }       }
    let(:output) { [{ foo: :FOO, bar: :BAR }, { baz: :BAZ }] }
  end

end # describe Faceter::Functions.split
