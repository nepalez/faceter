# encoding: utf-8

describe "wrap" do

  subject { mapper.new.call input }

  let(:input) do
    [
      {
        id: 1, name: "joe",
        contacts: [{ email: { address: "joe@doe.com" }, type: "job" }]
 },
      {
        id: 2, name: "jane",
        contacts: [{ email: { address: "jane@doe.com" }, type: "job" }]
 }
    ]
  end

  let(:output) do
    [
      {
        user: { id: 1, name: "joe" },
        contacts: [{ email: { address: "joe@doe.com", type: "job" } }]
 },
      {
        user: { id: 2, name: "jane" },
        contacts: [{ email: { address: "jane@doe.com", type: "job" } }]
 }
    ]
  end

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        wrap to: :user, only: :id

        wrap :name, to: :user # alternative syntax

        field :contacts do
          list { wrap to: :email, except: :email }
        end
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe wrap
