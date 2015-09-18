# encoding: utf-8

describe "fold" do

  subject { mapper.new.call input }

  let(:input) do
    [
      {
        name: "Joe",
        emails: [{ address: "joe@doe.com" }, { address: "joe@doe.org" }]
 },
      {
        name: "Jane",
        emails: [{ address: "jane@doe.com" }]
 }
    ]
  end

  let(:output) do
    [
      { name: "Joe",  emails: ["joe@doe.com", "joe@doe.org"] },
      { name: "Jane", emails: ["jane@doe.com"] }
    ]
  end

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        field :emails do
          list { unfold from: :address }
        end
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe fold
