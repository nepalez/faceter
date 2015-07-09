# encoding: utf-8

describe "create" do

  subject { mapper.new.call input }

  let(:input) do
    [{ foo: 1, bar: 3 }]
  end

  let(:output) do
    [{ foo: 1, bar: 3, baz: [1, 3], qux: 4, quxx: 3 }]
  end

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        create :baz, from: [:foo, :bar]

        create :qux, from: [:foo, :bar] do |foo, bar|
          foo + bar
        end

        create :quxx, from: :bar
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe create
