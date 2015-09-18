# encoding: utf-8

describe "exclude" do

  subject { mapper.new.call input }

  let(:input) do
    [
      {
        user: {
          id: 1,
          name: "joe",
          contacts: [{ email: "joe@doe.com", type: "job" }]
 },
        role: "admin"
 },
      {
        user: {
          id: 2,
          name: "jane",
          contacts: [{ email: "jane@doe.com", type: "job" }]
 },
        role: "admin"
 }
    ]
  end

  let(:output) do
    [
      { user: { name: "joe",  contacts: [{ email: "joe@doe.com" }] } },
      { user: { name: "jane", contacts: [{ email: "jane@doe.com" }] } }
    ]
  end

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        exclude :role

        field :user do
          exclude only: :id # alternative syntax

          field :contacts do
            list { exclude except: :email }
          end
        end
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe exclude
