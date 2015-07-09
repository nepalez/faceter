# encoding: utf-8

describe "ungroup" do

  subject { mapper.new.call input }

  let(:input) do
    [
      {
        role: "admin",
        users: [
          {
            name: "Joe",
            contacts: [
              { email: "joe@doe.com", type: "job" },
              { email: "joe@doe.org", type: "job" }
            ]
          },
          {
            name: "Ian",
            contacts: [
              { email: "ian@doe.com", type: "job" },
              { email: "ian@doe.org", type: "job" }
            ]
          }
        ]
      }
    ]
  end

  let(:output) do
    [
      {
        name: "Joe",
        role: "admin",
        type: "job",
        contacts: [{ email: "joe@doe.com" }, { email: "joe@doe.org" }]
      },
      {
        name: "Ian",
        role: "admin",
        type: "job",
        contacts: [{ email: "ian@doe.com" }, { email: "ian@doe.org" }]
      }
    ]
  end

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        field :users do
          ungroup :type, from: :contacts
        end
      end

      ungroup :name, :contacts, :type, from: :users
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe ungroup
