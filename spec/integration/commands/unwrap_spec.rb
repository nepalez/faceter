# encoding: utf-8

describe "unwrap" do

  subject { mapper.new.call input }

  let(:input) do
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

  let(:output) do
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

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        unwrap from: :user, only: :id

        unwrap :name, from: :user # alternative syntax

        field :contacts do
          list { unwrap from: :email, except: :address }
        end
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe unwrap
