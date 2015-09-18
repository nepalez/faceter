# encoding: utf-8

describe "group" do

  subject { mapper.new.call input }

  let(:input) do
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

  let(:output) do
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

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      group :name, :contacts, :type, to: :users

      list do
        field :users do
          group :type, to: :contacts
        end
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe group
