# encoding: utf-8

describe Faceter::Functions, ".reverse" do

  it "takes empty hash by default" do
    expect(described_class.reverse).to eql described_class.reverse({})
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:reverse] }

    let(:input)  { {}           }
    let(:output) { { only: [] } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:reverse] }

    let(:input)  { { only: :foo }   }
    let(:output) { { except: :foo } }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:reverse] }

    let(:input)  { { except: :foo } }
    let(:output) { { only: :foo }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:reverse] }

    let(:input)  { { except: [:foo, :bar] } }
    let(:output) { { only: [:foo, :bar] }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:reverse] }

    let(:input)  { { except: [:foo, :bar] } }
    let(:output) { { only: [:foo, :bar] }   }
  end

  it_behaves_like :transforming_immutable_data do
    let(:arguments) { [:reverse] }

    let(:input)  { { except: [:foo, :bar], only: [:baz, :qux] } }
    let(:output) { { except: [:baz, :qux] }                     }
  end

end # describe Faceter::Functions.reverse
