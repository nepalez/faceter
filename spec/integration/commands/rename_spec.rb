# encoding: utf-8

describe "rename" do

  subject { mapper.new.call input }

  let(:input) do
    [
      { user: { name: "joe",  contacts: [{ email: "joe@doe.com" }] } },
      { user: { name: "jane", contacts: [{ email: "jane@doe.com" }] } }
    ]
  end

  let(:output) do
    [
      { "user" => { "name" => "joe",  emails: [{ address: "joe@doe.com" }] } },
      { "user" => { "name" => "jane", emails: [{ address: "jane@doe.com" }] } }
    ]
  end

  let(:mapper) do
    Class.new(Faceter::Mapper) do
      list do
        field :user do
          rename :name, to: "name"

          field :contacts do
            list do
              rename :email, to: :address
            end
          end

          rename :contacts, to: :emails
        end

        rename :user, to: "user"
      end
    end
  end

  it "works" do
    expect(subject).to eql output
  end

end # describe rename
